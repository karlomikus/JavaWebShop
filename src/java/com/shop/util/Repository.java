package com.shop.util;

import com.shop.beans.CartItem;
import com.shop.beans.Product;
import com.shop.beans.User;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Repository
{
    private Connection con;
    
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public Repository()
    {
        this.openConnection();
    }
    
    // Users ========================================================================================
    public User loginUser(String email, String password)
    {
        User u = null;
        
        try {
            ps = con.prepareStatement("SELECT * FROM users WHERE email=? AND password=? LIMIT 1");
            ps.setString(1, email);
            ps.setString(2, generatePasswordHash(password));
            rs = ps.executeQuery();
            
            if(rs !=null && rs.next()) {
                u = new User();
                u.setId(rs.getInt("id"));
                u.setEmail(rs.getString("email"));
                u.setUsername(rs.getString("username"));
                u.setGroup_id(rs.getInt("group_id"));
            }
        } catch(SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
        }
        
        return u;
    }
    
    public void registerUser(String username, String email, String password, int groupID)
    {
        try {
            ps = con.prepareStatement("INSERT INTO users (username, email, password, group_id) VALUES (?, ?, ?, ?)");
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, generatePasswordHash(password));
            ps.setInt(4, groupID);
            ps.execute();
        } catch(SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
        }
    }
    
    public User getUser(int Id)
    {
        User u = new User();
        
        try {
            ps = con.prepareStatement("SELECT * FROM users WHERE id=? LIMIT 1");
            ps.setInt(1, Id);
            rs = ps.executeQuery();
        } catch(SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
        }
        
        return u;
    }
    
    public boolean isAdmin(int userID)
    {
        try {
            ps = con.prepareStatement("SELECT group_id FROM users WHERE id=? LIMIT 1");
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            
            return true;
            
        } catch(SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
        }
        return false;
    }
    
    // Products ========================================================================================
    public Product getProduct(int id)
    {
        try {
            ps = con.prepareStatement("SELECT p.*, c.name AS 'category_name' FROM products AS p INNER JOIN products_categories AS c ON p.category_id = c.id WHERE p.id = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            
            Product p = new Product();
            if(rs != null && rs.next())
            {
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setCategoryId(rs.getInt("category_id"));
                p.setCategory(rs.getString("category_name"));
                p.setPrice(rs.getBigDecimal("price"));
                p.setManufacturer(rs.getString("manufacturer"));
            }
            return p;
                
        } catch (SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
        }
        
        return null;
    }
    
    public ArrayList<Product> getProducts()
    {
        ArrayList<Product> products = new ArrayList();
        
        try {
            ps = con.prepareStatement("SELECT p.*, c.name AS 'category_name' FROM products AS p INNER JOIN products_categories AS c ON p.category_id = c.id");
            rs = ps.executeQuery();
            
            while(rs.next())
            {
                Product p = new Product();
                
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setCategoryId(rs.getInt("category_id"));
                p.setCategory(rs.getString("category_name"));
                p.setPrice(rs.getBigDecimal("price"));
                p.setManufacturer(rs.getString("manufacturer"));
                
                products.add(p);
            }
        } catch(SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
        }
        
        return products;
    }
    
    // Cart ========================================================================================
    public void addProductToCart(int productID, int userID)
    {
        try {
            ps = con.prepareStatement("INSERT INTO cart (product_id, user_id, quantity) VALUES (?,?,1)");
            ps.setInt(1, productID);
            ps.setInt(2, userID);
            
            ps.execute();
        } catch (SQLException e) {
            System.out.println(e.getLocalizedMessage());
        }
    }
    
    public ArrayList<CartItem> getCartItems(int userID)
    {
        ArrayList<CartItem> products = new ArrayList();
        
        try {
            ps = con.prepareStatement("SELECT sum(c.quantity) as quantity_sum, c.*, p.* FROM cart as c INNER JOIN products as p ON p.id = c.product_id WHERE c.user_id = ? GROUP BY c.product_id");
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            
            while(rs.next())
            {
                Product p = new Product();
                p.setId(rs.getInt("product_id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setCategoryId(rs.getInt("category_id"));
                p.setPrice(rs.getBigDecimal("price"));
                p.setManufacturer(rs.getString("manufacturer"));
                
                CartItem item = new CartItem();
                item.setProduct(p);
                item.setQuantity(rs.getInt("quantity_sum"));
                
                products.add(item);
            }
        } catch (SQLException e) {
            System.out.println(e.getLocalizedMessage());
        }
        
        return products;
    }
    
    public int countCartItems(int userID)
    {
        int items = 0;
        
        try {
            ps = con.prepareStatement("SELECT COUNT(*) as items FROM cart WHERE user_id = ?");
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            
            if(rs != null && rs.next())
            {
                items = rs.getInt("items");
            }
            
        } catch (SQLException e) {
            System.out.println(e.getLocalizedMessage());
        }
        
        return items;
    }
    
    // Util ========================================================================================
    private void openConnection()
    {
        DBConnectionManager conManager;
        try {
            conManager = new DBConnectionManager();
            con = conManager.getConnection();
            System.out.println("Connection opened!");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getLocalizedMessage());
        }
    }
    
    public void closeConnection()
    {
        try {
            con.close();
            System.out.println("Connection closed!");
        } catch (SQLException e) {
            System.out.println(e.getLocalizedMessage());
        }
    }
    
    public String generatePasswordHash(String input)
    {
        StringBuilder hash = new StringBuilder();
        
        try {
            MessageDigest sha = MessageDigest.getInstance("SHA-1");
            byte[] hashedBytes = sha.digest(input.getBytes());
            char[] digits = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };
            for(int idx = 0; idx < hashedBytes.length; idx++) {
                byte b = hashedBytes[idx];
                hash.append(digits[(b & 0xf0) >> 4]);
                hash.append(digits[b & 0x0f]);
            }
        } catch(NoSuchAlgorithmException e) {
            
        }
        
        return hash.toString();
    }
}

package com.shop.util;

import com.shop.beans.CartItem;
import com.shop.beans.Category;
import com.shop.beans.Country;
import com.shop.beans.Product;
import com.shop.beans.User;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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
            ps = con.prepareStatement("SELECT u.*, c.name AS country_name FROM users AS u INNER JOIN countries AS c ON u.country_id = c.id WHERE u.email=? AND u.password=? LIMIT 1");
            ps.setString(1, email);
            ps.setString(2, generatePasswordHash(password));
            rs = ps.executeQuery();
            
            if(rs !=null && rs.next()) {
                u = new User();
                u.setId(rs.getInt("id"));
                u.setEmail(rs.getString("email"));
                u.setUsername(rs.getString("username"));
                u.setGroup_id(rs.getInt("group_id"));
                u.setCity(rs.getString("city"));
                u.setCountry(rs.getString("country_name"));
                u.setFirstName(rs.getString("first_name"));
                u.setLastName(rs.getString("last_name"));
                u.setPostNumber(rs.getInt("post_number"));
                u.setStreet(rs.getString("street"));
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
    
    public void updateProfile(int userID, int postNumber, int countryID, String street, String city)
    {
        try {
            ps = con.prepareStatement("UPDATE users SET post_number = ?, country_id = ?, street = ?, city = ? WHERE id = ?");
            ps.setInt(1, postNumber);
            ps.setInt(2, countryID);
            ps.setString(3, street);
            ps.setString(4, city);
            ps.setInt(5, userID);
            ps.execute();
            
        } catch(SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
        }
    }
    
    public User getUserById(int id)
    {
        User u = null;
        
        try {
            ps = con.prepareStatement("SELECT u.*, c.name AS country_name FROM users AS u INNER JOIN countries AS c ON u.country_id = c.id WHERE u.id=? LIMIT 1");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            
            if(rs !=null && rs.next()) {
                u = new User();
                u.setId(rs.getInt("id"));
                u.setEmail(rs.getString("email"));
                u.setUsername(rs.getString("username"));
                u.setGroup_id(rs.getInt("group_id"));
                u.setCity(rs.getString("city"));
                u.setCountry(rs.getString("country_name"));
                u.setFirstName(rs.getString("first_name"));
                u.setLastName(rs.getString("last_name"));
                u.setPostNumber(rs.getInt("post_number"));
                u.setStreet(rs.getString("street"));
            }
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
                p.setImage(rs.getString("image"));
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
                p.setImage(rs.getString("image"));
                
                products.add(p);
            }
        } catch(SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
        }
        
        return products;
    }
    
    public ArrayList<Product> getProductsFromCategory(int categoryID)
    {
        ArrayList<Product> products = new ArrayList();
        
        try {
            ps = con.prepareStatement("SELECT p.*, c.name AS 'category_name' FROM products AS p INNER JOIN products_categories AS c ON p.category_id = c.id WHERE category_id = ?");
            ps.setInt(1, categoryID);
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
                p.setImage(rs.getString("image"));
                
                products.add(p);
            }
        } catch(SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
        }
        
        return products;
    }
    
    // Categories ========================================================================================
    public ArrayList<Category> getCategories()
    {
        ArrayList<Category> categories = new ArrayList();
        
        try {
            ps = con.prepareStatement("SELECT * FROM products_categories ORDER BY name ASC");
            rs = ps.executeQuery();
            
            while(rs.next())
            {
                Category c = new Category();
                
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setDescription(rs.getString("description"));
                
                categories.add(c);
            }
        } catch(SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
        }
        
        return categories;
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
    
    public void clearUserCart(int userID)
    {
        try {
            ps = con.prepareStatement("DELETE FROM cart WHERE user_id = ?");
            ps.setInt(1, userID);
            ps.execute();            
        } catch (SQLException e) {
            System.out.println(e.getLocalizedMessage());
        }
    }
    
    // Country ========================================================================================
    public ArrayList<Country> getCountries()
    {
        ArrayList<Country> countries = new ArrayList();
        
        try {
            ps = con.prepareStatement("SELECT * FROM countries ORDER BY name ASC");
            rs = ps.executeQuery();
            
            while(rs.next())
            {
                Country c = new Country();
                c.setId(rs.getInt("id"));
                c.setCode(rs.getString("code"));
                c.setName(rs.getString("name"));
                
                countries.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e.getLocalizedMessage());
        }
        
        return countries;
    }
    
    // Orders ========================================================================================
    public void newOrder(int userID, ArrayList<CartItem> items)
    {
        Date dt = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String currentDateTime = sdf.format(dt);
        try {
            ps = con.prepareStatement("INSERT INTO orders (user_id, date) VALUES (?, ?)");
            ps.setInt(1, userID);
            ps.setString(2, currentDateTime);
            ps.execute();
            
            rs = ps.executeQuery("SELECT MAX(id) as id FROM orders");
            int orderID = rs.getInt("id");
            
            for(CartItem item : items)
            {
                ps = con.prepareStatement("INSERT INTO orders_products (order_id, product_id, quantity) VALUES (?, ?, ?)");
                ps.setInt(1, orderID);
                ps.setInt(2, item.getProduct().getId());
                ps.setInt(3, item.getQuantity());
                ps.execute();
            }
            
            clearUserCart(userID);
            
        } catch (SQLException e) {
            System.out.println(e.getLocalizedMessage());
        }
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

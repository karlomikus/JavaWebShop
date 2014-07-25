package com.shop.util;

import com.shop.beans.Product;
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
    
    // Products
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
}

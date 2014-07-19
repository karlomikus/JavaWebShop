package com.shop.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectionManager
{
    private final Connection con;

    public DBConnectionManager() throws ClassNotFoundException, SQLException
    {
        Class.forName("com.mysql.jdbc.Driver");
        this.con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webshop", "root", "");
    }

    public Connection getConnection()
    {
        return con;
    }
    
}
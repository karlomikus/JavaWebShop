package com.shop.beans;

import java.util.ArrayList;

public class Order
{
    private int id;
    private String date;
    private String status;
    private ArrayList<Product> products;

    public Order() {}

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getDate()
    {
        return date;
    }

    public void setDate(String date)
    {
        this.date = date;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public ArrayList<Product> getProducts()
    {
        return products;
    }

    public void setProducts(ArrayList<Product> products)
    {
        this.products = products;
    }
    
}
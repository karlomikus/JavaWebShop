package com.shop.servlets;

import com.shop.util.Repository;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ProductsServlet", urlPatterns = { "/home" })
public class ProductsServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        Repository repo = (Repository) getServletContext().getAttribute("repo");
        
        request.setAttribute("products", repo.getProducts());
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}

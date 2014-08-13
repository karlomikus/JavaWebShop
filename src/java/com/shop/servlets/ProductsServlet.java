package com.shop.servlets;

import com.shop.util.Repository;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ProductsServlet", urlPatterns = { "/products" })
public class ProductsServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        int categoryID = 0;
        if(request.getParameterNames().hasMoreElements())
        {
            categoryID = Integer.parseInt(request.getParameter("category"));
            
            Repository repo = (Repository) getServletContext().getAttribute("repo");

            request.setAttribute("products", repo.getProductsFromCategory(categoryID));
            request.setAttribute("categories", repo.getCategories());
            request.setAttribute("categoryID", categoryID);
            request.getRequestDispatcher("products.jsp").forward(request, response);
        }
        else
        {
            Repository repo = (Repository) getServletContext().getAttribute("repo");

            request.setAttribute("products", repo.getProducts());
            request.setAttribute("categories", repo.getCategories());
            request.getRequestDispatcher("products.jsp").forward(request, response);
        }
    }
}

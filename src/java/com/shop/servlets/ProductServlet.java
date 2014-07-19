/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.shop.servlets;

import com.shop.util.Repository;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ProductServlet", urlPatterns = {"/product"})
public class ProductServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        int id = Integer.parseInt(request.getParameter("id"));
        
        Repository repo = (Repository) getServletContext().getAttribute("repo");
        
        request.setAttribute("product", repo.getProduct(id));
        request.getRequestDispatcher("/product.jsp").forward(request, response);
    }
}

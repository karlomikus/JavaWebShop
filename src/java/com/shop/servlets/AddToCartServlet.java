/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.shop.servlets;

import com.shop.beans.User;
import com.shop.util.Repository;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Karlo
 */
@WebServlet(name = "AddToCartServlet", urlPatterns = {"/addToCart"})
public class AddToCartServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        int product = Integer.parseInt(request.getParameter("product"));
        
        Repository repo = (Repository) getServletContext().getAttribute("repo");
        HttpSession session = request.getSession();
        
        User u = (User) session.getAttribute("user");
        
        repo.addProductToCart(product, u.getId());
        response.sendRedirect(request.getContextPath() + "/cart");
    }

}

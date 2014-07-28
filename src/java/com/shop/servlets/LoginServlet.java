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
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String email = request.getParameter("email");
        String password = request.getParameter("pwd");
        String errorMsg = null;
        
        if(email == null || email.equals("")) {
            errorMsg = "Email field can't be empty!";
        }
        if(password == null || password.equals("")) {
            errorMsg = "Password field can't be empty!";
        }
        
        if(errorMsg != null) {
            
        }
        else {
            Repository repo = (Repository) getServletContext().getAttribute("repo");
            User user = repo.loginUser(email, password);
            
            if(user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect("/home");
            }
        }
    }
}

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
            response.sendRedirect("/error");
        }
        else {
            Repository repo = (Repository) getServletContext().getAttribute("repo");
            User user = repo.loginUser(email, password);
            
            if(user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                session.setMaxInactiveInterval(30*60);
                session.setAttribute("cartCount", repo.countCartItems(user.getId()));
                response.sendRedirect(request.getContextPath() + "/home");
            }
            else {
                response.sendRedirect(request.getContextPath() + "/error.jsp");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }
}

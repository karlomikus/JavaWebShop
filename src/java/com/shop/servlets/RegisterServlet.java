package com.shop.servlets;

import com.shop.util.Repository;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("pwd");
        String passwordConfirm = request.getParameter("pwdconfirm");
        int groupID = 2; // Clients group
        String errorMsg = null;
        
        if(username == null || username.equals("")) {
            errorMsg = "Username field can't be empty!";
        }
        if(email == null || email.equals("")) {
            errorMsg = "Email field can't be empty!";
        }
        if(password == null || password.equals("")) {
            errorMsg = "Password field can't be empty!";
        }
        if(passwordConfirm == null || passwordConfirm.equals("")) {
            errorMsg = "Password confirm field can't be empty!";
        }
        if(!password.equals(passwordConfirm)) {
            errorMsg = "Passwords don't match!";
        }
        
        if(errorMsg != null) {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
        else {
            Repository repo = (Repository) getServletContext().getAttribute("repo");
            repo.registerUser(username, email, password, groupID);
            response.sendRedirect(request.getContextPath() + "/home");
        }
    }

}

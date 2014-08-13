package com.shop.servlets;

import com.shop.util.Repository;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ProfileServlet", urlPatterns = {"/profile"})
public class ProfileServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        Repository repo = (Repository) request.getServletContext().getAttribute("repo");
        
        request.setAttribute("countries", repo.getCountries());
        request.getRequestDispatcher("/profile.jsp").forward(request, response);
    }
}

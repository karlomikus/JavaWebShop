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

@WebServlet(name = "ProfileServlet", urlPatterns = {"/profile"})
public class ProfileServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        Repository repo = (Repository) request.getServletContext().getAttribute("repo");
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        
        request.setAttribute("profile", repo.getUserById(u.getId()));
        request.setAttribute("countries", repo.getCountries());
        request.getRequestDispatcher("/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        String firstName = req.getParameter("fname");
        String lastName = req.getParameter("lname");
        int countryID = Integer.parseInt(req.getParameter("country"));
        String city = req.getParameter("city");
        String street = req.getParameter("street");
        int postNumber = Integer.parseInt(req.getParameter("post"));
        
        Repository repo = (Repository) req.getServletContext().getAttribute("repo");
        HttpSession session = req.getSession();
        User u = (User) session.getAttribute("user");
        
        repo.updateProfile(u.getId(), postNumber, countryID, street, city, firstName, lastName);
        resp.sendRedirect(req.getContextPath() + "/profile");
    }
    
}

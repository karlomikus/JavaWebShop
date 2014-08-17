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

@WebServlet(name = "PlaceOrderServlet", urlPatterns = {"/placeOrder"})
public class PlaceOrderServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        Repository repo = (Repository) getServletContext().getAttribute("repo");
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        
        repo.newOrder(u.getId(), repo.getCartItems(u.getId()));
        response.sendRedirect(request.getContextPath() + "/orders");
    }

}

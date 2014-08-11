package com.shop.servlets;

import com.shop.beans.CartItem;
import com.shop.beans.User;
import com.shop.util.Repository;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        Repository repo = (Repository) getServletContext().getAttribute("repo");
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        ArrayList<CartItem> cartItems = repo.getCartItems(u.getId());
        
        double totalPrice = 0;
        int totalQuantity = 0;
        
        for(CartItem item : cartItems)
        {
            totalPrice += item.getProduct().getPrice().doubleValue() * item.getQuantity();
            totalQuantity += item.getQuantity();
        }
        
        request.setAttribute("cartItems", cartItems);
        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("totalQuantity", totalQuantity);
        request.getRequestDispatcher("/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        
    }

}

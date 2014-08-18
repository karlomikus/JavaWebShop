package com.shop.servlets;

import com.shop.beans.CartItem;
import com.shop.beans.User;
import com.shop.util.Repository;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
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
        
        if(request.getParameterMap().containsKey("remove"))
        {
            int productID = Integer.parseInt(request.getParameter("remove"));
            repo.removeProductFromCart(productID, u.getId());
            session.setAttribute("cartCount", repo.countCartItems(u.getId()));
            response.sendRedirect(request.getContextPath() + "/cart");
            //request.getRequestDispatcher("/cart.jsp").forward(request, response);
        }
        else
        {
            ArrayList<CartItem> cartItems = repo.getCartItems(u.getId());

            double totalPrice = 0;
            int totalQuantity = 0;

            for(CartItem item : cartItems)
            {
                totalPrice += item.getProduct().getPrice().doubleValue() * item.getQuantity();
                totalQuantity += item.getQuantity();
            }

            BigDecimal priceSummary = new BigDecimal(totalPrice);
            priceSummary = priceSummary.setScale(2, RoundingMode.UP);

            request.setAttribute("cartItems", cartItems);
            request.setAttribute("totalPrice", priceSummary);
            request.setAttribute("totalQuantity", totalQuantity);
            session.setAttribute("cartCount", repo.countCartItems(u.getId()));
            request.getRequestDispatcher("/cart.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.shop.util;

import com.shop.beans.User;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Karlo
 */
@WebFilter(filterName = "GlobalFilter", urlPatterns = {"/*"})
public class GlobalFilter implements Filter
{
    private ServletContext context;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException
    {
        this.context = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException
    {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        
        if(session.getAttribute("user") != null) {
            Repository repo = (Repository) context.getAttribute("repo");
            User u = (User) session.getAttribute("user");
            session.setAttribute("cartCount", repo.countCartItems(u.getId()));
            chain.doFilter(request, response);
        }
        chain.doFilter(request, response);
    }

    @Override
    public void destroy()
    {
        
    }
    
}

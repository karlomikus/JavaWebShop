package com.shop.servlet.listeners;

import com.shop.util.Repository;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class AppContextListener implements ServletContextListener
{
    @Override
    public void contextInitialized(ServletContextEvent sce)
    {
        ServletContext ctx = sce.getServletContext();
        
        Repository repo = new Repository();
        ctx.setAttribute("repo", repo);
        
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce)
    {
       Repository repo = (Repository) sce.getServletContext().getAttribute("repo");
       repo.closeConnection();
    }
    
}

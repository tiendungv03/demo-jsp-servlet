package com.codeTeam_3.config;

import com.codeTeam_3.util.dbMysql;           // class Db của bạn (HikariCP)
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.ServletContext;

import java.sql.Connection;

@WebListener
public class AppLifecycleListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent event) {
        ServletContext servletContext = event.getServletContext();

        try (Connection connection = dbMysql.getConnection()) {
            servletContext.log("dbMysql pool ready: " + connection.getMetaData().getURL());
        } catch (Exception e) {
            throw new RuntimeException("Cannot connect dbMysql at startup", e);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        dbMysql.close();
    }
}

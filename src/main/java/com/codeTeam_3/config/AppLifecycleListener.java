package com.codeTeam_3.config;

import com.codeTeam_3.util.dbMysql;           // class Db của bạn (HikariCP)
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class AppLifecycleListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        dbMysql.close();
    }
}

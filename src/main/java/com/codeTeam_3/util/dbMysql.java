package com.codeTeam_3.util;

//import org.apache.commons.dbcp2.BasicDataSource;
import java.sql.Connection;
import java.sql.DriverManager;


public class dbMysql {
    public static Connection getConnection() throws Exception {
        String url = "jdbc:mysql://localhost:3306/team3";
        // String name = "tiendungv03";
        String name = "root";
        String password = "tdung@2209";
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, name, password);
    }
}

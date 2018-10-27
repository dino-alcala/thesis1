/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author James
 */

import java.sql.Connection;

public abstract class DBConnectionFactory {
    private String driverName = "com.mysql.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/thsis01";
<<<<<<< HEAD
    private String username = "la";
    private String password = "1234";
=======
    private String username = "root";
    private String password = "#oraytrocknrollwooh3";
>>>>>>> be426d1e21462cec4b69f0f7ee78dcbb036ad777
    
    public static DBConnectionFactory getInstance() {
        return new DBConnectionFactoryImpl();
    }
    
    public abstract Connection getConnection();

    public String getDriverName() {
        return driverName;
    }

    public String getUrl() {
        return url;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }
    
    
}

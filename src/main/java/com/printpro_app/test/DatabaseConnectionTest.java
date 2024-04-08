package com.printpro_app.test;

import org.junit.Assert;
import org.junit.Test;

import com.printpro_app.util.DatabaseConnection;

import java.sql.Connection;
import java.sql.SQLException;

public class DatabaseConnectionTest {

    @Test
    public void testGetConnection() throws SQLException {
        Connection conn = DatabaseConnection.getConnection();
        Assert.assertNotNull("La conexión no debe ser nula", conn);

        if (conn != null) {
            conn.close();
        }
    }
}

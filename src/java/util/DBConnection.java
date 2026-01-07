package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL =
        "jdbc:mysql://localhost:3306/hmit_db?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";

    private static final String PASSWORD =
        System.getenv("DB_PASSWORD");

    private static Connection connection;

    public static Connection getConnection() {
        try {
            if (PASSWORD == null || PASSWORD.isEmpty()) {
                throw new IllegalStateException(
                    "DB_PASSWORD environment variable is not set"
                );
            }

            if (connection == null || connection.isClosed()) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(URL, USER, PASSWORD);
            }

            return connection;

        } catch (ClassNotFoundException e) {
            throw new IllegalStateException(
                "MySQL JDBC Driver not found", e
            );
        } catch (SQLException e) {
            throw new IllegalStateException(
                "Failed to connect to database", e
            );
        }
    }
}

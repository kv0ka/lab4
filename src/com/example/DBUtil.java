package com.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBUtil {
    // Подключение к базе данных userdb
    private static final String USERDB_URL = "jdbc:mysql://localhost:3306/userdb";
    private static final String USERDB_USER = "root";
    private static final String USERDB_PASSWORD = "root";

    // Подключение к базе данных restaurant_db
    private static final String RESTAURANT_URL = "jdbc:mysql://localhost:3306/restaurant_db";
    private static final String RESTAURANT_USER = "root";
    private static final String RESTAURANT_PASSWORD = "root";

    // Метод для получения подключения к userdb
    public static Connection getUserDBConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(USERDB_URL, USERDB_USER, USERDB_PASSWORD);
    }

    // Метод для получения подключения к restaurant_db
    public static Connection getRestaurantDBConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(RESTAURANT_URL, RESTAURANT_USER, RESTAURANT_PASSWORD);
    }

    // Проверка пользователя и получение роли
    public static String checkUserAndGetRole(String name, String pass) {
        String query = "SELECT role FROM users WHERE name = ? AND pass = ?";
        try (Connection conn = getUserDBConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, name);
            stmt.setString(2, pass);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getString("role");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Регистрация пользователя
    public static boolean registerUser(String name, String pass) {
        String query = "INSERT INTO users (name, pass, role) VALUES (?, ?, 'USER')";
        try (Connection conn = getUserDBConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, name);
            stmt.setString(2, pass);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Получение списка всех пользователей из userdb
    public static ResultSet getAllUsers() throws Exception {
        String query = "SELECT * FROM users";
        Connection conn = getUserDBConnection();
        PreparedStatement stmt = conn.prepareStatement(query);
        return stmt.executeQuery();
    }
    // Получение списка всех администраторов из restaurant_db
    public static ResultSet getAllAdmins() throws Exception {
        String query = "SELECT id, first_name, last_name, phone_number FROM users";
        Connection conn = getRestaurantDBConnection();
        PreparedStatement stmt = conn.prepareStatement(query);
        return stmt.executeQuery();
    }

    // Получение списка всех пользователей из restaurant_db
    public static ResultSet getAllBookings() throws Exception {
        String query = "SELECT id, user_name, table_number, booking_date FROM bookings";
        Connection conn = getRestaurantDBConnection();
        PreparedStatement stmt = conn.prepareStatement(query);
        return stmt.executeQuery();
    }
    public static ResultSet getAllUsersFromRestaurantDB() throws Exception {
        String query = "SELECT id, first_name, last_name, booking_date, table_number, phone_number FROM users";
        Connection conn = getRestaurantDBConnection();
        PreparedStatement stmt = conn.prepareStatement(query);
        return stmt.executeQuery();
    }
}
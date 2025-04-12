package com.example;

import java.sql.ResultSet;

public class Main {
    public static void main(String[] args) {
        try {
            // Выводим содержимое таблицы users из userdb
            System.out.println("Пользователи из userdb:");
            try (ResultSet rs = DBUtil.getAllUsers()) {
                while (rs.next()) {
                    System.out.println("ID: " + rs.getInt("id") +
                            ", Name: " + rs.getString("name") +
                            ", Role: " + rs.getString("role"));
                }
            }

            // Выводим содержимое таблицы bookings из restaurant_db
            System.out.println("\nБронирования из restaurant_db:");
            try (ResultSet rs = DBUtil.getAllBookings()) {
                while (rs.next()) {
                    System.out.println("ID: " + rs.getInt("id") +
                            ", User Name: " + rs.getString("user_name") +
                            ", Table Number: " + rs.getInt("table_number") +
                            ", Booking Date: " + rs.getString("booking_date"));
                }
            }

            // Выводим содержимое таблицы users из restaurant_db
            System.out.println("\nАдминистраторы из restaurant_db:");
            try (ResultSet rs = DBUtil.getAllAdmins()) {
                while (rs.next()) {
                    System.out.println("ID: " + rs.getInt("id") +
                            ", First Name: " + rs.getString("first_name") +
                            ", Last Name: " + rs.getString("last_name") +
                            ", Phone Number: " + rs.getString("phone_number"));
                }
            }
        } catch (Exception e) {
            System.err.println("Ошибка при запуске программы:");
            e.printStackTrace();
        }
    }
}
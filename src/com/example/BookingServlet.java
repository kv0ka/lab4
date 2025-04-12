package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "BookingServlet", urlPatterns = "/BookingServlet")
public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("user_name");
        String tableNumber = request.getParameter("table_number");
        String bookingDate = request.getParameter("booking_date");

        // Вставить запись в таблицу bookings
        String query = "INSERT INTO bookings (user_name, table_number, booking_date) VALUES (?, ?, ?)";
        try (Connection conn = DBUtil.getRestaurantDBConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, userName);
            stmt.setInt(2, Integer.parseInt(tableNumber));
            stmt.setString(3, bookingDate);
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect("success.jsp");
            } else {
                response.sendRedirect("failure.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("failure.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Получить список всех бронирований
        try (ResultSet rs = DBUtil.getAllBookings()) {
            request.setAttribute("bookings", rs);
            request.getRequestDispatcher("bookings.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
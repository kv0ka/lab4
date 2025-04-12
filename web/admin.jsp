<%@ page import="com.example.DBUtil" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
    <!-- Подключение Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center text-primary">Welcome, Admin!</h2>

    <!-- Отображение пользователей из userdb -->
    <p class="text-center">Here is the list of all users:</p>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Password</th>
            <th>Email</th>
            <th>Role</th>
        </tr>
        </thead>
        <tbody>
        <%
            try {
                ResultSet users = DBUtil.getAllUsers();
                while (users.next()) {
        %>
        <tr>
            <td><%= users.getInt("id") %></td>
            <td><%= users.getString("name") %></td>
            <td><%= users.getString("pass") %></td>
            <td><%= users.getString("email") %></td>
            <td><%= users.getString("role") %></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        </tbody>
    </table>

    <!-- Отображение бронирований из restaurant_db -->
    <p class="text-center">Here is the list of all bookings:</p>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th>User Name</th>
            <th>Table Number</th>
            <th>Booking Date</th>
        </tr>
        </thead>
        <tbody>
        <%
            try {
                ResultSet bookings = DBUtil.getAllBookings();
                while (bookings.next()) {
        %>
        <tr>
            <td><%= bookings.getInt("id") %></td>
            <td><%= bookings.getString("user_name") %></td>
            <td><%= bookings.getInt("table_number") %></td>
            <td><%= bookings.getString("booking_date") %></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        </tbody>
    </table>

    <a href="logout.jsp" class="btn btn-secondary d-block mx-auto w-25">Logout</a>
</div>
</body>
</html>
<%@ page import="com.example.DBUtil" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Page</title>
    <!-- Подключение Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center text-primary">Welcome, User!</h2>
    <p class="text-center">Here is the list of users from restaurant_db:</p>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Booking Date</th>
            <th>Table Number</th>
            <th>Phone Number</th>
        </tr>
        </thead>
        <tbody>
        <%
            try {
                ResultSet users = DBUtil.getAllUsersFromRestaurantDB();
                while (users.next()) {
        %>
        <tr>
            <td><%= users.getInt("id") %></td>
            <td><%= users.getString("frst_name") %></td>
            <td><%= users.getString("last_name") %></td>
            <td><%= users.getString("booking_date") %></td>
            <td><%= users.getInt("table_number") %></td>
            <td><%= users.getString("phone_number") %></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException("Error fetching data from database", e); // Добавляем явное выбрасывание исключения
            }
        %>
        </tbody>
    </table>
    <a href="logout.jsp" class="btn btn-secondary d-block mx-auto w-25">Logout</a>
</div>
</body>
</html>
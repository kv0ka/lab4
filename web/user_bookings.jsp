<%@ page import="com.example.DBUtil" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>User Page</title>
  <!-- Подключение Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Подключение Font Awesome для иконок -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <style>
    /* Градиентный фон для body */
    body {
      background: linear-gradient(135deg, #ff7e5f, #feb47b);
      color: white;
      font-family: 'Roboto', sans-serif;
      min-height: 100vh;
    }

    /* Стиль контейнера */
    .container {
      background: rgba(255, 255, 255, 0.1); /* Полупрозрачный фон */
      border-radius: 15px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
      padding: 30px;
      margin-top: 50px;
    }

    /* Заголовок */
    h2 {
      font-weight: bold;
      text-align: center;
      margin-bottom: 20px;
      color: #ffffff;
    }

    /* Таблица */
    .table {
      background: rgba(255, 255, 255, 0.2); /* Полупрозрачный фон для таблицы */
      border-radius: 10px;
      overflow: hidden;
    }

    .table thead th {
      background: rgba(255, 255, 255, 0.3); /* Фон для заголовков таблицы */
      color: white;
      font-weight: bold;
      text-align: center;
    }

    .table tbody td {
      color: white;
      text-align: center;
      vertical-align: middle;
    }

    /* Кнопка выхода */
    .btn-secondary {
      background: linear-gradient(135deg, #6a11cb, #2575fc);
      border: none;
      color: white;
      font-weight: bold;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .btn-secondary:hover {
      transform: scale(1.05);
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
    }
  </style>
</head>
<body>
<div class="container mt-5">
  <h2>Welcome, User!</h2>
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
      try (ResultSet bookings = DBUtil.getAllBookings()) {
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
        out.println("<p class='text-danger'>An error occurred while fetching data.</p>");
      }
    %>
    </tbody>
  </table>
  <a href="logout.jsp" class="btn btn-secondary d-block mx-auto w-25">Logout</a>
</div>
</body>
</html>
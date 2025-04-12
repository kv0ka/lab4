<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- Подключение Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Подключение Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        /* Общие стили */
        body {
            background: linear-gradient(135deg, #ff7e5f, #feb47b);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
        }

        /* Контейнер формы */
        .form-container {
            max-width: 450px;
            margin: 50px auto;
            padding: 40px;
            background: rgba(255, 255, 255, 0.9); /* Полупрозрачный фон */
            border-radius: 15px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        /* Заголовок */
        h2 {
            color: #4CAF50;
            font-weight: 600;
            margin-bottom: 20px;
        }

        /* Поля ввода */
        .form-control {
            background: #ffffff;
            border: 2px solid #4CAF50;
            border-radius: 10px;
            padding: 15px;
            font-size: 16px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-control:focus {
            border-color: #ff7e5f;
            box-shadow: 0 0 8px rgba(255, 126, 95, 0.5);
            outline: none;
        }

        /* Кнопка входа */
        .btn-success {
            background: linear-gradient(135deg, #ff7e5f, #feb47b);
            border: none;
            color: white;
            font-weight: 600;
            padding: 12px;
            border-radius: 10px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .btn-success:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        /* Ссылка "Register" */
        a {
            color: #4CAF50;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #ff7e5f;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Login</h2>
    <form action="Login" method="post">
        <!-- Поле для имени пользователя -->
        <div class="mb-3">
            <label for="name" class="form-label">Username</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="Enter your username" required>
        </div>

        <!-- Поле для пароля -->
        <div class="mb-3">
            <label for="pass" class="form-label">Password</label>
            <input type="password" class="form-control" id="pass" name="pass" placeholder="Enter your password" required>
        </div>

        <!-- Кнопка входа -->
        <button type="submit" class="btn btn-success w-100">Login</button>

        <!-- Ссылка на страницу регистрации -->
        <a href="register.jsp" class="d-block mt-3">Don't have an account? Register here</a>
    </form>
</div>
</body>
</html>
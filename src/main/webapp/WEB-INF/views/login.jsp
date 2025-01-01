<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JTVPSS Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f8fa;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-container {
            width: 450px; /* Increased width */
            padding: 30px; /* Increased padding */
            background-color: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: center;
        }
        .login-container img {
            width: 50px;
            margin-bottom: 10px;
        }
        .login-container h1 {
            font-size: 26px; /* Slightly larger font */
            margin-bottom: 20px;
            color: #333;
        }
        .form-group {
            margin-bottom: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .form-group input {
            width: 100%;
            padding: 12px; /* Increased padding */
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px; /* Increased font size */
        }
        .form-group input:focus {
            outline: none;
            border-color: #4CAF50;
        }
        .login-button {
            width: 100%;
            background-color: #4CAF50;
            color: #fff;
            padding: 12px; /* Increased padding */
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        .login-button:hover {
            background-color: #45a049;
        }
        .forgot-password {
            margin-top: 15px;
            font-size: 14px;
            color: #4CAF50;
            text-decoration: none;
        }
        .forgot-password:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <img src="https://via.placeholder.com/50" alt="JTVPSS Logo">
        <h1>JTVPSS Login</h1>
        <form name="Login" method="post" action="authenticate">
            <div class="form-group">
                <input type="text" name="username" placeholder="Tenant ID" required />
            </div>
            <div class="form-group">
                <input type="password" name="password" placeholder="Password" required />
            </div>
            <button type="submit" class="login-button">Login</button>
        </form>
        <a href="#" class="forgot-password">Forgot Password?</a>
    </div>
</body>
</html>

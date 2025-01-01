<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TVPSS - Welcome</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f8fa;
            color: #333;
        }

        .header {
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 20px;
        }

        .header h1 {
            font-size: 36px;
            margin: 0;
        }

        .header p {
            margin: 5px 0;
            font-size: 18px;
        }

        .banner {
            position: relative;
            text-align: center;
            color: white;
         background: url('/images/student.jpg') no-repeat center center/cover;
            height: 500px;
        }

        .banner-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
        }

        .banner-content h2 {
            font-size: 48px;
            margin: 0;
        }

        .banner-content p {
            margin: 20px 0;
            font-size: 18px;
        }

        .banner-content .cta-button {
            background-color: #4CAF50;
            color: white;
            padding: 15px 30px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 18px;
        }

        .banner-content .cta-button:hover {
            background-color: #45a049;
        }

        .features {
            text-align: center;
            padding: 50px 20px;
        }

        .features h2 {
            font-size: 32px;
            margin-bottom: 20px;
        }

        .features .feature-list {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 30px;
            margin-top: 20px;
        }

        .features .feature-item {
            width: 250px;
            text-align: center;
        }

        .features .feature-item img {
            width: 80px;
            margin-bottom: 10px;
        }

        .features .feature-item h3 {
            font-size: 20px;
            margin-bottom: 10px;
        }

        .features .feature-item p {
            font-size: 16px;
            color: #555;
        }

        .footer {
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 20px 0;
        }

        .footer p {
            margin: 0;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>TVPSS - School Resource Centre TV</h1>
        <p>Welcome to the TVPSS Management Information System</p>
    </div>

    <div class="banner">
        <div class="banner-content">
            <h2>Discover TVPSS</h2>
            <p>Fostering creativity and innovation in schools through educational technology.</p>
            <a href="/MIS_TVPSS/login" class="cta-button">Get Started Now</a>
        </div>
    </div>

    <div class="features">
        <h2>Grow with TVPSS</h2>
        <div class="feature-list">
            <div class="feature-item">
                <img src="https://via.placeholder.com/80" alt="Feature 1">
                <h3>Innovative Programs</h3>
                <p>Encouraging students to develop skills in journalism, hosting, and production.</p>
            </div>
            <div class="feature-item">
                <img src="https://via.placeholder.com/80" alt="Feature 2">
                <h3>Digital Learning</h3>
                <p>Providing tools and resources to enhance the teaching and learning experience.</p>
            </div>
            <div class="feature-item">
                <img src="https://via.placeholder.com/80" alt="Feature 3">
                <h3>Resource Management</h3>
                <p>Streamlining the management of school resource centers efficiently.</p>
            </div>
        </div>
    </div>

    <div class="footer">
        <p>© 2025 TVPSS - School Resource Centre TV. All Rights Reserved.</p>
    </div>
</body>
</html>

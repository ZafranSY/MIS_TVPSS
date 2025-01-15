<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Join Us as Crew</title>
    <style>
        /* Global Styles */
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #f5f7fa;
            color: #2c3e50;
            margin: 0;
            padding: 0;
        }
        .container {
            display: flex;
        }
        .content {
            flex: 1;
            margin-left: 300px;
            padding: 20px;
        }
        /* Hero Section */
        .hero {
            background: linear-gradient(135deg, #1a237e, #4caf50);
            color: white;
            text-align: center;
            padding: 50px 20px;
            border-radius: 12px;
            margin-bottom: 30px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        .hero h1 {
            font-size: 36px;
            margin-bottom: 10px;
        }
        .hero p {
            font-size: 18px;
            margin: 0;
        }
        /* Task Details Section */
        .task-details {
            margin-bottom: 30px;
            padding: 20px;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }
        .task-details h2 {
            color: #1a237e;
            font-size: 24px;
            margin-bottom: 20px;
        }
        .task-details p,
        .task-details ul {
            font-size: 16px;
            color: #2c3e50;
            margin-bottom: 20px;
            line-height: 1.6;
        }
        .task-details ul {
            list-style: disc inside;
            text-align: left;
            padding-left: 20px;
        }
        /* Testimonials Section */
        .testimonial {
            background-color: #f8fafc;
            border: 1px solid #e3e8ef;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }
        .testimonial strong {
            display: block;
            margin-top: 10px;
            font-size: 14px;
            color: #1a237e;
        }
        /* FAQ Section */
        .faq-item {
            text-align: left;
            margin-bottom: 20px;
        }
        .faq-item h3 {
            font-size: 18px;
            color: #1a237e;
            margin-bottom: 10px;
        }
        .faq-item p {
            font-size: 16px;
            color: #64748b;
            margin: 0;
        }
        /* Call-to-Action Button */
        .task-item.addTask {
            display: inline-block;
            text-decoration: none;
            font-size: 18px;
            color: white;
            background-color: #4caf50;
            padding: 12px 20px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        .task-item.addTask:hover {
            background-color: #43a047;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        /* Sidebar Navigation */
        .sidebar {
            width: 300px;
            background-color: white;
            box-shadow: 2px 0 8px rgba(0, 0, 0, 0.05);
            padding: 20px;
        }
        .sidebar h2 {
            font-size: 20px;
            color: #1a237e;
            margin-bottom: 20px;
        }
        .sidebar nav ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .sidebar nav ul li {
            margin-bottom: 15px;
        }
        .sidebar nav ul li a {
            text-decoration: none;
            color: #2c3e50;
            font-size: 16px;
            transition: all 0.3s ease;
        }
        .sidebar nav ul li a:hover {
            color: #4caf50;
        }
        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .sidebar {
                display: none;
            }
            .content {
                margin-left: 0;
                padding: 15px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
                <%@ include file="StudentSidebar.jsp" %>

        <!-- Main Content -->
        <main class="content">
            <!-- Hero Section -->
            <header class="hero">
                <h1>Welcome to Our Crew</h1>
                <p>Join a passionate team and unlock your full potential!</p>
            </header>
            <!-- About Section -->
            <section id="about" class="task-details">
                <h2>Why Join Our Crew?</h2>
                <p>Our crew is the heart of our success. By joining us, you'll have the opportunity to contribute to exciting projects, grow your skills, and collaborate with a team of passionate individuals.</p>
            </section>
            <!-- Benefits Section -->
            <section id="benefits" class="task-details">
                <h2>Benefits of Joining</h2>
                <ul>
                    <li>Access to exclusive tasks and projects</li>
                    <li>Opportunities for personal and professional growth</li>
                    <li>A supportive and inclusive community</li>
                    <li>Recognition and rewards for your contributions</li>
                </ul>
            </section>
            <!-- Testimonials Section -->
            <section id="testimonials" class="task-details">
                <h2>What Our Crew Says</h2>
                <div class="testimonial">
                    <p>"Being part of this crew has been an amazing journey. I've grown both personally and professionally!"</p>
                    <strong>- Jane Doe</strong>
                </div>
                <div class="testimonial">
                    <p>"The opportunities and support I’ve received here are unmatched. I feel valued and motivated every day!"</p>
                    <strong>- John Smith</strong>
                </div>
            </section>
            <!-- FAQ Section -->
            <section id="faq" class="task-details">
                <h2>Frequently Asked Questions</h2>
                <div class="faq-item">
                    <h3>What does it mean to be a crew member?</h3>
                    <p>As a crew member, you’ll contribute to various tasks and projects, while gaining skills and experiences that matter.</p>
                </div>
                <div class="faq-item">
                    <h3>Are there any membership fees?</h3>
                    <p>No, becoming a crew member is entirely free!</p>
                </div>
            </section>
            <!-- Call to Action Section -->
            <section id="register" class="task-details">
                <h2>Ready to Make an Impact?</h2>
                <p>Don’t miss this opportunity to make a difference and contribute to our community. Register now to unlock exclusive features and be a part of something amazing!</p>
                <a class="task-item addTask" href="http://localhost:8080/MIS_TVPSS/student/crewRegistration">Register Now</a>
            </section>
        </main>
    </div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crew Registration</title>
    <style>
        /* Base Layout */
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #f5f7fa;
            color: #2c3e50;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 280px;
            position: fixed;
            left: 0;
            top: 0;
            bottom: 0;
            background-color: white;
            box-shadow: 2px 0 8px rgba(0, 0, 0, 0.05);
            z-index: 10;
        }

        .content {
            flex: 1;
            margin-left: 280px;
            padding: 30px;
            background-color: #f8fafc;
            min-height: 100vh;
        }

        /* Header */
        header {
            background-color: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        header h1 {
            font-size: 24px;
            color: #1a237e;
            margin: 0;
        }

        /* Registration Form */
        .registration-form {
            background-color: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            max-width: 800px;
            margin: 0 auto;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: 600;
            color: #1a237e;
            margin-bottom: 8px;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #e3e8ef;
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.3s ease;
            background-color: white;
            box-sizing: border-box;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            border-color: #4caf50;
            outline: none;
            box-shadow: 0 0 0 2px rgba(76, 175, 80, 0.1);
        }

        .form-group textarea {
            min-height: 120px;
            resize: vertical;
        }

        .file-upload {
            margin-top: 8px;
        }

        .btn-submit {
            background-color: #4caf50;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .content {
                margin-left: 0;
                padding: 15px;
            }
            
            .sidebar {
                display: none;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <!-- Sidebar content goes here -->
        </div>
        
        <div class="content">
            <header>
                <h1>Crew Registration</h1>
                <div class="user-profile">
                    <!-- User profile information -->
                </div>
            </header>

            <div class="registration-form">
                <form action="CrewRegistrationServlet" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="userID" value="${sessionScope.userID}" />
                    <input type="hidden" name="adminSchoolID" value="${sessionScope.adminSchoolID}" />
                    
                    <div class="form-group">
                        <label for="role">Request Role *</label>
                        <select id="role" name="role" required>
                            <option value="">Select a role</option>
                            <option value="Teacher">Teacher</option>
                            <option value="Staff">Staff</option>
                            <option value="Student">Student</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="schoolName">School Name *</label>
                        <input type="text" id="schoolName" name="schoolName" required>
                    </div>

                    <div class="form-group">
                        <label for="address">Address *</label>
                        <textarea id="address" name="address" required></textarea>
                    </div>

                    <div class="form-group">
                        <label for="icNumber">IC Number *</label>
                        <input type="text" id="icNumber" name="icNumber" pattern="[0-9]{12}" 
                               title="Please enter a valid 12-digit IC number" required>
                    </div>

                    <div class="form-group">
                        <label for="picture">Profile Picture</label>
                        <input type="file" id="picture" name="picture" accept="image/*" class="file-upload">
                    </div>

                    <div class="form-group">
                        <label for="reasonToJoin">Reason to Join *</label>
                        <textarea id="reasonToJoin" name="reasonToJoin" required></textarea>
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn-submit">Submit Application</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        // Add client-side validation
        document.querySelector('form').addEventListener('submit', function(e) {
            const icNumber = document.getElementById('icNumber').value;
            if (!/^\d{12}$/.test(icNumber)) {
                e.preventDefault();
                alert('Please enter a valid 12-digit IC number');
            }
        });

        // Preview image before upload
        document.getElementById('picture').addEventListener('change', function(e) {
            if (e.target.files && e.target.files[0]) {
                const fileSize = e.target.files[0].size / 1024 / 1024; // in MB
                if (fileSize > 5) {
                    alert('File size must be less than 5MB');
                    e.target.value = '';
                }
            }
        });
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<style>
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
        </style>
</head>
<body>
         <%@ include file="StudentSidebar.jsp" %>
</body>
</html>
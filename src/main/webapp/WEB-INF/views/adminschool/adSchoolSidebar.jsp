<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="/MIS_TVPSS/resources/css/adSchoolNavbar.css">

</head>
<body>
<div class="menu-toggle" onclick="toggleSidebar()">☰</div>

<aside class="sidebar">
    <div class="sidebar-content">
        <div class="sidebar-logo">
            <img src="/MIS_TVPSS/resources/images/house.png" style="width:30px;" alt="Logo">
            <span>Management System</span>
        </div>
        <nav class="sidebar-menu">
            <a href="/MIS_TVPSS/adminschool/dashboard" class="menu-item active">
                <span class="icon">🏠</span> Dashboard
            </a>
              <a href="#" class="menu-item">
                <span class="icon">📄</span> Manage User
            </a>
            <a href="/MIS_TVPSS/adminschool/reviewApplicant" class="menu-item">
                <span class="icon">📄</span> Crew Applicants
            </a>
              <a href="/MIS_TVPSS/adminschool/crewTask" class="menu-item">
                <span class="icon">📄</span> Crew Task
            </a>
              <a href="/MIS_TVPSS/adminschool/program" class="menu-item">
                <span class="icon">📄</span> Program Planning
            </a>
              <a href="#" class="menu-item">
                <span class="icon">📄</span> Reports
            </a>
            <a href="#" class="menu-item">
                <span class="icon">⚙️</span> Settings
            </a>
            <div class="menu-bottom">
                <a href="#" class="menu-item help">Help</a>
                <a href="#" class="menu-item logout">Log Out</a>
            </div>
        </nav>
    </div>
</aside>
<script>
    document.addEventListener("DOMContentLoaded", () => {
        // Get the current path of the URL
        const currentPath = window.location.pathname;

        // Select all menu items
        const menuItems = document.querySelectorAll(".menu-item");

        // Add 'active' class to the matching menu item
        menuItems.forEach(item => {
            // Match the exact URL path, avoiding partial matches
            if (item.href.endsWith(currentPath)) {
                item.classList.add("active");
            } else {
                item.classList.remove("active");
            }
        });
    });
</script>

</body>
</html>
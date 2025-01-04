<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sidebar Example</title>
    <link rel="stylesheet" href="/MIS_TVPSS/resources/css/adSchoolNavbar.css">
    <script>
        function toggleSidebar() {
            const sidebar = document.querySelector('.sidebar');
            sidebar.classList.toggle('open');
        }
    </script>
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
                <a href="#" class="menu-item active">
                    <span class="icon">🏠</span> Dashboard
                </a>
                <a href="#" class="menu-item">
                    <span class="icon">📄</span> Reports
                </a>
                <a href="#" class="menu-item">
                    <span class="icon">⚙️</span> Settings
                </a>
                <!-- Dynamic spacing for Help and Logout -->
                <div class="menu-bottom">
                    <a href="#" class="menu-item help">Help</a>
                    <a href="#" class="menu-item logout">Log Out</a>
                </div>
            </nav>
        </div>
    </aside>
</body>
</html>

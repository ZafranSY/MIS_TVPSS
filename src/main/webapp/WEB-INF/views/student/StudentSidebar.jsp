<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Sidebar Styles */
        .sidebar {
            background: #ffffff;
            border-right: 1px solid #cbd5e1;
            position: fixed;
            height: 100vh; /* Full height to fix stretch issue */
            width: 256px;
            display: flex;
            flex-direction: column;
            z-index: 1000;
        }

        .sidebar-logo {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 20px;
            border-bottom: 1px solid #cbd5e1;
            background: white;
        }
        

        .sidebar-logo img {
            width: 30px;
            height: auto;
        }

        .sidebar-logo span {
            font-size: 18px;
            font-weight: bold;
            color: #1a237e;
        }

        .sidebar-menu {
            padding: 20px 0;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

.menu-bottom {
  margin-top: auto; /* Push Help and Logout to the bottom */
  display: flex;
  flex-direction: column;
  gap: 15px;
  margin-bottom:20px;
}

.menu-item {
  text-decoration: none;
  color: #6b7280;
  padding: 12px 15px;
  display: flex;
  align-items: center;
  gap: 10px;
  border-radius: 8px;
  font-size: 14px;
  transition: background-color 0.3s, color 0.3s, transform 0.2s;
}

.menu-item.active,
.menu-item:hover {
  background: #4caf50;
  color: #ffffff;
}

.menu-item .icon {
  font-size: 18px;
  transition: transform 0.3s;
}

.menu-item:hover .icon {
  transform: scale(1.2);
}
.menu-item.active, .menu-item:hover {
    background: #515B92;
    color: #FFFFFF;
    border-radius: 8px;
}

/* Responsive Sidebar */
@media (max-width: 600px) {
    .menu-toggle {
        display: block;
    }

    .sidebar {
        transform: translateX(-100%);
        position: fixed;
        width: 256px;
        top: 0;
        left: 0;
        height: 100%;
        background: #ffffff;
        z-index: 1000;
        transition: transform 0.3s ease-in-out;
    }

    .sidebar.open {
        transform: translateX(0);
    }

    .dashboard-container {
        margin-left: 0; /* Remove sidebar margin for smaller screens */
    }
}
</style>
</head>
<body>

<aside class="sidebar">
    <div class="sidebar-content">
        <div class="sidebar-logo">
            <img src="/MIS_TVPSS/resources/images/house.png"  alt="Logo">
            <span>Management System</span>
        </div>
        <nav class="sidebar-menu">
            <a href="/MIS_TVPSS/student/dashboard" class="menu-item active">
                <span class="icon">🏠</span> Dashboard
            </a>
           
              <a href="/MIS_TVPSS/student/crewTask" class="menu-item">
                <span class="icon">📄</span> Crew Task
            </a>
              <a href="#" class="menu-item">
                <span class="icon">📄</span> Program Planning
            </a>
              <a href="#" class="menu-item">
                <span class="icon">📄</span> Studio Equipment
            </a>
           
              <a href="#" class="menu-item">
                <span class="icon">📄</span> Video Content
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

    // Define related paths that should activate "Crew Task"
    const crewTaskPaths = ["/MIS_TVPSS/student/crewTask", "/MIS_TVPSS/student/crewRegistration"];

    // Select all menu items
    const menuItems = document.querySelectorAll(".menu-item");

    // Add 'active' class to the matching menu item
    menuItems.forEach(item => {
        // If currentPath matches any of the crewTaskPaths, activate "Crew Task"
        if (crewTaskPaths.some(path => item.href.endsWith(path))) {
            if (crewTaskPaths.includes(currentPath)) {
                item.classList.add("active");
            }
        } else {
            item.classList.remove("active");
        }
    });
});

</script>

</body>
</html>
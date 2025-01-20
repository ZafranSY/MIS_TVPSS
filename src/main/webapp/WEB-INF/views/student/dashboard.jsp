<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta charset="UTF-8">
    <title>Student Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .main-content {
            margin-left: 250px;
        }
    </style>    <link rel="stylesheet" href="/MIS_TVPSS/resources/css/adSchoolDashboard.css">

</head>
<body>
    <div class="dashboard-container">
    <!-- Sidebar -->
        <%@ include file="StudentSidebar.jsp" %>

    <!-- Main Content -->
  
    <main class="main-content">
        <!-- Header -->

        <!-- Dashboard Cards -->
        <section class="stats-cards">
            <div class="card">
                <div class="card-icon"><img src="<c:url value='/resources/images/numOfStudent.png' />" alt="Profile"></div>
                <div class="card-info">
                    <span>Number of Students</span>
                    <h2>${studentCount}</h2>  <h1>${{pendingApplicants}}</h1>
    <h1>${{pageTitle}}</h1>
                </div>
            </div>
            <div class="card">
                <div class="card-icon"><img src="<c:url value='/resources/images/totalAchievement.png' />" alt="Profile"></div>
                <div class="card-info">
                    <span>Total Achievement</span>
                    <h2>${{userID}}</h2>
                </div>
            </div>
            <div class="card">
                <div class="card-icon"><img src="<c:url value='/resources/images/numOfCrew.png' />" alt="Profile"></div>
                <div class="card-info">
                    <span>Number of Crew</span>
                    <h2>${{crewId}}</h2>
                </div>
            </div>
        </section>

        <!-- Charts Section -->
        <section class="charts">
            <div class="bar-chart">
                <h3>Crew Overview</h3>
                <canvas id="crewBarChart" width="400" height="300"></canvas>
            </div>
            <div class="pie-chart">
                <h3>Division of Crew by Gender</h3>
                <canvas id="genderPieChart" width="300" height="300"></canvas>
            </div>
        </section>
    </main>
</div>

</body>
</html>
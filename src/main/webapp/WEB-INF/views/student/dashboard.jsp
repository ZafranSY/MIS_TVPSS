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
  
    <div class="main-content p-8">
        <!-- Welcome Section -->
        <div class="mb-8">
            <h1 class="text-3xl font-bold text-gray-800">School Administration Portal</h1>
            <p class="text-gray-600">Manage your school efficiently</p>
        </div>

        <!-- Quick Stats -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
            <!-- Total Students -->
            <div class="bg-white rounded-lg shadow p-6">
                <div class="flex items-center">
                    <div class="p-3 rounded-full bg-blue-100 text-blue-500">
                        <i class="fas fa-user-graduate text-2xl"></i>
                    </div>
                    <div class="ml-4">
                        <p class="text-gray-500">Total Students</p>
                        <h3 class="text-2xl font-bold">1,234</h3>
                    </div>
                </div>
            </div>

            <!-- Total Teachers -->
            <div class="bg-white rounded-lg shadow p-6">
                <div class="flex items-center">
                    <div class="p-3 rounded-full bg-green-100 text-green-500">
                        <i class="fas fa-chalkboard-teacher text-2xl"></i>
                    </div>
                    <div class="ml-4">
                        <p class="text-gray-500">Total Teachers</p>
                        <h3 class="text-2xl font-bold">78</h3>
                    </div>
                </div>
            </div>

            <!-- Total Classes -->
            <div class="bg-white rounded-lg shadow p-6">
                <div class="flex items-center">
                    <div class="p-3 rounded-full bg-yellow-100 text-yellow-500">
                        <i class="fas fa-school text-2xl"></i>
                    </div>
                    <div class="ml-4">
                        <p class="text-gray-500">Total Classes</p>
                        <h3 class="text-2xl font-bold">45</h3>
                    </div>
                </div>
            </div>

            <!-- Revenue -->
            <div class="bg-white rounded-lg shadow p-6">
                <div class="flex items-center">
                    <div class="p-3 rounded-full bg-purple-100 text-purple-500">
                        <i class="fas fa-dollar-sign text-2xl"></i>
                    </div>
                    <div class="ml-4">
                        <p class="text-gray-500">Monthly Revenue</p>
                        <h3 class="text-2xl font-bold">$125K</h3>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Content Grid -->
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
            <!-- Recent Applications -->
            <div class="bg-white rounded-lg shadow">
                <div class="p-6 border-b border-gray-200">
                    <h2 class="text-xl font-bold">Recent Applications</h2>
                </div>
                <div class="p-6">
                    <div class="space-y-4">
                        <div class="flex items-center justify-between p-4 bg-gray-50 rounded">
                            <div>
                                <p class="font-semibold">John Doe - Grade 10</p>
                                <p class="text-sm text-gray-500">Applied: 2 days ago</p>
                            </div>
                            <button class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600">Review</button>
                        </div>
                        <div class="flex items-center justify-between p-4 bg-gray-50 rounded">
                            <div>
                                <p class="font-semibold">Jane Smith - Grade 8</p>
                                <p class="text-sm text-gray-500">Applied: 3 days ago</p>
                            </div>
                            <button class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600">Review</button>
                        </div>
                    </div>
                </div>
            </div>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Teacher Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .main-content {
            margin-left: 250px; /* Adjust based on your sidebar width */
        }
    </style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="bg-gray-100">
    <%@ include file="TeacherSidebar.jsp" %>
<body>
            <%@ include file="TeacherSidebar.jsp" %>

    <div class="main-content p-8">
        <!-- Welcome Section -->
        <div class="mb-8">
            <h1 class="text-3xl font-bold text-gray-800">Welcome</h1>
            <p class="text-gray-600">Here's your teaching overview</p>
        </div>

        <!-- Quick Stats -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
            <!-- Today's Classes -->
            <div class="bg-white rounded-lg shadow p-6">
                <div class="flex items-center">
                    <div class="p-3 rounded-full bg-blue-100 text-blue-500">
                        <i class="fas fa-chalkboard-teacher text-2xl"></i>
                    </div>
                    <div class="ml-4">
                        <p class="text-gray-500">Today's Classes</p>
                        <h3 class="text-2xl font-bold">5</h3>
                    </div>
                </div>
            </div>
            <!-- Active Students -->
            <div class="bg-white rounded-lg shadow p-6">
                <div class="flex items-center">
                    <div class="p-3 rounded-full bg-green-100 text-green-500">
                        <i class="fas fa-user-graduate text-2xl"></i>
                    </div>
                    <div class="ml-4">
                        <p class="text-gray-500">Active Students</p>
                        <h3 class="text-2xl font-bold">150</h3>
                    </div>
                </div>
            </div>
            <!-- Pending Tasks -->
            <div class="bg-white rounded-lg shadow p-6">
                <div class="flex items-center">
                    <div class="p-3 rounded-full bg-yellow-100 text-yellow-500">
                        <i class="fas fa-tasks text-2xl"></i>
                    </div>
                    <div class="ml-4">
                        <p class="text-gray-500">Pending Tasks</p>
                        <h3 class="text-2xl font-bold">8</h3>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main Content Grid -->
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
            <!-- Today's Schedule -->
            <div class="bg-white rounded-lg shadow">
                <div class="p-6 border-b border-gray-200">
                    <h2 class="text-xl font-bold">Today's Schedule</h2>
                </div>
                <div class="p-6">
                    <div class="space-y-4">
                        <div class="flex items-center p-4 bg-gray-50 rounded">
                            <div class="w-16 text-center">
                                <p class="font-bold">9:00</p>
                                <p class="text-sm text-gray-500">AM</p>
                            </div>
                            <div class="ml-4">
                                <p class="font-semibold">Mathematics - Class X</p>
                                <p class="text-sm text-gray-500">Room 101</p>
                            </div>
                        </div>
                        <div class="flex items-center p-4 bg-gray-50 rounded">
                            <div class="w-16 text-center">
                                <p class="font-bold">11:00</p>
                                <p class="text-sm text-gray-500">AM</p>
                            </div>
                            <div class="ml-4">
                                <p class="font-semibold">Physics - Class XI</p>
                                <p class="text-sm text-gray-500">Room 103</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Recent Activities -->
            <div class="bg-white rounded-lg shadow">
                <div class="p-6 border-b border-gray-200">
                    <h2 class="text-xl font-bold">Recent Activities</h2>
                </div>
                <div class="p-6">
                    <div class="space-y-4">
                        <div class="flex items-start">
                            <div class="flex-shrink-0">
                                <div class="w-3 h-3 bg-blue-500 rounded-full mt-2"></div>
                            </div>
                            <div class="ml-4">
                                <p class="text-gray-800">Submitted Class X Mathematics grades</p>
                                <p class="text-sm text-gray-500">2 hours ago</p>
                            </div>
                        </div>
                        <div class="flex items-start">
                            <div class="flex-shrink-0">
                                <div class="w-3 h-3 bg-green-500 rounded-full mt-2"></div>
                            </div>
                            <div class="ml-4">
                                <p class="text-gray-800">Created new assignment for Physics</p>
                                <p class="text-sm text-gray-500">4 hours ago</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Quick Actions -->
        <div class="mt-8 grid grid-cols-2 md:grid-cols-4 gap-4">
            <button class="p-4 bg-blue-500 text-white rounded-lg hover:bg-blue-600 flex items-center justify-center">
                <i class="fas fa-plus-circle mr-2"></i>
                Create Assignment
            </button>
            <button class="p-4 bg-green-500 text-white rounded-lg hover:bg-green-600 flex items-center justify-center">
                <i class="fas fa-book mr-2"></i>
                Take Attendance
            </button>
            <button class="p-4 bg-yellow-500 text-white rounded-lg hover:bg-yellow-600 flex items-center justify-center">
                <i class="fas fa-chart-bar mr-2"></i>
                View Reports
            </button>
            <button class="p-4 bg-purple-500 text-white rounded-lg hover:bg-purple-600 flex items-center justify-center">
                <i class="fas fa-calendar-plus mr-2"></i>
                Schedule Class
            </button>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
</body>
</html>
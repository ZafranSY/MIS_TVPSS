<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Programs</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f5f5f5;
        }

        .main-container {
            display: flex;
        }

        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            color: white;
            padding: 20px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
        }

        .content {
            margin-left: 250px;
            padding: 30px;
            width: calc(100% - 250px);
        }

        h1 {
            color: #2c3e50;
            margin-bottom: 30px;
            padding-bottom: 10px;
            border-bottom: 2px solid #3498db;
            font-size: 2em;
        }

        table {
            width: 100%;
            background-color: white;
            border-collapse: collapse;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 25px;
        }

        th {
            background-color: #4CAF50;
            color: white;
            padding: 15px;
            text-align: left;
            font-weight: 500;
        }

        td {
            padding: 12px 15px;
            border-bottom: 1px solid #eee;
            word-wrap: break-word;
            white-space: normal;
        }

        .date-cell {
            white-space: nowrap;
            text-align: center;
        }

        tbody tr:hover {
            background-color: #f8f9fa;
        }

        tbody tr:last-child td {
            border-bottom: none;
        }

        a {
            text-decoration: none;
            padding: 6px 12px;
            border-radius: 4px;
            font-weight: 500;
            display: inline-block;
        }

        @media (max-width: 768px) {
            .main-container {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }

            .content {
                margin-left: 0;
                width: 100%;
                padding: 20px;
            }

            a[href*="add"] {
                width: 100%;
                text-align: center;
                margin-top: 15px;
            }
        }
    </style>
</head>
<body>
    <div class="main-container">
        <!-- Sidebar Section -->
        <div class="sidebar">
            <%@ include file="adSchoolSidebar.jsp" %>
        </div>

        <!-- Content Section -->
        <div class="content">
            <h1>Program List</h1>
            <table>
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Program Name</th>
                        <th>Description</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>School</th>
                        <th>District</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="program" items="${programs}" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td>${program.name}</td>
                            <td>${program.description}</td>
                            <td><fmt:formatDate value="${program.startDate}" pattern="yyyy-MM-dd" /></td>
                            <td><fmt:formatDate value="${program.endDate}" pattern="yyyy-MM-dd" /></td>
                            <td>${program.school.name}</td>
                            <td>${program.school.district.name}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>

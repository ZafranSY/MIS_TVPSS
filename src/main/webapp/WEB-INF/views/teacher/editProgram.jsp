<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Program</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        h1 {
            color: #2c3e50;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
            margin-bottom: 30px;
        }
        form {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 10px;
        }
        input[type="text"],
        input[type="number"],
        input[type="date"],
        textarea {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        button {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <h1>Edit Program</h1>
    
    <!-- Form for submitting updated program details -->
    <form action="<c:url value='/teacher/updateProgram' />" method="post">
        
        <!-- Hidden field for Program ID (required for updating in DB) -->
        <input type="hidden" name="programID" value="${program.programID}">
        
        <!-- Hidden field for Teacher ID (if relevant) -->
        <input type="hidden" name="teacherID" value="${program.teacherID}">
        
        <!-- Title -->
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" value="${program.title}" required>

        <!-- Description -->
        <label for="description">Description:</label>
        <textarea id="description" name="description" required>${program.description}</textarea>

        <!-- Start Date -->
        <label for="startDate">Start Date:</label>
        <input type="date" id="startDate" name="startDate" 
               value="<fmt:formatDate value='${program.startDate}' pattern='yyyy-MM-dd' />" required>

        <!-- End Date -->
        <label for="endDate">End Date:</label>
        <input type="date" id="endDate" name="endDate" 
               value="<fmt:formatDate value='${program.endDate}' pattern='yyyy-MM-dd' />" required>

        <!-- Submit Button -->
        <button type="submit">Update Program</button>
    </form>
</body>
</html>

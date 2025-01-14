<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Program</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0 auto;
            padding: 20px;
            background-color: #f5f5f5;
            max-width: 800px;
        }
        form {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
        }
        input, select, textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        textarea {
            min-height: 100px;
            resize: vertical;
        }
        button {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #218838;
        }
        .error {
            color: #dc3545;
            font-size: 0.9em;
            margin-top: -10px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <h1>Add Program</h1>
    <form:form method="post" modelAttribute="program" action="/MIS_TVPSS/teacher/saveProgram">

        <!-- Teacher ID Field -->
        <label for="teacherID">Teacher ID (UserID):</label>
        <form:input path="teacherID" type="number" required="true" />
        <form:errors path="teacherID" cssClass="error" />

        <!-- Program Title Field -->
        <label for="title">Program Title:</label>
        <form:input path="title" type="text" required="true" />
        <form:errors path="title" cssClass="error" />

        <!-- Description Field -->
        <label for="description">Program Description:</label>
        <form:textarea path="description" required="true" />
        <form:errors path="description" cssClass="error" />

        <!-- Start Date Field -->
        <label for="startDate">Start Date:</label>
        <form:input path="startDate" type="date" required="true" />
        <form:errors path="startDate" cssClass="error" />

        <!-- End Date Field -->
        <label for="endDate">End Date:</label>
        <form:input path="endDate" type="date" required="true" />
        <form:errors path="endDate" cssClass="error" />

        <button type="submit">Save Program</button>
    </form:form>
</body>
</html>

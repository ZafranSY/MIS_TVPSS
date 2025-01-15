<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div id="addTaskModal" class="modal">
        <div class="modal-content">
            <span class="close" id="closeModal">&times;</span>
            <div class="modal-header">Add Task</div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="taskTitle">Task Title</label>
                    <input type="text" id="taskTitle" placeholder="Enter task title">
                </div>
                <div class="form-group">
                    <label for="taskDescription">Task Description</label>
                    <textarea id="taskDescription" placeholder="Enter task description"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" id="saveTask">Save Task</button>
                <button class="btn btn-secondary" id="cancelTask">Cancel</button>
            </div>
        </div>
    </div>
</body>
</html>
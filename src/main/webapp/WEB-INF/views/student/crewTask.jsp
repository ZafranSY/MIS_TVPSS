<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>UC007 Student Tasks</title>
    <link rel="stylesheet" href="/MIS_TVPSS/resources/css/crewTask.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="container">
        <%@ include file="StudentSidebar.jsp" %>

        <main class="content">
            <%@ include file="../common/header.jsp" %>

            <section class="task-section">
                <div class="task-list">
                    <h3>Task List</h3>
                    <ul id="task-list">
                        <c:forEach var="task" items="${tasks}">
                            <li class="task-item" data-task-id="${task.TaskID}">
                                <span class="task-title">${task.TaskTitle}</span>
                                <span class="task-description hidden">${task.TaskDescription}</span>
                                <span class="task-deadline hidden">${task.TaskDeadline}</span>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

                <div class="task-details">
                    <h3>Task Details</h3>
                    <div class="details-card">
                        <h4 id="task-title">Select a Task</h4>
                                <p><strong>Description:</strong> <span id="task-description">-</span></p>
                                <p><strong>Due Date:</strong> <span id="task-due-date">-</span></p>
                                <p><strong>Status:</strong> <span id="task-status">-</span></p>
                                <p><strong>Overdue:</strong> <span id="task-overdue">-</span></p>
                    </div>
                                        <div class="actions">
                        <button class="btn btn-complete" onclick="updateStatus('Approved')">
                            <i class="fa fa-check"></i> Complete
                        </button>
                        
                    </div>
                </div>
            </section>
        </main>
    </div>

    <script>
    // Handle task selection
    $(document).on("click", ".task-item", function () {
        const taskTitle = $(this).find(".task-title").text();
        const taskDescription = $(this).find(".task-description").text();
        const taskDeadline = $(this).find(".task-deadline").text();

        // Update task details
        $("#task-title-display").text(taskTitle || "N/A");
        $("#task-description-display").text(taskDescription || "N/A");
        $("#task-deadline-display").text(taskDeadline || "N/A");

        // Highlight selected task
        $(".task-item").removeClass("active");
        $(this).addClass("active");
    });

    // Ensure tasks load dynamically if needed
    $(document).ready(function () {
        const crewId = "${sessionScope.userID}";

        $.ajax({
	        url: "/MIS_TVPSS/adminschool/getTaskDetails",
	        method: "GET",
	        data: { crewID: crewId },
	     // Modify the task rendering section in your AJAX success callback
	        success: function (response) {
	            console.log("Tasks Response:", response);

	            if (!response.tasks || response.tasks.length === 0) {
	                console.warn(`No tasks found for Crew ID: ${crewId}`);
	                $("#task-list").html("<li>No tasks available.</li>");
	                return;
	            }

	            // Clear the task list
	            $("#task-list").empty();
	            
	            // Render each task
	            response.tasks.forEach(function(task) {
	                const taskItem = document.createElement('li');
	                taskItem.className = 'task-item';
	                taskItem.setAttribute('data-task-id', task.TaskID);
	                
	                const title = document.createElement('span');
	                title.textContent = task.TaskTitle;
	                
	                const desc = document.createElement('span');
	                desc.textContent = task.TaskDescription;
	                
	                
	                taskItem.appendChild(title);
	                taskItem.appendChild(desc);
	                
	                $("#task-list").append(taskItem);
	            });
	        },
	        error: function (xhr, status, error) {
	            console.error("Error fetching tasks:", error);
	        },
	    });
    });
    // Handle Task Selection
    $(document).on("click", ".task-item", function () {
        const taskID = $(this).data("task-id");
        console.log(`Selected Task ID: ${taskID}`); // Debug task ID

        $(".task-item").removeClass("active");
        $(this).addClass("active");

        // Fetch task details dynamically
        $.ajax({
            url: "/MIS_TVPSS/adminschool/getTaskDetailsByID",
            method: "GET",
            data: { taskID },
            success: function (response) {
                console.log("Task Details Response:", response); // Debug response

                // Populate task details
                $("#task-title").text(response.TaskTitle || "N/A");
                $("#task-description").text(response.TaskDescription || "N/A");
                $("#task-due-date").text(
                    response.TaskDueDate
                        ? new Date(response.TaskDueDate).toLocaleDateString()
                        : "N/A"
                );
                $("#task-status").text(response.TaskStatus || "N/A");
                $("#task-overdue").text(response.isOverdue ? "Yes" : "No");
            },
            error: function (xhr, status, error) {
                console.error("AJAX Error:", status, error);
                alert("Failed to fetch task details. Please try again.");
            },
        });
    });
    </script>
</body>
</html>

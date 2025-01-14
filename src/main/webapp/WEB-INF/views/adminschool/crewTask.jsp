<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>UC007 Review Applicant</title>
    <link rel="stylesheet" href="/MIS_TVPSS/resources/css/crewTask.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="container">
		<%@ include file="adSchoolSidebar.jsp"%>

        <main class="content">
            <header>
                <h1>Review Applicant</h1>
                <div class="user-profile">
                                            <p>${tasks[0].TaskTitle}</p>
                
                    <span>John Doe</span> <span>ID: 32450</span>
                </div>
            </header>

            <section class="review-applicant">
                <div class="applicant-list">
                    <h3>Applicants</h3>
                    <ul id="applicant-list">
                        <c:forEach var="applicant" items="${AllApplicantsbyschool}">
                            <li class="applicant-item" data-crew-id="${applicant.crewID }">
                                <span>${applicant.user.name}</span>
                                <span> crewID    ${applicant.crewID }</span>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

                <div class="applicant-details">
                    <div class="details-card">
                        <div class="profile-section">
                            <h2 class="applicant-name" id="name-display">Select a Crew</h2>
                        </div>
                        <!-- Task List -->
                        <div class="task-list">
                            <h3>Task List</h3>
                            <ul id="task-list">
                                <!-- Server-Side Rendering of Task List -->
                                <c:forEach var="task" items="${tasks}">
                                    <li class="task-item" data-task-id="${task.TaskID}">
                                        <span>${task.TaskTitle}</span>
                                        
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="crew-list">
                    <div class="task-details">
                        <h2>Task Details</h2>
                        <div class="details-card">
                            <div class="info-section">
                                <p><strong>Title:</strong> <span id="task-title">-</span></p>
                                <p><strong>Description:</strong> <span id="task-description">-</span></p>
                                <p><strong>Due Date:</strong> <span id="task-due-date">-</span></p>
                                <p><strong>Status:</strong> <span id="task-status">-</span></p>
                                <p><strong>Overdue:</strong> <span id="task-overdue">-</span></p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </div>

   <script>
   $(document).on("click", ".applicant-item", function () {
	    const crewId = $(this).data("crew-id") || $(this).attr("data-crew-id");

	    console.log("Clicked Element:", this.outerHTML); // Log the clicked element
	    console.log("Crew ID:", crewId);

	    if (!crewId) {
	        console.error("Crew ID is missing!");
	        alert("Crew ID is not available. Please check the HTML structure.");
	        return;
	    }

	    // Highlight the selected applicant
	    $(".applicant-item").removeClass("active");
	    $(this).addClass("active");

	    // Fetch tasks dynamically via AJAX
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

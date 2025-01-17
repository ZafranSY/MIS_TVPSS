<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>UC007 Review Applicant</title>
    <link rel="stylesheet" href="/MIS_TVPSS/resources/css/crewTask.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://kit.fontawesome.com/2b260a5b5a.js"></script>
    
</head>
<body>
    <div class="container">
		<%@ include file="adSchoolSidebar.jsp"%>

        <main class="content">
            		<%@ include file="../common/header.jsp"%>


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
                    <button class="btn btn-primary" id="addTaskButton">Add Task</button>
                        
                        </div>
                    </div> 
                </div>

                <div class="crew-list">
                    <div class="task-details">
                         <div class="task-header">
        <h2>Task Details</h2>
        <div class="task-actions">
            <button class="action-button edit-button" title="Edit Task">
                <i class="fa-solid fa-pen-to-square"></i>
                <span>Edit</span>
            </button>
            <button class="action-button delete-button" title="Delete Task">
                <i class="fa-solid fa-trash"></i>
                <span>Delete</span>
            </button>
        </div>
    </div>
            </div>
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
                  <!-- Modal for Add Task -->
<!-- Keep only this one modal -->
<div id="addTaskModal" class="modal">
    <div class="modal-content">
        <span class="close" id="closeModal">&times;</span>
        <div class="modal-header">Add Task</div>
        <div class="modal-body">
            <form id="taskForm">
                <div class="form-group">
                    <label for="taskTitle">Task Title</label>
                    <input type="text" id="taskTitle" name="taskTitle" placeholder="Enter task title" required>
                </div>
                <div class="form-group">
                    <label for="taskDescription">Task Description</label>
                    <textarea id="taskDescription" name="taskDescription" placeholder="Enter task description" rows="4"></textarea>
                </div>
                <div class="form-group">
                    <label for="taskDueDate">Due Date</label>
                    <input type="date" id="taskDueDate" name="taskDueDate">
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button class="btn btn-primary" id="saveTask">Save Task</button>
            <button class="btn btn-secondary" id="cancelTask">Cancel</button>
        </div>
    </div>
</div>

            </section>
        </main>
    </div>
<style>
/* Button Styles */
/* Task Details Container */
.task-details {
    position: relative;
    background-color: white;
    border-radius: 12px;
    padding: 24px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
    margin-bottom: 20px;
}

/* Remove background from details-card since parent is already white */
.details-card {
    padding: 20px;
    border-radius: 8px;
    border: 1px solid #e3e8ef;
    margin-top: 20px;
}

/* Header with Action Buttons Container */
.task-details .task-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
    padding-bottom: 15px;
    border-bottom: 2px solid #e3e8ef;
}

.task-details h2 {
    color: #1a237e;
    font-size: 18px;
    margin: 0;
    display: flex;
    align-items: center;
    gap: 10px;
}

/* Action Buttons Container */
.task-actions {
    display: flex;
    gap: 10px;
}

/* Individual Action Buttons */
.task-actions .action-button {
    padding: 6px 12px;
    border-radius: 6px;
    border: none;
    cursor: pointer;
    transition: all 0.2s ease;
    font-size: 14px;
    display: flex;
    align-items: center;
    gap: 6px;
}

/* Edit Button */
.task-actions .edit-button {
    background-color: #e3f2fd;
    color: #1976d2;
}

.task-actions .edit-button:hover {
    background-color: #bbdefb;
}

/* Delete Button */
.task-actions .delete-button {
    background-color: #fee2e2;
    color: #dc2626;
}

.task-actions .delete-button:hover {
    background-color: #fecaca;
}
.details-card
{
background-color: #fff;
}

/* Info Section Styling */
.info-section p {
    display: flex;
    justify-content: space-between;
    padding: 12px 0;
    border-bottom: 1px solid #e3e8ef;
    margin: 0;
}

.info-section p:last-child {
    border-bottom: none;
}

.info-section strong {
    color: #1a237e;
    min-width: 120px;
}

.info-section span {
    color: #4a5568;
}
.btn {
    padding: 8px 16px;
    border-radius: 6px;
    font-weight: 500;
    transition: all 0.3s ease;
    cursor: pointer;
    border: none;
    font-size: 14px;
}

.btn-primary {
    background-color: #4CAF50;
    color: white;
    box-shadow: 0 2px 4px rgba(76, 175, 80, 0.2);
}

.btn-primary:hover {
    background-color: #45a049;
    transform: translateY(-1px);
    box-shadow: 0 4px 6px rgba(76, 175, 80, 0.3);
}

.btn-secondary {
    background-color: #f44336;
    color: white;
    box-shadow: 0 2px 4px rgba(244, 67, 54, 0.2);
}

.btn-secondary:hover {
    background-color: #da190b;
    transform: translateY(-1px);
    box-shadow: 0 4px 6px rgba(244, 67, 54, 0.3);
}

  .modal {
    display: none; /* Hidden by default */
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.5);
    align-items: center;
    justify-content: center;
}

.modal-content {
    background-color: white;
    margin: auto;
    padding: 20px;
    border-radius: 8px;
    width: 50%;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    position: relative;
}


.modal {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    align-items: center;
    justify-content: center;
}

.modal.show {
    display: flex;
}

.modal-content {
    background-color: white;
    padding: 20px;
    border-radius: 8px;
    width: 500px;
    max-width: 90%;
    position: relative;
}

.modal-header {
    font-size: 1.25rem;
    font-weight: bold;
    margin-bottom: 1rem;
    padding-bottom: 0.5rem;
    border-bottom: 1px solid #eee;
}

.modal-body {
    margin-bottom: 1rem;
}

.form-group {
    margin-bottom: 1rem;
}

.form-group label {
    display: block;
    margin-bottom: 0.5rem;
    font-weight: 500;
}

.form-group input,
.form-group textarea {
    width: 100%;
    padding: 0.5rem;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 1rem;
}

.modal-footer {
    display: flex;
    justify-content: flex-end;
    gap: 10px;
    padding-top: 1rem;
    border-top: 1px solid #eee;
}

.close {
    position: absolute;
    right: 1rem;
    top: 1rem;
    font-size: 1.5rem;
    cursor: pointer;
    color: #666;
}

.close:hover {
    color: #000;
}

</style>
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
    
 // Remove any existing event listeners
    const addTaskButton = document.getElementById("addTaskButton");
    const modal = document.getElementById("addTaskModal");
    const closeModal = document.getElementById("closeModal");
    const cancelTask = document.getElementById("cancelTask");
    const saveTask = document.getElementById("saveTask");

    // Clean up existing listeners
    addTaskButton.replaceWith(addTaskButton.cloneNode(true));
    const newAddTaskButton = document.getElementById("addTaskButton");

    // Add new event listeners
    newAddTaskButton.addEventListener("click", function() {
     const activeCrew = $("#applicant-list .applicant-item.active");
        
        const crewID = activeCrew.data("crew-id");
        if(crewID != null)
        modal.style.display = "flex";
        else
        	alert("Select the crew first!!")
    });

    closeModal.addEventListener("click", function() {
        modal.style.display = "none";
    });

    cancelTask.addEventListener("click", function() {
        modal.style.display = "none";
    });

    saveTask.addEventListener("click", function() {
        const title = document.getElementById("taskTitle").value;
        const description = document.getElementById("taskDescription").value;
        const dueDate = document.getElementById("taskDueDate").value;
        
        const activeCrew = $("#applicant-list .applicant-item.active");
        
        const crewID = activeCrew.data("crew-id");
       
        console.log("crewId when save",crewID)
        if (!title.trim()) {
            alert("Task title is required!");
            return;
        } if(crewID == null)
        	{
        	alert("please select crew first!")
        	}
        else
        	{
        	
        	
        const payload= {
        		title:title,
        		description:description,
        		dueDate:dueDate,
                crewID: crewID

        }
        $.ajax({
            url: "/MIS_TVPSS/adminschool/createTask",
            method :"POST",            
            contentType: 'application/json', // Ensures JSON data is sent

            data: JSON.stringify({ 
                crewID: crewID, 
                title: title, 
                description: description, 
                dueDate: dueDate 
            }),
            beforeSend: function(xhr) {
            	var token = $("meta[name='_csrf']").attr("content");
            	var header = $("meta[name='_csrf_header']").attr("content");
            	if (token && header) {
            	    xhr.setRequestHeader(header, token);
            	}

            },
            success: function(response) {
                alert("Task created successfully");
                console.log(response);
                location.reload();
            },
            error: function(xhr, status, error) {
                console.error("Error creating task:", error);
                alert("Failed to create task. Please try again.");
            }
        });
        	}
        // Here you would typically send this data to your server
        console.log("Saving task:", { title, description, dueDate, crewID });

        // Clear form and close modal
        document.getElementById("taskForm").reset();
        modal.style.display = "none";
    });

    // Close modal when clicking outside
    window.addEventListener("click", function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    });
 // Handle delete button click
 $(".delete-button").click(function() {
    const activeTask = $("#task-list .task-item.active");
    if (!activeTask.length) {
        alert("Please select a task to delete");
        return;
    }

    const taskId = activeTask.data("task-id");
    
    if (confirm("Are you sure you want to delete this task?")) {
        $.ajax({
            url: `/MIS_TVPSS/adminschool/deleteTask/${taskId}`,
            method: "DELETE",
            beforeSend: function(xhr) {
                // Get CSRF token from meta tag
                var token = $("meta[name='_csrf']").attr("content");
                var header = $("meta[name='_csrf_header']").attr("content");
                if (token && header) {
                    xhr.setRequestHeader(header, token);
                }
            },
            contentType: 'application/json',
            success: function() {
                alert("Task deleted successfully");
                activeTask.remove();
                clearTaskDetails();
            },
            error: function(xhr, status, error) {
                console.error("Error deleting task:", error);
                alert("Failed to delete task. Please try again.");
            }
        });
    }
});
// Clear the task details section after deletion
function clearTaskDetails() {
    $("#task-title").text("-");
    $("#task-description").text("-");
    $("#task-due-date").text("-");
    $("#task-status").text("-");
    $("#task-overdue").text("-");
}
//First, add an edit modal (similar to your add modal)
$(".edit-button").click(function() {
    const activeTask = $("#task-list .task-item.active");
    if (!activeTask.length) {
        alert("Please select a task to edit");
        return;
    }

    // Pre-fill the modal with existing values
    $("#taskTitle").val($("#task-title").text());
    $("#taskDescription").val($("#task-description").text());
    // Parse the date properly
    const dueDate = new Date($("#task-due-date").text());
    $("#taskDueDate").val(dueDate.toISOString().split('T')[0]);

    // Show the modal
    modal.style.display = "flex";
    
    // Update the save button to handle edit instead of add
    $("#saveTask").attr("data-mode", "edit");
    $("#saveTask").attr("data-task-id", activeTask.data("task-id"));
});

// Modify your save handler to handle both add and edit

$("#saveTask").click(function() {
	 const title = document.getElementById("taskTitle").value;
     const description = document.getElementById("taskDescription").value;
     const dueDate = document.getElementById("taskDueDate").value;
     
     const activeCrew = $("#task-list .task-item.active");
     
     const taskID = activeCrew.data("task-id");
    
     console.log("crewId when save",task)
     if (!title.trim()) {
         alert("Task title is required!");
         return;
     } if(crewID == null)
     	{
     	alert("please select crew first!")
     	}
     else
     	{
     	
     	
     const payload= {
     		title:title,
     		description:description,
     		dueDate:dueDate,
     		taskID: taskID

     }
     $.ajax({
         url: "/MIS_TVPSS/adminschool/updateTask",
         method :"POST",            
         contentType: 'application/json', // Ensures JSON data is sent

         data: JSON.stringify({ 
             crewID: taskID, 
             title: title, 
             description: description, 
             dueDate: dueDate 
         }),
         beforeSend: function(xhr) {
         	var token = $("meta[name='_csrf']").attr("content");
         	var header = $("meta[name='_csrf_header']").attr("content");
         	if (token && header) {
         	    xhr.setRequestHeader(header, token);
         	}

         },
         success: function(response) {
             alert("Task created successfully");
             console.log(response);
             location.reload();
         },
         error: function(xhr, status, error) {
             console.error("Error creating task:", error);
             alert("Failed to create task. Please try again.");
         }
     });
     	}
     // Here you would typically send this data to your server
     console.log("Saving task:", { title, description, dueDate, crewID });

     // Clear form and close modal
     document.getElementById("taskForm").reset();
     modal.style.display = "none";
});
</script>

</body>
</html>

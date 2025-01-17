<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UC007 Review Applicant1</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
/* Base Layout */
body {
    font-family: 'Segoe UI', Arial, sans-serif;
    background-color: #f5f7fa;
    color: #2c3e50;
    margin: 0;
    padding: 0;
}

.container {
    display: flex;
    min-height: 100vh;
}

.sidebar {
    width: 280px;
    position: fixed;
    left: 0;
    top: 0;
    bottom: 0;
    background-color: white;
    box-shadow: 2px 0 8px rgba(0, 0, 0, 0.05);
    z-index: 10;
}

/* Main content positioning */
.content {
    flex: 1;
    margin-left: 280px;
    padding: 30px;
    background-color: #f8fafc;
    min-height: 100vh;
}

/* Header Styling */
header {
    background-color: white;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
    margin-bottom: 30px;
}

header h1 {
    font-size: 24px;
    color: #1a237e;
    margin: 0;
}

.user-profile {
    background-color: #f1f5f9;
    padding: 8px 15px;
    border-radius: 8px;
    font-size: 14px;
}

/* Review Section Layout */
.review-applicant {
    display: grid;
    grid-template-columns: minmax(250px, 300px) minmax(300px, 1fr);
    gap: 25px;
    margin-top: 20px;
}

/* Applicant List Styling */
.applicant-list {
    background-color: white;
    border-radius: 12px;
    padding: 20px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}

.applicant-list h3 {
    color: #1a237e;
    font-size: 18px;
    margin-bottom: 20px;
    padding-bottom: 10px;
    border-bottom: 2px solid #e3e8ef;
}

.applicant-list ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

.applicant-item {
    background-color: white;
    border: 1px solid #e3e8ef;
    padding: 15px;
    margin-bottom: 10px;
    border-radius: 8px;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
}

.applicant-item:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
    border-color: #4caf50;
}

.applicant-item.active {
    background-color: #e8f5e9;
    border-color: #4caf50;
}

.applicant-item img {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    margin-right: 15px;
    object-fit: cover;
}

/* Applicant Details Section */
.applicant-details {
    background-color: white;
    border-radius: 12px;
    padding: 20px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}

.applicant-details h2 {
    color: #1a237e;
    font-size: 18px;
    margin-bottom: 20px;
    padding-bottom: 10px;
    border-bottom: 2px solid #e3e8ef;
}

/* Form Styling */
.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    font-weight: 600;
    color: #1a237e;
    margin-bottom: 8px;
}

.form-group input,
.form-group select {
    width: 100%;
    padding: 12px;
    border: 1px solid #e3e8ef;
    border-radius: 8px;
    font-size: 14px;
    transition: border-color 0.3s ease;
    background-color: white;
}

.form-group input:focus,
.form-group select:focus {
    border-color: #4caf50;
    outline: none;
    box-shadow: 0 0 0 2px rgba(76, 175, 80, 0.1);
}

/* Button Styling */
.actions {
    margin-top: 30px;
    display: flex;
    gap: 15px;
}

.btn {
    padding: 12px 25px;
    border: none;
    cursor: pointer;
    font-weight: 600;
    border-radius: 8px;
    transition: all 0.3s ease;
    font-size: 14px;
}

.btn-approve {
    background-color: #4caf50;
    color: white;
}

.btn-reject {
    background-color: #f44336;
    color: white;
}

.btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

/* Crew List Styling */
.crew-list {
    background-color: white;
    border-radius: 12px;
    padding: 20px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
    margin-top: 30px;
}

.crew-list h3 {
    color: #1a237e;
    font-size: 18px;
    margin-bottom: 20px;
    padding-bottom: 10px;
    border-bottom: 2px solid #e3e8ef;
}

.crew-item {
    background-color: white;
    border: 1px solid #e3e8ef;
    padding: 15px;
    margin-bottom: 10px;
    border-radius: 8px;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
}

.crew-item:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
}

/* Responsive Design */
@media (max-width: 1200px) {
    .review-applicant {
        grid-template-columns: 1fr 2fr;
    }
    
    .crew-list {
        grid-column: span 2;
    }
}

@media (max-width: 768px) {
    .review-applicant {
        grid-template-columns: 1fr;
    }
    
    .crew-list {
        grid-column: span 1;
    }
    
    .content {
        margin-left: 0;
        padding: 15px;
    }
}
</style>
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
                    <c:forEach var="applicant" items="${pendingApplicants}">
                        <li class="applicant-item" data-crew-id="${applicant.crewID}">
                            <span>${applicant.user.name}</span>
                        </li>
                    </c:forEach>
                </ul>
            </div>

            <div class="applicant-details">
                <div class="details-card">
                    <div class="profile-section">
                        <h2 class="applicant-name" id="name-display">Select an applicant</h2>
                    </div>
                    <div class="info-section">
                        <p>
                            <i class="fa fa-id-card"></i> <strong>IC Number:</strong> 
                            <span id="icNumber-display">-</span>
                        </p>
                        <p>
                            <i class="fa fa-envelope"></i> <strong>Email:</strong> 
                            <span id="email-display">-</span>
                        </p>
                        <p>
                            <i class="fa fa-briefcase"></i> <strong>Position:</strong> 
                            <span id="position-display">-</span>
                        </p>
                        <p>
                            <i class="fa fa-briefcase"></i> <strong>School:</strong> 
                            <span id="school-display">-</span>
                        </p>
                        <p>
                            <i class="fa fa-map-marker"></i> <strong>Address:</strong> 
                            <span id="address-display">-</span>
                        </p>
                        <p>
                            <i class="fa fa-calendar"></i> <strong>Reason To Join</strong>
                            <span id="ReasonToJoin">-</span>
                        </p>
                        
                    </div>

                    <c:if test="${empty pendingApplicants}">
                        <p>No pending applicants found.</p>
                    </c:if>

                    <div class="actions">
                        <button class="btn btn-approve" onclick="updateStatus('Approved')">
                            <i class="fa fa-check"></i> Approve
                        </button>
                        <button class="btn btn-reject" onclick="updateStatus('Rejected')">
                            <i class="fa fa-times"></i> Reject
                        </button>
                    </div>
                </div>
            </div>
        </section>

        <section class="crew-section">
            <div class="crew-list">
                <h3>Crew List</h3>
                <ul id="crew-list">
                    <c:forEach var="crew" items="${approvedApplicants}">
                        <li class="crew-item" data-crew-id="${crew.crewID}">
                            <span>${crew.user.name}</span>
                        </li>
                    </c:forEach>
                </ul>
            </div>

            <div class="crew-details">
                <div class="details-card">
                    <div class="profile-section">
                        <h2 class="crew-name" id="crew-name-display">Select a crew member</h2>
                        <div class="task-actions">
                        <button class="action-button delete-button" data-crew-id="${crew.crewID}" title="Delete Task">
                <i class="fa-solid fa-trash"></i>
                <span>Delete</span>
            </button>
                        </div>
                    </div>
                    <div class="info-section">
                        <p>
                            <i class="fa fa-id-card"></i> <strong>IC Number:</strong>
                            <span id="crew-ic-display">-</span>
                        </p>
                        <p>
                            <i class="fa fa-envelope"></i> <strong>Email:</strong>
                            <span id="crew-email-display">-</span>
                        </p>
                        <p>
                            <i class="fa fa-briefcase"></i> <strong>Position:</strong>
                            <span id="crew-position-display">-</span>
                        </p>
                        <p>
                            <i class="fa fa-building"></i> <strong>School:</strong>
                            <span id="crew-school-display">-</span>
                        </p>
                        <p>
                            <i class="fa fa-map-marker"></i> <strong>Address:</strong>
                            <span id="crew-address-display">-</span>
                        </p>
                        <p>
                            <i class="fa fa-calendar"></i> <strong>Join Date:</strong>
                            <span id="crew-joindate-display">-</span>
                        </p>
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>

<style>
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


/* Delete Button */
.task-actions .delete-button {
    background-color: #fee2e2;
    color: #dc2626;
}

.task-actions .delete-button:hover {
    background-color: #fecaca;
}
.crew-section {
    display: grid;
    grid-template-columns: 1fr 2fr;
    gap: 20px;
    margin: 20px;
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.crew-list {
    background-color: #ffffff;
    padding: 15px;
    border-radius: 12px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.section-title {
    font-size: 18px;
    color: #1a237e;
    margin-bottom: 10px;
    border-bottom: 2px solid #e0e0e0;
    padding-bottom: 5px;
}

.list-item {
    padding: 10px 15px;
    border: 1px solid #e0e0e0;
    border-radius: 6px;
    margin-bottom: 10px;
    cursor: pointer;
    color: #424242;
}

.list-item.active {
    background-color: #e8f5e9;
    border-color: #4caf50;
    color: #1a237e;
}

.list-item:hover {
    background-color: #f1f8e9;
    border-color: #81c784;
}

.crew-details {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.crew-name {
    color: #0d47a1;
    font-size: 22px;
    margin-bottom: 20px;
    border-bottom: 2px solid #e0e0e0;
    padding-bottom: 10px;
}

.info-section {
    display: grid;
    grid-template-columns: 150px 1fr;
    gap: 10px 20px;
}

.info-row {
    display: contents;
}

.info-label {
    font-weight: bold;
    color: #1a237e;
}

.info-value {
    color: #424242;
}

@media (max-width: 768px) {
    .crew-section {
        grid-template-columns: 1fr;
        gap: 15px;
    }

    .info-section {
        grid-template-columns: 1fr;
    }
}

</style>

<script>
// Existing applicant click handler
$(document).on("click", ".applicant-item", function () {
    const crewId = $(this).data("crew-id");
    $(".applicant-item").removeClass("active");
    $(this).addClass("active");

    $.ajax({
        url: "/MIS_TVPSS/adminschool/getApplicantDetails",
        method: "GET",
        data: { crewID: crewId },
        success: function (response) {
            if (response.error) {
                alert(response.error);
                return;
            }
            console.log(response);

            $("#name-display").text(response.name || "N/A");
            $("#icNumber-display").text(response.ICNumber || "N/A");
            $("#email-display").text(response.email || "N/A");
            $("#position-display").text(response.role || "N/A");
            $("#school-display").text(response.schoolName || "N/A");
            $("#address-display").text(response.address || "N/A");
            $("#ReasonToJoin").text(response.ReasonToJoin || "Pending");
        },
        error: function () {
            alert("Failed to fetch applicant details. Please try again.");
        },
    });
});

// New crew click handler
$(document).on("click", ".crew-item", function () {
    const crewId = $(this).data("crew-id");
    console.log("crew memeber crewid ",crewId)
    $(".crew-item").removeClass("active");
    $(this).addClass("active");

    $.ajax({
        url: "/MIS_TVPSS/adminschool/getApplicantDetails",
        method: "GET",
        data: { crewID: crewId },
        success: function (response) {
            if (response.error) {
                alert(response.error);
                return;
            }

            $("#crew-name-display").text(response.name || "N/A");
            $("#crew-ic-display").text(response.ICNumber || "N/A");
            $("#crew-email-display").text(response.email || "N/A");
            $("#crew-position-display").text(response.role || "N/A");
            $("#crew-school-display").text(response.schoolName || "N/A");
            $("#crew-address-display").text(response.address || "N/A");
        },
        error: function () {
            alert("Failed to fetch applicant details. Please try again.");
        },
    });
});

function updateStatus(status) {
    const crewID = $(".applicant-item.active").data("crew-id");

    if (!crewID) {
        alert("Please select an applicant.");
        return;
    }

    $.ajax({
        url: "/MIS_TVPSS/adminschool/updateApplicationStatus",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify({
            crewID: crewID,  // Ensure this is an integer
            status: status  // Ensure this is a string
        }),
        success: function(response) {
        	location.reload();
            console.log("Status updated successfully", response);
        },
        error: function(xhr, status, error) {
            console.error("Error updating status: ", xhr, status, error);
        }
    });

}
$(".crew-section").on("click", ".delete-button", function() {
    const activeCrew = $("#crew-list .crew-item.active");
    const crewId = activeCrew.data("crew-id");
    
    if (!crewId) {
        alert("Please select a crew member first.");
        return;
    }

    if (confirm("Are you sure you want to delete this crew member?")) {
        $.ajax({
            url: "/MIS_TVPSS/adminschool/deleteCrew",  // Remove the trailing slash
            method: "POST",
            data: { crewID: crewId },  // Send as form data
            beforeSend: function(xhr) {
                // Get CSRF token from meta tag
                var token = $("meta[name='_csrf']").attr("content");
                var header = $("meta[name='_csrf_header']").attr("content");
                if (token && header) {
                    xhr.setRequestHeader(header, token);
                }
            },
            success: function(response) {
                if (response.success) {
                    // Remove the crew item from the list
                    activeCrew.remove();
                    // Clear the details display
                    $("#crew-name-display").text("Select a crew member");
                    $("#crew-ic-display").text("-");
                    $("#crew-email-display").text("-");
                    $("#crew-position-display").text("-");
                    $("#crew-school-display").text("-");
                    $("#crew-address-display").text("-");
                    $("#crew-joindate-display").text("-");
                    
                    alert("Crew member deleted successfully");
                } else {
                    alert(response.message || "Failed to delete crew member");
                }
            },
            error: function(xhr, status, error) {
                console.error("Error deleting crew member:", error);
                alert("Failed to delete crew member. Please try again.");
            }
        });
    }
});
</script>
</body>
</html>

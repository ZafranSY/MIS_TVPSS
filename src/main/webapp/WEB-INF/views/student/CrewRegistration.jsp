<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Crew Registration</title>
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

.sidebar {
	width: 300px;
	background-color: white;
	box-shadow: 2px 0 8px rgba(0, 0, 0, 0.05);
	padding: 20px;
}

.sidebar h2 {
	font-size: 20px;
	color: #1a237e;
	margin-bottom: 20px;
}

.sidebar nav ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.sidebar nav ul li {
	margin-bottom: 15px;
}

.sidebar nav ul li a {
	text-decoration: none;
	color: #2c3e50;
	font-size: 16px;
	transition: all 0.3s ease;
}

.menu-item:hover .icon {
	transform: scale(1.2);
}

.sidebar nav ul li a:hover {
	color: #4caf50;
}

.content {
	flex: 1;
	margin-left: 280px;
	padding: 30px;
	background-color: #f8fafc;
	min-height: 100vh;
}
/* Header */
/* Registration Form */
.registration-form {
	background-color: white;
	border-radius: 12px;
	padding: 30px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
	max-width: 800px;
	margin: 0 auto;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	font-weight: 600;
	color: #1a237e;
	margin-bottom: 8px;
}

.form-group input, .form-group select, .form-group textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #e3e8ef;
	border-radius: 8px;
	font-size: 14px;
	transition: border-color 0.3s ease;
	background-color: white;
	box-sizing: border-box;
}

.form-group input:focus, .form-group select:focus, .form-group textarea:focus
	{
	border-color: #4caf50;
	outline: none;
	box-shadow: 0 0 0 2px rgba(76, 175, 80, 0.1);
}

.form-group textarea {
	min-height: 120px;
	resize: vertical;
}

.file-upload {
	margin-top: 8px;
}

.btn-submit {
	background-color: #4caf50;
	color: white;
	padding: 12px 25px;
	border: none;
	border-radius: 8px;
	font-weight: 600;
	font-size: 14px;
	cursor: pointer;
	transition: all 0.3s ease;
}

.btn-submit:hover {
	transform: translateY(-2px);
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}
/* Responsive Design */
@media ( max-width : 768px) {
	.content {
		margin-left: 0;
		padding: 15px;
	}
	.sidebar {
		display: none;
	}
}
</style>
</head>
<body>
	<div class="container">
		<%@ include file="StudentSidebar.jsp"%>
		<div class="content">
			<%@ include file="../common/header.jsp"%>


			<div class="registration-form">
				<form:form method="post" modelAttribute="crew"
					action="/MIS_TVPSS/student/crewRegistration"
					onsubmit="return validateForm()">					action="/MIS_TVPSS/student/crewRegistration">
					<input type="hidden" name="userID" value="${sessionScope.userID}" />
					<input type="hidden" name="adminSchoolID"
						value="${sessionScope.adminSchoolID}" />
					<div class="form-group">
						<label for="districtDropdown">District:</label>
						<form:select path="district.districtID" id="districtDropdown"
							class="form-control">
							<form:option value="" label="-- Select District --" />
							<c:forEach var="dist" items="${district}">
								<form:option value="${dist.districtID}">${dist.districtID} - ${dist.name}</form:option>
							</c:forEach>
						</form:select>

					</div>
					<!-- School Selection -->
					<div class="form-group">
						<label for="schoolDropdown">School:</label> <select
							name="school.schoolID" id="schoolDropdown"
							onchange="updateHiddenFields(this)">
							<option value="">-- Select School --</option>
							<c:if test="${not empty schools}">
								<c:forEach var="school" items="${schools}">
									<option value="${school.schoolID}"
										data-school-name="${school.name}"
										data-admin-school-id="${school.adminSchool.adminSchoolID}">
										${school.name}</option>
								</c:forEach>
							</c:if>
						</select>
						<form:input type="hidden" path="schoolName" id="schoolNameInput" />
						<form:input type="hidden" path="adminSchool.adminSchoolID"
							id="adminSchoolIDInput" />
					</div>
					<div class="form-group">
						<label for="address">Address *</label>
						<form:textarea path="address" required="true" />
						<form:errors path="address" cssClass="error" />
					</div>
					<div class="form-group">
						<label for="icNumber">IC Number *</label>
						<form:input path="ICNumber" type="text" required="true" />
						<form:errors path="ICNumber" cssClass="error" />
					</div>
					<div class="form-group">
						<label for="reasonToJoin">Reason to Join *</label>
						<form:textarea path="ReasonToJoin" required="true" />
						<form:errors path="ReasonToJoin" cssClass="error" />
					</div>
					<div class="form-group">
						<button type="submit" class="btn-submit"
							style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer;">
							Submit Registration</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<script>
        // Add client-side validation
       /* document.querySelector('form').addEventListener('submit', function(e) {
            const icNumber = document.getElementById('icNumber').value;
            if (!/^\d{12}$/.test(icNumber)) {
                e.preventDefault();
@@ -227,7 +257,98 @@ header h1 {
                    e.target.value = '';
                }
            }
        }); */
        function validateForm() {
            console.log("Form submission triggered"); // Debug log
            
            // Get the school name value
            const schoolName = document.getElementById('schoolNameInput').value;
            console.log("School Name:", schoolName); // Debug log
            
            if (!schoolName) {
                alert("Please select a school");
                return false;
            }
            
            return true;
        }

        // Update school name when school is selected
        document.getElementById('schoolDropdown').addEventListener('change', function() {
            const selectedOption = this.options[this.selectedIndex];
            const schoolName = selectedOption.text;
            document.getElementById('schoolNameInput').value = schoolName;
            console.log("School name updated:", schoolName); // Debug log
        });
        function updateHiddenFields(selectElement) {
            const selectedOption = selectElement.options[selectElement.selectedIndex];
            document.getElementById('schoolNameInput').value = selectedOption.getAttribute('data-school-name');
            document.getElementById('adminSchoolIDInput').value = selectedOption.getAttribute('data-admin-school-id');
        }
        function updateSchoolName(selectElement) {
            var selectedOption = selectElement.options[selectElement.selectedIndex];
            document.getElementById('schoolName').value = selectedOption.getAttribute('data-school-name');
        }


        	console.log(document.getElementById('districtDropdown'));
        document.addEventListener("DOMContentLoaded", function () {
            const districtDropdown = document.getElementById('districtDropdown');
            const schoolDropdown = document.getElementById("schoolDropdown");
            
            if (districtDropdown) {
                districtDropdown.addEventListener('change', function() {
                    const selectedValue = this.value;
                    
                    // Validate the district ID
                    if (!selectedValue || selectedValue.trim() === '') {
                        console.error("Invalid district ID selected");
                        schoolDropdown.innerHTML = '<option value="">Please select a district first</option>';
                        return;
                    }
                    $.ajax({
                        url: "/MIS_TVPSS/student/getSchoolsByDistrict",
                        method: "GET",
                        data: { districtID: selectedValue },
                        success: function(data) {
                            console.log(data);  // Debug log to check if schools are being returned
                            schoolDropdown.innerHTML = '<option value="">-- Select School --</option>';
                            if (data && data.length > 0) {
                                data.forEach(school => {
                                    const option = document.createElement("option");
                                    option.value = school.schoolID;
                                    option.textContent = school.name;
                                    schoolDropdown.appendChild(option);
                                });
                            } else {
                                schoolDropdown.innerHTML = '<option value="">No schools found</option>';
                            }
                        },
                        error: function(xhr, status, error) {
                            console.error("Error fetching schools:", error);
                            schoolDropdown.innerHTML = '<option value="">Error loading schools</option>';
                        }
                    });

                });
            }
        });
       
  
     // Add this at the start of your script to ensure jQuery is loaded
// Using event delegation for both dropdowns
/*
document.getElementById("districtDropdown").addEventListener("change", function () {
    const selectedValue = this.value; // The value of the selected option
    if (!selectedDistrict) {
        console.error("districtDropdown element not found!");
        return;
    }
    const districtID = selectedDistrict.value;
    console.log("Selected District ID:", districtID); // Debug log
    fetch(`/student/selectDistrict?districtID=${districtID}`)
        .then(response => {
            console.log("Response Status:", response.status); // Debug log
            if (!response.ok) {
                throw new Error("Network response was not ok");
            }
            return response.json();
        })
        .then(data => {
            console.log("Schools received:", data); // Debug log
            const schoolDropdown = document.getElementById("schoolDropdown");
            schoolDropdown.innerHTML = '<option value="">-- Select School --</option>';
            data.forEach(school => {
                const option = document.createElement("option");
                option.value = school.schoolID;
                option.textContent = school.name;
                schoolDropdown.appendChild(option);
            });
        })
        .catch(error => {
            console.error("Error fetching schools:", error); // Debug log
            alert("Failed to fetch schools. Please try again.");
        });
});
*/
    </script>
</body>
</html>
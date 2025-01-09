<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UC007 Review Applicant</title>
<link rel="stylesheet"
	href="/MIS_TVPSS/resources/css/reviewApplicant.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="container">
		<%@ include file="adSchoolSidebar.jsp"%>

		<main class="content">
			<header>
				<h1>Review Applicant</h1>
				<div class="user-profile">
					<span>John Doe</span> <span>ID: 32450</span>
				</div>
			</header>

			<section class="review-applicant">
				<div class="applicant-list">
					<h3>Applicants</h3>
					<ul id="applicant-list">
						<c:forEach var="applicant" items="${pendingApplicants}">
							<li class="applicant-item" data-crew-id="${applicant.crewID}">
								<img src="/MIS_TVPSS/resources/images/default-profile.png"
								alt="Profile"> <span>${applicant.user.name}</span>
							</li>
						</c:forEach>
					</ul>
				</div>

				<div class="applicant-details">
					<div class="details-card">
						<div class="profile-section">
							<img src="/MIS_TVPSS/resources/images/default-profile.png"
								alt="Profile Picture" class="profile-pic">
							<h2 class="applicant-name" id="name-display">Select an
								applicant</h2>
						</div>
						<div class="info-section">
							<p>
								<i class="fa fa-id-card"></i> <strong>IC Number:</strong> <span
									id="icNumber-display">-</span>
							</p>
							<p>
								<i class="fa fa-envelope"></i> <strong>Email:</strong> <span
									id="email-display">-</span>
							</p>
							<p>
								<i class="fa fa-briefcase"></i> <strong>Position:</strong> <span
									id="position-display">-</span>
							</p>
							<p>
								<i class="fa fa-map-marker"></i> <strong>Address:</strong> <span
									id="address-display">-</span>
							</p>
							<p>
								<i class="fa fa-check-circle"></i> <strong>Application
									Status:</strong> <select id="applicationStatus" name="applicationStatus">
									<option value="Pending" selected>Pending</option>
									<option value="Approved">Approved</option>
									<option value="Rejected">Rejected</option>
								</select>
							</p>
						</div>
						<div class="actions">
							<button class="btn btn-approve"
								onclick="updateStatus('Approved')">
								<i class="fa fa-check"></i> Approve
							</button>
							<button class="btn btn-reject" onclick="updateStatus('Rejected')">
								<i class="fa fa-times"></i> Reject
							</button>
						</div>

					</div>
				</div>
			</section>
			<div class="crew-list">
    <h3>Crew List</h3>
    <ul id="crew-list">
        <c:forEach var="crew" items="${ApprovedApplicants}">
            <li class="crew-item" data-crew-id="${crew.crewID}">
                <img src="/MIS_TVPSS/resources/images/default-profile.png" alt="Profile">
                <span>${crew.user.name}</span>
            </li>
        </c:forEach>
    </ul>
</div>


		</main>
	</div>

	<script>
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

                    $("#name-display").text(response.name || "N/A");
                    $("#icNumber-display").text(response.icNumber || "N/A");
                    $("#email-display").text(response.email || "N/A");
                    $("#position-display").text(response.role || "N/A");
                    $("#address-display").text(response.address || "N/A");
                    $("#applicationStatus").val(response.applicationStatus || "Pending");
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
                method: "POST",
                data: { crewID: crewID, status: status },
                success: function (response) {
                    $("#applicationStatus").val(status); // Update the dropdown to reflect the change
                    location.reload();
                },
                error: function () {
                    alert("Failed to update application status. Please try again.");
                },
            });
        }

    </script>
</body>
</html>

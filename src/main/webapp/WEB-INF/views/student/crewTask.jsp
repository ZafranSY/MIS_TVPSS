<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <%@ include file="StudentSidebar.jsp" %>

        <main class="content">
            <header>
                <h1>Review Applicant</h1>
                <div class="user-profile">
                    <span>John Doe</span>
                    <span>ID: 32450</span>
                </div>
            </header>
             <div class="upcoming-overdue-task">
                    <h3>Upcoming or Overdue Task</h3>
                  
                </div>
            <section class="review-applicant">
                <div class="applicant-list">
                    <h3>Task Tittle</h3>
                   <ul id="applicant-list">
                        <c:forEach var="applicant" items="{pendingApplicants}">
                            <li class="applicant-item" data-crew-id="{applicant.crewID}">
                                <img src="/MIS_TVPSS/resources/images/default-profile.png" alt="Profile">
                                <span>{applicant.user.name}</span>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

               <div class="applicant-details">
    <div class="details-card">
        <div class="profile-section">
            <h2 class="applicant-name" id="name-display">Clean the Lab</h2>
        </div>
        <div class="info-section">
            <p><i class="fa fa-id-card"></i> <strong> Description :</strong> <span id="icNumber-display">-</span></p>
            <p><i class="fa fa-envelope"></i> <strong>Deadline :</strong> <span id="email-display">-</span></p>
        </div>
        <div class="actions">
            <button class="btn btn-approve"><i class="fa fa-check"></i> Complete</button>
        </div>
    </div>
</div>

            </section>
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
    </script>
</body>
</html>

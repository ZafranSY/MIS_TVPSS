<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pending Applicants</title>
</head>
<body>
    <section>
        <h3>Pending Applicants</h3>
        <table border="1">
            <thead>
                <tr>
                    <th>Crew ID</th>
                    <th>User ID</th>
                    <th>Role</th>
                    <th>Application Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="applicant" items="${pendingApplicants}">
                    <tr>
                        <td>${applicant.crewID}</td>

                        <td>${applicant.role}</td>
                        <td>${applicant.applicationStatus}</td>
                        <td>
                            <a href="/MIS_TVPSS/adminschool/reviewApplicant?crewID=${applicant.crewID}&action=approve">Approve</a> |
                            <a href="/MIS_TVPSS/adminschool/reviewApplicant?crewID=${applicant.crewID}&action=reject">Reject</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </section>
</body>
</html>

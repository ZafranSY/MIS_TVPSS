<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
		<h3>Pending Applicants</h3>
		<table>
			<thead>
				<tr>
					<th>Crew ID</th>
					<th>User ID</th>
					<th>Role</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				
				<c:forEach var="applicant" items="${pendingApplicants}">
					<tr>
						<td>${applicant.crewID}</td>
						<td>${applicant.userID}</td>
						<td>${applicant.role}</td>
						<td>
							<form action="/MIS_TVPSS/adminschool/reviewApplicant"
								method="post">
								<input type="hidden" name="crewID" value="${applicant.crewID}">
								<input type="hidden" name="action" value="approve">
								<button type="submit">Approve</button>
							</form>
							<form action="/MIS_TVPSS/adminschool/reviewApplicant"
								method="post">
								<input type="hidden" name="crewID" value="${applicant.crewID}">
								<input type="hidden" name="action" value="reject">
								<button type="submit">Reject</button>
							</form>
						</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</section>

</body>
</html>
<%@page import="org.apache.commons.codec.binary.Base64" %>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<title>Manage Students | Quiz Platform</title>
				<link rel="preconnect" href="https://fonts.googleapis.com">
				<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
				<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
					rel="stylesheet">
				<link rel="stylesheet" href="/css/style.css">
				<style>
					.student-pic {
						width: 50px;
						height: 50px;
						border-radius: 50%;
						object-fit: cover;
						border: 2px solid var(--glass-border);
					}

					.status-badge {
						padding: 0.25rem 0.75rem;
						border-radius: 20px;
						font-size: 0.75rem;
						font-weight: 600;
						text-transform: uppercase;
					}

					.status-approved {
						background: rgba(34, 197, 94, 0.2);
						color: #4ade80;
					}

					.status-pending {
						background: rgba(239, 68, 68, 0.2);
						color: #f87171;
					}
				</style>
			</head>

			<body>
				<div class="container" style="max-width: 1400px;">
					<div class="glass-card">
						<header>
							<h2 id="msg-pass">${pass}</h2>
							<h3 id="msg-fail">${fail}</h3>
							<h1>Student Management</h1>
							<p style="text-align: center; color: var(--text-muted); margin-bottom: 2rem;">Review and
								manage student access permissions</p>
						</header>

						<div class="table-container">
							<table>
								<thead>
									<tr>
										<th>Profile</th>
										<th>Name</th>
										<th>Email</th>
										<th>Mobile</th>
										<th>Gender</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="student" items="${students}">
										<tr>
											<td>
												<img class="student-pic"
													src="data:image/jpeg;base64,${Base64.encodeBase64String(student.getPicture())}"
													alt="Profile">
											</td>
											<td style="font-weight: 500;">${student.getName()}</td>
											<td>${student.getEmail()}</td>
											<td>${student.getMobile()}</td>
											<td>${student.getGender()}</td>
											<td>
												<c:if test="${student.isApproved()}">
													<span class="status-badge status-approved">Approved</span>
												</c:if>
												<c:if test="${!student.isApproved()}">
													<span class="status-badge status-pending">Pending</span>
												</c:if>
											</td>
											<td>
												<a href="/admin/student/change-status/${student.getId()}"
													class="btn btn-outline"
													style="padding: 0.5rem 1rem; font-size: 0.8rem;">
													Toggle Status
												</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

						<div style="text-align: center; margin-top: 2rem;">
							<a class="link" href="/admin/home">← Back to Dashboard</a>
						</div>
					</div>
				</div>
				<footer>
					<p>&copy; 2026 Quiz Platform. Built with passion by Silas.</p>
				</footer>
				<script>
					setTimeout(function () {
						const passMsg = document.getElementById('msg-pass');
						const failMsg = document.getElementById('msg-fail');
						if (passMsg) passMsg.style.display = 'none';
						if (failMsg) failMsg.style.display = 'none';
					}, 3000);
				</script>
			</body>

			</html>
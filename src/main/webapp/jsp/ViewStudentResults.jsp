<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Performance History | Quiz Platform</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/style.css">
<style>
    .percentage-circle {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 45px;
        height: 45px;
        border-radius: 50%;
        background: rgba(99, 102, 241, 0.1);
        border: 2px solid var(--primary);
        font-size: 0.8rem;
        font-weight: 700;
        color: var(--primary);
    }
    .score-chip {
        background: rgba(255, 255, 255, 0.05);
        padding: 0.25rem 0.75rem;
        border-radius: 12px;
        font-family: monospace;
        font-weight: 600;
    }
</style>
</head>
<body>
	<div class="container" style="max-width: 1200px;">
		<div class="glass-card">
			<header>
				<h2 id="msg-pass">${pass}</h2>
				<h3 id="msg-fail">${fail}</h3>
				<h1>Performance Analytics</h1>
				<p style="text-align: center; color: var(--text-muted); margin-bottom: 2rem;">Track your progress across all assessments</p>
			</header>

			<div class="table-container">
				<table>
					<thead>
						<tr>
							<th>Assessment Name</th>
							<th>Batch</th>
							<th>Max Score</th>
							<th>Your Score</th>
							<th>Percentage</th>
							<th>Details</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="result" items="${results}">
							<tr>
								<td style="font-weight: 600; color: var(--text);">${result.testName}</td>
								<td><span class="score-chip">${result.batchCode}</span></td>
								<td>${result.totalMarks}</td>
								<td style="color: var(--success); font-weight: 700;">${result.obtainedMarks}</td>
								<td>
									<div class="percentage-circle">
										${result.percentage}%
									</div>
								</td>
								<td>
									<a href="/student/test/questions/${result.id}" class="btn btn-outline" style="padding: 0.5rem 1rem; font-size: 0.8rem;">
										View Review
									</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<div style="text-align: center; margin-top: 2rem;">
				<a class="link" href="/student/home">← Back to Dashboard</a>
			</div>
		</div>
	</div>
	<footer>
		<p>&copy; 2026 Quiz Platform. Analytics Dashboard.</p>
	</footer>
	<script>
		setTimeout(function() {
			const passMsg = document.getElementById('msg-pass');
			const failMsg = document.getElementById('msg-fail');
			if (passMsg) passMsg.style.display = 'none';
			if (failMsg) failMsg.style.display = 'none';
		}, 3000);
	</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Student Dashboard | Quiz Platform</title>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
			rel="stylesheet">
		<link rel="stylesheet" href="/css/style.css">
	</head>

	<body>
		<div class="container">
			<div class="glass-card">
				<header>
					<h2 id="msg-pass">${pass}</h2>
					<h3 id="msg-fail">${fail}</h3>
					<h1>Student Dashboard</h1>
					<p style="text-align: center; color: var(--text-muted); margin-bottom: 2rem;">Welcome back! Ready to
						test your skills?</p>
				</header>
				<main>
					<div class="btn-group">
						<a href="/student/add-batchcode" class="btn btn-primary">Batch Selection</a>
						<a href="/student/show-test" class="btn btn-secondary">Available Tests</a>
						<a href="/student/view-result" class="btn btn-outline">Performance History</a>
						<a href="/logout" class="btn btn-outline"
							style="border-color: var(--error); color: var(--error);">Logout</a>
					</div>
				</main>
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
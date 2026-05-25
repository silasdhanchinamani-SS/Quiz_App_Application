<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login | Quiz Platform</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
	<div class="container">
		<div class="glass-card" style="max-width: 500px; margin: 0 auto;">
			<header>
				<h2 id="msg-pass">${pass}</h2>
				<h3 id="msg-fail">${fail}</h3>
				<h1>Admin Login</h1>
				<p style="text-align: center; color: var(--text-muted); margin-bottom: 2rem;">Secure access for platform administrators</p>
			</header>

			<div id="login">
				<form action="/admin/login" method="post">
					<div class="form-group">
						<label for="email">Admin Email</label>
						<input type="email" id="email" name="email" placeholder="admin@gmail.com" required>
					</div>
					<div class="form-group">
						<label for="password">Security Code (check console)</label>
						<input type="password" id="password" name="password" placeholder="••••" required>
					</div>
					<button type="submit" class="btn btn-primary" style="width: 100%;">Authenticate</button>
				</form>
				<p style="text-align: center; font-size: 0.8rem; color: var(--secondary); margin-top: 1rem;">
					Note: A new security token is generated and printed in the server console every time this page is loaded.
				</p>
			</div>
			<div style="text-align: center; margin-top: 2rem;">
				<a class="link" href="/">← Back to Home</a>
			</div>
		</div>
	</div>

	<footer>
		<p>&copy; 2026 Quiz Platform. Built with passion by Silas.</p>
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

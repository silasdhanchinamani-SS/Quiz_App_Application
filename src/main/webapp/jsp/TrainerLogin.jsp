<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trainer Login | Quiz Platform</title>
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
				<h1>Trainer Login</h1>
				<p style="text-align: center; color: var(--text-muted); margin-bottom: 2rem;">Access your trainer dashboard and manage tests</p>
			</header>

			<div id="login">
				<form action="/trainer/login" method="post">
					<div class="form-group">
						<label for="email">Work Email</label>
						<input type="email" id="email" name="email" placeholder="trainer@institution.edu" required>
					</div>
					<div class="form-group">
						<label for="password">Password</label>
						<input type="password" id="password" name="password" placeholder="••••••••" required>
					</div>
					<button type="submit" class="btn btn-primary" style="width: 100%;">Login to Workspace</button>
					<a class="link" href="/trainer/forgot-password">Forgot Password?</a>
					<hr style="border: 0; border-top: 1px solid var(--glass-border); margin: 1rem 0;">
					<a class="btn btn-secondary" href="/trainer/signup" style="width: 100%;">Apply as Trainer</a>
				</form>
			</div>
			<div style="text-align: center; margin-top: 2rem;">
				<a class="link" href="/">← Back to Home</a>
			</div>
		</div>
	</div>

	<footer>
		<p>&copy; 2026 Quiz Platform. Built with passion by Saish.</p>
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

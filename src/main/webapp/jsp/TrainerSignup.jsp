<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
		<!DOCTYPE html>
		<html lang="en">

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>Trainer Registration | Quiz Platform</title>
			<link rel="preconnect" href="https://fonts.googleapis.com">
			<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
			<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
				rel="stylesheet">
			<link rel="stylesheet" href="/css/style.css">
			<style>
				.radio-group {
					display: flex;
					gap: 1.5rem;
					padding: 0.5rem 0;
				}

				.radio-item {
					display: flex;
					align-items: center;
					gap: 0.5rem;
					cursor: pointer;
				}

				.radio-item input {
					width: auto;
					margin: 0;
				}

				.error-msg {
					color: var(--error);
					font-size: 0.8rem;
					margin-top: -1rem;
					margin-bottom: 0.5rem;
				}
			</style>
		</head>

		<body>
			<div class="container">
				<div class="glass-card" style="max-width: 600px; margin: 0 auto;">
					<header>
						<h2 id="msg-pass">${pass}</h2>
						<h3 id="msg-fail">${fail}</h3>
						<h1>Trainer Registration</h1>
						<p style="text-align: center; color: var(--text-muted); margin-bottom: 2rem;">Apply to become a
							mentor and create assessments</p>
					</header>

					<mvc:form action="/trainer/signup" method="post" modelAttribute="trainer"
						enctype="multipart/form-data">
						<div class="form-group">
							<label for="name">Full Name</label>
							<mvc:input path="name" placeholder="Prof. Jane Smith" />
							<div class="error-msg">
								<mvc:errors path="name" />
							</div>
						</div>

						<div class="form-group">
							<label for="email">Work Email</label>
							<mvc:input path="email" placeholder="jane.smith@institution.edu" />
							<div class="error-msg">
								<mvc:errors path="email" />
							</div>
						</div>

						<div class="form-group">
							<label for="mobile">Mobile Number</label>
							<mvc:input path="mobile" placeholder="+1 234 567 890" />
							<div class="error-msg">
								<mvc:errors path="mobile" />
							</div>
						</div>

						<div class="form-group">
							<label for="subject">Primary Subject</label>
							<mvc:input path="subject" placeholder="Computer Science" />
							<div class="error-msg">
								<mvc:errors path="subject" />
							</div>
						</div>

						<div class="form-group">
							<label for="eid">Employee ID</label>
							<mvc:input path="eid" placeholder="EMP-12345" />
						</div>

						<div class="form-group">
							<label for="password">Security Password</label>
							<mvc:password path="password" placeholder="••••••••" />
							<div class="error-msg">
								<mvc:errors path="password" />
							</div>
						</div>

						<div class="form-group">
							<label>Gender Selection</label>
							<div class="radio-group">
								<label class="radio-item">
									<mvc:radiobutton path="gender" value="male" /> Male
								</label>
								<label class="radio-item">
									<mvc:radiobutton path="gender" value="female" /> Female
								</label>
							</div>
							<div class="error-msg">
								<mvc:errors path="gender" />
							</div>
						</div>

						<div class="form-group">
							<label for="pic">Verification Photo</label>
							<input id="pic" type="file" name="pic" accept="image/*">
						</div>

						<div class="btn-group" style="margin-top: 1rem;">
							<button type="submit" class="btn btn-primary" style="flex: 1;">Register as Trainer</button>
							<button type="reset" class="btn btn-secondary">Clear</button>
						</div>
					</mvc:form>

					<div style="text-align: center; margin-top: 2rem;">
						<a class="link" href="/">← Back to Home</a>
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
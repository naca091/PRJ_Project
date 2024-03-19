<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<% 
    String message = (String) request.getAttribute("message");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="">
/* Reset CSS */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	color: #333;
}

.container {
	max-width: 800px;
	margin: 0 auto;
}

/* Sign-in section styles */
.sign-in {
	background: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin: 50px 0;
}

.signin-content {
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
}

.form-title {
	font-size: 24px;
	margin-bottom: 20px;
	text-transform: uppercase;
	color: #333;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	font-size: 16px;
	margin-bottom: 10px;
}

.form-group input[type="text"], .form-group input[type="password"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
}

.form-group input[type="checkbox"] {
	margin-right: 5px;
}

.form-button input[type="submit"] {
	background: #333;
	color: #fff;
	border: none;
	border-radius: 5px;
	padding: 10px 20px;
	cursor: pointer;
	font-size: 16px;
}

.form-button input[type="submit"]:hover {
	background: #555;
}

/* Social login styles */
.social-login {
	margin-top: 20px;
}

.social-label {
	font-size: 18px;
	color: #333;
}

.socials {
	list-style: none;
	padding: 0;
	display: flex;
	justify-content: center;
}

.socials li {
	margin-right: 10px;
}

.socials a {
	display: inline-block;
	background: #333;
	color: #fff;
	width: 40px;
	height: 40px;
	border-radius: 50%;
	line-height: 40px;
	text-align: center;
	font-size: 18px;
	text-decoration: none;
	transition: background 0.3s;
}

.socials a:hover {
	background: #555;
}
</style>
</head>
<body>
	<div class="main">
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">

					<div class="signin-form">
						<h2 class="form-title">Log in</h2>
						<% if (message != null) { %>
						<p><%= message %></p>
						<% } %>
						<form action="inforCar/layoutWeb/Login.jsp"
							method="POST" class="register-form" id="login-form">
							<div class="form-group"></div>
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</div>

	<script src="js/global.js"></script>
	<script src="js/main.js"></script>
</body>
</html>

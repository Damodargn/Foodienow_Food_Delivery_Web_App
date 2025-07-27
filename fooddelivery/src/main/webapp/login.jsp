<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTj9rfZOenKeoMdqAUXMswJf9IcoeODzuN2hg&s">
<title>Foodienow - Login</title>
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
	height: 100vh;
	background: url('https://images.unsplash.com/photo-1600891964599-f61ba0e24092?auto=format&fit=crop&w=1950&q=80') no-repeat center center/cover;
	display: flex;
	align-items: center;
	justify-content: center;
	position: relative;
}

body::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	backdrop-filter: blur(3px);
	z-index: 0;
}

.login-container {
	position: relative;
	z-index: 1;
	background: rgba(255, 255, 255, 0.1);
	backdrop-filter: blur(15px);
	-webkit-backdrop-filter: blur(15px);
	border-radius: 15px;
	box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
	padding: 40px 30px;
	width: 100%;
	max-width: 400px;
	color: white;
}

.login-container h2 {
	text-align: center;
	margin-bottom: 10px;
	color: #ffffff;
}

.login-container p {
	text-align: center;
	margin-bottom: 20px;
	color: #dddddd;
}

.input-group {
	margin-bottom: 20px;
}

.input-group label {
	display: block;
	margin-bottom: 6px;
	color: #ffffff;
}

.input-group input {
	width: 100%;
	padding: 10px 12px;
	border: none;
	border-radius: 10px;
	outline: none;
	background: rgba(255, 255, 255, 0.3);
	color: #ffffff;
	transition: 0.3s;
}

.input-group input::placeholder {
	color: #f1f1f1;
}

.input-group input:focus {
	background: rgba(255, 255, 255, 0.5);
}

button {
	width: 100%;
	padding: 12px;
	background-color: #ff7e5f;
	color: white;
	border: none;
	border-radius: 10px;
	font-size: 16px;
	cursor: pointer;
	transition: background 0.3s ease;
}

button:hover {
	background-color: #feb47b;
}

.footer-text {
	margin-top: 15px;
	text-align: center;
	color: #eeeeee;
}

.footer-text a {
	color: #ff7e5f;
	text-decoration: none;
	font-weight: bold;
}

.footer-text a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>

	<div class="login-container">
		<form action="callingservlet1" method="post" class="login-form">
			<h2>Welcome Back</h2>
			<p>Please login to your account</p>

			<div class="input-group">
				<label for="name">Name</label>
				<input type="text" id="name" placeholder="Name" name="Name" required>
			</div>

			<div class="input-group">
				<label for="password">Password</label>
				<input type="password" id="password" placeholder="Password" name="Password" required>
			</div>

			<button type="submit">Login</button>

			<p class="footer-text">
				Don't have an account? <a href="signUp.jsp">Sign up</a>
			</p>
		</form>
	</div>

</body>
</html>

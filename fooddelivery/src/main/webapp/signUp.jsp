<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTj9rfZOenKeoMdqAUXMswJf9IcoeODzuN2hg&s">
<title>Foodienow - Sign Up</title>
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
	height: 100vh;
	background:url('https://images.unsplash.com/photo-1600891964599-f61ba0e24092?auto=format&fit=crop&w=1950&q=80') no-repeat center center/cover;
	display: flex;
	align-items: center;
	justify-content: center;
	position: relative;
	overflow: hidden;
}

/* Multicolor gradient overlay */
body::before {
	content: '';
	position: absolute;
	inset: 0;
	background-size: 400% 400%;
	animation: gradientFlow 15s ease infinite;
	backdrop-filter: blur(8px);
	z-index: 0;
}

/* Animate the gradient */
@keyframes gradientFlow {
	0% { background-position: 0% 50%; }
	50% { background-position: 100% 50%; }
	100% { background-position: 0% 50%; }
}

.signup-container {
	position: relative;
	z-index: 1;
	background: rgba(255, 255, 255, 0.1);
	backdrop-filter: blur(20px);
	border-radius: 20px;
	box-shadow: 0 12px 32px rgba(0, 0, 0, 0.25);
	padding: 45px 35px;
	width: 100%;
	max-width: 420px;
	color: #fff;
	animation: fadeIn 1s ease;
}

@keyframes fadeIn {
	from { opacity: 0; transform: translateY(20px); }
	to { opacity: 1; transform: translateY(0); }
}

.signup-container h2 {
	text-align: center;
	margin-bottom: 30px;
	color: #fff;
	letter-spacing: 1px;
	text-shadow: 1px 1px 3px rgba(0,0,0,0.4);
}

input[type="text"],
input[type="number"],
input[type="email"],
input[type="password"] {
	width: 100%;
	padding: 12px;
	margin-bottom: 20px;
	border: none;
	border-radius: 12px;
	background: rgba(255, 255, 255, 0.3);
	color: black; /* Changed from #fff to black */
	outline: none;
	transition: 0.3s ease-in-out;
	font-size: 15px;
}

input::placeholder {
	color: black; /* Placeholder color */
}


input:focus {
	background: rgba(255, 255, 255, 0.5);
	box-shadow: 0 0 5px rgba(255,255,255,0.6);
}

.signup-container button {
	width: 100%;
	padding: 14px;
	background: linear-gradient(135deg, #ff4e50, #f9d423);
	color: white;
	border: none;
	border-radius: 12px;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	transition: transform 0.3s ease, background 0.3s ease;
}

.signup-container button:hover {
	transform: scale(1.05);
	background: linear-gradient(135deg, #f9d423, #ff4e50);
}
</style>
</head>
<body>

	<form action="callingSignup" method="post">
		<div class="signup-container">
			<h2>Create Your Account</h2>
			<input type="text" placeholder="Name" name="Name" required />
			<input type="number" placeholder="Phone Number" name="Phonenumber" required />
			<input type="email" placeholder="Email ID" name="EmailId" required />
			<input type="password" placeholder="Password" name="Password" required />
			<button type="submit">Sign Up</button>
		</div>
	</form>

</body>
</html>

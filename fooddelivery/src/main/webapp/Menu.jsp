<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTj9rfZOenKeoMdqAUXMswJf9IcoeODzuN2hg&s">
<title>Foodienow - Menus</title>
<style>
body {
	font-family: 'Segoe UI', sans-serif;
	background:
		url('https://images.unsplash.com/photo-1600891964599-f61ba0e24092?auto=format&fit=crop&w=1950&q=80')
		no-repeat center center/cover;
	margin: 0;
	padding: 20px;
}

.menu-container {
	max-width: 600px;
	margin: auto;
	background: #fff;
	border-radius: 8px;
	padding: 30px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

h1 {
	text-align: center;
	color: #d35400;
	margin-bottom: 30px;
}

.menu-section {
	margin-bottom: 25px;
}

.menu-section h2 {
	color: #2c3e50;
	border-bottom: 2px solid #eee;
	padding-bottom: 5px;
}

ul {
	list-style: none;
	padding: 0;
}

li {
	display: flex;
	justify-content: space-between;
	padding: 10px 0;
	border-bottom: 1px dotted #ccc;
}

li span:first-child {
	font-weight: 500;
}

li span:last-child {
	color: #16a085;
	font-weight: bold;
}

/* Home button styles */
.home-button {
	display: inline-block;
	background: #d35400;
	color: white;
	padding: 10px 25px;
	border-radius: 30px;
	text-decoration: none;
	font-weight: 600;
	font-size: 1rem;
	margin-bottom: 25px;
	box-shadow: 0 4px 10px rgba(211, 84, 0, 0.4);
	transition: background 0.3s ease, box-shadow 0.3s ease;
}

.home-button:hover {
	background: #e67e22;
	box-shadow: 0 6px 15px rgba(230, 126, 34, 0.6);
}
</style>
</head>
<body>

	<!-- Home button -->
	<a href="food.jsp" class="home-button">🏠 Home</a>

	<form action="callingmenuservlet" method="post">
		<div class="menu-container">
			<h1>🌟 Welcome to Foodienow</h1>

			<section class="menu-section">
				<h2>Starters</h2>
				<ul>
					<li><span>Paneer Tikka</span><span>$7.75</span></li>
					<li><span>Veg Spring Rolls</span><span>$8.75</span></li>
					<li><span>Prawns</span><span>$12.50</span></li>
					<li><span>Vaya</span><span>$9.10</span></li>
				</ul>
			</section>

			<section class="menu-section">
				<h2>Main Course</h2>
				<ul>
					<li><span>Butter Chicken</span><span>$9.99</span></li>
					<li><span>Veg Fried Rice</span><span>$6.99</span></li>
					<li><span>Shawarma</span><span>$7.99</span></li>
					<li><span>Mutton Fry</span><span>$11.25</span></li>
					<li><span>Sushi World</span><span>$10.99</span></li>
				</ul>
			</section>

			<section class="menu-section">
				<h2>Beverages and Snacks</h2>
				<ul>
					<li><span>Cold Coffee</span><span>$3.99</span></li>
					<li><span>Burger Palace</span><span>$5.99</span></li>
					<li><span>Pizza</span><span>$8.99</span></li>
				</ul>
			</section>
		</div>

	</form>

</body>
</html>

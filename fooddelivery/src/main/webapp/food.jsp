<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String username = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTj9rfZOenKeoMdqAUXMswJf9IcoeODzuN2hg&s">
    <title>Foodienow - Foods</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: url('https://images.unsplash.com/photo-1600891964599-f61ba0e24092?auto=format&fit=crop&w=1950&q=80') no-repeat center center/cover;
            min-height: 100vh;
            color: #333;
        }

        .navbar {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            position: sticky;
            top: 0;
            z-index: 1000;
            backdrop-filter: blur(8px);
        }

        .navbar h1 {
            color: #fc8019;
            font-weight: bold;
        }

        .navbar ul {
            list-style: none;
            display: flex;
            gap: 2rem;
        }

        .navbar ul li {
            font-size: 1rem;
            cursor: pointer;
            color: #444;
            transition: color 0.3s;
        }

        .navbar ul li:hover {
            color: #fc8019;
        }

        .navbar a {
            text-decoration: none;
        }

        .restaurant-section {
            padding: 2rem;
        }

        .restaurant-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 2rem;
        }

        button.restaurant-card {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease-in-out;
            border: none;
            cursor: pointer;
            padding: 0;
            text-align: left;
            font-family: inherit;
        }

        button.restaurant-card:hover {
            transform: translateY(-6px);
        }

        button.restaurant-card img {
            width: 100%;
            height: 160px;
            object-fit: cover;
            display: block;
        }

        .restaurant-info {
            padding: 1rem;
        }

        .restaurant-info h3 {
            margin-bottom: 0.5rem;
            color: #333;
        }

        .description {
            font-size: 0.9rem;
            color: #666;
            margin-bottom: 0.5rem;
        }

        .details {
            display: flex;
            justify-content: space-between;
            font-size: 0.85rem;
            color: #777;
        }

        .rating {
            background-color: #48c479;
            color: white;
            padding: 0.2rem 0.5rem;
            border-radius: 5px;
            font-weight: bold;
        }

        @media (max-width: 768px) {
            .navbar ul {
                gap: 1rem;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>

<nav class="navbar">
    <h1>FoodieNow</h1>
    <ul>
        <a href="food.jsp"><li>Home</li></a>
        <a href="Menu.jsp"><li>Menu</li></a>
        <a href="cart.jsp"><li>Cart</li></a>
        <a href="login.jsp"><li>Login</li></a>
    </ul>
</nav>

<form action="callingservlet2" method="post">
    <section class="restaurant-section">
        <div class="restaurant-grid">

<%
    String[][] foods = {
        {"Burger Palace", "https://images.getbento.com/accounts/a9557f94e91b365d1d35efa65fb2af99/media/images/43150BW_Website.jpg", "Burgers, Fast Food", "30 mins", "4.2"},
        {"Pizza Delight", "https://b.zmtcdn.com/data/dish_photos/3b5/21f8b79e66a380476c3466251e4d53b5.jpeg", "Italian, Pizza", "25 mins", "4.5"},
        {"Spicy Biryani", "https://b.zmtcdn.com/data/dish_photos/f4c/869e36f525b9b5a6094d797d2f129f4c.jpg", "Indian, Biryani", "40 mins", "4.3"},
        {"Noodels", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRj4fbDzlSwNqWoBrAIR5tG2DH7S2u4I9qTg&s", "Asian, Chinese", "20 mins", "4.1"},
        {"Sushi World", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-SU9u7pqWZaw008hCWz0noS2iOk-Z_q6H4A&s", "Japanese, Sushi", "35 mins", "4.6"},
        {"Butter Chicken", "https://b.zmtcdn.com/data/dish_photos/213/8fb963500627fc3270bdf801ec4a9213.jpg", "Indian, Butter Chicken", "35 mins", "4.7"},
        {"Fry Fish", "https://b.zmtcdn.com/data/dish_photos/539/f7723ce68fc4d013d15fb62b5c159539.jpg?output-format=webp", "Italian, Fry Fish", "25 mins", "4.4"},
        {"Mutton Fry", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJcY1vrl-RW-LTrC305LNBCiwtLH70iTt4fQ&s", "Indian, Mutton Fry", "35 mins", "4.3"},
        {"Paneer Thikka", "https://www.oyorooms.com/blog/wp-content/uploads/2018/07/shutterstock_423385612.jpg", "Indian, Paneer Thikka", "30 mins", "4.5"},
        {"Cold Coffee", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQnnXPwgvjhVD1VDYcjJHYy-l4HkXT7ElqKw&s", "Indian, Cold Coffee", "25 mins", "4.6"},
        {"Prawns", "https://th.bing.com/th/id/OIP.jH9OvpFQojd7DCN2s19q6QHaE7?w=299&h=199&c=7&r=0&o=5&dpr=1.3&pid=1.7", "Italian, Prawns", "30 mins", "4.2"},
        {"Chicken Tikka", "https://th.bing.com/th/id/OIP.qUdsA17N2f9pauk7M4OuKAHaE8?w=229&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7", "Indian, Chicken Tikka", "35 mins", "4.5"},
        {"Fried Rice", "https://b.zmtcdn.com/data/dish_photos/04c/27d2dc24001bfe450a6da7fc7894004c.jpeg", "Italian, Fried Rice", "30 mins", "4.2"},
        {"Chicken Paneer Rolls", "https://b.zmtcdn.com/data/pictures/chains/8/54308/f4b955e8e8271c4c99d8af4ee8edc604_o2_featured_v2.jpg", "Indian, Chicken Paneer Rolls", "35 mins", "4.5"},
        {"Shawarma", "https://b.zmtcdn.com/data/pictures/6/17949166/711ec69ed68d2d0e85e82baa1197fc31_o2_featured_v2.jpg", "Italian, Shawarma", "30 mins", "4.2"},
        {"Vaya", "https://th.bing.com/th/id/OIP.spqHcPbp6cuALm1RMoUMWQHaG4?w=195&h=182&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3", "Indian, Vaya", "35 mins", "4.5"}
    };

    for (String[] food : foods) {
%>
    <% if (username != null) { %>
    <button type="submit" name="item" value="<%= food[0] %>" class="restaurant-card">
    <% } else { %>
    <button type="button" onclick="window.location.href='login.jsp'" class="restaurant-card">
    <% } %>
        <img src="<%= food[1] %>" alt="<%= food[0] %>" />
        <div class="restaurant-info">
            <h3><%= food[0] %></h3>
            <div class="description"><%= food[2] %></div>
            <div class="details">
                <span><%= food[3] %></span>
                <span class="rating"><%= food[4] %> ★</span>
            </div>
        </div>
    </button>
<%
    }
%>

        </div>
    </section>
</form>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTj9rfZOenKeoMdqAUXMswJf9IcoeODzuN2hg&s">
    <title>FoodieNow - Cart</title>
    <style>
        body {
            background: linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%);
            background:url('https://images.unsplash.com/photo-1600891964599-f61ba0e24092?auto=format&fit=crop&w=1950&q=80') no-repeat center center/cover;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #333;
            min-height: 100vh;
            padding: 20px;
        }

        .cart-container {
            max-width: 700px;
            margin: auto;
            background-color: rgba(255,255,255,0.95);
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        h1 {
            color: #fc8019;
            margin-bottom: 1rem;
            text-align: center;
        }

        .cart-item {
            display: flex;
            align-items: center;
            border-bottom: 1px solid #ddd;
            padding: 12px 0;
            gap: 15px;
        }

        .item-img {
            width: 80px;
            height: 80px;
            border-radius: 10px;
            object-fit: cover;
            flex-shrink: 0;
        }

        .item-info {
            flex-grow: 1;
        }

        .item-name {
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 6px;
        }

        .quantity-controls {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        button.qty-btn {
            width: 30px;
            height: 30px;
            font-size: 20px;
            border: none;
            background-color: #fc8019;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }

        button.qty-btn:hover {
            background-color: #e67300;
        }

        .quantity-display {
            min-width: 20px;
            text-align: center;
            font-size: 1.1rem;
            font-weight: 600;
            color: #555;
        }

        .item-price {
            width: 80px;
            text-align: right;
            font-weight: 600;
            color: #333;
        }

        .checkout-section {
            margin-top: 25px;
            text-align: center;
        }

        button.checkout-btn {
            background-color: #fc8019;
            border: none;
            color: white;
            padding: 12px 30px;
            font-size: 1.1rem;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
        }

        button.checkout-btn:hover {
            background-color: #e67300;
        }

        .empty-message {
            text-align: center;
            font-size: 1.1rem;
            color: #666;
            padding: 2rem 0;
        }
    </style>

    <script>
        function updateCart(itemName, action) {
            fetch('CartUpdateServlet', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: 'itemName=' + encodeURIComponent(itemName) + '&action=' + action
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    document.getElementById(itemName + '-qty').textContent = data.quantity;
                    document.getElementById(itemName + '-subtotal').textContent = '$' + data.subtotal.toFixed(2);
                    document.getElementById('totalPrice').textContent = '$' + data.totalPrice.toFixed(2);

                    if (data.quantity === 0) {
                        let itemDiv = document.getElementById(itemName + '-item');
                        if(itemDiv) {
                            itemDiv.remove();
                        }

                        if (document.querySelectorAll('.cart-item').length === 0) {
                            document.querySelector('.cart-container').innerHTML = '<div class="empty-message">Your cart is empty. <a href="food.jsp" style="color:#fc8019; text-decoration:none;">Browse food</a></div>';
                        }
                    }
                }
            })
            .catch(err => console.error('Error:', err));
        }
    </script>
</head>
<body>

<div class="cart-container">
    <h1>Your Cart</h1>

<%
    Map<String, Double> itemPrices = new HashMap<>();
    Map<String, String> itemImages = new HashMap<>();

    itemPrices.put("Burger Palace", 5.99);
    itemPrices.put("Pizza Delight", 8.99);
    itemPrices.put("Spicy Biryani", 7.49);
    itemPrices.put("Noodels", 6.25);
    itemPrices.put("Sushi World", 10.99);
    itemPrices.put("Butter Chicken", 9.99);
    itemPrices.put("Fry Fish", 8.50);
    itemPrices.put("Mutton Fry", 11.25);
    itemPrices.put("Paneer Thikka", 7.75);
    itemPrices.put("Cold Coffee", 3.99);
    itemPrices.put("Prawns", 12.50);
    itemPrices.put("Chicken Tikka", 9.50);
    itemPrices.put("Fried Rice", 6.99);
    itemPrices.put("Chicken Paneer Rolls", 8.75);
    itemPrices.put("Shawarma", 7.99);
    itemPrices.put("Vaya", 9.10);

    itemImages.put("Burger Palace", "https://images.getbento.com/accounts/a9557f94e91b365d1d35efa65fb2af99/media/images/43150BW_Website.jpg");
    itemImages.put("Pizza Delight", "https://b.zmtcdn.com/data/dish_photos/3b5/21f8b79e66a380476c3466251e4d53b5.jpeg");
    itemImages.put("Spicy Biryani", "https://b.zmtcdn.com/data/dish_photos/f4c/869e36f525b9b5a6094d797d2f129f4c.jpg");
    itemImages.put("Noodels", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRj4fbDzlSwNqWoBrAIR5tG2DH7S2u4I9qTg&s");
    itemImages.put("Sushi World", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-SU9u7pqWZaw008hCWz0noS2iOk-Z_q6H4A&s");
    itemImages.put("Butter Chicken", "https://b.zmtcdn.com/data/dish_photos/213/8fb963500627fc3270bdf801ec4a9213.jpg");
    itemImages.put("Fry Fish", "https://b.zmtcdn.com/data/dish_photos/539/f7723ce68fc4d013d15fb62b5c159539.jpg?output-format=webp");
    itemImages.put("Mutton Fry", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJcY1vrl-RW-LTrC305LNBCiwtLH70iTt4fQ&s");
    itemImages.put("Paneer Thikka", "https://www.oyorooms.com/blog/wp-content/uploads/2018/07/shutterstock_423385612.jpg");
    itemImages.put("Cold Coffee","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQnnXPwgvjhVD1VDYcjJHYy-l4HkXT7ElqKw&s");
    itemImages.put("Prawns", "https://th.bing.com/th/id/OIP.jH9OvpFQojd7DCN2s19q6QHaE7?w=299&h=199&c=7&r=0&o=5&dpr=1.3&pid=1.7");
    itemImages.put("Chicken Tikka", "https://th.bing.com/th/id/OIP.qUdsA17N2f9pauk7M4OuKAHaE8?w=229&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7");
    itemImages.put("Fried Rice", "https://b.zmtcdn.com/data/dish_photos/04c/27d2dc24001bfe450a6da7fc7894004c.jpeg");
    itemImages.put("Chicken Paneer Rolls", "https://b.zmtcdn.com/data/pictures/chains/8/54308/f4b955e8e8271c4c99d8af4ee8edc604_o2_featured_v2.jpg");
    itemImages.put("Shawarma", "https://b.zmtcdn.com/data/pictures/6/17949166/711ec69ed68d2d0e85e82baa1197fc31_o2_featured_v2.jpg");
    itemImages.put("Vaya", "https://th.bing.com/th/id/OIP.spqHcPbp6cuALm1RMoUMWQHaG4?w=195&h=182&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3");

    List<String> cart = (List<String>) session.getAttribute("cart");

    if (cart == null || cart.isEmpty()) {
%>
    <div class="empty-message">Your cart is empty. <a href="food.jsp" style="color:#fc8019; text-decoration:none;">Add food</a></div>
<%
    } else {
        Map<String, Integer> itemCounts = new LinkedHashMap<>();
        for (String item : cart) {
            itemCounts.put(item, itemCounts.getOrDefault(item, 0) + 1);
        }

        double totalPrice = 0.0;

        for (Map.Entry<String, Integer> entry : itemCounts.entrySet()) {
            String itemName = entry.getKey();
            int quantity = entry.getValue();
            double price = itemPrices.getOrDefault(itemName, 0.0);
            double subTotal = price * quantity;
            totalPrice += subTotal;
%>
    <div class="cart-item" id="<%= itemName %>-item">
        <img src="<%= itemImages.getOrDefault(itemName, "https://via.placeholder.com/80") %>" alt="<%= itemName %>" class="item-img" />
        <div class="item-info">
            <div class="item-name"><%= itemName %></div>
            <div class="quantity-controls">
                <button type="button" class="qty-btn" onclick="updateCart('<%= itemName %>', 'decrease')" title="Decrease quantity">−</button>

                <div class="quantity-display" id="<%= itemName %>-qty"><%= quantity %></div>

                <button type="button" class="qty-btn" onclick="updateCart('<%= itemName %>', 'increase')" title="Increase quantity">+</button>
            </div>
        </div>
        <div class="item-price" id="<%= itemName %>-subtotal">$<%= String.format("%.2f", subTotal) %></div>
    </div>
<%
        }
%>
<div class="checkout-section">
    <h3>Total Price: <span id="totalPrice">$<%= String.format("%.2f", totalPrice) %></span></h3>
    <form action="checkout.jsp" method="post">
        <button type="submit" class="checkout-btn">Checkout</button>
    </form>
    <br/>
    <a href="food.jsp" style="text-decoration:none;">
        <button type="button" style="background-color:#4CAF50; color:white; padding:10px 20px; font-size:1rem; border:none; border-radius:8px; cursor:pointer;">
            Add Items
        </button>
</div>
    
<%
    }
%>
</div>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTj9rfZOenKeoMdqAUXMswJf9IcoeODzuN2hg&s">
    <title>FoodieNow - Checkout</title>

    <script>
    window.onload = function () {
        <% 
            String msg = (String) session.getAttribute("orderSuccessMessage");
            if (msg != null) { 
        %>
            alert("<%= msg %>");
            <% session.removeAttribute("orderSuccessMessage"); %>
            window.location.href = "food.jsp";
        <% } %>
    };

        function confirmOrder() {
            alert("✅ Order confirmed! Thank you for ordering with FoodieNow 🍔🍕");
            return true; // proceed with form submission
        }
    </script>

    <style>
        body {
            margin: 0;
            padding: 0;
            background:url('https://images.unsplash.com/photo-1600891964599-f61ba0e24092?auto=format&fit=crop&w=1950&q=80') no-repeat center center/cover;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #333;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .checkout-container {
            background: #ffffffcc;
            backdrop-filter: blur(6px);
            max-width: 750px;
            width: 95%;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #fc8019;
            margin-bottom: 25px;
            font-size: 2rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 25px;
        }

        th, td {
            padding: 14px 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #fc8019;
            color: white;
            font-weight: 600;
        }

        .total-row td {
            font-weight: bold;
            font-size: 1.1rem;
            background-color: #fafafa;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: 600;
            font-size: 0.95rem;
        }

        input[type="text"], textarea, select {
            width: 100%;
            padding: 10px 12px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 1rem;
            background-color: #fefefe;
        }

        button.submit-btn {
            margin-top: 25px;
            width: 100%;
            background-color: #fc8019;
            border: none;
            padding: 14px 0;
            color: white;
            font-size: 1.1rem;
            border-radius: 10px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        button.submit-btn:hover {
            background-color: #e67300;
        }

        .empty-cart-msg {
            text-align: center;
            font-size: 1.2rem;
            color: #777;
        }

        .empty-cart-msg a {
            color: #fc8019;
            text-decoration: none;
            font-weight: bold;
        }

        .empty-cart-msg a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="checkout-container">
    <h1>Checkout</h1>

<%
    List<String> cart = (List<String>) session.getAttribute("cart");
    Map<String, Double> itemPrices = new HashMap<>();

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

    if (cart == null || cart.isEmpty()) {
%>
    <p class="empty-cart-msg">Your cart is empty. <a href="food.jsp">Add Food</a></p>
<%
    } else {
        Map<String, Integer> itemCounts = new LinkedHashMap<>();
        for (String item : cart) {
            itemCounts.put(item, itemCounts.getOrDefault(item, 0) + 1);
        }

        double totalPrice = 0.0;
%>
    <table>
        <thead>
            <tr>
                <th>Item</th>
                <th>Qty</th>
                <th>Unit Price</th>
                <th>Subtotal</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (Map.Entry<String, Integer> entry : itemCounts.entrySet()) {
                String itemName = entry.getKey();
                int qty = entry.getValue();
                double price = itemPrices.getOrDefault(itemName, 0.0);
                double subTotal = price * qty;
                totalPrice += subTotal;
        %>
            <tr>
                <td><%= itemName %></td>
                <td><%= qty %></td>
                <td>$<%= String.format("%.2f", price) %></td>
                <td>$<%= String.format("%.2f", subTotal) %></td>
            </tr>
        <%
            }
        %>
            <tr class="total-row">
                <td colspan="3">Total</td>
                <td>$<%= String.format("%.2f", totalPrice) %></td>
            </tr>
        </tbody>
    </table>

    <form action="OrderConfirmationServlet" method="post" onsubmit="return confirmOrder();">
        <label for="customerName">Full Name</label>
        <input type="text" id="customerName" name="customerName" required>

        <label for="address">Delivery Address</label>
        <textarea id="address" name="address" rows="3" required></textarea>

        <label for="paymentMethod">Payment Method</label>
        <select id="paymentMethod" name="paymentMethod" required>
            <option value="">--Select Payment Method--</option>
            <option value="Cash on Delivery">Cash on Delivery</option>
            <option value="Credit Card">Credit Card</option>
            <option value="Debit Card">Debit Card</option>
            <option value="UPI">UPI</option>
        </select>

        <button type="submit" class="submit-btn">Confirm Order</button>
    </form>

<%
    }
%>

</div>
</body>
</html>

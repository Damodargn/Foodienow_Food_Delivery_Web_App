package food;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@WebServlet("/CartUpdateServlet")
public class CartServlet extends HttpServlet {
    private static final Map<String, Double> itemPrices = new HashMap<>();

    static {
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
    }

    @SuppressWarnings("unchecked")
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String itemName = request.getParameter("itemName");
        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        List<String> cart = (List<String>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        if ("increase".equals(action)) {
            cart.add(itemName);
        } else if ("decrease".equals(action)) {
            cart.remove(itemName); // removes one occurrence
        }

        session.setAttribute("cart", cart);

        // Calculate quantity and total
        Map<String, Integer> itemCounts = new HashMap<>();
        double totalPrice = 0;

        for (String item : cart) {
            itemCounts.put(item, itemCounts.getOrDefault(item, 0) + 1);
            totalPrice += itemPrices.getOrDefault(item, 0.0);
        }

        int quantity = itemCounts.getOrDefault(itemName, 0);
        double subtotal = quantity * itemPrices.getOrDefault(itemName, 0.0);

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print("{");
        out.print("\"success\": true,");
        out.print("\"quantity\": " + quantity + ",");
        out.print("\"subtotal\": " + String.format("%.2f", subtotal) + ",");
        out.print("\"totalPrice\": " + String.format("%.2f", totalPrice));
        out.print("}");
        out.flush();
    }
}

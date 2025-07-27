package food;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/callingservlet2")
public class foodservlet extends HttpServlet {

    @SuppressWarnings({ "unchecked", "unused" })
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        String user = (String) session.getAttribute("user");
        String item = request.getParameter("item");

        // Get cart from session or create if not present
        List<String> cart = (List<String>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }
        cart.add(item);
        session.setAttribute("cart", cart);

        // Redirect to cart or some confirmation page
        response.sendRedirect("cart.jsp");
    }
}

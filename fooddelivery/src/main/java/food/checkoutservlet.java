package food;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@SuppressWarnings("serial")
@WebServlet("/checkout")
public class checkoutservlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		
	    HttpSession session = request.getSession(false);
	    if (session != null) {
	        session.removeAttribute("cart");
	    }

	    response.sendRedirect("checkout.jsp");
	}

}

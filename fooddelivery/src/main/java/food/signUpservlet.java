package food;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/callingSignup")
public class signUpservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/foddienow";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "damodargn77";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("Name");
        String phone = request.getParameter("Phonenumber");
        String email = request.getParameter("EmailId");
        String password = request.getParameter("Password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement stmt = conn.prepareStatement(
                     "INSERT INTO createaccount (Name, Phonenumber, EmailId, Password) VALUES (?, ?, ?, ?)")) {

                stmt.setString(1, name);
                stmt.setString(2, phone);
                stmt.setString(3, email);
                stmt.setString(4, password);

                stmt.executeUpdate();

                HttpSession session = request.getSession();
                session.setAttribute("username", name);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("food.jsp");
    }
}

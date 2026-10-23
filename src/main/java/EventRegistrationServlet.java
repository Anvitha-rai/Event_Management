import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*;

@WebServlet("/EventRegistrationServlet")
public class EventRegistrationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int eventId = Integer.parseInt(req.getParameter("event_id"));
        HttpSession session = req.getSession();
        int userId = (int) session.getAttribute("user_id");

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO registrations (user_id, event_id) VALUES (?, ?)");
            ps.setInt(1, userId);
            ps.setInt(2, eventId);
            ps.executeUpdate();
            res.sendRedirect("view_events.jsp?msg=registered");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

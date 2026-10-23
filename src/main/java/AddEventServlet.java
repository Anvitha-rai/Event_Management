import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*;

@WebServlet("/AddEventServlet")
public class AddEventServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String name = req.getParameter("event_name");
        String date = req.getParameter("date");
        String time = req.getParameter("time");
        String venue = req.getParameter("venue");
        String desc = req.getParameter("description");

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO events (event_name, date, time, venue, description) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, date);
            ps.setString(3, time);
            ps.setString(4, venue);
            ps.setString(5, desc);
            ps.executeUpdate();
            res.sendRedirect("add_event.jsp?msg=added");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

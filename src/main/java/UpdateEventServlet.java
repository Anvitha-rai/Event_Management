import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*;

@WebServlet("/UpdateEventServlet")
public class UpdateEventServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("event_name");
        String date = req.getParameter("date");
        String time = req.getParameter("time");
        String venue = req.getParameter("venue");
        String desc = req.getParameter("description");

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "UPDATE events SET event_name=?, date=?, time=?, venue=?, description=? WHERE id=?");
            ps.setString(1, name);
            ps.setString(2, date);
            ps.setString(3, time);
            ps.setString(4, venue);
            ps.setString(5, desc);
            ps.setInt(6, id);
            ps.executeUpdate();
            res.sendRedirect("add_event.jsp?msg=updated");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

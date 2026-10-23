import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*;

@WebServlet("/DeleteEventServlet")
public class DeleteEventServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM events WHERE id=?");
            ps.setInt(1, id);
            ps.executeUpdate();
            res.sendRedirect("add_event.jsp?msg=deleted");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
if (session == null || session.getAttribute("admin") == null) {
    response.sendRedirect("admin_login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Event</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body class="p-4 bg-light">

    <div class="container col-md-6 bg-white p-4 rounded shadow">
        <h3 class="text-center mb-4">Add New Event</h3>

        <form action="AddEventServlet" method="post" class="border p-4 rounded shadow-sm">
            <div class="mb-3">
                <label>Event Name:</label>
                <input type="text" name="event_name" class="form-control" required>
            </div>

            <div class="mb-3">
                <label>Date:</label>
                <input type="date" name="date" class="form-control" required>
            </div>

            <div class="mb-3">
                <label>Time:</label>
                <input type="time" name="time" class="form-control" required>
            </div>

            <div class="mb-3">
                <label>Venue:</label>
                <input type="text" name="venue" class="form-control" required>
            </div>

            <div class="mb-3">
                <label>Description:</label>
                <textarea name="description" class="form-control" required></textarea>
            </div>

            <input type="submit" value="Add Event" class="btn btn-success w-100">
        </form>

        <div class="mt-4 text-center">
            <a href="index.jsp" class="btn btn-secondary">Logout</a>
        </div>

        <hr>

        <h4 class="text-center mt-4">All Events</h4>

        <table class="table table-bordered table-striped mt-3">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Venue</th>
                    <th>Description</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
            <%
                Connection con = null;
                Statement st = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", "root", "");  // use your MySQL password if any
                    st = con.createStatement();
                    rs = st.executeQuery("SELECT * FROM events");

                    while (rs.next()) {
            %>
                        <tr>
                            <td><%= rs.getInt("id") %></td>
                            <td><%= rs.getString("event_name") %></td>
                            <td><%= rs.getString("date") %></td>
                            <td><%= rs.getString("time") %></td>
                            <td><%= rs.getString("venue") %></td>
                            <td><%= rs.getString("description") %></td>
                            <td>
                                <a href="DeleteEventServlet?id=<%= rs.getInt("id") %>" 
                                   class="btn btn-danger btn-sm">Delete</a>
                            </td>
                        </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='7' class='text-danger text-center'>Error: " + e.getMessage() + "</td></tr>");
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (st != null) st.close();
                    if (con != null) con.close();
                }
            %>
            </tbody>
        </table>
    </div>

</body>
</html>

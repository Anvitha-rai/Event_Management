<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
if (session == null || session.getAttribute("user_id") == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Events</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #e0eafc, #cfdef3);
            font-family: "Poppins", sans-serif;
            color: #333;
        }

        .container {
            background: #fff;
            padding: 30px;
            margin-top: 50px;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #222;
            font-weight: 600;
            letter-spacing: 1px;
        }

        table {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        thead {
            background: #007bff;
            color: white;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        tbody tr:hover {
            background-color: #f6faff;
            transition: 0.3s ease;
        }

        .btn-logout {
            display: inline-block;
            margin-top: 25px;
            background-color: #ff4d4d;
            color: white;
            padding: 10px 25px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-logout:hover {
            background-color: #e63946;
            transform: translateY(-2px);
        }

        .table td, .table th {
            vertical-align: middle !important;
        }
    </style>
</head>
<body>
    <div class="container col-md-8">
        <h2>✨ All Events ✨</h2>

        <table class="table table-bordered table-striped text-center align-middle">
            <thead>
                <tr>
                    <th>Event ID</th>
                    <th>Event Name</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Location</th>
                </tr>
            </thead>
            <tbody>
                <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", "root", "");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM events");

                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("event_name") %></td>
                    <td><%= rs.getString("date") %></td>
                    <td><%= rs.getString("time") %></td>
                    <td><%= rs.getString("venue") %></td>
                </tr>
                <%
                    }
                    con.close();
                } catch (Exception e) {
                %>
                <tr>
                    <td colspan="5" class="text-danger fw-bold">Error: <%= e.getMessage() %></td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>

        <div class="text-center">
            <a href="index.jsp" class="btn-logout">Logout</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

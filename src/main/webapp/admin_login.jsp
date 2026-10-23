<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<title>Admin Login</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body class="p-5">
    <div class="container col-md-4">
        <h3 class="text-center mb-4">Admin Login</h3>

        <form action="AdminLoginServlet" method="post" class="border p-4 rounded shadow">
            <div class="mb-3">
                <label>Username:</label>
                <input type="text" name="username" class="form-control" required>
            </div>

            <div class="mb-3">
                <label>Password:</label>
                <input type="password" name="password" class="form-control" required>
            </div>

            <input type="submit" class="btn btn-danger w-100" value="Login">
        </form>

        <div class="text-center mt-3">
            <a href="index.jsp">← Back to Home</a>
        </div>
    </div>
</body>
</html>

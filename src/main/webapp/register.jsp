<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<title>User Registration</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body class="p-5">
    <div class="container col-md-4">
        <h3 class="text-center mb-4">User Registration</h3>

        <form action="UserRegisterServlet" method="post" class="border p-4 rounded shadow">
            <div class="mb-3">
                <label>Name:</label>
                <input type="text" name="name" class="form-control" required>
            </div>

            <div class="mb-3">
                <label>Email:</label>
                <input type="email" name="email" class="form-control" required>
            </div>

            <div class="mb-3">
                <label>Mobile:</label>
                <input type="text" name="mobile" class="form-control" required>
            </div>

            <div class="mb-3">
                <label>Password:</label>
                <input type="password" name="password" class="form-control" required>
            </div>

            <input type="submit" value="Register" class="btn btn-success w-100">
        </form>

        <div class="text-center mt-3">
            <a href="login.jsp">Already have an account? Login</a>
        </div>
    </div>
</body>
</html>

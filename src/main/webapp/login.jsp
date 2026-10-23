<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
    background: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQc08LHkToa7j98qpzRtvg0T-TyLpMp3LecUQ&s') 
        no-repeat center center fixed;
    background-size: cover;          /* Ensures image covers the whole page */
    background-position: center;     /* Keeps image centered */
    font-family: 'Poppins', sans-serif;
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #fff;
}


        .login-container {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
            padding: 40px 35px;
            width: 100%;
            max-width: 400px;
            color: #fff;
            text-align: center;
            animation: fadeIn 0.8s ease;
        }

        .login-container h3 {
            font-weight: 600;
            margin-bottom: 25px;
        }

        .form-control {
            border: none;
            border-radius: 10px;
            padding: 12px;
            background: rgba(255, 255, 255, 0.85);
            color: #333;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            box-shadow: 0 0 8px rgba(255, 255, 255, 0.6);
        }

        .btn-primary {
            background: linear-gradient(135deg, #43CBFF, #9708CC);
            border: none;
            padding: 12px;
            border-radius: 10px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #9708CC, #43CBFF);
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.2);
        }

        .links a {
            color: #fff;
            text-decoration: none;
            transition: 0.3s;
            font-size: 0.95rem;
        }

        .links a:hover {
            text-decoration: underline;
            color: #FFD700;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h3>🎟️ User Login</h3>

        <form action="UserLoginServlet" method="post">
            <div class="mb-3 text-start">
                <label class="form-label">Email</label>
                <input type="email" name="email" class="form-control" placeholder="Enter your email" required>
            </div>

            <div class="mb-3 text-start">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control" placeholder="Enter your password" required>
            </div>

            <input type="submit" class="btn btn-primary w-100 mt-2" value="Login">
        </form>

        <div class="links mt-4">
            <a href="register.jsp">New user? Register here</a><br>
            <a href="index.jsp">← Back to Home</a>
        </div>
    </div>

</body>
</html>

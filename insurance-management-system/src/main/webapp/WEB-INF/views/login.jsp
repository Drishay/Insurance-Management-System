<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="container mt-5">

<div class="row justify-content-center">
    <div class="col-md-5">

        <div class="card shadow p-4">

            <h3 class="mb-4 text-center">Login</h3>

            <!-- 🔥 ADD ERROR BLOCK HERE -->
            <%
                String error = request.getParameter("error");
                if ("true".equals(error)) {
            %>
                <div class="alert alert-danger text-center">
                    Invalid email or password
                </div>
            <%
                }
            %>

            <!-- FORM -->
            <form action="/login" method="post">

                <div class="mb-3">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label>Password</label>
                    <input type="password" name="password" class="form-control" required>
                </div>

                <button type="submit" class="btn btn-primary w-100">Login</button>

            </form>

            <!-- REGISTER LINK -->
            <div class="text-center mt-3">
                <span>New user?</span><br>
                <a href="/register" class="btn btn-outline-success btn-sm mt-2">Create Account</a>
            </div>

        </div>

    </div>
</div>

</body>
</html>
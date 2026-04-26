<%@ page import="com.project.insurance_management_system.model.User" %>

<%
User user = (User) session.getAttribute("user");
%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="container mt-4">

<h2 class="mb-4">Admin Account </h2>

<nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm mb-4 px-3">

    <span class="navbar-brand fw-bold">Admin Panel</span>

    <div class="ms-auto">

        <a class="btn btn-outline-primary btn-sm me-2" href="/admin/dashboard">Home</a>

        <a class="btn btn-outline-secondary btn-sm me-2" href="/policies">Policies</a>

        <a class="btn btn-outline-success btn-sm me-2" href="/addPolicy">Add Policy</a>

        <a class="btn btn-outline-warning btn-sm me-2" href="/admin/claims">Manage Claims</a>

        <a class="btn btn-outline-info btn-sm me-2" href="/admin/account">My Account</a>

        <a class="btn btn-danger btn-sm" href="/logout">Logout</a>

    </div>

</nav>

<!-- Optional: show logged in admin -->
<div class="alert alert-warning">
    Admin: <b><%= user != null ? user.getEmail() : "" %></b>
</div>
<div class="card shadow p-4 w-50">
    <h5>Name: <%= user.getName() %></h5>
    <p>Email: <%= user.getEmail() %></p>
    <p>Role: <%= user.getRole() %></p>
</div>

<a href="/admin/dashboard" class="btn btn-primary mt-3">Back</a>

</body>
</html>
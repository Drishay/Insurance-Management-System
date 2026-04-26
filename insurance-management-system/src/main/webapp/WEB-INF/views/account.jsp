<%
com.project.insurance_management_system.model.User user =
    (com.project.insurance_management_system.model.User) session.getAttribute("user");
%>

<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="container mt-4">

<h2>My Account</h2>
<nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm mb-4 px-3">


    <div class="ms-auto">

        <a class="btn btn-outline-primary btn-sm me-2" href="/user/dashboard">Home</a>

        <a class="btn btn-outline-secondary btn-sm me-2" href="/policies">Policies</a>

        <a class="btn btn-outline-success btn-sm me-2" href="/myPolicies">My Policies</a>

        <a class="btn btn-outline-warning btn-sm me-2" href="/claim">Raise Claim</a>

        <a class="btn btn-outline-dark btn-sm me-2" href="/myClaims">My Claims</a>

        <a class="btn btn-outline-info btn-sm me-2" href="/account">My Account</a>

        <a class="btn btn-danger btn-sm" href="/logout">Logout</a>

    </div>

</nav>

<!-- Optional user info -->
<div class="alert alert-info">
    Welcome, <b><%= user != null ? user.getEmail() : "" %></b>
</div>
<div class="card p-3 shadow w-50">
    <h5>Name: <%= user.getName() %></h5>
    <p>Email: <%= user.getEmail() %></p>
    <p>Role: <%= user.getRole() %></p>
</div>

<a href="/user/dashboard" class="btn btn-primary mt-3">Back</a>

</body>
</html>
<%
com.project.insurance_management_system.model.User user =
    (com.project.insurance_management_system.model.User) session.getAttribute("user");
%>

<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="container mt-4">

<h2 class="mb-4" >Welcome, <%= user.getName() %></h2>



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

<div class="row">
    <div class="col-md-4">
        <div class="card shadow p-3 mb-3">
            <h5>Policies</h5>
            <p>Browse available insurance plans.</p>
            <a href="/policies" class="btn btn-primary btn-sm">View</a>
        </div>
    </div>

    <div class="col-md-4">
        <div class="card shadow p-3 mb-3">
            <h5>My Policies</h5>
            <p>Check your purchased policies.</p>
            <a href="/myPolicies" class="btn btn-success btn-sm">Open</a>
        </div>
    </div>

    <div class="col-md-4">
        <div class="card shadow p-3 mb-3">
            <h5>Claims</h5>
            <p>Raise or track claims.</p>
            <a href="/myClaims" class="btn btn-warning btn-sm">Check</a>
        </div>
    </div>
</div>
<div class="row mb-4">

    <div class="col-md-4">
        <div class="card shadow p-3 text-center">
            <h5>Policies</h5>
            <h3><%= request.getAttribute("policyCount") %></h3>
        </div>
    </div>

    <div class="col-md-4">
        <div class="card shadow p-3 text-center">
            <h5>My Policies</h5>
            <h3><%= request.getAttribute("myPolicyCount") %></h3>
        </div>
    </div>

    <div class="col-md-4">
        <div class="card shadow p-3 text-center">
            <h5>Claims</h5>
            <h3><%= request.getAttribute("claimCount") %></h3>
        </div>
    </div>

</div>

</body>
</html>
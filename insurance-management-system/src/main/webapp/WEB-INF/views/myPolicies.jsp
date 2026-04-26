<%@ page import="java.util.List" %>
<%@ page import="com.project.insurance_management_system.model.Subscription" %>

<%
com.project.insurance_management_system.model.User user =
    (com.project.insurance_management_system.model.User) session.getAttribute("user");

boolean isAdmin = user != null && "ADMIN".equals(user.getRole());
%>

<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="container mt-4">

<h2 class="mb-4">My Policies</h2>



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

<table class="table table-bordered table-hover shadow">
    <tr>
        <th>Policy</th>
        <th>Status</th>
        <th>Start Date</th>
    </tr>

    <%
        List<Subscription> subs = (List<Subscription>) request.getAttribute("subscriptions");
        if (subs != null) {
            for (Subscription s : subs) {
    %>
    <tr>
        <td><%= s.getPolicy().getName() %></td>
        <td><%= s.getStatus() %></td>
        <td><%= s.getStartDate() %></td>
    </tr>
    <%
            }
        }
    %>
</table>

</body>
</html>
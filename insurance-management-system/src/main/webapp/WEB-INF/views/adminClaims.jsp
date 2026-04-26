<%@ page import="java.util.List" %>
<%@ page import="com.project.insurance_management_system.model.Claim" %>
<%@ page import="com.project.insurance_management_system.model.User" %>

<%
User user = (User) session.getAttribute("user");
%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="container mt-4">

<h2 class="mb-4">Manage Claims</h2>

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

<table class="table table-bordered table-striped shadow">
    <tr>
        <th>ID</th>
        <th>User</th>
        <th>Policy</th>
        <th>Amount</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

    <%
        List<Claim> claims = (List<Claim>) request.getAttribute("claims");
        if (claims != null) {
            for (Claim c : claims) {
    %>
    <tr>
        <td><%= c.getId() %></td>
        <td><%= c.getUser().getEmail() %></td>
        <td><%= c.getPolicy().getName() %></td>
        <td><%= c.getAmount() %></td>

        <td>
        <%
            String status = c.getStatus();
            if ("APPROVED".equals(status)) {
        %>
            <span class="badge bg-success">APPROVED</span>
        <%
            } else if ("REJECTED".equals(status)) {
        %>
            <span class="badge bg-danger">REJECTED</span>
        <%
            } else {
        %>
            <span class="badge bg-warning text-dark">PENDING</span>
        <%
            }
        %>
        </td>

        <td>
            <a class="btn btn-success btn-sm"
   onclick="return confirm('Approve this claim?');"
   href="/admin/approveClaim?id=<%= c.getId() %>">Approve</a>

<a class="btn btn-danger btn-sm"
   onclick="return confirm('Reject this claim?');"
   href="/admin/rejectClaim?id=<%= c.getId() %>">Reject</a>
        </td>
    </tr>
    <%
            }
        }
    %>

</table>

</body>
</html>
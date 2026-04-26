<%@ page import="java.util.List" %>
<%@ page import="com.project.insurance_management_system.model.Claim" %>
<%
com.project.insurance_management_system.model.User user =
    (com.project.insurance_management_system.model.User) session.getAttribute("user");
%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="container mt-4">

<h2 class="mb-4">My Claims</h2>

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
        <th>Amount</th>
        <th>Reason</th>
        <th>Status</th>
        <th>Date</th>
    </tr>

    <%
        List<Claim> claims = (List<Claim>) request.getAttribute("claims");
        if (claims != null) {
            for (Claim c : claims) {
    %>
    <tr>
        <td><%= c.getPolicy().getName() %></td>
        <td><%= c.getAmount() %></td>
        <td><%= c.getReason() %></td>
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
        <td><%= c.getDate() %></td>
    </tr>
    <%
            }
        }
    %>

</table>

</body>
</html>
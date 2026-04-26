<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.project.insurance_management_system.model.Policy" %>
<%@ page import="com.project.insurance_management_system.model.User" %>
<%@ page import="com.project.insurance_management_system.model.Subscription" %>

<%
User user = (User) session.getAttribute("user");
boolean isAdmin = user != null && "ADMIN".equals(user.getRole());

List<Subscription> userSubs = (List<Subscription>) request.getAttribute("userSubs");
%>

<html>
<head>
    <title>Policies</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="container mt-4">

<h2 class="mb-4">All Policies</h2>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm mb-4 px-3">
    <div class="ms-auto">

        <a class="btn btn-outline-primary btn-sm me-2"
           href="<%= isAdmin ? "/admin/dashboard" : "/user/dashboard" %>">Home</a>

        <a class="btn btn-outline-secondary btn-sm me-2" href="/policies">Policies</a>

        <% if (isAdmin) { %>
            <a class="btn btn-outline-success btn-sm me-2" href="/addPolicy">Add Policy</a>
            <a class="btn btn-outline-warning btn-sm me-2" href="/admin/claims">Manage Claims</a>
            <a class="btn btn-outline-info btn-sm me-2" href="/admin/account">My Account</a>
        <% } else { %>
            <a class="btn btn-outline-success btn-sm me-2" href="/myPolicies">My Policies</a>
            <a class="btn btn-outline-warning btn-sm me-2" href="/claim">Raise Claim</a>
            <a class="btn btn-outline-dark btn-sm me-2" href="/myClaims">My Claims</a>
            <a class="btn btn-outline-info btn-sm me-2" href="/account">My Account</a>
        <% } %>

        <a class="btn btn-danger btn-sm" href="/logout">Logout</a>

    </div>
</nav>

<!-- USER INFO -->
<div class="alert <%= isAdmin ? "alert-warning" : "alert-info" %>">
    <%= isAdmin ? "Admin" : "User" %>: 
    <b><%= user != null ? user.getEmail() : "" %></b>
</div>

<table class="table table-bordered table-hover shadow">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Type</th>
        <th>Premium</th>
        <th>Duration</th>

        <% if (!isAdmin) { %>
            <th>Action</th>
        <% } %>

        <% if (isAdmin) { %>
            <th>Action</th>
        <% } %>
    </tr>

    <%
        List<Policy> policies = (List<Policy>) request.getAttribute("policies");
        if (policies != null) {
            for (Policy p : policies) {

                boolean alreadyBought = false;

                if (userSubs != null) {
                    for (Subscription s : userSubs) {
                        if (s.getPolicy().getId() == p.getId()) {
                            alreadyBought = true;
                            break;
                        }
                    }
                }
    %>

    <tr>
        <td><%= p.getId() %></td>
        <td><%= p.getName() %></td>
        <td><%= p.getType() %></td>
        <td><%= p.getPremium() %></td>
        <td><%= p.getDuration() %></td>

        <!-- USER ACTION -->
        <% if (!isAdmin) { %>
        <td>
            <% if (alreadyBought) { %>
                <span class="badge bg-success">Purchased</span>
            <% } else { %>
                <form action="/buyPolicy" method="post"
                      onsubmit="return confirm('Are you sure you want to buy this policy?');">
                    <input type="hidden" name="policyId" value="<%= p.getId() %>"/>
                    <button class="btn btn-success btn-sm">Buy</button>
                </form>
            <% } %>
        </td>
        <% } %>

        <!-- ADMIN ACTION -->
        <% if (isAdmin) { %>
        <td>
            <a class="btn btn-danger btn-sm"
               onclick="return confirm('Delete this policy?');"
               href="/admin/deletePolicy?id=<%= p.getId() %>">
               Delete
            </a>
        </td>
        <% } %>

    </tr>

    <%
            }
        }
    %>

</table>

</body>
</html>
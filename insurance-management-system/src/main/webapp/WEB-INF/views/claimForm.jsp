<%@ page import="java.util.List" %>
<%@ page import="com.project.insurance_management_system.model.Subscription" %>
<%
com.project.insurance_management_system.model.User user =
    (com.project.insurance_management_system.model.User) session.getAttribute("user");
%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="container mt-4">

<h2 class="mb-4">Raise Claim</h2>

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

<form action="/claim" method="post" class="w-50">

    <div class="mb-3">
        <label>Policy</label>
        <select name="policyId" class="form-control">
            <%
                List<Subscription> subs = (List<Subscription>) request.getAttribute("subs");
                if (subs != null) {
                    for (Subscription s : subs) {
            %>
                <option value="<%= s.getPolicy().getId() %>">
                    <%= s.getPolicy().getName() %>
                </option>
            <%
                    }
                }
            %>
        </select>
    </div>

    <div class="mb-3">
        <label>Amount</label>
        <input type="number" name="amount" class="form-control" required>
    </div>

    <div class="mb-3">
        <label>Reason</label>
        <input type="text" name="reason" class="form-control" required>
    </div>

    <button class="btn btn-primary">Submit Claim</button>

</form>

</body>
</html>
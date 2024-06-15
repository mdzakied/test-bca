<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <%-- JQuery --%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h1>Login</h1>
<form id="loginForm" action="login" method="post">
    User ID: <input id="userId" type="text" name="userId"><br>
    Password: <input id="password" type="password" name="password" style="margin-top: 10px"><br>
    <input type="submit" value="Login" style="margin-top: 20px">
</form>

<div style="margin-top: 20px">
    <a href="welcome.jsp">welcome page</a>
</div>

</body>
</html>

<script>
    // Always reset error message for notification
    const errorMessage = "<%= session.getAttribute("error") %>";

    // Conditional after notif appears reset message
    if (errorMessage && errorMessage != "null") {
        alert(errorMessage);
        <% session.removeAttribute("error"); %>
    }

    // Validation Form
    $(document).ready(function () {
        $('#loginForm').submit(function (event) {
            const userId = $('#userId').val();
            const password = $('#password').val();

            if (userId === "" || password === "") {
                alert("User ID or Password are required.");
                event.preventDefault();
            }
        });
    });
</script>
<%--
  Created by IntelliJ IDEA.
  entity.User: 6666
  Date: 2020/7/9
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Login success</title>
    <link rel="stylesheet" href="../Resources/layui/css/layui.css">
    <script src="../Resources/layui/layui.js"></script>

    <link rel="stylesheet" href="../Resources/toastr/toastr.css">
    <script src="../Resources/jquery-3.5.1/jquery-3.5.1.min.js"></script>
    <script src="../Resources/toastr/toastr.min.js"></script>
    <script src="../Alerts.js"></script>
</head>
<body onload="toastr.success('Login success! Welcome back.')">
    <div style="height: 30%"></div>
    <h1 style="text-align: center">Login success</h1>
    <div style="height: 10%"></div>
    <h3  style="text-align: center">
    <%
        String firstName = request.getParameter("firstName");
        out.println("Hello, " + firstName);
    %>
    </h3>
</body>
</html>

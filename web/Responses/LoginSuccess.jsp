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
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../layui/layui.js"></script>
</head>
<body>

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

<%--
  Created by IntelliJ IDEA.
  User: 6666
  Date: 2020/7/12
  Time: 12:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Home controller</title>
    <link rel="stylesheet" href="../Resources/layui/css/layui.css">
    <script src="../Resources/layui/layui.js"></script>

    <link rel="stylesheet" href="../Resources/toastr/toastr.css">
    <script src="../Resources/jquery-3.5.1/jquery-3.5.1.min.js"></script>
    <script src="../Resources/toastr/toastr.min.js"></script>
    <script src="../Alerts.js"></script>
</head>
<body>
<h1><%= (String)session.getAttribute("firstName") %> 's personal center</h1>
<h2>
    <%=
        request.getAttribute("favors")
    %>
</h2>
</body>
</html>

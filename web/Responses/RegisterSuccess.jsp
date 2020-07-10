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
    <title>Register success</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../layui/layui.js"></script>
</head>
<body>

    <div style="height: 30%"></div>
    <h1 style="text-align: center">Register success</h1>
    <div style="height: 10%"></div>
    <h2 style="text-align: center">Your info here</h2><br>
    <div style="text-align: center">
        <h3 style="text-align: center">
        <%
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            out.println("first name: " + firstName);
        %>
        </h3>
        <br>
        <h3 style="text-align: center">
        <%
            out.println("last name: " + lastName);
        %>
        </h3>
        <br>
        <h3 style="text-align: center">
        <%
            out.println("email: " + email);
        %>
        </h3>
    </div>
    <div style="height: 10%"></div>
    <div class="layui-row" style="vertical-align: middle">
        <div class="layui-col-md12" style="text-align: center">
            <a href="../Login.jsp">Back to login</a>
        </div>
    </div>
</body>
</html>

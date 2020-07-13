<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Register</title>
    <link rel="stylesheet" href="Resources/layui/css/layui.css">
    <script src="Resources/layui/layui.js"></script>

    <link rel="stylesheet" href="Resources/toastr/toastr.css">
    <script src="Resources/jquery-3.5.1/jquery-3.5.1.min.js"></script>
    <script src="Resources/toastr/toastr.min.js"></script>
    <script src="JS/Alerts.js"></script>
    <script src="JS/LoginAndRegister.js"></script>
</head>
<%
    if(session.getAttribute("result") != null){
        int result = (int) session.getAttribute("result");
        if(result == 0) {
            out.print("<body onload=\"toastr.error('Register failed. The user name has been used.')\">");
        }
        session.setAttribute("result", null);
    }
    else {
        out.print("<body>");
    }
%>

<div class="layui-container">
    <div style="height: 25%"></div>
    <div class="layui-row layui-col-space10" style="vertical-align: middle; height: 38%">
        <div class="layui-col-md3"></div>
        <div class="layui-col-md6">
            <h1 style="text-align: center">Register</h1>
            <div style="height: 5%"></div>
            <form class="layui-form" action="registerServlet" method="post" onSubmit="return isValid(this);">
                <div class="layui-form-item">
                    <label class="layui-form-label">Username</label>
                    <div class="layui-input-block">
                        <input type="text" name="username" placeholder="Your name" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">Password</label>
                    <div class="layui-input-block">
                        <input type="password" name="password" placeholder="Your password" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">Email</label>
                    <div class="layui-input-block">
                        <input type="text" name="email" id="email" placeholder="Your email" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="*">Submit</button>
                        <button type="reset" class="layui-btn layui-btn-primary">Reset</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="layui-col-md3"></div>
    </div>
    <div class="layui-row" style="vertical-align: middle">
        <div class="layui-col-md12" style="text-align: center">
            <a href="Login.jsp">Already has an account? Click here to log in.</a>
        </div>
    </div>
</div>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  entity.User: 6666
  Date: 2020/7/9
  Time: 13:11
  To change this template use File | Settings | File Templates.
--%>
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
    <script src="Alerts.js"></script>
    <script>
        function isValid(form)
        {
            if (form.firstName.value==="")
            {
                toastr.error("First name can't be empty.");
                return false;
            }
            if (form.lastName.value==="")
            {
                toastr.error("Last name can't be empty.");
                return false;
            }
            if (form.password.value==="")
            {
                toastr.error("Password can't be empty.");
                return false;
            }
            if (form.email.value==="")
            {
                toastr.error("Email can't be empty.");
                return false;
            }
            else return true;
        }
    </script>
</head>
<body>
    <div style="height: 25%"></div>
    <div class="layui-row layui-col-space10" style="vertical-align: middle; height: 38%">
        <div class="layui-col-md4"></div>
        <div class="layui-col-md4">
            <h1 style="text-align: center">Register</h1>
            <div style="height: 5%"></div>
            <form class="layui-form" action="registerServlet" method="post" onSubmit="return isValid(this);">
                <div class="layui-form-item">
                    <label class="layui-form-label">First name</label>
                    <div class="layui-input-block">
                        <input type="text" name="firstName" placeholder="Your first name" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">Last name</label>
                    <div class="layui-input-block">
                        <input type="text" name="lastName" placeholder="Your last name" autocomplete="off" class="layui-input">
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
                        <input type="email" name="email" placeholder="Your email" autocomplete="off" class="layui-input">
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
        <div class="layui-col-md4"></div>
    </div>
    <div class="layui-row" style="vertical-align: middle">
        <div class="layui-col-md12" style="text-align: center">
            <a href="Login.jsp">Already has an account? Click here to log in.</a>
        </div>
    </div>
</body>
</html>

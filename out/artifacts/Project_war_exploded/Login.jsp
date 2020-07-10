<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Login</title>
    <link rel="stylesheet" href="Resources/layui/css/layui.css">
    <script src="Resources/layui/layui.js"></script>

    <link rel="stylesheet" href="Resources/toastr/toastr.css">

    <script src="Resources/jquery-3.5.1/jquery-3.5.1.min.js"></script>
    <script src="Resources/toastr/toastr.min.js"></script>
    <script src="Alerts.js"></script>
    <script>
    </script>
    <script>
        function isValid(form)
        {
            if (form.firstName.value==="")
            {
                toastr.error("First name can't be empty.");
                return false;
            }
            if (form.password.value==="")
            {
                toastr.error("Password can't be empty.");
                return false;
            }
            else return true;
        }
    </script>
</head>
<body>
    <div style="height: 30%"></div>
    <div class="layui-row layui-col-space10" style="vertical-align: middle; height: 30%">
        <div class="layui-col-md4"></div>
        <div class="layui-col-md4">
            <h1 style="text-align: center">Login</h1>
            <div style="height: 10%"></div>
            <form class="layui-form" action="loginServlet" method="post" onSubmit="return isValid(this);">
                <div class="layui-form-item">
                    <label class="layui-form-label">First name</label>
                    <div class="layui-input-block">
                        <input type="text" name="firstName" placeholder="Your first name" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">Password</label>
                    <div class="layui-input-block">
                        <input type="password" name="password" placeholder="Your password" autocomplete="off" class="layui-input">
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
    <div style="height: 3%"></div>
    <div class="layui-row" style="vertical-align: middle">
        <div class="layui-col-md12" style="text-align: center">
            <a href="Register.jsp">No account yet? Click here to register.</a>
        </div>
    </div>
</body>
</html>
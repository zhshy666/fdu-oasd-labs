<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <title>Main page</title>
        <link rel="stylesheet" href="Resources/layui/css/layui.css">
        <script src="Resources/layui/layui.js"></script>

        <link rel="stylesheet" href="Resources/toastr/toastr.css">
        <script src="Resources/jquery-3.5.1/jquery-3.5.1.min.js"></script>
        <script src="Resources/toastr/toastr.min.js"></script>
        <script src="JS/Alerts.js"></script>
    </head>
    <%
        // TODO: 导航栏实现
        // TODO: 主页图片轮播+展示
        // TODO: 做登录状态的检验
        if(session.getAttribute("result") != null){
            int result = (int) session.getAttribute("result");
            if(result == 1) {
                out.print("<body onload=\"toastr.success('Register success. Login successfully.')\">");
            }
            session.setAttribute("result", null);
        }
        else {
            out.print("<body>");
        }
    %>

    <h1>Hello!!!Main Page here</h1>

    <h2><%
      String username = (String) request.getSession().getAttribute("username");
      if (username == null || username.equals("")){
        out.print("<a href=\"Login.jsp\">login</a>");
      }
      else {
        out.print("Hello, <a href=\"Home.jsp\">" + username +"</a>");
      }
    %>
    </h2>
    <h2>相关功能开发中...先完成lab的需求要紧（逃）</h2>
  </body>
</html>

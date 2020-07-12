<%@ page import="entity.Image" %>
<%@ page import="java.util.Set" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Home</title>
    <link rel="stylesheet" href="../Resources/layui/css/layui.css">
    <script src="../Resources/layui/layui.js"></script>

    <link rel="stylesheet" href="../Resources/toastr/toastr.css">
    <script src="../Resources/jquery-3.5.1/jquery-3.5.1.min.js"></script>
    <script src="../Resources/toastr/toastr.min.js"></script>
    <script src="../Alerts.js"></script>
</head>
<body>
<h1><%= (String)session.getAttribute("firstName") %> 's personal center</h1>

    <%
        Set<Image> set = (Set<Image>) request.getAttribute("favors");
        for(Image image : set){
            String path = image.getPath();
            String url = "../travel-images/medium/" + path;
            out.print("<img src=" + url + ">");
        }
    %>
</body>
</html>

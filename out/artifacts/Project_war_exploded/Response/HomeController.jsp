<%@ page import="entity.Image" %>
<%@ page import="java.util.Set" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Home</title>
    <link rel="stylesheet" href="../Resources/layui/css/layui.css">
    <script src="../Resources/layui/layui.js"></script>
    <link rel="stylesheet" href="../Resources/myCSS/card.css">

    <link rel="stylesheet" href="../Resources/toastr/toastr.css">
    <script src="../Resources/jquery-3.5.1/jquery-3.5.1.min.js"></script>
    <script src="../Resources/toastr/toastr.min.js"></script>
    <script src="../Alerts.js"></script>
</head>
<body>
<div class="layui-container">
    <div style="height: 5%"></div>
    <div class="layui-row layui-col-space10">
        <div class="layui-col-md1"></div>
        <div class="layui-col-md11">
            <h1><%= (String)session.getAttribute("firstName") %> 's Home</h1>
        </div>
    </div>

    <div style="height: 5%"></div>
    <div class="layui-row layui-col-space10" style="vertical-align: middle">
        <div class="layui-col-md1"></div>
        <div class="layui-col-md11">
            <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                <ul class="layui-tab-title">
                    <li class="layui-this">Favors</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-row" style="text-align: center">
                        <%
                            // TODO: 分页实现，这里先全部展示在一个页面上
                            // TODO: 好友访问时只能见到收藏的图片这一个栏目，但用户本人还可以访问其他栏目（如我的好友，我的照片）
                            Set<Image> set = (Set<Image>) request.getAttribute("favors");
                            for(Image image : set){
                                String path = image.getPath();
                                String url = "../travel-images/small/" + path;
                                out.print("<div class=\"layui-col-md3 card\">");
                                out.print("<img class=\"layui-col-md12\" style=\"height: 25%; width: 100%\" src=" + url + ">");
                                // TODO: 点击大图片进入详情页
                                out.print("<div class=\"container\" style=\"text-align: right\">" +
                                        "<a href=\"../Home.jsp?imageId=" +
                                        image.getImageId() +"\">" +
                                        "<i class=\"layui-icon layui-icon-star-fill\" style=\"font-size: 25px; color: #FFB800;\"></i>" +
                                        "</a>" +
                                        "</div>");
                                out.print("</div>");
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

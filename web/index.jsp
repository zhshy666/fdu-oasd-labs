<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Main page</title>
        <link rel="stylesheet" href="Resources/toastr/toastr.css">
        <script src="Resources/jquery-3.5.1/jquery-3.5.1.min.js"></script>
        <script src="Resources/toastr/toastr.min.js"></script>
        <script src="Alerts.js"></script>
    </head>
    <%
        if(session.getAttribute("result") != null){
            int result = (int) session.getAttribute("result");
            if(result == 0) {
                out.print("<body onload=\"toastr.success('Register success. Login successfully.')\">");
            }
            session.setAttribute("result", null);
        }
        else {
            out.print("<body>");
        }
    %>

    <h1>Hello!!!Main Page here</h1>

    <%
      String firstName = (String) request.getSession().getAttribute("firstName");
      if (firstName == null || firstName.equals("")){
        out.print("<a href=\"Login.jsp\">login</a>");
      }
      else {
        out.print("Hello, " + firstName);
      }
    %>
  </body>
</html>

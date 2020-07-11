<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Main page</title>
  </head>
  <body>
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

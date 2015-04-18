<%-- 
   Document   : Logout
   Created on : 18-Apr-2015, 12:51:49 PM
   Author     : C0648301
   --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Online Exam - MGIT University</title>
   </head>
   <body>
      <%
         session.setAttribute("Username", null);
         session.setAttribute("Privilege", null);
         session.setAttribute("UserId", null);
         session.invalidate();
         %>
      <h2>You have successfully logged out</h2>
      <br/>
      <a href="index.html">Click here to login again</a>
   </body>
</html>
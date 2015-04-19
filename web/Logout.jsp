<%-- 
    Document   : Logout
    Created on : 18-Apr-2015, 8:13:21 PM
    Author     : C0648301
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log Out</title>

    </head>
    <body>
        <%
            session.setAttribute("Username", null);
            session.setAttribute("Privilage", null);
            session.setAttribute("UserId", null);
            session.invalidate();
        %>
        <h2>Thank You, You have logged out successfully</h2>
        <br/>
        <a href="index.html">Click to LOGIN</a>
    </body>
</html>


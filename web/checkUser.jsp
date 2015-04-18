<%-- 
    Document   : checkUser
    Created on : 18-Apr-2015, 2:02:35 PM
    Author     : C0648301
--%>

<%@ page import="java.sql.*" %> 
<%
    String name = request.getParameter("name").toString();
    System.out.println(name);
    String data = "";
    String dbUrl = "jdbc:mysql://localhost/onlineexam";

    try {
        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(dbUrl, "root", "");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select * from login_credentials where username='" + name + "'");
        int count = 0;
        while (rs.next()) {

            count++;
        }

        if (count > 0) {
            data = "Not Available";
        } else {
            data = "Available";
        }
        out.println(data);

    } catch (Exception e) {
        System.out.println(e);
    }
%>



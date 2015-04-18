<%-- 
    Document   : checkExamId
    Created on : 18-Apr-2015, 2:00:16 PM
    Author     : C0648301
--%>

<%@ page import="java.sql.*" %> 
<%
    String name = request.getParameter("name").toString();
    System.out.println(name);
    String data = "";
    boolean isInputNumOnly = false;
    String dbUrl = "jdbc:mysql://localhost/onlineexam";
    try {
        Class.forName("com.mysql.jdbc.Driver");

        isInputNumOnly = name.matches("^[0-9]{5}$");
        if (isInputNumOnly) {
            Connection con = DriverManager.getConnection(dbUrl, "root", "");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from exam_list where ExamId=" + name + "");
            int count = 0;
            while (rs.next()) {

                count++;
            }

            if (count > 0) {
                data = "Exam ID already exists.";
            } else {
                data = "Available";
            }
        } else {
            data = "Exam ID must be have 5 digits";
        }
        out.println(data);

    } catch (Exception e) {
        out.println(e.getMessage() + isInputNumOnly);
    }
%>

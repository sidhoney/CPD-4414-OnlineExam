<%-- 
    Document   : checkExamId
    Created on : 18-Apr-2015, 8:09:37 PM
    Author     : C0648301
--%>


<%@ page import="java.sql.*" %> 
<%
    String name = request.getParameter("name").toString();
    System.out.println(name);
    String data = "";
    boolean isInputNumOnly = false;
    String dbUrl = "jdbc:mysql://localhost/onlineexamproject";
    try {
        Class.forName("com.mysql.jdbc.Driver");

        isInputNumOnly = name.matches("^[0-9]{5}$");
        if (isInputNumOnly) {
            Connection con = DriverManager.getConnection(dbUrl, "root", "");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from Exam_List where ExamId=" + name + "");
            int count = 0;
            while (rs.next()) {

                count++;
            }

            if (count > 0) {
                data = "Exam-ID already exists.";
            } else {
                data = "Available";
            }
        } else {
            data = "Exam-ID must be have 5 digits";
        }
        out.println(data);

    } catch (Exception e) {
        out.println(e.getMessage() + isInputNumOnly);
    }
%>

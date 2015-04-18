<%-- 
    Document   : resultAnalysis
    Created on : 18-Apr-2015, 2:04:58 PM
    Author     : C0648301
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <%
            HttpSession UserSession = request.getSession(false);
            if (UserSession.getAttribute("Username") == null || UserSession.getAttribute("Privilage") == null) {
                response.sendRedirect("index.html");

            } else {
                int currentQuestionNo = 0;
                String currentAnswer = "";
                String UserSelection = "";
                String Question = "";

                String dbUrl = "jdbc:mysql://localhost/onlineexam";
                String dbClass = "com.mysql.jdbc.Driver";
                String query = "";
        %>
        <title><% out.print(UserSession.getAttribute("ExamName") + " : " + UserSession.getAttribute("UEID")); %> - Online Examination Portal</title>

    </head>
    <body style="background-color: #ffffff">
    <center>  
        <h1>Let's take a look at how you answered the test....</h1>
        <a href="ExaminationResult.jsp"><img src="images/back-to-summary.png" style="border: 0"/></a>
        <br/>
        <table border="0" cellpadding="10" cellspacing ="0" width="950">
            <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");

                        Connection con = DriverManager.getConnection(dbUrl, "root", "");
                        Statement stmt = con.createStatement();

                        query = "select QuestionNo, Question, Answer, OptionA, OptionB, OptionC, OptionD from Exam_Question_Bank where ExamId="
                                + UserSession.getAttribute("ExamID") + " order by QuestionNo asc";
                        ResultSet rs = stmt.executeQuery(query);

                        while (rs.next()) {
                            String qno = rs.getString("QuestionNo");
                            Question = rs.getString("Question");

                            currentAnswer = rs.getString("Answer");
                            String optionA = rs.getString("OptionA");
                            String optionB = rs.getString("OptionB");
                            String optionC = rs.getString("OptionC");
                            String optionD = rs.getString("OptionD");

                            String OptionName = "Question" + qno + "SelectedOption";
                            if (UserSession.getAttribute(OptionName) != null) {
                                UserSelection = UserSession.getAttribute(OptionName).toString();

                            } else {
                                UserSelection = null;
                            }

                            if (UserSelection == null) {
                                out.print("<tr style='background-color: #fbd1d1'>");
                                out.print("<td rowspan = '2'>");
                                out.print("<img src='images/no.png' width='30' height='30'/>"
                                        + "</td>");
                                out.print("<td>"
                                        + "<b>Q." + qno + ".</b> ");
                                out.print(Question + "</td></tr>"
                                        + "<tr style='background-color: #f98080'><td><b>A. </b>");
                                if (currentAnswer.contains("OptionA")) {
                                    out.print(optionA);
                                } else if (currentAnswer.contains("OptionB")) {
                                    out.print(optionB);
                                } else if (currentAnswer.contains("OptionC")) {
                                    out.print(optionC);
                                } else if (currentAnswer.contains("OptionD")) {
                                    out.print(optionD);
                                }
                                out.print("</td></tr>");

                            } else if (currentAnswer.contains(UserSelection)) {
                                out.print("<tr style='background-color: #dbfbd1'>");
                                out.print("<td rowspan = '2'>");
                                out.print("<img src='images/yes.png' width='30' height='30'/>"
                                        + "</td>");
                                out.print("<td>"
                                        + "<b>Q." + qno + ".</b> ");
                                out.print(Question + "</td></tr>"
                                        + "<tr style='background-color: #83f980'><td><b>A. </b>");

                                if (currentAnswer.contains("OptionA")) {
                                    out.print(optionA);
                                } else if (currentAnswer.contains("OptionB")) {
                                    out.print(optionB);
                                } else if (currentAnswer.contains("OptionC")) {
                                    out.print(optionC);
                                } else if (currentAnswer.contains("OptionD")) {
                                    out.print(optionD);
                                }
                                out.print("</td></tr>");
                            } else {
                                out.print("<tr style='background-color: #f7aeae'>");
                                out.print("<td rowspan = '3'>");
                                out.print("<img src='images/no.png' width='30' height='30'/>"
                                        + "</td>");
                                out.print("<td>"
                                        + "<b>Q." + qno + ". </b>");
                                out.print(Question + "</td></tr>"
                                        + "<tr style='background-color: #f79595'><td><b>A. </b>");
                                if (currentAnswer.contains("OptionA")) {
                                    out.print(optionA);
                                } else if (currentAnswer.contains("OptionB")) {
                                    out.print(optionB);
                                } else if (currentAnswer.contains("OptionC")) {
                                    out.print(optionC);
                                } else if (currentAnswer.contains("OptionD")) {
                                    out.print(optionD);
                                }
                                out.print("</td></tr><tr style='background-color: #f76868'><td><b>You Answered : </b><br>");
                                if (UserSelection.contains("OptionA")) {
                                    out.print(optionA);
                                } else if (UserSelection.contains("OptionB")) {
                                    out.print(optionB);
                                } else if (UserSelection.contains("OptionC")) {
                                    out.print(optionC);
                                } else if (UserSelection.contains("OptionD")) {
                                    out.print(optionD);
                                }

                            }

                            out.print("<tr><td colspan='2' style='border-left:0px;border-right:0px'></td></tr>");
                        }
                    } catch (Exception e) {
                        out.print(e.getMessage());
                        e.printStackTrace(response.getWriter());
                    }
                }
            %>
        </table>

    </center>
</body>
</html>


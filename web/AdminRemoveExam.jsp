<%-- 
    Document   : AdminRemoveExam
    Created on : 18-Apr-2015, 8:08:21 PM
    Author     : C0648301
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove Exam - MGIT</title>

        <style>
            #navigation {
                width: 950px;
                height: 50px;
                margin: 0;
                padding: 0;
                background: url(images/navigation-bg.jpg) no-repeat left top;
            } 
            #navigation ul {
                list-style: none;
                margin: 0;
                padding: 0;
            } 
            #navigation ul li {
                display: inline;
                margin: 0px;
            } 

            #navigation ul li a {
                height:33px;
                display: block;
                float: left;
                padding: 17px 15px 0 15px;
                font: bold 12px Arial;
                color: black;
                text-decoration: none;
                background: url(images/navigation-separator.png) no-repeat right center;
            } 

            #navigation ul li a:hover {
                color:#134264;
                background: url(images/navigation-hover.png) repeat-x left top;
            }

            #navigation ul li#active a {
                color:#134264;
                background: url(images/navigation-hover.png) repeat-x left top;
            }
            .Page-Heading {
                padding:0;
                margin:0;
                color: #4778e3;
                font: bold 38px;
            }


            .show { display: block;  }
            .hide { display: none; }
        </style>
    </head>
    <body>

        <%
            HttpSession Usersession = request.getSession(false);

        %>

        <%        out.println("<b>Welcome " + Usersession.getAttribute("Username") + "...</b>");
        %>
        <div id="navigation">
            <ul>
                <li><a href="home.jsp">Home</a></li>

                <li><a href="main.jsp">Available Exams</a></li>
                <li><a href="PreviousResults.jsp">Previous Grades</a></li>
                <li><a href="ContactUs.jsp">Contact Us</a></li>
                <li><a href="Logout.jsp">Logout</a></li>
            </ul>
        </div>    

        <table border="0" width="950">
            <tr>
                <td align ="center">
                    <form action="RemoveExam" id="RemoveExamForm" method="post">

                        <h2 style="color: #4778e3">Current Exams</h2>  

                        <%
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/onlineexamproject", "root", "");
                            Statement ps = con.createStatement();

                            ResultSet rs = ps.executeQuery("Select * from exam_list");
                            int ExamId;
                            int bgcolorFlag = 0;

                            if (rs.next()) {
                        %>


                        <table cellspacing="0" cellpadding="15" border="0" width="600" >
                            <tr style="background-color: #a9a8f0; font-size: 20px; font-weight: bold">
                                <td></td>
                                <td><b>Exam-ID</b></td>
                                <td><b>Subject</b></td>
                            </tr>
                            <%          do {
                                    bgcolorFlag++;
                                    ExamId = rs.getInt("ExamId");
                            %>


                            <tr style="background-color:<% if ((bgcolorFlag % 2) == 0) {
                                    out.print("#f0cda8");
                                } else {
                                    out.print("#92ecc1");
                                }
                                %>"> <td align="center">
                                    <input type="radio" id="ExamIdToRemoveRadio" name="ExamIdToRemoveRadio" value="<% out.print(ExamId); %>"/>

                                </td>



                                <td><b><% out.println(ExamId); %></b><br>
                                <td><% out.println(rs.getString("ExamName")); %><br>
                                </td>
                            </tr>



                            <%
                                } while (rs.next());

                            %>

                        </table>
                        <br>
                        <b style="color: red;" align="center">
                            <% if (Usersession.getAttribute("RemoveExamException") != null) {
                                    out.print(Usersession.getAttribute("RemoveExamException"));
                                } %></b>
                        <br/>
                        <!--<i id="err"></i> -->
                        <a href="javascript:void(0)" onclick="javascript:document.getElementById('RemoveExamForm').submit()">
                            <img src="images/Remove-Exam.png" style="margin-top:5px;margin-bottom: 5px; padding-top: 15px; border: 0"/></a>



                        <a href="AdminConsoleHome.jsp">
                            <img src="images/Cancel-Exam-Registration-btn.png" style="margin-top:5px;margin-bottom: 5px; padding-top: 15px; border: 0"/></a>

                        <%
                        } else {
                        %>     

                        <h2 style="padding-top: 20px; color: #4778e3;">No active exams scheduled</h2>





                        <%
                            }
                        %>
                    </form>
                </td>
            </tr>
        </table>
        <%

        %>      
    </body>
</html>


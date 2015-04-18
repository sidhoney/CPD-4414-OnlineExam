<%-- 
   Document   : PreviousResults
   Created on : 18-Apr-2015, 12:45:03 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Previous Results - MGIT University</title>

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
                color: #FFF;
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
                font: bold 38px "Calibri", Arial;
            }

            .show { display: block;  }

            .hide { display: none; }
        </style>
    </head>
    <body>
        <%
            HttpSession Usersession = request.getSession(false);
            if (Usersession.getAttribute("Username") == null || Usersession.getAttribute("Privilege") == null) {
                response.sendRedirect("index.html");

            } else {
        %>
        <h2 class="Page-Heading">Online Exam</h2>
        <%
            out.println("<b>Welcome " + Usersession.getAttribute("Username") + "...</b>");
        %>
        <div id="navigation">
            <ul>
                <li><a href="home.jsp">Home</a></li>
                    <%
                        if (Usersession.getAttribute("Privilege").toString().contains("adminUser")) {
                            out.println("<li><a href = 'AdminConsoleHome.jsp'>Administration Console</a></li>");
                        }
                    %>
                <li><a href="main.jsp">Available Exam</a></li>
                <li id="active"><a href="PreviousResults.jsp">Previous Grades</a></li>
                <li><a href="ContactUs.jsp">Contact Us</a></li>
                <li><a href="Logout.jsp">Logout</a></li>
            </ul>
        </div>
        <table border="0" width="950">
            <tr>
                <td align ="center">
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/onlineexam", "root", "");
                        Statement ps = con.createStatement();

                        ResultSet rs;

                        rs = ps.executeQuery("Select * from exam_results where UserId = " + Usersession.getAttribute("UserId") + " order by TimeStamp desc");
                        rs.setFetchDirection(ResultSet.FETCH_UNKNOWN);
                        int ExamId;
                        int bgcolorFlag = 0;
                        if (rs.next()) {


                    %>
                    <h2 style="color: #4778e3">Grades </h2>
                    <table border ="0" width="800" cellpadding="15" cellspacing="0">
                        <tr  style="background-color: #a9a8f0; font-size: 20px; font-weight: bold">
                            <td align="center">
                                <b>UEID</b>
                            </td>
                            <td align="center">
                                <b>Exam ID</b>
                            </td>
                            <td align="center">
                                <b>Exam Title</b>
                            </td>
                            <td align="center">
                                <b>Marks Scored</b>
                            </td>
                            <td align="center">
                                <b>Date of Test</b>
                            </td>
                        </tr>
                        <%                      do {
                                bgcolorFlag++;
                        %>
                        <tr style="background-color:<% if ((bgcolorFlag % 2) == 0) {
                                out.print("#cac9f2");
                            } else {
                                out.print("#e1e1f0");
                            }
                            %>">
                            <td align="center"><% out.print(rs.getString("UEID")); %></td>
                            <td align="center"><% out.print(rs.getInt("ExamId")); %></td>
                            <td align="center"><% out.print(rs.getString("ExamName")); %></td>
                            <td align="center"><% out.print(rs.getInt("MarksScored")); %> /100</td>
                            <td align="center"><% out.print(rs.getString("TimeStamp")); %></td>
                        </tr>
                        <%
                            } while (rs.next());
                        } else {
                        %>
                        <h2 style="padding-top: 20px">No Exams attempted</h2>
                        <h4>Please check Available Exams</h4>
                    </table>
                </td>
            </tr>
        </table>
        <%
                }
            }
        %>      
    </body>
</html>
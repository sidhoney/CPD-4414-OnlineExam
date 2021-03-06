<%-- 
    Document   : main
    Created on : 18-Apr-2015, 8:13:40 PM
    Author     : C0648301
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exams- MGIT</title>
        <%@page language="java" %>
        <%@page import="java.io.*" %>
        <%@page import="java.sql.*" %>
        <%@page import="javax.servlet.*"%>

        <style>#navigation {
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
                color: #0099CC;
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
            if (Usersession.getAttribute("Username") == null) {
                response.sendRedirect("index.html");

            } else {

        %>
        
        <%    out.println("<b>Welcome " + Usersession.getAttribute("Username") + "...</b>");

        %>
        <div id="navigation">  
            <ul>
                <li><a href="home.jsp">Home</a></li>
                    <%                    if (Usersession.getAttribute("Privilage").toString().contains("adminUser")) {
                            out.println("<li><a href = 'AdminConsoleHome.jsp'>Administration Console</a></li>");
                        }
                    %>
                <li id="active"><a href="main.jsp">Available Exams</a></li>
                <li><a href="PreviousResults.jsp">Previous Grades</a></li>
                <li><a href="ContactUs.jsp">Contact Us</a></li>
                <li><a href="Logout.jsp">Logout</a></li>
            </ul>
        </div>    


        <table border="0" width="950">
            <tr>
                <td align ="center">



                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/onlineexamproject", "root", "");
                            Statement ps = con.createStatement();

                            ResultSet rs = ps.executeQuery("Select * from Exam_List");
                            String examID = "";
                            int bgcolorFlag = 0;
                            if (rs.next()) {

                    %>

                    <p>Select the exam to begin</p>
                    <form id="ExamListForm" action="BeginTest.jsp" method="post">
                        <table cellspacing="0" cellpadding="10" width="900" align="center" border="0">
                            <%                 do {
                                    bgcolorFlag++;
                                    examID = rs.getString("ExamId");
                            %>
                            <tr colspan ="2"  style="background-color:<% if ((bgcolorFlag % 2) == 0) {
                                    out.print("#92ecc1");
                                } else {
                                    out.print("#ecc192");
                                }
                                %>">
                                <td colspan ="2" align="center">
                                    <input type="radio" id="examListRadio" name="examListRadio" value="<% out.print(examID); %>">
                                </td>
                                <td>
                                    <b>
                                        <%
                                            String ExamName = rs.getString("ExamName");
                                            out.println(ExamName);
                                        %>
                                    </b>
                                    <input type="hidden" name="Name-<% out.print(examID); %>" value="<% out.print(ExamName); %>" />
                                    <br>
                                    <% out.println(rs.getString("ExamDescription")); %>
                                </td>
                            </tr>

                            <%
                                } while (rs.next());
                            %>
                            <tr>
                        </table>

                        <a href="javascript:void(0)" onClick="javascript:document.getElementById('ExamListForm').submit()"><!--Login</a>-->
                            <img src="images/View_Details.png" width="160" height="42" style="margin-top:10px; border: 0" /></a>
                    </form>            
                    <%
                    } else {
                    %>
                    <h2 style="padding-top: 20px; color: #4778e3;">It seems we do not have any active exams right now...</h2>
                    <h4>Do check back in later for an updated list of exams soon...</h4>
                    <%
                                }
                            } catch (Exception e) {
                                out.println("Error : <br>" + e.getMessage());
                               
                            }
                        }
                    %>                    




                </td>
            </tr>
        </table>
      </body>
</html>


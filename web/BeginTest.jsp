<%-- 
    Document   : BeginTest
    Created on : 18-Apr-2015, 8:09:13 PM
    Author     : C0648301
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam Summary- MGIT</title>

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
            if (Usersession.getAttribute("Username") == null) {
                response.sendRedirect("index.html");

            } else {

        %>

        <%    out.println("<b>Welcome " + Usersession.getAttribute("Username") + "...</b>");

        %>
        <div id="navigation">  
            <ul>
                <li id="active"><a href="main.jsp">Home</a></li>
                    <%                    if (Usersession.getAttribute("Privilage").toString().contains("adminUser")) {
                            out.println("<li><a href = 'AdminConsoleHome.jsp'>Administration Console</a></li>");
                        }
                    %>

                <li><a href="navigation.html">Contact Us</a></li>
                <li><a href="Logout.jsp">Logout</a></li>
            </ul>
        </div>    


        <table border="0" width="950">
            <tr>
                <td align ="center">
                    <form name="testSummary" id="testSummary" action="StartNewExam" method="POST">
                        <table cellpadding ="10" cellspacing="0" border ="0" width="600" style="padding-top: 40px; border: none">
                            <th colspan ="3" style="background-color: #0033CC"><h2>Exam Memo</h2></th>
                            <tr style="background-color: #669999">
                                <td style="font-size:20px;">
                                    Exam-Code
                                </td>
                                <td>:</td>
                                <td>
                                    <%
                                        String exam = "";
                                        exam = request.getParameter("examListRadio");
                                        out.println(exam);
                                    %>
                                    <input type="hidden" id="ExamCode" name="ExamCode" value="<% out.print(exam); %>"/>
                                    <input type="hidden" id="ExamName" name="ExamNamePassOn" value="<% out.print(request.getParameter("Name-" + exam)); %>"/>
                                </td>
                            </tr>
                            <tr style="background-color: #669999">
                                <td style="font-size:20px;">
                                    Duration
                                </td>
                                <td>:</td>
                                <td>
                                    60 mins
                                </td>
                            </tr>
                            <tr style="background-color: #669999">
                                <td style="font-size:20px;">
                                    Total Questions
                                </td>
                                <td>:</td>
                                <td>
                                    5
                                </td>
                            </tr>
                            <tr style="background-color: #e1e1f0">
                                <td style="font-size:20px;">
                                    Max Marks
                                </td>
                                <td>:</td>
                                <td>
                                    100
                                </td>
                            </tr>
                            <tr style="background-color: #6666FF">
                                <td colspan="3" align ="center">

                                    <a href="javascript:void(0)" onClick="javascript:document.getElementById('testSummary').submit()">
                                        <img src="images/Start-Test.png" width="160" height="42" style="margin-top:10px; border: 0" /></a>
                                    <a href="main.jsp">
                                        <img src="images/Cancel-Exam-Start.png" width="160" height="42" style="margin-top:10px; border: 0; padding-left: 30px" /></a>
                                </td>
                            </tr>
                        </table>         
                    </form>  
                </td>
            </tr>
        </table>
        <%
            }
        %>

    </body>
</html>


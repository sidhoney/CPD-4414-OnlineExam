<%-- 
   Document   : AdminConsoleHome
   Created on : 18-Apr-2015, 11:27:25 AM
   Author     : C0648301
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Console - MGIT Univ</title>
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

            Usersession.setAttribute("RemoveExamException", null);
            Usersession.setAttribute("RemoveUserException", null);
            Usersession.setAttribute("ExamCreationError", null);
            Usersession.setAttribute("QuestionEntryException", null);
            Usersession.setAttribute("UserPrivilegeChangeException", null);
        %>
        <h2 class="Page-Heading">Online Examination Portal</h2>
        <%
            out.println("<b>Welcome " + Usersession.getAttribute("Username") + "...</b>");
        %>
        <div id="navigation">
            <ul>
                <li><a href="home.jsp">Home</a></li>
                    <%
                        if (Usersession.getAttribute("Privilege").toString().contains("adminUser")) {
                            out.println("<li id='active'><a href = 'AdminConsoleHome.jsp'>Administration Console</a></li>");
                        }
                    %>
                <li><a href="main.jsp">Available Exam</a></li>
                <li><a href="PreviousResults.jsp">Previous Grades</a></li>
                <li><a href="ContactUs.jsp">Contact Us</a></li>
                <li><a href="Logout.jsp">Logout</a></li>
            </ul>
        </div>
        <table border="0" width="950">
            <tr>
                <td align ="center">
                    <h1 style="color: #4778e3">Admin Console</h1>
                    <br>
                    <table cellpadding ="15" border="0">
                        <tr>
                            <td> 
                                <a href="AddNewExam.jsp">
                                    <img src="images/Add-Exam.png" width="160" height="42" style="margin-top:5px; margin-bottom: 5px; border: 0" />
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href="AdminRemoveExam.jsp">
                                    <img src="images/Remove-Exam.png" width="160" height="42" style="margin-top:5px;  margin-bottom: 5px; border: 0" />
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href="AdminRemoveUser.jsp">
                                    <img src="images/Remove-User.png" width="160" height="42" style="margin-top:5px;  margin-bottom: 5px; border: 0" />
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href="AdminChangeUserPrivileges.jsp">
                                    <img src="images/User-Privilages.png" width="160" height="42" style="margin-top:5px;  margin-bottom: 5px; border: 0" />
                                </a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <%
        %>      
    </body>
</html>
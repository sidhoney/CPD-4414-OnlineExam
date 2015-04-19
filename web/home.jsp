<%-- 
    Document   : home
    Created on : 18-Apr-2015, 8:11:43 PM
    Author     : C0648301
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home - MGIT Univ</title>
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
                color: #0099cc;
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
            if (Usersession.getAttribute("Username") == null || Usersession.getAttribute("Privilage") == null) {
                response.sendRedirect("index.html");

            } else {
        %>
        <h2 class="Page-Heading">MGIT University Online</h2>  
        <%
            out.println("<b>Welcome " + Usersession.getAttribute("Username") + "</b>");
        %>
        <div id="navigation">
            <ul>
                <li id="active"><a href="home.jsp">Home</a></li>
                    <%
                        if (Usersession.getAttribute("Privilage").toString().contains("adminUser")) {
                            out.println("<li><a href = 'AdminConsoleHome.jsp'>Administration Console</a></li>");
                        }
                    %>
                <li><a href="main.jsp">Available Exams</a></li>
                <li><a href="PreviousResults.jsp">Previous Grades</a></li>
                <li><a href="ContactUs.jsp">Contact Us</a></li>
                <li><a href="Logout.jsp">Logout</a></li>
            </ul>
        </div>    

        <table border="0" width="950">
            <tr>
                <td>

                    <h1 class="Page-Heading" style="font-size: 34px; padding-top: 20px"> Welcome</h1>
                    <p >MGIT University has been servicing Canadian and international students for over 100 years
                        and has truly evolved from a public not-for-profit college to a global post-secondary education
                        provider.

                    <p>
                    <h4 style="color: #4778e3"><font size="5"><b> Exams</b></font></h4>

                    <p>On the online examination portal we offer quality education in a challenging yet student-friendly 
                        environment. Following the MGIT University curriculum, each semester is designed to meet the challenges
                        unique to international students and create a quality academic experience. We offer small class sizes 
                        leading to efficient teacher-student interaction, flexible instruction hours.</p>

                    <h4 style="color: #4778e3"><font size="5"><b>About</b></font></h4>

                    <ul>
                        <li style="padding: 5px">Exam is closed book </li>

                        <li style="padding: 5px">All tests currently registered at the website is available to the user during the Instructors Scheduled time</li>

                        <li style="padding: 5px">Marks generated are purely on the basis of answers</li>

                        <li style="padding: 5px">The test consist of 5 multiple choice questions that relate to subject knowledge</li>


                    </ul>
                    </p>

                </td>
            </tr>
        </table>
        <%
            }
        %>      
    </body>
</html>


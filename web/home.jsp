<%-- 
    Document   : home
    Created on : 17-Apr-2015, 11:21:37 PM
    Author     : C0648301
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Home Page</title>
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
            if (Usersession.getAttribute("Username") == null || Usersession.getAttribute("Privilage") == null) {
                response.sendRedirect("index.html");

            } else {
        %>
        <h2 class="Page-Heading">Online Examination Portal</h2>  
        <%
            out.println("<b>Welcome " + Usersession.getAttribute("Username") + "...</b>");
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
                <li><a href="PreviousResults.jsp">Previous Results</a></li>
                <li><a href="ContactUs.jsp">Contact Us</a></li>
                <li><a href="Logout.jsp">Logout</a></li>
            </ul>
        </div>    

        <table border="0" width="950">
            <tr>
                <td>

                    <h1 class="Page-Heading" style="font-size: 34px; padding-top: 20px"> Welcome . . . .</h1>
                    <p >Welcome to the MGIT Examination Portal.
                        Our comprehensive program provides you with the necessary information needed 
                        to have a smooth and successful transition to college life. Our goal is to ensure 
                        that all first year students feel welcomed and supported during this program. 
                        Your overall engagement in college life is an important factor in your progress towards graduation.  
                        Campus Connection runs over two days; each day is assigned to different program areas.  

                    <p>
                    <h4 style="color: #4778e3"><font size="5"><b> Assessments</b></font></h4>

                    <p>Campus Connection will provide students and parents/supporters with important information on how 
                        to succeed at college. You will also have the opportunity to complete math assessment 
                        (applies to certain programs). Keep checking this website for the most up to date information 
                        and to find out which day you should attend. Math assessments, itineraries, driving directions and 
                        much more will be added in the near future.</p>

                    <h4 style="color: #4778e3"><font size="5"><b>Standards</b></font></h4>

                    <ul>
                        <li style="padding: 5px">Exam score is purely based on the performance of the student </li>

                        <li style="padding: 5px">All exams currently registered at the web-site is available only during Lecture's advised Schedule</li>

                        <li style="padding: 5px">The marks wont be changed, all results are generated purely on the basis of merit.</li>

                        <li style="padding: 5px">The test consist of Twenty-five multiple choice questions that relate to course schedule</li>

                        <li style="padding: 5px">The exam does not have negative marking</li>
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


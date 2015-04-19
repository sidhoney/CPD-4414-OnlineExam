<%-- 
    Document   : ContactUs
    Created on : 18-Apr-2015, 8:10:21 PM
    Author     : C0648301
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us - MGIT</title>
        <style>
            #navigation {
                width: 800px;
                height: 150px;
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
                font: bold 38px;
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

        <%
            out.println("<b>Welcome " + Usersession.getAttribute("Username") + "</b>");
        %>
        <div id="navigation">
            <ul>
                <li><a href="home.jsp">Home</a></li>
                    <%
                        if (Usersession.getAttribute("Privilage").toString().contains("adminUser")) {
                            out.println("<li><a href = 'AdminConsoleHome.jsp'>Administration Console</a></li>");
                        }
                    %>
                <li><a href="main.jsp">Available Exams</a></li>
                <li><a href="PreviousResults.jsp">Previous Grades</a></li>
                <li id="active"><a href="ContactUs.jsp">Contact Us</a></li>
                <li><a href="Logout.jsp">Logout</a></li>
            </ul>
        </div>    
        <table border="0" width="950">
            <tr>
                <td>
                    <h2 class="Page-Heading" style="font-size: 34px;padding-bottom: 15px">Contact Us</h2>
                    We can be reached at<br/><br/>
                    MGIT University<br>
                    817 Devine Street<br>
                    Sarnia<br>
                    N7T 1X3<br />
                    <b> Email : </b>c0648301@mgit.ca<br>
                    <b> Phone : </b>+1-226-402-2848
                    <br />
                    </p>


                </td>
            </tr>
        </table>
        <%
            }
        %>      
    </body>
</html>

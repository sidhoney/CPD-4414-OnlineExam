<%-- 
    Document   : AdminChangeUserPrivileges
    Created on : 18-Apr-2015, 8:06:19 PM
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
        <title>User Priv - MGIT</title>

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
        <h2 class="Page-Heading">Online Examination Portal</h2>  
        <%        out.println("<b>Welcome " + Usersession.getAttribute("Username") + "...</b>");
        %>
        <div id="navigation">
            <ul>
                <li><a href="home.jsp">Home</a></li>
                    <%
                        if (Usersession.getAttribute("Privilage").toString().contains("adminUser")) {
                            out.println("<li id='active'><a href = 'AdminConsoleHome.jsp'>Administration Console</a></li>");
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
                <td align ="center">



                    <form name="ChangeUserPrivilagesForm" action="ChangeUserPrivilage" id="ChangeUserPrivilageForm" method="post">

                        <h1 style="color: #4778e3">Privileges</h1>

                        <input type="hidden" name="UserToChange" id="UserToChange"/>
                        <input type="hidden" name="ChangeType" id="ChangeType"/>
                        <b style="color: red; padding-bottom: 10px" align="center">
                            <% if (Usersession.getAttribute("UserPrivilageChangeException") != null) {
                                    out.print(Usersession.getAttribute("UserPrivilageChangeException") + "<br>");
                                } %></b>
                        <table cellspacing="0" cellpadding="15" border="0" width="800">
                            <tr style="background-color: #f0a9a8; font-size: 20px; font-weight: bold">
                                <td>User-ID</td>
                                <td>User Name</td>
                                <td align="center">Privileges</td>
                            </tr>
                            <%
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/onlineexamproject", "root", "");
                                    Statement ps = con.createStatement();

                                    ResultSet rs = ps.executeQuery("Select UserId,Name from user_information");
                                    String UserId = "";
                                    String Name = "";
                                    int bgcolorFlag = 0;
                            %>


                            <%     while (rs.next()) {
                                    bgcolorFlag++;
                                    UserId = rs.getString("UserId");
                                    Name = rs.getString("Name");
                                    Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost/onlineexamproject", "root", "");
                                    Statement ns = con2.createStatement();

                                    ResultSet rs2 = ns.executeQuery("select * from Administrator_List where UserId = " + UserId);

                            %>
                            <tr style="background-color:<% if ((bgcolorFlag % 2) == 0) {
                                    out.print("#cac9f2");
                                } else {
                                    out.print("#e1e1f0");
                                }
                                %>"><td><% out.println(UserId); %></td>
                                <td><b style="font-size: 18px"><% out.println(Name); %></b></td>
                                    <%
                                        if (rs2.next()) {
                                    %>


                                <td align="center">
                                    <a href="javascript:void(0)" onclick="javascript:document.getElementById('UserToChange').value = <%=UserId%>;
                                            document.getElementById('ChangeType').value = 'ToNormalUser';
                                            document.getElementById('ChangeUserPrivilageForm').submit()"><img src="images/admin-user-toggle.png" style="border: 0"/></a>

                                </td>
                                <%
                                } else {
                                %>                 
                                <td align="center">
                                    <a href="javascript:void(0)" onclick="javascript: document.getElementById('UserToChange').value = <%=UserId%>;
                                            document.getElementById('ChangeType').value = 'ToAdminUser';
                                            document.getElementById('ChangeUserPrivilageForm').submit()"><img src="images/normal-user-toggle.png" style="border: 0"/></a>

                                </td>
                                <%
                                    }
                                %>


                            </tr>



                            <%}
                            %>

                        </table>

                        <br>


                    </form>

            </tr>
        </table>
        <%
            } catch (Exception e) {
                e.printStackTrace();
            }

        %>      
    </body>
</html>

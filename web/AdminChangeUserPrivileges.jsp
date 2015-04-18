<%-- 
   Document   : AdminChangeUserPrivileges
   Created on : 18-Apr-2015, 11:17:45 AM
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
        <title>Change User Privileges - Administration Console</title>
        <link href="menuStyle.css" rel="stylesheet" type="text/css" />
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
                <li><a href="PreviousResults.jsp">Previous Results</a></li>
                <li><a href="ContactUs.jsp">Contact Us</a></li>
                <li><a href="Logout.jsp">Logout</a></li>
            </ul>
        </div>
        <table border="0" width="950">
            <tr>
                <td align ="center">
                    <form name="ChangeUserPrivilegesForm" action="ChangeUserPrivilege" id="ChangeUserPrivilageForm" method="post">
                        <h1 style="color: #4778e3">Registered Accounts</h1>
                        Use toggle switch to edit privileges<br/><br/>
                        <input type="hidden" name="UserToChange" id="UserToChange"/>
                        <input type="hidden" name="ChangeType" id="ChangeType"/>
                        <b style="color: red; padding-bottom: 10px" align="center">
                            <% if (Usersession.getAttribute("UserPrivilegeChangeException") != null) {
                          out.print(Usersession.getAttribute("UserPrivilegeChangeException") + "<br>");
                      } %></b>
                        <table cellspacing="0" cellpadding="15" border="0" width="800">
                            <tr style="background-color: #a9a8f0; font-size: 20px; font-weight: bold">
                                <td>User ID</td>
                                <td>Name</td>
                                <td align="center">Current Status</td>
                            </tr>
                            <%
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/onlineexam", "root", "");
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
                                    Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost/onlineexam", "root", "");
                                    Statement ns = con2.createStatement();

                                    ResultSet rs2 = ns.executeQuery("select * from administrator_list where UserId = " + UserId);

                            %>
                            <tr style="background-color:<% if ((bgcolorFlag % 2) == 0) {
                                    out.print("#cac9f2");
                                } else {
                                    out.print("#e1e1f0");
                                }
                                %>">
                                <td><% out.println(UserId); %></td>
                                <td><b style="font-size: 18px"><% out.println(Name); %></b></td>
                                    <%
                                        if (rs2.next()) {
                                    %>
                                <td align="center">
                                    <a href="javascript:void(0)" onclick="javascript:document.getElementById('UserToChange').value = <%=UserId%>;
                                            document.getElementById('ChangeType').value = 'ToNormalUser';
                                            document.getElementById('ChangeUserPrivilegeForm').submit()"><img src="images/admin-user-toggle.png" style="border: 0"/></a>
                                </td>
                                <%
                                } else {
                                %>                 
                                <td align="center">
                                    <a href="javascript:void(0)" onclick="javascript: document.getElementById('UserToChange').value = <%=UserId%>;
                                            document.getElementById('ChangeType').value = 'ToAdminUser';
                                            document.getElementById('ChangeUserPrivilegeForm').submit()"><img src="images/normal-user-toggle.png" style="border: 0"/></a>
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

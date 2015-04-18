<%-- 
   Document   : AdminRemoveUser
   Created on : 18-Apr-2015, 1:42:52 PM
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
      <title>Remove User - Admin</title>
      <script type="text/javascript">
         function removeUser()
         {
             out.println("inside removeUser..");
             var radioSelect = document.getElementById("User").value;
             out.println("radioSelect : " + radioSelect);
             if (radioSelect == "" || radioSelect == null)
             {
                 document.getElementById("err").innerHtml = "Please Select a User before clicking Remove button...";
             }
             else
             {
                 document.getElementById("RemoveUserForm").submit();
             }
         
         }
      </script>
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
         
         %>
      <h2 class="Page-Heading">Online Exam</h2>
      <%        out.println("<b>Welcome " + Usersession.getAttribute("Username") + "...</b>");
         %>
      <div id="navigation">
         <ul>
            <li><a href="home.jsp">Home</a></li>
            <%
               if (Usersession.getAttribute("Privilege").toString().contains("adminUser")) {
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
               <form action="RemoveUser" id="RemoveUserForm" method="post">
                  <h1 style="color: #4778e3">Registered User Accounts</h1>
                  Please select a User Account below and click Remove User to clear User Data<br/><br/>
                  <table cellspacing="0" cellpadding="15" border="0" width="800">
                     <tr  style="background-color: #a9a8f0; font-size: 20px; font-weight: bold">
                        <td></td>
                        <td><b>Name</b></td>
                        <td><b>Email</b></td>
                     </tr>
                     <%
                        int bgcolorFlag = 0;
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/onlineexam", "root", "");
                        Statement ps = con.createStatement();
                        
                        ResultSet rs = ps.executeQuery("Select UserId, Name, Email from user_information"); %>
                     <%     while (rs.next()) {
                        bgcolorFlag++;
                        %>
                     <tr  style="background-color:<% if ((bgcolorFlag % 2) == 0) {
                        out.print("#cac9f2");
                        } else {
                        out.print("#e1e1f0");
                        }
                        %>">
                        <td align="center">
                           <input type="radio" id="User" name="UserIdToRemoveRadio" value="<% out.print(rs.getString("UserId")); %>">
                        </td>
                        <td><% out.println(rs.getString("Name")); %><br>
                        <td><% out.println(rs.getString("Email")); %><br>
                        </td>
                     </tr>
                     <%}
                        %>
                  </table>
                  <br>
                  <b style="color: red; padding-bottom: 10px" align="center">
                  <% if (Usersession.getAttribute("RemoveUserException") != null) {
                     out.print(Usersession.getAttribute("RemoveUserException") + "<br>");
                     } %></b>
                  <a href="javascript:void(0)" onclick="document.getElementById('RemoveUserForm').submit()">
                  <img src="images/Remove-User.png" width="150" height="40" style="margin-top:5px;margin-bottom: 5px; padding-top: 10px; border: 0"/></a>
                  <a href="AdminConsoleHome.jsp">
                  <img src="images/Cancel-User-Removal.png" width="160" height="40" style="margin-top:5px;margin-bottom: 5px; padding-top: 10px; border: 0"/></a>
               </form>
            </td>
         </tr>
      </table>
      <%
         %>      
   </body>
</html>
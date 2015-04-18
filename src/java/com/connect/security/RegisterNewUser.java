/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.connect.security;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author C0648301
 */
public class RegisterNewUser extends HttpServlet {
    String dbUrl = "jdbc:mysql://localhost/onlineexamproject";
String dbClass = "com.mysql.jdbc.Driver";
String userInfoInsertQuery = "";
String userLoginCredentialsInsertQuery = "";

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
             out.println("<html>");
            out.println("<head>");
            out.println("<title>Please wait while we analyze your request...</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h2>Please wait... </h2>");
          
            
        Class.forName("com.mysql.jdbc.Driver");
               
        Connection con = DriverManager.getConnection (dbUrl,"root","");
        PreparedStatement insertUserInfo, insertUserInfo1;
        
        userInfoInsertQuery="insert into user_information (Name, Age, Address, Phone, Email) values(?,?,?,?,?);";
         userLoginCredentialsInsertQuery = "insert into login_credentials (Username, Password) values(?,?);";
        
        insertUserInfo = con.prepareStatement(userInfoInsertQuery);
        insertUserInfo1 = con.prepareStatement(userLoginCredentialsInsertQuery);
        String Name= request.getParameter("name");
        String Age = request.getParameter("age");
        String Address = request.getParameter("address");
        String Phone = request.getParameter("phoneno");
        String Email = request.getParameter("email");
        String UserName = request.getParameter("username");
        String Password = request.getParameter("password2");
        
        insertUserInfo.setString(1, Name);
        insertUserInfo.setInt(2, Integer.parseInt(Age));
        insertUserInfo.setString(3, Address);
        insertUserInfo.setString(4, Phone);
        insertUserInfo.setString(5, Email);
        insertUserInfo1.setString(1, UserName);
        insertUserInfo1.setString(2, Password);
        
        int output = insertUserInfo.executeUpdate();
         int output1 = insertUserInfo1.executeUpdate();
        out.println("<br><br><h3>New Student Details</h3>" 
                + "-----------------------------------------------------------------<br>");
        out.println("<br>Name     &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp "+Name);
        out.println("<br>Age      &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp "+Age);
        out.println("<br>Address  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp "+Address);
        out.println("<br>Phone    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp "+Phone);
        out.println("<br>Email    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp "+Email);
        out.println("<br>Username &nbsp&nbsp&nbsp&nbsp&nbsp "+UserName);
        out.println("<br>Password &nbsp&nbsp&nbsp&nbsp&nbsp "+Password);
        
         out.println("<br><br> Rows Updated:  "+output);
           
        out.println("<br><br><a href='index.html'>Click to login</a></body>");
        out.println("</html>");
        } 
        catch(Exception er)
        {
            out.println("<br><br> We are facing issues in our system database. We will get back shortly, Thank you for your patience<br><br>"
                    + er.getMessage());
        }
        finally {            
            out.close();
        }
    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
    }

    /**
     *
     * @return
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}


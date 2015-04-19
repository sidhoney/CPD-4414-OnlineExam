/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.connect.security;

import javax.servlet.http.HttpServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;
import javax.servlet.http.HttpSession;

/**
 *
 * @author C0648301
 */
public class AuthenticateLogin extends HttpServlet {

    String dbtime;
    String dbUrl = "jdbc:mysql://localhost/onlineexamproject";
    String dbClass = "com.mysql.jdbc.Driver";
    String query = "";
    String adminSelectQuery = "";
    int authenticatorFlag = 0;
    int userTypeFlag = 5;
    int DBUserId;
    String DBPass = "";
    String DBUser = "";

    static final int LOGIN_SUCCESS = 1;
    static final int LOGIN_WRONGPASSWORD = 2;
    static final int LOGIN_UNKNOWNUSERNAME = 3;
    static final int ADMIN_USER = 4;
    static final int NORMAL_USER = 5;

    /**
     * authenticatorFlag - used to record various possible states for login
     * authentication process The value set in the authenticatorFlag may depict
     * one of the many possible states for the validation process
     *
     *
     *
     * @param config
     * @throws ServletException
     */
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

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
            out.println("<title>Patience while we check your records</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h3>Please wait</h3>");
            out.println("</body>");
            out.println("</html>");

            String Username = "";
            String Password = "";

            Username = request.getParameter("Username");
            Password = request.getParameter("Password");

            Class.forName("com.mysql.jdbc.Driver");

            Connection con = DriverManager.getConnection(dbUrl, "root", "");
            Statement stmt = con.createStatement();

            query = "select UserId, Username, Password from login_credentials where Username='" + Username + "'";
            ResultSet rs = stmt.executeQuery(query);

            boolean UserAuth = false;
            if (rs.next()) {
                DBUserId = rs.getInt("UserId");
                DBUser = rs.getString("Username");
                DBPass = rs.getString("Password");

                UserAuth = DBUser.contains(Username);//.equals(Username);
            }
            if (UserAuth) {
                authenticatorFlag = LOGIN_WRONGPASSWORD;

                if (DBPass.contains(Password))//&& authenticatorFlag!=LOGIN_UNKNOWNUSERNAME)
                {

                    authenticatorFlag = LOGIN_SUCCESS;

                }
            } else {
                authenticatorFlag = LOGIN_UNKNOWNUSERNAME;
            }
            if ("".equals(Password) || Password == null) {
                authenticatorFlag = LOGIN_WRONGPASSWORD;
            }
            if ("".equals(Username) || Username == null) {
                authenticatorFlag = LOGIN_UNKNOWNUSERNAME;
            }
            con.close();

            Connection con2 = DriverManager.getConnection(dbUrl, "root", "");
            Statement stmt2 = con2.createStatement();
            adminSelectQuery = "select UserId from Administrator_List";// where UserId="+DBUserId;
            ResultSet rs1 = stmt2.executeQuery(adminSelectQuery);
            int userID = 0;

            while (rs1.next()) {
                userID = rs1.getInt("UserId");

                if (userID == DBUserId) {

                    userTypeFlag = ADMIN_USER;
                    break;
                } else {
                    userTypeFlag = NORMAL_USER;
                }
            }

            if (authenticatorFlag == LOGIN_SUCCESS) {

                HttpSession newUserSession = request.getSession(true);

                newUserSession.setMaxInactiveInterval(1800);
                newUserSession.setAttribute("Username", Username);
                newUserSession.setAttribute("UserId", DBUserId);
                if (userTypeFlag == ADMIN_USER) {
                    newUserSession.setAttribute("Privilage", "adminUser");
                } else if (userTypeFlag == NORMAL_USER) {
                    newUserSession.setAttribute("Privilage", "normalUser");
                }
                response.sendRedirect("home.jsp");
            } else if (authenticatorFlag == LOGIN_WRONGPASSWORD) {
                out.println("Please check the password you have entered and try again...<br>");//entered password: "+Password+"<br>DB password: "+DBPass);
                out.println("<br><a href=\"index.html\">Click here to try again</a>");
            } else if (authenticatorFlag == LOGIN_UNKNOWNUSERNAME) {
                out.println("The username you have entered"
                        //+ " "+Username+" >> "+DBUser+" >> "+UserAuth
                        + " does not exist in our database...");

                out.println("<br><a href=\"index.html\">Click here to try again</a> ... OR ... "
                        + "<a href=\"register.jsp\">Click here to register</a>");
            }

        } catch (Exception e) {
            out.println("<br><br><br>It seems we have some error in our login mechanism...<br>Don't worry, we'll get"
                    + "it fixed up pretty soon..."
                    + "<br><br>Here's a bit of technical stuff for debugging : <br><br>");
            e.printStackTrace(out);
        } finally {
            out.close();
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}

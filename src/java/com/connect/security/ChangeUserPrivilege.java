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
import javax.servlet.http.HttpSession;

/**
 *
 * @author C0648301
 */
public class ChangeUserPrivilege extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    String dbUrl = "jdbc:mysql://localhost/onlineexam";
    String dbClass = "com.mysql.jdbc.Driver";
    String query = "";

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
        String UserIdToChange = "";
        String ChangeType = "";
        String AddAdminQuery = "";
        String RemoveAdminQuery = "";

        int output;
        HttpSession UserSession = request.getSession(false);

        try {
            UserIdToChange = request.getParameter("UserToChange");
            ChangeType = request.getParameter("ChangeType");

            Connection con = DriverManager.getConnection(dbUrl, "root", "");
            PreparedStatement userPrivilegeChanger;

            if ("ToAdminUser".equals(ChangeType)) {

                AddAdminQuery = "insert into administrator_list (UserId) values(?)";

                userPrivilegeChanger = con.prepareStatement(AddAdminQuery);
                userPrivilegeChanger.setString(1, UserIdToChange);
                output = userPrivilegeChanger.executeUpdate();
            } else if ("ToNormalUser".equals(ChangeType)) {
                RemoveAdminQuery = "delete from administrator_list where UserId = ?";

                userPrivilegeChanger = con.prepareStatement(RemoveAdminQuery);
                userPrivilegeChanger.setString(1, UserIdToChange);
                output = userPrivilegeChanger.executeUpdate();
            }

            response.sendRedirect("AdminChangeUserPrivileges.jsp");

        } catch (Exception e) {
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
    }
}

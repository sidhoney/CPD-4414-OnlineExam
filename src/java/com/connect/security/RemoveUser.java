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
public class RemoveUser extends HttpServlet{

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
        String userIdToRemove = null;
        HttpSession UserSession = request.getSession(false);
        UserSession.setAttribute("RemoveUserException", null);
        try {
            userIdToRemove = request.getParameter("UserIdToRemoveRadio");

            if ("".equals(userIdToRemove) || userIdToRemove == null) {
                UserSession.setAttribute("RemoveUserException", "Please select a user account to delete");
                response.sendRedirect("AdminRemoveUser.jsp");
            }

            Class.forName(dbClass);
            Connection con = DriverManager.getConnection(dbUrl, "root", "");
            PreparedStatement insertNewQuestion;

            query = ""
                    + "delete from user_information where UserId = ?;"
                    + "delete from login_credentials where UserId = ?;"
                    + "delete from administrator_list where UserId = ?;"
                    + "delete from exam_results where UserId = ?;";

            insertNewQuestion = con.prepareStatement(query);

            insertNewQuestion.setString(1, userIdToRemove);
            insertNewQuestion.setString(2, userIdToRemove);
            insertNewQuestion.setString(3, userIdToRemove);
            insertNewQuestion.setString(4, userIdToRemove);

            int output = insertNewQuestion.executeUpdate();

            response.sendRedirect("AdminRemoveUser.jsp");
        } catch (Exception e) {
            e.printStackTrace(out);
        } finally {
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

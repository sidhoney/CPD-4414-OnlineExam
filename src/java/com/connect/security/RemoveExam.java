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
public class RemoveExam extends HttpServlet {

    String dbUrl = "jdbc:mysql://localhost/onlineexamproject";
    String dbClass = "com.mysql.jdbc.Driver";
    String query = "";
    String query1 = "";

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
        String examIdToRemove = null;
        HttpSession UserSession = request.getSession(false);
        UserSession.setAttribute("RemoveExamException", null);
        try {
            examIdToRemove = request.getParameter("ExamIdToRemoveRadio");

            if ("".equals(examIdToRemove) || examIdToRemove == null) {
                UserSession.setAttribute("RemoveExamException", "Please select an Exam to DELETE");
                response.sendRedirect("AdminRemoveExam.jsp");
            }

            Class.forName(dbClass);
            Connection con = DriverManager.getConnection(dbUrl, "root", "");
            PreparedStatement insertNewQuestion;
            PreparedStatement insertNewQuestion1;
            query = "delete from exam_list where ExamId = ?";
            query1 = "delete from exam_question_bank where ExamId = ?";

            insertNewQuestion = con.prepareStatement(query);
            insertNewQuestion1 = con.prepareStatement(query1);
            insertNewQuestion.setString(1, examIdToRemove);
            insertNewQuestion1.setString(1, examIdToRemove);

            int output = insertNewQuestion.executeUpdate();

            response.sendRedirect("AdminRemoveExam.jsp");
        } catch (Exception e) {
            e.printStackTrace(out);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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

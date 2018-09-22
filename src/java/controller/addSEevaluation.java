/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.SEevaluation;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LA
 */
public class addSEevaluation extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            SEevaluation SEevaluation = new SEevaluation();
            HttpSession session = request.getSession();

            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-mm-dd");
            java.util.Date javaDate = new java.util.Date();
            java.sql.Date sqlDate = new java.sql.Date(javaDate.getTime());

            SEevaluation.setDate(sqlDate);
            SEevaluation.setName(request.getParameter("name"));
            SEevaluation.setDetail(request.getParameter("unit"));
            SEevaluation.setSubjectName(request.getParameter("subject"));
            if (request.getParameter("q1.1") != null) {
                SEevaluation.setSl11(Integer.parseInt(request.getParameter("q1.1")));
            }
            if (request.getParameter("q1.2") != null) {
                SEevaluation.setSl12(Integer.parseInt(request.getParameter("q1.2")));
            }
            if (request.getParameter("q1.3") != null) {
                SEevaluation.setSl13(Integer.parseInt(request.getParameter("q1.3")));
            }
            if (request.getParameter("q1.4") != null) {
                SEevaluation.setSl14(Integer.parseInt(request.getParameter("q1.4")));
            }
            if (request.getParameter("q1.5") != null) {
                SEevaluation.setSl15(Integer.parseInt(request.getParameter("q1.5")));
            }
            if (request.getParameter("q2.1") != null) {
                SEevaluation.setSs21(Integer.parseInt(request.getParameter("q2.1")));
            }
            if (request.getParameter("q2.2") != null) {
                SEevaluation.setSs22(Integer.parseInt(request.getParameter("q2.2")));
            }
            if (request.getParameter("q2.3") != null) {
                SEevaluation.setSs23(Integer.parseInt(request.getParameter("q2.3")));
            }
            if (request.getParameter("q2.4") != null) {
                SEevaluation.setSs24(Integer.parseInt(request.getParameter("q2.4")));
            }
            if (request.getParameter("q2.5") != null) {
                SEevaluation.setSs25(Integer.parseInt(request.getParameter("q2.5")));
            }
            SEevaluation.setPe31(Integer.parseInt(request.getParameter("q3.1")));
            SEevaluation.setPj41(Integer.parseInt(request.getParameter("q4.1")));
            SEevaluation.setSeproposalID(Integer.parseInt(request.getParameter("seID")));

            session.setAttribute("SEevaluation", SEevaluation);
            ServletContext context = getServletContext();
            RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-evaluateSE2.jsp");
            dispatcher.forward(request, response);
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

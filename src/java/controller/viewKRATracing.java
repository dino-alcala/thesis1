/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LA
 */
public class viewKRATracing extends HttpServlet {

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

            if (request.getParameter("first") != null) {
                request.setAttribute("first", 1);
            }

            if (request.getParameter("second") != null) {
                request.setAttribute("second", 2);
            }

            if (request.getParameter("third") != null) {
                request.setAttribute("third", 3);
            }
            if (request.getParameter("fourth") != null) {
                request.setAttribute("fourth", 4);
            }

            if (request.getParameter("fifth") != null) {
                request.setAttribute("fifth", 5);
            }

            if (request.getParameter("sixth") != null) {
                request.setAttribute("sixth", 6);
            }

            if (request.getParameter("seventh") != null) {
                request.setAttribute("seventh", 7);
            }

            if (request.getParameter("ninth") != null) {
                request.setAttribute("ninth", 9);
            }

            if (request.getParameter("tenth") != null) {
                request.setAttribute("tenth", 10);
            }

            if (request.getParameter("eleventh") != null) {
                request.setAttribute("eleventh", 11);
            }

            if (request.getParameter("twelfth") != null) {
                request.setAttribute("twelfth", 12);
            }

            if (request.getParameter("thirteenth") != null) {
                request.setAttribute("thirteenth", 13);
            }

            if (request.getParameter("sixteenth") != null) {
                request.setAttribute("sixteenth", 16);
            }
            ServletContext context = getServletContext();
            RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-viewKRATracing.jsp");
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

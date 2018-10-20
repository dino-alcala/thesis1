/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.FF;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class viewFF2 extends HttpServlet {

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

            UserDAO UserDAO = new UserDAO();
            HttpSession session = request.getSession();
            ArrayList<FF> proposals = new ArrayList();

            if (session.getAttribute("position").toString().equals("LSPO - Director")) {
                proposals = UserDAO.retrieveFFProposalByStep(4);
            }

            int userID = Integer.parseInt(session.getAttribute("userID").toString());

            if (session.getAttribute("position").equals("OVPLM - Vice President for Lasallian Mission") || session.getAttribute("position").equals("DSA - Dean") || session.getAttribute("position").equals("LCLM - Executive Director") || session.getAttribute("position").equals("COSCA - Director")) {
                proposals = UserDAO.retrieveFFProposalByStep(5);
            }

            for (int i = 0; i < proposals.size(); i++) {
                if (request.getParameter("viewFF" + i) != null) {
                    request.setAttribute("ffID", request.getParameter("viewFF" + i));
                }
            }

            if (session.getAttribute("position").toString().equals("LSPO - Director")) {
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-approveFFProposal3.jsp");
                dispatcher.forward(request, response);
            }

            if (session.getAttribute("position").equals("OVPLM - Vice President for Lasallian Mission") || session.getAttribute("position").equals("DSA - Dean") || session.getAttribute("position").equals("LCLM - Executive Director") || session.getAttribute("position").equals("COSCA - Director")) {
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-approveFFProposal4.jsp");
                dispatcher.forward(request, response);
            }
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

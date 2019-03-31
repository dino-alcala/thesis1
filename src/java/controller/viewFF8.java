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
 * @author Dino Alcala
 */
public class viewFF8 extends HttpServlet {

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
            UserDAO UserDAO = new UserDAO();
            HttpSession session = request.getSession();
            ArrayList<FF> my = new ArrayList();

            my = UserDAO.retrieveFFProposalByApprovedOwner(Integer.parseInt(session.getAttribute("userID").toString()));

            for (int i = 0; i < my.size(); i++) {
                if (request.getParameter("viewMy" + i) != null) {
                    request.setAttribute("ffID", request.getParameter("viewMy" + i));

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-viewFFProgramDetails.jsp");
                    dispatcher.forward(request, response);
                }
            }

            ArrayList<FF> others = new ArrayList();
            others = UserDAO.retrieveFFProposalByApproved(Integer.parseInt(session.getAttribute("userID").toString()));

            for (int i = 0; i < others.size(); i++) {
                if (request.getParameter("viewCompleted" + i) != null) {
                    request.setAttribute("ffID", request.getParameter("viewCompleted" + i));
                    
                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-viewFFProgramDetails.jsp");
                    dispatcher.forward(request, response);
                }
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

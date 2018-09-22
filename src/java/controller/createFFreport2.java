/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.FFparticipants;
import entity.FFreport;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
public class createFFreport2 extends HttpServlet {

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
            HttpSession session = request.getSession();
            
            FFreport FFreport = new FFreport();
            
            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-mm-dd");
            java.util.Date javaDate = new java.util.Date();
            java.sql.Date sqlDate = new java.sql.Date(javaDate.getTime());
            
            FFreport.setProjectTitle(request.getParameter("name"));
            FFreport.setDate(sqlDate);
            FFreport.setTargetKRA(request.getParameter("kra"));
            FFreport.setTargetGoal(request.getParameter("goal"));
            FFreport.setTargetMeasure(request.getParameter("measure"));
            FFreport.setProjectProponent(request.getParameter("proponents"));
            FFreport.setPersonResponsible(request.getParameter("responsible"));
            FFreport.setNameOfFacilitator(request.getParameter("facilitator"));
            
            ArrayList<FFparticipants> participants = new ArrayList();

            for (int i = 0; i < Integer.parseInt(request.getParameter("countparticipants")); i++) {
                FFparticipants p = new FFparticipants();
                p.setClassification(request.getParameter("classification" + i));
                p.setNumberOfIndividuals(Integer.parseInt(request.getParameter("number" + i)));
                participants.add(p);
            }
            FFreport.setParticipants(participants);
            FFreport.setAmountReceivedOVPLM(Double.parseDouble(request.getParameter("source")));
            FFreport.setFfproposalID(Integer.parseInt(request.getParameter("ffID")));
            
            session.setAttribute("FFreport", FFreport);
            request.setAttribute("ffID", request.getParameter("ffID"));
            ServletContext context = getServletContext();
            RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-createFFReport2.jsp");
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

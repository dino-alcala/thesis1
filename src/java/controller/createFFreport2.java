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
import java.sql.Date;
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
            FFreport.setProjectProponent(request.getParameter("proponents"));
            FFreport.setPersonResponsible(request.getParameter("responsible"));
            FFreport.setNameOfFacilitator(request.getParameter("facilitator"));
            FFreport.setCap(Integer.parseInt(request.getParameter("number0")));
            FFreport.setApsp(Integer.parseInt(request.getParameter("number1")));
            FFreport.setAsf(Integer.parseInt(request.getParameter("number2")));
            FFreport.setFaculty(Integer.parseInt(request.getParameter("number3")));
            FFreport.setAdmin(Integer.parseInt(request.getParameter("number4")));
            FFreport.setDirecthired(Integer.parseInt(request.getParameter("number5")));
            FFreport.setIndependent(Integer.parseInt(request.getParameter("number6")));
            FFreport.setExternal(Integer.parseInt(request.getParameter("number7")));
            FFreport.setAmountReceivedOVPLM(Double.parseDouble(request.getParameter("source")));
            FFreport.setFfproposalID(Integer.parseInt(request.getParameter("ffID")));
            FFreport.setImplementationdate(Date.valueOf(request.getParameter("implementationdate")));
            FFreport.setVenue(request.getParameter("venue"));
            
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

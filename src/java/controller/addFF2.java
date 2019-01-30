/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.FF;
import entity.FFattendees;
import entity.Notification;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class addFF2 extends HttpServlet {

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
            FF FF;
            UserDAO UserDAO = new UserDAO();

            FF = (FF) session.getAttribute("FF");

            ArrayList<FFattendees> attendees = new ArrayList();

            for (int i = 0; i < Integer.parseInt(request.getParameter("countattendees")); i++) {
                FFattendees FFattendees = new FFattendees();
                FFattendees.setName(request.getParameter("attendee" + i));
                FFattendees.setEmail(request.getParameter("email" + i));
                attendees.add(FFattendees);
            }

            FF.setAttendees(attendees);
            FF.setUnittype(UserDAO.getUnitTypeByName(session.getAttribute("unit").toString()));
            FF.setStep(1);

            UserDAO.AddFF(FF);

            Notification n = new Notification();
            n.setTitle(FF.getProjectName());

            SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-mm-dd");
            java.util.Date javaDate = new java.util.Date();
            String input1 = new java.sql.Date(javaDate.getTime()).toString();
            String input2 = FF.getActualDate().toString();
            
            java.util.Date dt = new java.util.Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
            java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            try {
                java.util.Date date1 = myFormat.parse(input1);
                java.util.Date date2 = myFormat.parse(input2);
                long diff = date2.getTime() - date1.getTime();
                long days = (diff / (1000 * 60 * 60 * 24));

                if (days <= 14) {
                    n.setBody("URGENT FF Proposal ready for approval! \n " + sdf.format(dt));
                } else if (days >= 15) {
                    n.setBody("New FF Proposal ready for approval! \n " + sdf.format(dt));
                }
            } catch (ParseException ex) {
                Logger.getLogger(addSE2.class.getName()).log(Level.SEVERE, null, ex);
            }

            n.setDt(sdf2.format(dt));
            n.setUserID(UserDAO.getUserIDforNotifsAssistantDean(FF.getUnit()));

            UserDAO.AddNotification(n);

            if (session.getAttribute("unit").toString().equals("Office of the Vice President for Lasallian Mission (OVPLM)")) {

                request.setAttribute("successFF", "You have successfully submitted your FF Proposal!");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/OVPLM-home.jsp");
                dispatcher.forward(request, response);
            } else if (session.getAttribute("unit").equals("Center for Social Concern and Action (COSCA)")) {

                request.setAttribute("successFF", "You have successfully submitted your FF Proposal!");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/COSCA-home.jsp");
                dispatcher.forward(request, response);

            } else if (session.getAttribute("position").equals("Lasallian Pastoral Office (LSPO)")) {

                request.setAttribute("successFF", "You have successfully submitted your FF Proposal!");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/LSPO-home.jsp");
                dispatcher.forward(request, response);

            } else if (session.getAttribute("position").equals("Dean of Student Affairs (DSA)")) {

                request.setAttribute("successFF", "You have successfully submitted your FF Proposal!");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/DSA-home.jsp");
                dispatcher.forward(request, response);

            } else if (session.getAttribute("position").equals("Laguna Campus Lasallian Mission (LCLM)")) {

                request.setAttribute("successFF", "You have successfully submitted your FF Proposal!");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/LCLM-home.jsp");
                dispatcher.forward(request, response);

            } else if (session.getAttribute("position").toString().contains("ADEALM")) {

                request.setAttribute("successFF", "You have successfully submitted your FF Proposal!");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/ADEALM-home.jsp");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("successFF", "You have successfully submitted your FF Proposal!");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/UR-home.jsp");
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

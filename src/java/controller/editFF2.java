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
import entity.SE;
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
public class editFF2 extends HttpServlet {

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

            UserDAO.auditFF(FF.getId());

            UserDAO.EditFF(FF);

            UserDAO.completeReviseFF(FF.getId());
            
            java.util.Date dt = new java.util.Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
            java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            Notification n = new Notification();
            n.setTitle(FF.getProjectName());
            n.setBody("You have a Revised FF Proposal ready for approval! \n " + sdf.format(dt));
            n.setDt(sdf2.format(dt));

            if (UserDAO.getStepFF(Integer.parseInt(request.getParameter("ffID"))) == 1 || UserDAO.getStepFF(Integer.parseInt(request.getParameter("ffID"))) == 2 || UserDAO.getStepFF(Integer.parseInt(request.getParameter("ffID"))) == 3 || UserDAO.getStepFF(Integer.parseInt(request.getParameter("ffID"))) == 4) {
                n.setUserID(UserDAO.getUserIDforNotifsAssistantDean(session.getAttribute("unit").toString()));
            }

            UserDAO.AddNotification(n);

            request.setAttribute("reviseFF1", "You have successfully revised the FF!");
            ServletContext context = getServletContext();
            RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-pendingFFList.jsp");
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

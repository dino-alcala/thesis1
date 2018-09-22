/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.Notification;
import java.io.IOException;
import java.io.PrintWriter;
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
public class approveFF extends HttpServlet {

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

            UserDAO UserDAO = new UserDAO();

            if (request.getParameter("viewAttendees") != null) {
                request.setAttribute("ffID", request.getParameter("viewAttendees"));

                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/SIGNATORIES-approveFFViewAttendeesList.jsp");
                dispatcher.forward(request, response);
            }

            if (request.getParameter("approve") != null) {

                if (session.getAttribute("unit").toString().equals("Chairperson / Director")) {
                    UserDAO.updateStepFF(2, Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updateChairDirectorRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                }

                if (session.getAttribute("unit").toString().equals("Vice President for Lasallian Mission")) {
                    UserDAO.updateStepFF(3, Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updateVPLMRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                }

                if (session.getAttribute("unit").toString().equals("Dean / Unit Head")) {
                    UserDAO.updateStepFF(4, Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updateDeanunitRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                }

                if (session.getAttribute("unit").toString().equals("Assistant Dean for Lasallian Mission / Assistant Unit Head")) {
                    UserDAO.updateStepFF(5, Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updateAssistantdeanRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                }

                Notification n = new Notification();
                n.setTitle(UserDAO.getProjectName(Integer.parseInt(request.getParameter("approve"))));
                n.setBody("You have new FF Proposal ready for approval!");

                java.util.Date dt = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                n.setDt(sdf.format(dt));

                if (session.getAttribute("unit").toString().equals("Chairperson / Director")) {
                    n.setUserID(29);
                }

                if (session.getAttribute("unit").toString().equals("Vice President for Lasallian Mission")) {
                    n.setUserID(30);
                }

                if (session.getAttribute("unit").toString().equals("Dean / Unit Head")) {
                    n.setUserID(31);
                }

                if (session.getAttribute("unit").toString().equals("Assistant Dean for Lasallian Mission / Assistant Unit Head")) {
                    n.setUserID(32);
                }

                UserDAO.AddNotification(n);

                Notification n2 = new Notification();
                n2.setTitle(UserDAO.getProjectName(Integer.parseInt(request.getParameter("approve"))));

                if (session.getAttribute("unit").toString().equals("Chairperson / Director")) {
                    n2.setBody("Your proposal has been approved by the Chairperson / Director! It will now be taken to the Vice President for Lasallian Mission.");
                }

                if (session.getAttribute("unit").toString().equals("Vice President for Lasallian Mission")) {
                    n2.setBody("Your proposal has been approved by the Vice President for Lasallian Mission! It will now be taken to the Dean / Unit Head.");
                }

                if (session.getAttribute("unit").toString().equals("Dean / Unit Head")) {
                    n2.setBody("Your proposal has been approved by the Dean / Unit Head! It will now be taken to the Assistant Dean for Lasallian Mission / Assistant Unit Head.");
                }

                if (session.getAttribute("unit").toString().equals("Assistant Dean for Lasallian Mission / Assistant Unit Head")) {
                    n2.setBody("Your proposal has been approved by the Assistant Dean for Lasallian Mission / Assistant Unit Head! It will now be taken to the LSPO.");
                }

                n2.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("approve"))));
                n2.setDt(sdf.format(dt));

                UserDAO.AddNotification(n2);

                request.setAttribute("successFF1", "You have successfully approved the FF Proposal!");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/SIGNATORIES-home2.jsp");
                dispatcher.forward(request, response);

            }
            if (request.getParameter("revise") != null) {

                Notification n3 = new Notification();
                n3.setTitle(UserDAO.getProjectName(Integer.parseInt(request.getParameter("revise"))));
                if (session.getAttribute("unit").toString().equals("Chairperson / Director")) {
                    UserDAO.reviseFF(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.updateChairDirectorRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("revise")));
                    n3.setBody("Your proposal has some revisions before it is approved by the Chairperson / Director.");

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("revise"))));
                }

                if (session.getAttribute("unit").toString().equals("Vice President for Lasallian Mission")) {
                    UserDAO.reviseFF(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.updateVPLMRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("revise")));
                    n3.setBody("Your proposal has some revisions before it is approved by the Vice President for Lasallian Mission.");

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("revise"))));
                }

                if (session.getAttribute("unit").toString().equals("Dean / Unit Head")) {
                    UserDAO.reviseFF(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.updateDeanunitRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("revise")));
                    n3.setBody("Your proposal has some revisions before it is approved by the Dean / Unit Head.");

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("revise"))));
                }

                if (session.getAttribute("unit").toString().equals("Assistant Dean for Lasallian Mission / Assistant Unit Head")) {
                    UserDAO.reviseFF(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.updateAssistantdeanRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("revise")));
                    n3.setBody("Your proposal has some revisions before it is approved by the Assistant Dean for Lasallian Mission / Assistant Unit Head.");

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("revise"))));
                }

                UserDAO.AddNotification(n3);

                request.setAttribute("reviseFF1", "Revisions has been sent to the requesting unit.");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/SIGNATORIES-home2.jsp");
                dispatcher.forward(request, response);

            }

            if (request.getParameter("reject") != null) {
                Notification n3 = new Notification();
                n3.setTitle(UserDAO.getProjectName(Integer.parseInt(request.getParameter("reject"))));

                if (session.getAttribute("unit").toString().equals("Chairperson / Director")) {
                    UserDAO.updateChairDirectorRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                    n3.setBody("Your proposal has been rejected by the Chairperson / Director. Reason: " + request.getParameter("remarks1"));

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("reject"))));
                }

                if (session.getAttribute("unit").toString().equals("Vice President for Lasallian Mission")) {
                    UserDAO.updateVPLMRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                    n3.setBody("Your proposal has been rejected by the Vice President for Lasallian Mission. Reason: " + request.getParameter("remarks1"));

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("reject"))));
                }

                if (session.getAttribute("unit").toString().equals("Dean / Unit Head")) {
                    UserDAO.updateDeanunitRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                    n3.setBody("Your proposal has been rejected by the Dean / Unit Head. Reason: " + request.getParameter("remarks1"));

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("reject"))));
                }

                if (session.getAttribute("unit").toString().equals("Assistant Dean for Lasallian Mission / Assistant Unit Head")) {
                    UserDAO.updateAssistantdeanRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                    n3.setBody("Your proposal has been rejected by the Assistant Dean for Lasallian Mission / Assistant Unit Head. Reason: " + request.getParameter("remarks1"));

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("reject"))));
                }

                UserDAO.rejectFF(Integer.parseInt(request.getParameter("reject")));
                UserDAO.AddNotification(n3);

                request.setAttribute("rejectFF1", "You have rejected the proposal.");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/SIGNATORIES-home2.jsp");
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

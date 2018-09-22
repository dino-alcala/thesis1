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
public class approveSE extends HttpServlet {

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

            if (request.getParameter("checklist") != null) {
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-approveSEProposalChecklist.jsp");
                dispatcher.forward(request, response);
            }
            if (request.getParameter("approve") != null) {

                if (session.getAttribute("unit").toString().equals("Department / Unit Chair")) {

                    UserDAO.updateStep(2, Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updateDeptUnitRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                }

                if (session.getAttribute("unit").toString().equals("External Affairs / Social Engagement Director")) {
                    UserDAO.updateStep(3, Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updateExternalRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                }

                if (session.getAttribute("unit").toString().equals("Dean / VP / VC")) {
                    UserDAO.updateStep(4, Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updateDeanRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                }

                Notification n = new Notification();
                n.setTitle(UserDAO.getProgramName(Integer.parseInt(request.getParameter("approve"))));
                n.setBody("You have new SE Proposal ready for approval!");

                java.util.Date dt = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                n.setDt(sdf.format(dt));

                if (session.getAttribute("unit").toString().equals("Department / Unit Chair")) {
                    n.setUserID(14);
                }

                if (session.getAttribute("unit").toString().equals("External Affairs / Social Engagement Director")) {
                    n.setUserID(15);
                }

                if (session.getAttribute("unit").toString().equals("Dean / VP / VC")) {
                    n.setUserID(18);
                }

                UserDAO.AddNotification(n);

                Notification n2 = new Notification();
                n2.setTitle(UserDAO.getProgramName(Integer.parseInt(request.getParameter("approve"))));

                if (session.getAttribute("unit").toString().equals("Department / Unit Chair")) {
                    n2.setBody("Your proposal has been approved by the Department / Unit Chair! It will now be taken to the External Affairs / SE Director.");
                }

                if (session.getAttribute("unit").toString().equals("External Affairs / Social Engagement Director")) {
                    n2.setBody("Your proposal has been approved by the External Affairs / SE Director! It will now be taken to the Dean / VP / VC.");
                }

                if (session.getAttribute("unit").toString().equals("Dean / VP / VC")) {
                    n2.setBody("Your proposal has been approved by the Dean / VP / VC! It will now be taken to the COSCA.");

                    Notification n3 = new Notification();
                    n3.setTitle(UserDAO.getProgramName(Integer.parseInt(request.getParameter("approve"))));
                    n3.setBody("A proposal has been received by COSCA.");
                    n3.setDt(sdf.format(dt));
                    n3.setUserID(17);

                    UserDAO.AddNotification(n3);
                }

                n2.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("approve"))));
                n2.setDt(sdf.format(dt));

                UserDAO.AddNotification(n2);

                request.setAttribute("successSE1", "You have successfully approved the SE Proposal!");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/SIGNATORIES-home.jsp");
                dispatcher.forward(request, response);

            }

            if (request.getParameter("revise") != null) {

                Notification n3 = new Notification();
                n3.setTitle(UserDAO.getProgramName(Integer.parseInt(request.getParameter("revise"))));
                if (session.getAttribute("unit").toString().equals("Department / Unit Chair")) {
                    UserDAO.reviseSE(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.updateDeptUnitRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("revise")));
                    n3.setBody("Your proposal has some revisions before it is approved by the Department / Unit Chair.");

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("revise"))));
                }

                if (session.getAttribute("unit").toString().equals("External Affairs / Social Engagement Director")) {
                    UserDAO.reviseSE(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.updateExternalRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("revise")));
                    n3.setBody("Your proposal has some revisions before it is approved by the External Affairs / Social Engagement Director.");

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("revise"))));
                }

                if (session.getAttribute("unit").toString().equals("Dean / VP / VC")) {
                    UserDAO.reviseSE(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.updateDeanRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("revise")));
                    n3.setBody("Your proposal has some revisions before it is approved by the Dean / VP / VC.");

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("revise"))));
                }

                UserDAO.AddNotification(n3);

                request.setAttribute("reviseSE1", "Revisions has been sent to the requesting unit.");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/SIGNATORIES-home.jsp");
                dispatcher.forward(request, response);
            }

            if (request.getParameter("reject") != null) {
                Notification n3 = new Notification();
                n3.setTitle(UserDAO.getProgramName(Integer.parseInt(request.getParameter("reject"))));

                if (session.getAttribute("unit").toString().equals("Department / Unit Chair")) {
                    UserDAO.updateDeptUnitRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                    n3.setBody("Your proposal has been rejected by the Department / Unit Chair. Reason: " + request.getParameter("remarks1"));

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("reject"))));
                }

                if (session.getAttribute("unit").toString().equals("External Affairs / Social Engagement Director")) {
                    UserDAO.updateExternalRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                    n3.setBody("Your proposal has been rejected by the External Affairs / Social Engagement Director. Reason: " + request.getParameter("remarks1"));

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("reject"))));
                }

                if (session.getAttribute("unit").toString().equals("Dean / VP / VC")) {
                    UserDAO.updateDeanRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                    n3.setBody("Your proposal has been rejected by the Dean / VP / VC. Reason: " + request.getParameter("remarks1"));

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("reject"))));
                }

                UserDAO.rejectSE(Integer.parseInt(request.getParameter("reject")));
                UserDAO.AddNotification(n3);

                request.setAttribute("rejectSE1", "You have rejected the proposal.");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/SIGNATORIES-home.jsp");
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

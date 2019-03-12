/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.FF;
import entity.Notification;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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

            if (request.getParameter("auditFF") != null) {

                session.setAttribute("auditFF", request.getParameter("auditFF"));
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-auditTrailFF.jsp");
                dispatcher.forward(request, response);
            }

            if (request.getParameter("viewAttendees") != null) {
                request.setAttribute("ffID", request.getParameter("viewAttendees"));

                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/SIGNATORIES-approveFFViewAttendeesList.jsp");
                dispatcher.forward(request, response);
            }

            if (request.getParameter("approve") != null) {

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("ADLM")) {
                    UserDAO.updateStepFF(2, Integer.parseInt(request.getParameter("approve")));
                    UserDAO.approveADLM(Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updateADLMRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Chairperson")) {
                    UserDAO.updateStepFF(3, Integer.parseInt(request.getParameter("approve")));
                    UserDAO.approveChairperson(Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updateChairpersonRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Unit Head")) {
                    UserDAO.updateStepFF(3, Integer.parseInt(request.getParameter("approve")));
                    UserDAO.approveUnitHead(Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updateUnitHeadRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Dean")) {
                    UserDAO.updateStepFF(4, Integer.parseInt(request.getParameter("approve")));
                    UserDAO.approveFFDean(Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updateFFDeanRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Director")) {
                    UserDAO.updateStepFF(4, Integer.parseInt(request.getParameter("approve")));
                    UserDAO.approveDirector(Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updateDirectorRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                }
                
                FF FF = UserDAO.retrieveFFByFFID(Integer.parseInt(request.getParameter("approve")));
                
                java.util.Date dt = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
                java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                
                Notification n = new Notification();
                n.setBody("Program: " + UserDAO.getProjectName(Integer.parseInt(request.getParameter("approve"))) + "\n"  + sdf.format(dt));

                SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-mm-dd");
                java.util.Date javaDate = new java.util.Date();
                String input1 = new java.sql.Date(javaDate.getTime()).toString();
                String input2 = FF.getActualDate().toString();

                try {
                    java.util.Date date1 = myFormat.parse(input1);
                    java.util.Date date2 = myFormat.parse(input2);
                    long diff = date2.getTime() - date1.getTime();
                    long days = (diff / (1000 * 60 * 60 * 24));

                    if (days <= 14) {
                        n.setTitle("Urgent FF Proposal ready for Approval");
                    } else if (days >= 15) {
                        n.setTitle("FF Proposal ready for Approval");
                    }
                } catch (ParseException ex) {
                    Logger.getLogger(addSE2.class.getName()).log(Level.SEVERE, null, ex);
                }

                n.setDt(sdf2.format(dt));

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("ADLM")) {
                    if (UserDAO.getUnitTypeByName(session.getAttribute("unit").toString()).equals("Academic")) {
                        n.setUserID(UserDAO.getUserIDforNotifsChairperson(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString())), UserDAO.getDepartmentIDByName(UserDAO.getDepartmentByffID(Integer.parseInt(request.getParameter("approve"))))));
                        n.setRedirect("/SIGNATORIES-approveFFProposal2.jsp");
                        n.setAttribute(FF.getId());
                    } else if (UserDAO.getUnitTypeByName(session.getAttribute("unit").toString()).equals("Non-Academic")) {
                        n.setUserID(UserDAO.getUserIDforNotifsUnitHead(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))));
                        n.setRedirect("/SIGNATORIES-approveFFProposal2.jsp");
                        n.setAttribute(FF.getId());
                    }

                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Chairperson")) {
                    n.setUserID(UserDAO.getUserIDforNotifsDean(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))));
                    n.setRedirect("/SIGNATORIES-approveFFProposal3.jsp");
                    n.setAttribute(FF.getId());
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Unit Head")) {
                    n.setUserID(UserDAO.getUserIDforNotifsDirector(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))));
                    n.setRedirect("/SIGNATORIES-approveFFProposal3.jsp");
                    n.setAttribute(FF.getId());
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Dean")) {
                    n.setUserID(UserDAO.getUserIDforNotifsJames());
                    n.setRedirect("/MULTIPLE-approveFFProposal3.jsp");
                    n.setAttribute(FF.getId());
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Director")) {
                    n.setUserID(UserDAO.getUserIDforNotifsJames());
                    n.setRedirect("/MULTIPLE-approveFFProposal3.jsp");
                    n.setAttribute(FF.getId());
                }

                UserDAO.AddNotification(n);

                Notification n2 = new Notification();
                n2.setTitle(UserDAO.getProjectName(Integer.parseInt(request.getParameter("approve"))));

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("ADLM")) {
                    n2.setBody("Your proposal has been approved by the Assistant Dean for Lasallian Mission! It will now be taken to the Chairperson of the Department." + "\n"  + sdf.format(dt));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Chairperson")) {
                    n2.setBody("Your proposal has been approved by the Chairperson of the Department! It will now be taken to the Dean." + "\n"  + sdf.format(dt));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Unit Head")) {
                    n2.setBody("Your proposal has been approved by the Unit Head! It will now be taken to the Director." + "\n"  + sdf.format(dt));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Dean")) {
                    n2.setBody("Your proposal has been approved by the Dean! It will now be taken to Sir James." + "\n"  + sdf.format(dt));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Director")) {
                    n2.setBody("Your proposal has been approved by the Dean! It will now be taken to the LSPO." + "\n"  + sdf.format(dt));
                }

                n2.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("approve"))));
                n2.setDt(sdf2.format(dt));
                n2.setRedirect("/MULTIPLE-viewPendingFFProgramDetails.jsp");
                n2.setAttribute(FF.getId());

                UserDAO.AddNotification(n2);

                request.setAttribute("successFF1", "You have successfully approved the FF Proposal!");

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Dean")) {
                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/SIGNATORIES-home.jsp");
                    dispatcher.forward(request, response);
                }

                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/SIGNATORIES-home2.jsp");
                dispatcher.forward(request, response);

            }
            if (request.getParameter("revise") != null) {
                FF FF = UserDAO.retrieveFFByFFID(Integer.parseInt(request.getParameter("revise")));
                java.util.Date dt = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
                java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                Notification n3 = new Notification();
                n3.setTitle(UserDAO.getProjectName(Integer.parseInt(request.getParameter("revise"))));
                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("ADLM")) {
                    UserDAO.reviseFF(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.reviseADLM(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.updateADLMRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("revise")));
                    n3.setBody("Your proposal has some revisions before it is approved by the Assistant Dean for Lasallian Mission." + "\n"  + sdf.format(dt));
                    n3.setDt(sdf2.format(dt));
                    n3.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("revise"))));
                    n3.setRedirect("/MULTIPLE-viewPendingFFProgramDetails.jsp");
                    n3.setAttribute(FF.getId());
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Chairperson")) {
                    UserDAO.reviseFF(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.reviseChairperson(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.updateChairpersonRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("revise")));
                    n3.setBody("Your proposal has some revisions before it is approved by the Chairperson of the Department." + "\n"  + sdf.format(dt));
                    n3.setDt(sdf2.format(dt));
                    n3.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("revise"))));
                    n3.setRedirect("/MULTIPLE-viewPendingFFProgramDetails.jsp");
                    n3.setAttribute(FF.getId());
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Unit Head")) {
                    UserDAO.reviseFF(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.reviseUnitHead(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.updateUnitHeadRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("revise")));
                    n3.setBody("Your proposal has some revisions before it is approved by the Unit Head." + "\n"  + sdf.format(dt));
                    n3.setDt(sdf2.format(dt));
                    n3.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("revise"))));
                    n3.setRedirect("/MULTIPLE-viewPendingFFProgramDetails.jsp");
                    n3.setAttribute(FF.getId());
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Dean")) {
                    UserDAO.reviseFF(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.reviseFFDean(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.updateFFDeanRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("revise")));
                    n3.setBody("Your proposal has some revisions before it is approved by the Dean." + "\n"  + sdf.format(dt));
                    n3.setDt(sdf2.format(dt));
                    n3.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("revise"))));
                    n3.setRedirect("/MULTIPLE-viewPendingFFProgramDetails.jsp");
                    n3.setAttribute(FF.getId());
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Director")) {
                    UserDAO.reviseFF(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.reviseDirector(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.updateDirectorRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("revise")));
                    n3.setBody("Your proposal has some revisions before it is approved by the Director." + "\n"  + sdf.format(dt));
                    n3.setDt(sdf2.format(dt));
                    n3.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("revise"))));
                    n3.setRedirect("/MULTIPLE-viewPendingFFProgramDetails.jsp");
                    n3.setAttribute(FF.getId());
                }

                UserDAO.AddNotification(n3);

                request.setAttribute("reviseFF1", "Revisions has been sent to the requesting unit.");

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Dean")) {
                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/SIGNATORIES-home.jsp");
                    dispatcher.forward(request, response);
                }
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/SIGNATORIES-home2.jsp");
                dispatcher.forward(request, response);

            }

            if (request.getParameter("reject") != null) {
                FF FF = UserDAO.retrieveFFByFFID(Integer.parseInt(request.getParameter("reject")));
                Notification n3 = new Notification();
                n3.setTitle(UserDAO.getProjectName(Integer.parseInt(request.getParameter("reject"))));
                
                java.util.Date dt = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
                java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("ADLM")) {
                    UserDAO.updateADLMRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                    UserDAO.rejectADLM(Integer.parseInt(request.getParameter("reject")));
                    n3.setBody("Your proposal has been rejected by the Assistant Dean for Lasallian Mission. Reason: " + request.getParameter("remarks1") + "\n" + sdf.format(dt));
                    n3.setDt(sdf2.format(dt));
                    n3.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("reject"))));
                    n3.setRedirect("/MULTIPLE-viewFFProgramDetails.jsp");
                    n3.setAttribute(FF.getId());
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Chairperson")) {
                    UserDAO.updateChairpersonRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                    UserDAO.rejectChairperson(Integer.parseInt(request.getParameter("reject")));
                    n3.setBody("Your proposal has been rejected by the Chairperson of the Department. Reason: " + request.getParameter("remarks1") + "\n" + sdf.format(dt));
                    n3.setDt(sdf2.format(dt));
                    n3.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("reject"))));
                    n3.setRedirect("/MULTIPLE-viewFFProgramDetails.jsp");
                    n3.setAttribute(FF.getId());
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Unit Head")) {
                    UserDAO.updateUnitHeadRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                    UserDAO.rejectUnitHead(Integer.parseInt(request.getParameter("reject")));
                    n3.setBody("Your proposal has been rejected by the Unit Head. Reason: " + request.getParameter("remarks1") + "\n" + sdf.format(dt));
                    n3.setDt(sdf2.format(dt));
                    n3.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("reject"))));
                    n3.setRedirect("/MULTIPLE-viewFFProgramDetails.jsp");
                    n3.setAttribute(FF.getId());
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Dean")) {
                    UserDAO.updateFFDeanRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                    UserDAO.rejectFFDean(Integer.parseInt(request.getParameter("reject")));
                    n3.setBody("Your proposal has been rejected by the Dean. Reason: " + request.getParameter("remarks1") + "\n" + sdf.format(dt));
                    n3.setDt(sdf2.format(dt));
                    n3.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("reject"))));
                    n3.setRedirect("/MULTIPLE-viewFFProgramDetails.jsp");
                    n3.setAttribute(FF.getId());
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Director")) {
                    UserDAO.updateDirectorRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                    UserDAO.rejectDirector(Integer.parseInt(request.getParameter("reject")));
                    n3.setBody("Your proposal has been rejected by the Director. Reason: " + request.getParameter("remarks1") + "\n" + sdf.format(dt));
                    n3.setDt(sdf2.format(dt));
                    n3.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("reject"))));
                    n3.setRedirect("/MULTIPLE-viewFFProgramDetails.jsp");
                    n3.setAttribute(FF.getId());
                }

                UserDAO.rejectFF(Integer.parseInt(request.getParameter("reject")));
                UserDAO.AddNotification(n3);

                request.setAttribute("rejectFF1", "You have rejected the proposal.");

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Dean")) {
                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/SIGNATORIES-home.jsp");
                    dispatcher.forward(request, response);
                }

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

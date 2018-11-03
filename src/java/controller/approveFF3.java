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
public class approveFF3 extends HttpServlet {

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

                if (session.getAttribute("position").equals("OVPLM - Vice President for Lasallian Mission")) {
                    UserDAO.voteFFMichael(Integer.parseInt(request.getParameter("approve")), 1);
                    UserDAO.addFFVote(Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updateFFlmc1Remarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                }

                if (session.getAttribute("position").equals("DSA - Dean")) {
                    UserDAO.voteFFNelca(Integer.parseInt(request.getParameter("approve")), 1);
                    UserDAO.addFFVote(Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updateFFlmc2Remarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                }

                if (session.getAttribute("position").equals("LCLM - Executive Director")) {
                    UserDAO.voteFFMargarita(Integer.parseInt(request.getParameter("approve")), 1);
                    UserDAO.addFFVote(Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updateFFlmc3Remarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                }

                if (session.getAttribute("position").equals("COSCA - Director")) {
                    UserDAO.voteFFFritzie(Integer.parseInt(request.getParameter("approve")), 1);
                    UserDAO.addFFVote(Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updateFFlmc5Remarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                }

                Notification n = new Notification();
                n.setTitle(UserDAO.getProjectName(Integer.parseInt(request.getParameter("approve"))));
                n.setBody(UserDAO.getNameByID(Integer.parseInt(session.getAttribute("userID").toString())) + " has voted to APPROVE your proposal. Vote Count: " + UserDAO.getFFVoteCount(Integer.parseInt(request.getParameter("approve"))) + "/4");

                java.util.Date dt = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                n.setDt(sdf.format(dt));

                n.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("approve"))));

                UserDAO.AddNotification(n);

                request.setAttribute("successFF2", "You have successfully voted APPROVE for the FF Proposal!");
            }

            /*
            if (request.getParameter("reject") != null) {

                if (Integer.parseInt(session.getAttribute("userID").toString()) == 19) {
                    UserDAO.voteFFMichael(Integer.parseInt(request.getParameter("reject")), 0);
                    UserDAO.addFFRejectVote(Integer.parseInt(request.getParameter("reject")));
                    UserDAO.updateFFlmc1Remarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                }

                if (Integer.parseInt(session.getAttribute("userID").toString()) == 20) {
                    UserDAO.voteFFNelca(Integer.parseInt(request.getParameter("reject")), 0);
                    UserDAO.addFFRejectVote(Integer.parseInt(request.getParameter("reject")));
                    UserDAO.updateFFlmc2Remarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                }

                if (Integer.parseInt(session.getAttribute("userID").toString()) == 21) {
                    UserDAO.voteFFMargarita(Integer.parseInt(request.getParameter("reject")), 0);
                    UserDAO.addFFRejectVote(Integer.parseInt(request.getParameter("reject")));
                    UserDAO.updateFFlmc3Remarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                }

                if (Integer.parseInt(session.getAttribute("userID").toString()) == 22) {
                    UserDAO.voteFFJames(Integer.parseInt(request.getParameter("reject")), 0);
                    UserDAO.addFFRejectVote(Integer.parseInt(request.getParameter("reject")));
                    UserDAO.updateFFlmc4Remarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                }

                if (Integer.parseInt(session.getAttribute("userID").toString()) == 23) {
                    UserDAO.voteFFFritzie(Integer.parseInt(request.getParameter("reject")), 0);
                    UserDAO.addFFRejectVote(Integer.parseInt(request.getParameter("reject")));
                    UserDAO.updateFFlmc5Remarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                }

                Notification n = new Notification();
                n.setTitle(UserDAO.getProjectName(Integer.parseInt(request.getParameter("reject"))));
                n.setBody(UserDAO.getNameByID(Integer.parseInt(session.getAttribute("userID").toString())) + " has voted to REJECT your proposal. Vote Count: " + UserDAO.getFFRejectVoteCount(Integer.parseInt(request.getParameter("reject"))) + "/5");

                java.util.Date dt = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                n.setDt(sdf.format(dt));

                n.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("reject"))));

                UserDAO.AddNotification(n);

                request.setAttribute("rejectFF1", "You have successfully voted REJECT for the FF Proposal!");
            }
             */
            if (UserDAO.hasFFEveryoneVoted(Integer.parseInt(request.getParameter("ffID")))) {

                if (UserDAO.FFtallyVote(Integer.parseInt(request.getParameter("ffID"))).equals("approve")) {

                    if (UserDAO.isOVPLMSourceFF(Integer.parseInt(request.getParameter("ffID")))) {

                        UserDAO.updateStepFF(6, Integer.parseInt(request.getParameter("ffID")));

                        Notification n2 = new Notification();
                        n2.setTitle(UserDAO.getProjectName(Integer.parseInt(request.getParameter("ffID"))));
                        n2.setBody("Your proposal has been approved by the Council. You may now upload the PRS for endorsement.");

                        java.util.Date dt = new java.util.Date();
                        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                        n2.setDt((sdf.format(dt)));
                        n2.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("ffID"))));
                        UserDAO.AddNotification(n2);
                    } else {
                        UserDAO.updateStepFF(8, Integer.parseInt(request.getParameter("ffID")));

                        Notification n2 = new Notification();
                        n2.setTitle(UserDAO.getProjectName(Integer.parseInt(request.getParameter("ffID"))));
                        n2.setBody("Congratulations! Your FF Proposal has been approved!");

                        java.util.Date dt = new java.util.Date();
                        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                        n2.setDt((sdf.format(dt)));
                        n2.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("ffID"))));
                        UserDAO.AddNotification(n2);
                    }
                }

                /*
                if (UserDAO.FFtallyVote(Integer.parseInt(request.getParameter("ffID"))).equals("reject")) {
                    UserDAO.rejectFF(Integer.parseInt(request.getParameter("ffID")));

                    Notification n2 = new Notification();
                    n2.setTitle(UserDAO.getProjectName(Integer.parseInt(request.getParameter("ffID"))));
                    n2.setBody("Sorry! Your proposal has been rejected by the Council.");

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    n2.setDt((sdf.format(dt)));
                    n2.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("ffID"))));
                    UserDAO.AddNotification(n2);
                }
                 */
            }

            ServletContext context = getServletContext();
            RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-ffProgramsForApproval.jsp");
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

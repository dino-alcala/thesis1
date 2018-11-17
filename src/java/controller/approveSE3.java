/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.Notification;
import entity.SE;
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
public class approveSE3 extends HttpServlet {

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

            if (request.getParameter("auditSE") != null) {

                session.setAttribute("auditSE", request.getParameter("auditSE"));
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-auditTrailSE.jsp");
                dispatcher.forward(request, response);
            }
            
            if (request.getParameter("approve") != null) {

                if (session.getAttribute("position").toString().equals("OVPLM - Vice President for Lasallian Mission")) {
                    UserDAO.voteMichael(Integer.parseInt(request.getParameter("approve")), 1);
                    UserDAO.addVote(Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updatelmc1Remarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                }

                if (session.getAttribute("position").toString().equals("DSA - Dean")) {
                    UserDAO.voteNelca(Integer.parseInt(request.getParameter("approve")), 1);
                    UserDAO.addVote(Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updatelmc2Remarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                }

                if (session.getAttribute("position").toString().equals("LCLM - Executive Director")) {
                    UserDAO.voteMargarita(Integer.parseInt(request.getParameter("approve")), 1);
                    UserDAO.addVote(Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updatelmc3Remarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                }

                if (session.getAttribute("position").toString().equals("LSPO - Director")) {
                    UserDAO.voteJames(Integer.parseInt(request.getParameter("approve")), 1);
                    UserDAO.addVote(Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updatelmc4Remarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                }

                if (session.getAttribute("position").toString().equals("COSCA - Director")) {
                    UserDAO.voteFritzie(Integer.parseInt(request.getParameter("approve")), 1);
                    UserDAO.addVote(Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updatelmc5Remarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                }

                Notification n = new Notification();
                n.setTitle(UserDAO.getProgramName(Integer.parseInt(request.getParameter("approve"))));
                n.setBody(UserDAO.getNameByID(Integer.parseInt(session.getAttribute("userID").toString())) + " has voted to APPROVE your proposal. Vote Count: " + UserDAO.getVoteCount(Integer.parseInt(request.getParameter("approve"))) + "/5");

                java.util.Date dt = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                n.setDt(sdf.format(dt));

                n.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("approve"))));

                UserDAO.AddNotification(n);

                request.setAttribute("successSE2", "You have successfully voted APPROVE for the SE Proposal!");
            }

            if (UserDAO.hasEveryoneVoted(Integer.parseInt(request.getParameter("seID")))) {

                if (UserDAO.tallyVote(Integer.parseInt(request.getParameter("seID"))).equals("approve")) {

                    if (UserDAO.isOVPLMSource(Integer.parseInt(request.getParameter("seID")))) {

                        UserDAO.updateStep(6, Integer.parseInt(request.getParameter("seID")));

                        Notification n2 = new Notification();
                        n2.setTitle(UserDAO.getProgramName(Integer.parseInt(request.getParameter("seID"))));
                        n2.setBody("Your proposal has been approved by the Council. You may now upload the PRS for endorsement.");
                        
                        SE SE = UserDAO.retrieveSEBySEID(Integer.parseInt(request.getParameter("approve")));
                        SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-mm-dd");
                        java.util.Date javaDate = new java.util.Date();
                        String input1 = new java.sql.Date(javaDate.getTime()).toString();
                        String input2 = SE.getActualDate().toString();

                        try {
                            java.util.Date date1 = myFormat.parse(input1);
                            java.util.Date date2 = myFormat.parse(input2);
                            long diff = date2.getTime() - date1.getTime();
                            long days = (diff / (1000*60*60*24));

                            if(days <= 14){
                                n2.setBody("Your URGENT proposal has been approved by the Council. You may now upload the PRS for endorsement!");
                            } else if (days >= 15){
                                n2.setBody("Your proposal has been approved by the Council. You may now upload the PRS for endorsement.");
                            }
                        } catch (ParseException ex) {
                            Logger.getLogger(addSE2.class.getName()).log(Level.SEVERE, null, ex);
                        }

                        java.util.Date dt = new java.util.Date();
                        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                        n2.setDt((sdf.format(dt)));
                        n2.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("seID"))));
                        UserDAO.AddNotification(n2);
                    } else {

                        UserDAO.updateStep(8, Integer.parseInt(request.getParameter("seID")));

                        Notification n2 = new Notification();
                        n2.setTitle(UserDAO.getProgramName(Integer.parseInt(request.getParameter("seID"))));
                        n2.setBody("Congratulations! Your SE Proposal has been approved!");

                        java.util.Date dt = new java.util.Date();
                        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                        n2.setDt((sdf.format(dt)));
                        n2.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("seID"))));
                        UserDAO.AddNotification(n2);
                    }
                }

                if (UserDAO.tallyVote(Integer.parseInt(request.getParameter("seID"))).equals("revise")) {
                    UserDAO.reviseSE(Integer.parseInt(request.getParameter("seID")));

                    Notification n2 = new Notification();
                    n2.setTitle(UserDAO.getProgramName(Integer.parseInt(request.getParameter("seID"))));
                    n2.setBody("Your proposal has some revisions before it is approved by the Council.");

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    n2.setDt(sdf.format(dt));
                    n2.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("seID"))));
                    UserDAO.AddNotification(n2);
                    UserDAO.resetVoteSE(Integer.parseInt(request.getParameter("seID")));
                }

            }

            ServletContext context = getServletContext();
            RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-seProgramsForApproval.jsp");
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

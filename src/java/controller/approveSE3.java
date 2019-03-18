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
            SE SE = UserDAO.retrieveSEBySEID(Integer.parseInt(request.getParameter("seID")));

            if (request.getParameter("auditSE") != null) {

                session.setAttribute("auditSE", request.getParameter("auditSE"));
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-auditTrailSE.jsp");
                dispatcher.forward(request, response);
            }
            
            if (request.getParameter("approve") != null) {

                if (session.getAttribute("position").toString().equals("OVPLM - Vice President for Lasallian Mission")) {
                    if(request.getParameter("remarktype").equals("--")){
                        request.setAttribute("remarksSE", "Please select a remark type!");
                        request.setAttribute("seID", SE.getId());
                        ServletContext context = getServletContext();
                        RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-approveSEProposal4.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        UserDAO.voteMichael(Integer.parseInt(request.getParameter("approve")), 1);
                        UserDAO.addVote(Integer.parseInt(request.getParameter("approve")));
                        UserDAO.updatelmc1Remarks(request.getParameter("remarks1"), request.getParameter("remarktype"), Integer.parseInt(request.getParameter("approve")));
                        SE.setRemarktype1(request.getParameter("remarktype"));
                    }
                }

                if (session.getAttribute("position").toString().equals("DSA - Dean")) {
                    if(request.getParameter("remarktype").equals("--")){
                        request.setAttribute("remarksSE", "Please select a remark type!");
                        request.setAttribute("seID", SE.getId());
                        ServletContext context = getServletContext();
                        RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-approveSEProposal4.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        UserDAO.voteNelca(Integer.parseInt(request.getParameter("approve")), 1);
                        UserDAO.addVote(Integer.parseInt(request.getParameter("approve")));
                        UserDAO.updatelmc2Remarks(request.getParameter("remarks1"), request.getParameter("remarktype"), Integer.parseInt(request.getParameter("approve")));
                        SE.setRemarktype2(request.getParameter("remarktype"));
                    }
                }

                if (session.getAttribute("position").toString().equals("LCLM - Executive Director")) {
                    if(request.getParameter("remarktype").equals("--")){
                        request.setAttribute("remarksSE", "Please select a remark type!");
                        request.setAttribute("seID", SE.getId());
                        ServletContext context = getServletContext();
                        RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-approveSEProposal4.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        UserDAO.voteMargarita(Integer.parseInt(request.getParameter("approve")), 1);
                        UserDAO.addVote(Integer.parseInt(request.getParameter("approve")));
                        UserDAO.updatelmc3Remarks(request.getParameter("remarks1"), request.getParameter("remarktype"), Integer.parseInt(request.getParameter("approve")));
                        SE.setRemarktype3(request.getParameter("remarktype"));
                    }
                }

                if (session.getAttribute("position").toString().equals("LSPO - Director")) {
                    if(request.getParameter("remarktype").equals("--")){
                        request.setAttribute("remarksSE", "Please select a remark type!");
                        request.setAttribute("seID", SE.getId());
                        ServletContext context = getServletContext();
                        RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-approveSEProposal4.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        UserDAO.voteJames(Integer.parseInt(request.getParameter("approve")), 1);
                        UserDAO.addVote(Integer.parseInt(request.getParameter("approve")));
                        UserDAO.updatelmc4Remarks(request.getParameter("remarks1"), request.getParameter("remarktype"), Integer.parseInt(request.getParameter("approve")));
                        SE.setRemarktype4(request.getParameter("remarktype"));
                    }
                }

                if (session.getAttribute("position").toString().equals("COSCA - Director")) {
                    if(request.getParameter("remarktype").equals("--")){
                        request.setAttribute("remarksSE", "Please select a remark type!");
                        request.setAttribute("seID", SE.getId());
                        ServletContext context = getServletContext();
                        RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-approveSEProposal4.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        UserDAO.voteFritzie(Integer.parseInt(request.getParameter("approve")), 1);
                        UserDAO.addVote(Integer.parseInt(request.getParameter("approve")));
                        UserDAO.updatelmc5Remarks(request.getParameter("remarks1"), request.getParameter("remarktype"), Integer.parseInt(request.getParameter("approve")));
                        SE.setRemarktype5(request.getParameter("remarktype"));
                    }
                }
                
                java.util.Date dt = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
                java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                Notification n = new Notification();
                n.setTitle("Proposal Approval Count: " + UserDAO.getProgramName(Integer.parseInt(request.getParameter("approve"))));
                n.setBody(UserDAO.getNameByID(Integer.parseInt(session.getAttribute("userID").toString())) + " has approved your proposal. Count: " + UserDAO.getVoteCount(Integer.parseInt(request.getParameter("approve"))) + "/5" + "\n" + sdf.format(dt));
                n.setDt(sdf2.format(dt));
                n.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("approve"))));
                n.setRedirect("/MULTIPLE-viewPendingSEProgramDetails.jsp");
                n.setAttribute(SE.getId());
                UserDAO.AddNotification(n);
                
                n.setTitle("Proposal Approval Count: " + UserDAO.getProgramName(Integer.parseInt(request.getParameter("approve"))));
                n.setBody(UserDAO.getNameByID(Integer.parseInt(session.getAttribute("userID").toString())) + " has approved this proposal. Count: " + UserDAO.getVoteCount(Integer.parseInt(request.getParameter("approve"))) + "/5" + "\n" + sdf.format(dt));
                n.setDt(sdf2.format(dt));
                n.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Executive Officer"));
                n.setRedirect("/MULTIPLE-viewPendingSEProgramDetails.jsp");
                n.setAttribute(SE.getId());
                UserDAO.AddNotification(n);
                
                n.setTitle("Proposal Approval Count: " + UserDAO.getProgramName(Integer.parseInt(request.getParameter("approve"))));
                n.setBody(UserDAO.getNameByID(Integer.parseInt(session.getAttribute("userID").toString())) + " has approved this proposal. Count: " + UserDAO.getVoteCount(Integer.parseInt(request.getParameter("approve"))) + "/5" + "\n" + sdf.format(dt));
                n.setDt(sdf2.format(dt));
                n.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Vice President for Lasallian Mission"));
                n.setRedirect("/MULTIPLE-viewPendingSEProgramDetails.jsp");
                n.setAttribute(SE.getId());
                UserDAO.AddNotification(n);
                
                n.setTitle("Proposal Approval Count: " + UserDAO.getProgramName(Integer.parseInt(request.getParameter("approve"))));
                n.setBody(UserDAO.getNameByID(Integer.parseInt(session.getAttribute("userID").toString())) + " has approved this proposal. Count: " + UserDAO.getVoteCount(Integer.parseInt(request.getParameter("approve"))) + "/5" + "\n" + sdf.format(dt));
                n.setDt(sdf2.format(dt));
                n.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Sir Jay Position"));
                n.setRedirect("/MULTIPLE-viewPendingSEProgramDetails.jsp");
                n.setAttribute(SE.getId());
                UserDAO.AddNotification(n);

                request.setAttribute("successSE2", "You have successfully voted APPROVE for the SE Proposal!");
            }

            if (UserDAO.hasEveryoneVoted(Integer.parseInt(request.getParameter("seID")))) {

                if (UserDAO.tallyVote(Integer.parseInt(request.getParameter("seID"))).equals("approve")) {

                    if (UserDAO.isOVPLMSource(Integer.parseInt(request.getParameter("seID")))) {
                        java.util.Date dt = new java.util.Date();
                        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
                        java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                        UserDAO.updateStep(6, Integer.parseInt(request.getParameter("seID")));

                        Notification n2 = new Notification();
                        n2.setBody(UserDAO.getProgramName(Integer.parseInt(request.getParameter("seID"))) + ": You may now upload the PRS for endorsement." + "\n"  + sdf.format(dt));
                        
                        SE = UserDAO.retrieveSEBySEID(Integer.parseInt(request.getParameter("approve")));
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
                                n2.setTitle("Urgent SE Proposal Approved by Council");
                            } else if (days >= 15){
                                n2.setTitle("SE Proposal Approved by Council");
                            }
                        } catch (ParseException ex) {
                            Logger.getLogger(addSE2.class.getName()).log(Level.SEVERE, null, ex);
                        }

                        n2.setDt((sdf2.format(dt)));
                        n2.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("seID"))));
                        n2.setRedirect("/MULTIPLE-viewPendingSEProgramDetails.jsp");
                        n2.setAttribute(SE.getId());
                        UserDAO.AddNotification(n2);
                    } else {
                        java.util.Date dt = new java.util.Date();
                        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
                        java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        
                        UserDAO.updateStep(8, Integer.parseInt(request.getParameter("seID")));

                        Notification n2 = new Notification();
                        n2.setBody("Program: " + UserDAO.getProgramName(Integer.parseInt(request.getParameter("seID"))) + "\n"  + sdf.format(dt));
                        
                        SE = UserDAO.retrieveSEBySEID(Integer.parseInt(request.getParameter("approve")));
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
                                n2.setTitle("Urgent SE Proposal Approved by Council");
                            } else if (days >= 15){
                                n2.setTitle("SE Proposal Approved by Council");
                            }
                        } catch (ParseException ex) {
                            Logger.getLogger(addSE2.class.getName()).log(Level.SEVERE, null, ex);
                        }

                        n2.setDt((sdf2.format(dt)));
                        n2.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("seID"))));
                        n2.setRedirect("/MULTIPLE-viewSEProgramDetails.jsp");
                        n2.setAttribute(SE.getId());
                        UserDAO.AddNotification(n2);
                    }
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

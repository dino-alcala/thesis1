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
public class approveFF2 extends HttpServlet {

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
                FF FF = UserDAO.retrieveFFByFFID(Integer.parseInt(request.getParameter("approve")));
                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString())))) {
                    if(request.getParameter("remarktype").equals("Comment") || request.getParameter("remarktype").equals("For Action")){
                        UserDAO.updateStepFF(5, Integer.parseInt(request.getParameter("approve")));
                        UserDAO.approveLSPO(Integer.parseInt(request.getParameter("approve")));
                        UserDAO.updatelsporemarks(request.getParameter("remarks1"), request.getParameter("remarktype"), Integer.parseInt(request.getParameter("approve")));
                        
                        java.util.Date dt = new java.util.Date();
                        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
                        java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                        Notification n = new Notification();
                        n.setBody("Progam: " + UserDAO.getProjectName(Integer.parseInt(request.getParameter("approve"))) + "\n" + sdf.format(dt));

                        //to check if submitter is part of council
                        boolean checkproponent1 = false;
                        boolean checkproponent2 = false;
                        boolean checkproponent3 = false;
                        boolean checkproponent4 = false;
                        if(FF.getUnit().equals("Office of the Vice President for Lasallian Mission (OVPLM)")){
                            UserDAO.voteFFMichael(Integer.parseInt(request.getParameter("approve")), 1);
                            UserDAO.addFFVote(Integer.parseInt(request.getParameter("approve")));
                            UserDAO.updateFFlmc1Remarks("N/A", "Comment", Integer.parseInt(request.getParameter("approve")));
                            FF.setRemarktype1("Comment");
                            checkproponent1 = true;
                        } else if(FF.getUnit().equals("Center for Social Concern and Action (COSCA)")){
                            UserDAO.voteFFFritzie(Integer.parseInt(request.getParameter("approve")), 1);
                            UserDAO.addFFVote(Integer.parseInt(request.getParameter("approve")));
                            UserDAO.updateFFlmc5Remarks("N/A", "Comment", Integer.parseInt(request.getParameter("approve")));
                            FF.setRemarktype1("Comment");
                            checkproponent2 = true;
                        } else if(FF.getUnit().equals("Dean of Student Affairs (DSA)")){
                            UserDAO.voteFFNelca(Integer.parseInt(request.getParameter("approve")), 1);
                            UserDAO.addFFVote(Integer.parseInt(request.getParameter("approve")));
                            UserDAO.updateFFlmc2Remarks("N/A", "Comment", Integer.parseInt(request.getParameter("approve")));
                            FF.setRemarktype1("Comment");
                            checkproponent3 = true;
                        } else if(FF.getUnit().equals("Laguna Campus Lasallian Mission (LCLM)")){
                            UserDAO.voteFFMargarita(Integer.parseInt(request.getParameter("approve")), 1);
                            UserDAO.addFFVote(Integer.parseInt(request.getParameter("approve")));
                            UserDAO.updateFFlmc3Remarks("N/A", "Comment", Integer.parseInt(request.getParameter("approve")));
                            FF.setRemarktype1("Comment");
                            checkproponent4 = true;
                        }
                        
                        SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-mm-dd");
                        java.util.Date javaDate = new java.util.Date();
                        String input1 = new java.sql.Date(javaDate.getTime()).toString();
                        String input2 = FF.getActualDate().toString();

                        try {
                            java.util.Date date1 = myFormat.parse(input1);
                            java.util.Date date2 = myFormat.parse(input2);
                            long diff = date2.getTime() - date1.getTime();
                            long days = (diff / (1000*60*60*24));

                            if(days <= 14){
                                n.setTitle("Urgent FF Proposal ready for Approval");
                            } else if (days >= 15){
                                n.setTitle("FF Proposal ready for Approval");
                            }
                        } catch (ParseException ex) {
                            Logger.getLogger(addSE2.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        n.setDt(sdf2.format(dt));

                        if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString())))) {
                            n.setUserID(UserDAO.getUserIDforNotifsPosition("LCLM - Executive Director"));
                            if(checkproponent4 == true){
                                n.setTitle("Proposal being approved by the LMC");
                                n.setRedirect("/MULTIPLE-viewPendingFFProgramDetails.jsp");
                            } else {
                                n.setRedirect("/MULTIPLE-approveFFProposal4.jsp");
                            }
                            n.setAttribute(FF.getId());
                            UserDAO.AddNotification(n);

                            n.setUserID(UserDAO.getUserIDforNotifsPosition("COSCA - Director"));
                            if(checkproponent2 == true){
                                n.setTitle("Proposal being approved by the LMC");
                                n.setRedirect("/MULTIPLE-viewPendingFFProgramDetails.jsp");
                            } else {
                                n.setRedirect("/MULTIPLE-approveFFProposal4.jsp");
                            }
                            n.setAttribute(FF.getId());
                            UserDAO.AddNotification(n);

                            n.setUserID(UserDAO.getUserIDforNotifsPosition("DSA - Dean"));
                            if(checkproponent3 == true){
                                n.setTitle("Proposal being approved by the LMC");
                                n.setRedirect("/MULTIPLE-viewPendingFFProgramDetails.jsp");
                            } else {
                                n.setRedirect("/MULTIPLE-approveFFProposal4.jsp");
                            }
                            n.setAttribute(FF.getId());
                            UserDAO.AddNotification(n);

                            n.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Vice President for Lasallian Mission"));
                            if(checkproponent1 == true){
                                n.setTitle("Proposal being approved by the LMC");
                                n.setRedirect("/MULTIPLE-viewPendingFFProgramDetails.jsp");
                            } else {
                                n.setRedirect("/MULTIPLE-approveFFProposal4.jsp");
                            }
                            n.setAttribute(FF.getId());
                            UserDAO.AddNotification(n);
                        }

                        Notification n2 = new Notification();
                        n2.setTitle("FF Proposal Approved");

                        if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString())))) {
                            n2.setBody(UserDAO.getProjectName(Integer.parseInt(request.getParameter("approve"))) + " has been approved by the LSPO! It will now be taken to the LMC Council." + "\n"  + sdf.format(dt));
                        }

                        n2.setDt(sdf2.format(dt));
                        n2.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("approve"))));
                        n2.setRedirect("/MULTIPLE-viewPendingFFProgramDetails.jsp");
                        n2.setAttribute(FF.getId());

                        UserDAO.AddNotification(n2);

                        request.setAttribute("successFF1", "You have successfully approved the FF Proposal!");
                        ServletContext context = getServletContext();
                        RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-ffProgramsForApproval.jsp");
                        dispatcher.forward(request, response);
                    } else if(request.getParameter("remarktype").equals("--")) {
                        request.setAttribute("remarksFF", "Please select a remark type!");
                        request.setAttribute("ffID", FF.getId());
                        ServletContext context = getServletContext();
                        RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-approveFFProposal3.jsp");
                        dispatcher.forward(request, response);
                    } else if(request.getParameter("remarktype").equals("Revise") || request.getParameter("remarktype").equals("Reject")) {
                        request.setAttribute("remarksFF", "Please select the correct remark type!");
                        request.setAttribute("ffID", FF.getId());
                        ServletContext context = getServletContext();
                        RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-approveFFProposal3.jsp");
                        dispatcher.forward(request, response);
                    }
                }
            }

            if (request.getParameter("revise") != null) {
                Notification n3 = new Notification();
                n3.setTitle("FF Proposal for Revision");
                FF FF = UserDAO.retrieveFFByFFID(Integer.parseInt(request.getParameter("revise")));

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString())))) {
                    if(request.getParameter("remarktype").equals("Comment") || request.getParameter("remarktype").equals("For Action") || request.getParameter("remarktype").equals("Reject")){
                        request.setAttribute("remarksFF", "Please select the correct remark type!");
                        request.setAttribute("ffID", FF.getId());
                        ServletContext context = getServletContext();
                        RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-approveFFProposal3.jsp");
                        dispatcher.forward(request, response);
                    } else if(request.getParameter("remarktype").equals("--")) {
                        request.setAttribute("remarksFF", "Please select a remark type!");
                        request.setAttribute("ffID", FF.getId());
                        ServletContext context = getServletContext();
                        RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-approveFFProposal3.jsp");
                        dispatcher.forward(request, response);
                    } else if(request.getParameter("remarktype").equals("Revise")) {
                        java.util.Date dt = new java.util.Date();
                        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
                        java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        
                        UserDAO.reviseFF(Integer.parseInt(request.getParameter("revise")));
                        UserDAO.reviseLSPO(Integer.parseInt(request.getParameter("revise")));
                        UserDAO.updatelsporemarks(request.getParameter("remarks1"), request.getParameter("remarktype"), Integer.parseInt(request.getParameter("revise")));
                        n3.setBody(UserDAO.getProjectName(Integer.parseInt(request.getParameter("revise"))) + " has some revisions before it is approved by the LSPO. \n " + sdf.format(dt));
                        n3.setDt(sdf2.format(dt));
                        n3.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("revise"))));
                        n3.setRedirect("/MULTIPLE-viewPendingFFProgramDetails.jsp");
                        n3.setAttribute(FF.getId());
                    }
                }

                UserDAO.AddNotification(n3);

                request.setAttribute("reviseFF1", "Revisions has been sent to the requesting unit.");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-ffProgramsForApproval.jsp");
                dispatcher.forward(request, response);
            }

            if (request.getParameter("reject") != null) {
                Notification n3 = new Notification();
                n3.setTitle("FF Proposal Rejected");
                FF FF = UserDAO.retrieveFFByFFID(Integer.parseInt(request.getParameter("reject")));

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString())))) {
                    if(request.getParameter("remarktype").equals("Comment") || request.getParameter("remarktype").equals("For Action") || request.getParameter("remarktype").equals("Revise")){
                        request.setAttribute("remarksFF", "Please select the correct remark type!");
                        request.setAttribute("ffID", FF.getId());
                        ServletContext context = getServletContext();
                        RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-approveFFProposal3.jsp");
                        dispatcher.forward(request, response);
                    } else if(request.getParameter("remarktype").equals("--")) {
                        request.setAttribute("remarksFF", "Please select a remark type!");
                        request.setAttribute("ffID", FF.getId());
                        ServletContext context = getServletContext();
                        RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-approveFFProposal3.jsp");
                        dispatcher.forward(request, response);
                    } else if(request.getParameter("remarktype").equals("Reject")) {
                        java.util.Date dt = new java.util.Date();
                        java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
                        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        
                        UserDAO.updatelsporemarks(request.getParameter("remarks1"), request.getParameter("remarktype"), Integer.parseInt(request.getParameter("reject")));
                        UserDAO.rejectLSPO(Integer.parseInt(request.getParameter("reject")));
                        UserDAO.rejectFF(Integer.parseInt(request.getParameter("reject")));
                        n3.setBody(UserDAO.getProjectName(Integer.parseInt(request.getParameter("reject"))) + " has been rejected by the LSPO. Reason: " + request.getParameter("remarks1") + "\n" + sdf.format(dt));
                        n3.setDt(sdf2.format(dt));
                        n3.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("reject"))));
                        n3.setRedirect("/MULTIPLE-viewPendingFFProgramDetails.jsp");
                        n3.setAttribute(FF.getId());
                    }
                }
                UserDAO.AddNotification(n3);

                request.setAttribute("rejectFF1", "You have rejected the proposal.");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-ffProgramsForApproval.jsp");
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

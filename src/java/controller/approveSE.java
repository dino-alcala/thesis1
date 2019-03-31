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

            if (request.getParameter("auditSE") != null) {

                session.setAttribute("auditSE", request.getParameter("auditSE"));
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-auditTrailSE.jsp");
                dispatcher.forward(request, response);
            }

            if (request.getParameter("checklist") != null) {
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-approveSEProposalChecklist.jsp");
                dispatcher.forward(request, response);
            }
            if (request.getParameter("approve") != null) {
                SE SE = UserDAO.retrieveSEBySEID(Integer.parseInt(request.getParameter("approve")));
                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Department Chair")) {
                    if(SE.getDepartment().equals("ADEALM")){
                        UserDAO.updateStep(3, Integer.parseInt(request.getParameter("approve")));
                        UserDAO.updateDeptUnitRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                        UserDAO.approveDeptChair(Integer.parseInt(request.getParameter("approve")));
                        
                        UserDAO.updateExternalRemarks("N/A", Integer.parseInt(request.getParameter("approve")));
                        UserDAO.approveADEALM(Integer.parseInt(request.getParameter("approve")));
                    } else {
                        UserDAO.updateStep(2, Integer.parseInt(request.getParameter("approve")));
                        UserDAO.updateDeptUnitRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                        UserDAO.approveDeptChair(Integer.parseInt(request.getParameter("approve")));
                    }
                    
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Unit Chair")) {
                    UserDAO.updateStep(2, Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updateUnitChairRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                    UserDAO.approveUnitChair(Integer.parseInt(request.getParameter("approve")));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("ADEALM")) {
                    UserDAO.updateStep(3, Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updateExternalRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                    UserDAO.approveADEALM(Integer.parseInt(request.getParameter("approve")));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Social Engagement Director")) {
                    UserDAO.updateStep(3, Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updateSEDirectorRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                    UserDAO.approveSEDirector(Integer.parseInt(request.getParameter("approve")));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Dean")) {
                    UserDAO.updateStep(4, Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updateDeanRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                    UserDAO.approveDean(Integer.parseInt(request.getParameter("approve")));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("VP/VC")) {
                    UserDAO.updateStep(4, Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updateVPVCRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                    UserDAO.approveVPVC(Integer.parseInt(request.getParameter("approve")));
                }

                java.util.Date dt = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
                java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                
                Notification n = new Notification();
                n.setBody("Program: " + UserDAO.getProgramName(Integer.parseInt(request.getParameter("approve"))) + "\n" + sdf.format(dt));
                
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
                        n.setTitle("Urgent SE Proposal ready for Approval");
                    } else if (days >= 15){
                        n.setTitle("SE Proposal ready for Approval");
                    }
                } catch (ParseException ex) {
                    Logger.getLogger(addSE2.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                n.setDt(sdf2.format(dt));

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Department Chair")) {
                    n.setUserID(UserDAO.getUserIDforNotifsADEALM(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))));
                    n.setRedirect("/SIGNATORIES-approveSEProposal2.jsp");
                    n.setAttribute(SE.getId());
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("ADEALM")) {
                    n.setUserID(UserDAO.getUserIDforNotifsDean(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))));
                    n.setRedirect("/SIGNATORIES-approveSEProposal3.jsp");
                    n.setAttribute(SE.getId());
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Social Engagement Director")) {
                    n.setUserID(UserDAO.getUserIDforNotifsVPVC(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))));
                    n.setRedirect("/SIGNATORIES-approveSEProposal3.jsp");
                    n.setAttribute(SE.getId());
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Dean")) {
                    n.setUserID(UserDAO.getUserIDforNotifsNeil());
                    n.setRedirect("/MULTIPLE-approveSEProposal3.jsp");
                    n.setAttribute(SE.getId());
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Unit Chair")) {
                    n.setUserID(UserDAO.getUserIDforNotifsSEDirector(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))));
                    n.setRedirect("/SIGNATORIES-approveSEProposal2.jsp");
                    n.setAttribute(SE.getId());
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("VP/VC")) {
                    n.setUserID(UserDAO.getUserIDforNotifsNeil());
                    n.setRedirect("/MULTIPLE-approveSEProposal3.jsp");
                    n.setAttribute(SE.getId());
                }

                UserDAO.AddNotification(n);

                Notification n2 = new Notification();
                n2.setTitle("SE Proposal Approved");

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Department Chair")) {
                    n2.setBody(UserDAO.getProgramName(Integer.parseInt(request.getParameter("approve"))) + " approved the Department Chair! It will now be taken to the ADEALM." + "\n"  + sdf.format(dt));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Unit Chair")) {
                    n2.setBody(UserDAO.getProgramName(Integer.parseInt(request.getParameter("approve"))) + " approved by the Unit Chair! It will now be taken to the SE Director." + "\n"  + sdf.format(dt));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("ADEALM")) {
                    n2.setBody(UserDAO.getProgramName(Integer.parseInt(request.getParameter("approve"))) + " approved by the ADEALM! It will now be taken to the Dean." + "\n"  + sdf.format(dt));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Social Engagement Director")) {
                    n2.setBody(UserDAO.getProgramName(Integer.parseInt(request.getParameter("approve"))) + " approved by the SE Director! It will now be taken to the VP/VC." + "\n"  + sdf.format(dt));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("VP/VC")) {
                    n2.setBody(UserDAO.getProgramName(Integer.parseInt(request.getParameter("approve"))) + " approved by the VP/VC! It will now be taken to COSCA." + "\n"  + sdf.format(dt));

                    Notification n3 = new Notification();
                    n3.setBody("Program: " + UserDAO.getProgramName(Integer.parseInt(request.getParameter("approve"))) + "\n" + sdf.format(dt));

                    try {
                        java.util.Date date1 = myFormat.parse(input1);
                        java.util.Date date2 = myFormat.parse(input2);
                        long diff = date2.getTime() - date1.getTime();
                        long days = (diff / (1000*60*60*24));

                        if(days <= 14){
                            n3.setTitle("Urgent SE Proposal ready for Approval");
                        } else if (days >= 15){
                            n3.setTitle("SE Proposal ready for Approval");
                        }
                    } catch (ParseException ex) {
                        Logger.getLogger(addSE2.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    n3.setDt(sdf2.format(dt));
                    n3.setUserID(UserDAO.getUserIDforNotifsNeil());
                    n3.setRedirect("/MULTIPLE-approveSEProposal3.jsp");
                    n3.setAttribute(SE.getId());
                    UserDAO.AddNotification(n3);
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Dean")) {
                    n2.setBody(UserDAO.getProgramName(Integer.parseInt(request.getParameter("approve"))) + " has been approved by the Dean! It will now be taken to COSCA." + "\n"  + sdf.format(dt));
                }

                n2.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("approve"))));
                n2.setDt(sdf2.format(dt));
                n2.setRedirect("/MULTIPLE-viewPendingSEProgramDetails.jsp");
                n2.setAttribute(SE.getId());
                UserDAO.AddNotification(n2);

                request.setAttribute("successSE1", "You have successfully approved the SE Proposal!");
                ServletContext context = getServletContext();
                if (session.getAttribute("position").toString().contains("ADEALM")) {
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/ADEALM-home.jsp");
                    dispatcher.forward(request, response);
                } else if (session.getAttribute("position").equals("CCS - Dean") || session.getAttribute("position").equals("COS - Dean")
                        || session.getAttribute("position").equals("GCOE - Dean") || session.getAttribute("position").equals("RVRCOB - Dean") || session.getAttribute("position").equals("COL - Dean")
                        || session.getAttribute("position").equals("BAGCED - Dean") || session.getAttribute("position").equals("CLA - Dean") || session.getAttribute("position").equals("SOE - Dean")
                        || session.getAttribute("position").toString().contains("Department Chair") || session.getAttribute("position").toString().contains("Unit Chair")
                        || session.getAttribute("position").toString().contains("Social Engagement Director") || session.getAttribute("position").toString().contains("VP/VC")) {
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/SIGNATORIES-home.jsp");
                    dispatcher.forward(request, response);
                }
            }

            if (request.getParameter("revise") != null) {
                SE SE = UserDAO.retrieveSEBySEID(Integer.parseInt(request.getParameter("revise")));
                
                java.util.Date dt = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
                java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                
                Notification n3 = new Notification();
                n3.setTitle("SE Proposal for Revision");
                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Department Chair")) {
                    UserDAO.reviseSE(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.updateDeptUnitRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("revise")));
                    UserDAO.reviseDeptChair(Integer.parseInt(request.getParameter("revise")));
                    n3.setBody(UserDAO.getProgramName(Integer.parseInt(request.getParameter("revise"))) + " has some revisions before it is approved by the Department Chair." + "\n"  + sdf.format(dt));
                    n3.setDt(sdf2.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("revise"))));
                    n3.setRedirect("/MULTIPLE-viewPendingSEProgramDetails.jsp");
                    n3.setAttribute(SE.getId());
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("ADEALM")) {
                    UserDAO.reviseSE(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.updateExternalRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("revise")));
                    UserDAO.reviseADEALM(Integer.parseInt(request.getParameter("revise")));
                    n3.setBody(UserDAO.getProgramName(Integer.parseInt(request.getParameter("revise"))) + " has some revisions before it is approved by the ADEALM." + "\n"  + sdf.format(dt));
                    n3.setDt(sdf2.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("revise"))));
                    n3.setRedirect("/MULTIPLE-viewPendingSEProgramDetails.jsp");
                    n3.setAttribute(SE.getId());
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Dean")) {
                    UserDAO.reviseSE(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.updateDeanRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("revise")));
                    UserDAO.reviseDean(Integer.parseInt(request.getParameter("revise")));
                    n3.setBody(UserDAO.getProgramName(Integer.parseInt(request.getParameter("revise"))) + " has some revisions before it is approved by the Dean." + "\n"  + sdf.format(dt));
                    n3.setDt(sdf2.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("revise"))));
                    n3.setRedirect("/MULTIPLE-viewPendingSEProgramDetails.jsp");
                    n3.setAttribute(SE.getId());
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Unit Chair")) {
                    UserDAO.reviseSE(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.updateUnitChairRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("revise")));
                    UserDAO.reviseUnitChair(Integer.parseInt(request.getParameter("revise")));
                    n3.setBody(UserDAO.getProgramName(Integer.parseInt(request.getParameter("revise"))) + " has some revisions before it is approved by the Unit Chair." + "\n"  + sdf.format(dt));
                    n3.setDt(sdf2.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("revise"))));
                    n3.setRedirect("/MULTIPLE-viewPendingSEProgramDetails.jsp");
                    n3.setAttribute(SE.getId());
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Social Engagement Director")) {
                    UserDAO.reviseSE(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.updateSEDirectorRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("revise")));
                    UserDAO.reviseSEDirector(Integer.parseInt(request.getParameter("revise")));
                    n3.setBody(UserDAO.getProgramName(Integer.parseInt(request.getParameter("revise"))) + " has some revisions before it is approved by the SE Director." + "\n"  + sdf.format(dt));
                    n3.setDt(sdf2.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("revise"))));
                    n3.setRedirect("/MULTIPLE-viewPendingSEProgramDetails.jsp");
                    n3.setAttribute(SE.getId());
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("VP/VC")) {
                    UserDAO.reviseSE(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.updateVPVCRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("revise")));
                    UserDAO.reviseVPVC(Integer.parseInt(request.getParameter("revise")));
                    n3.setBody(UserDAO.getProgramName(Integer.parseInt(request.getParameter("revise"))) + " has some revisions before it is approved by the VP/VC." + "\n"  + sdf.format(dt));
                    n3.setDt(sdf2.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("revise"))));
                    n3.setRedirect("/MULTIPLE-viewPendingSEProgramDetails.jsp");
                    n3.setAttribute(SE.getId());
                }

                UserDAO.AddNotification(n3);

                request.setAttribute("reviseSE1", "The requesting unit has been notified for a proposal revision.");
                ServletContext context = getServletContext();
                if (session.getAttribute("position").toString().contains("ADEALM")) {
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/ADEALM-home.jsp");
                    dispatcher.forward(request, response);
                } else if (session.getAttribute("position").equals("CCS - Dean") || session.getAttribute("position").equals("COS - Dean")
                        || session.getAttribute("position").equals("GCOE - Dean") || session.getAttribute("position").equals("RVRCOB - Dean") || session.getAttribute("position").equals("COL - Dean")
                        || session.getAttribute("position").equals("BAGCED - Dean") || session.getAttribute("position").equals("CLA - Dean") || session.getAttribute("position").equals("SOE - Dean")
                        || session.getAttribute("position").toString().contains("Department Chair") || session.getAttribute("position").toString().contains("Unit Chair")
                        || session.getAttribute("position").toString().contains("Social Engagement Director") || session.getAttribute("position").toString().contains("VP/VC")) {
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/SIGNATORIES-home.jsp");
                    dispatcher.forward(request, response);
                }
            }

            if (request.getParameter("reject") != null) {
                SE SE = UserDAO.retrieveSEBySEID(Integer.parseInt(request.getParameter("reject")));
                
                Notification n3 = new Notification();
                n3.setTitle("SE Proposal Rejected");
                
                java.util.Date dt = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
                java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Department Chair")) {
                    UserDAO.updateDeptUnitRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                    UserDAO.rejectDeptChair(Integer.parseInt(request.getParameter("reject")));
                    n3.setBody(UserDAO.getProgramName(Integer.parseInt(request.getParameter("reject"))) + " has been rejected by the Department Chair. Reason: " + request.getParameter("remarks1") + "\n" + sdf.format(dt));
                    n3.setDt(sdf2.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("reject"))));
                    n3.setRedirect("/MULTIPLE-viewSEProgramDetails.jsp");
                    n3.setAttribute(SE.getId());
                    
                    UserDAO.rejectSE(Integer.parseInt(request.getParameter("reject")));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Unit Chair")) {
                    UserDAO.updateDeptUnitRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                    UserDAO.rejectUnitChair(Integer.parseInt(request.getParameter("reject")));
                    n3.setBody(UserDAO.getProgramName(Integer.parseInt(request.getParameter("reject"))) + " has been rejected by the Unit Chair. Reason: " + request.getParameter("remarks1") + "\n" + sdf.format(dt));
                    n3.setDt(sdf2.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("reject"))));
                    n3.setRedirect("/MULTIPLE-viewSEProgramDetails.jsp");
                    n3.setAttribute(SE.getId());
                    
                    UserDAO.rejectSE(Integer.parseInt(request.getParameter("reject")));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("ADEALM")) {
                    UserDAO.updateExternalRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                    UserDAO.rejectADEALM(Integer.parseInt(request.getParameter("reject")));
                    n3.setBody(UserDAO.getProgramName(Integer.parseInt(request.getParameter("reject"))) + " has been rejected by the ADEALM. Reason: " + request.getParameter("remarks1") + "\n" + sdf.format(dt));
                    n3.setDt(sdf2.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("reject"))));
                    n3.setRedirect("/MULTIPLE-viewSEProgramDetails.jsp");
                    n3.setAttribute(SE.getId());
                    
                    UserDAO.rejectSE(Integer.parseInt(request.getParameter("reject")));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Social Engagement Director")) {
                    UserDAO.updateExternalRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                    UserDAO.rejectSEDirector(Integer.parseInt(request.getParameter("reject")));
                    n3.setBody(UserDAO.getProgramName(Integer.parseInt(request.getParameter("reject"))) + " has been rejected by the SE Director. Reason: " + request.getParameter("remarks1") + "\n" + sdf.format(dt));
                    n3.setDt(sdf2.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("reject"))));
                    n3.setRedirect("/MULTIPLE-viewSEProgramDetails.jsp");
                    n3.setAttribute(SE.getId());
                    
                    UserDAO.rejectSE(Integer.parseInt(request.getParameter("reject")));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Dean")) {
                    UserDAO.updateDeanRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                    UserDAO.rejectDean(Integer.parseInt(request.getParameter("reject")));
                    n3.setBody(UserDAO.getProgramName(Integer.parseInt(request.getParameter("reject"))) + " has been rejected by the Dean. Reason: " + request.getParameter("remarks1") + "\n" + sdf.format(dt));
                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("reject"))));
                    n3.setRedirect("/MULTIPLE-viewSEProgramDetails.jsp");
                    n3.setAttribute(SE.getId());
                    
                    UserDAO.rejectSE(Integer.parseInt(request.getParameter("reject")));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("VP/VC")) {
                    UserDAO.updateDeanRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                    UserDAO.rejectVPVC(Integer.parseInt(request.getParameter("reject")));
                    n3.setBody(UserDAO.getProgramName(Integer.parseInt(request.getParameter("reject"))) + " has been rejected by the VP/VC. Reason: " + request.getParameter("remarks1") + "\n" + sdf.format(dt));
                    n3.setDt(sdf2.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("reject"))));
                    n3.setRedirect("/MULTIPLE-viewSEProgramDetails.jsp");
                    n3.setAttribute(SE.getId());
                    
                    UserDAO.rejectSE(Integer.parseInt(request.getParameter("reject")));
                }

                UserDAO.AddNotification(n3);

                request.setAttribute("rejectSE1", "You have rejected the proposal.");
                ServletContext context = getServletContext();
                if (session.getAttribute("position").toString().contains("ADEALM")) {
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/ADEALM-home.jsp");
                    dispatcher.forward(request, response);
                } else if (session.getAttribute("position").equals("CCS - Dean") || session.getAttribute("position").equals("COS - Dean")
                        || session.getAttribute("position").equals("GCOE - Dean") || session.getAttribute("position").equals("RVRCOB - Dean") || session.getAttribute("position").equals("COL - Dean")
                        || session.getAttribute("position").equals("BAGCED - Dean") || session.getAttribute("position").equals("CLA - Dean") || session.getAttribute("position").equals("SOE - Dean")
                        || session.getAttribute("position").toString().contains("Department Chair") || session.getAttribute("position").toString().contains("Unit Chair")
                        || session.getAttribute("position").toString().contains("Social Engagement Director") || session.getAttribute("position").toString().contains("VP/VC")) {
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/SIGNATORIES-home.jsp");
                    dispatcher.forward(request, response);
                }
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

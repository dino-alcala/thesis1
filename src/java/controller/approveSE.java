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

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Department Chair")) {

                    UserDAO.updateStep(2, Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updateDeptUnitRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                }
                
                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Unit Chair")) {
                    UserDAO.updateStep(2, Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updateUnitChairRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("ADEALM")) {
                    UserDAO.updateStep(3, Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updateExternalRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                }
                
                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Social Engagement Director")) {
                    UserDAO.updateStep(3, Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updateSEDirectorRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Dean")) {
                    UserDAO.updateStep(4, Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updateDeanRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                }
                
                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("VPVC")) {
                    UserDAO.updateStep(4, Integer.parseInt(request.getParameter("approve")));
                    UserDAO.updateDeanRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("approve")));
                }
                
                Notification n = new Notification();
                n.setTitle(UserDAO.getProgramName(Integer.parseInt(request.getParameter("approve"))));
                n.setBody("New SE Proposal ready for approval!");

                java.util.Date dt = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                n.setDt(sdf.format(dt));

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Department Chair")) {
                    n.setUserID(UserDAO.getUserIDforNotifsADEALM(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("ADEALM")) {
                    n.setUserID(UserDAO.getUserIDforNotifsDean(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Dean")) {
                    n.setUserID(UserDAO.getUserIDforNotifsNeil());
                    
                }
                
                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Unit Chair")) {
                    n.setUserID(UserDAO.getUserIDforNotifsSEDirector(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))));
                }
                
                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("VP/VC")) {
                    n.setUserID(UserDAO.getUserIDforNotifsVPVC(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))));
                }

                UserDAO.AddNotification(n);

                Notification n2 = new Notification();
                n2.setTitle(UserDAO.getProgramName(Integer.parseInt(request.getParameter("approve"))));

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Department Chair")) {
                    n2.setBody("Your proposal has been approved by the Department Chair! It will now be taken to the ADEALM.");
                }
                
                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Unit Chair")) {
                    n2.setBody("Your proposal has been approved by the Unit Chair! It will now be taken to the SE Director.");
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("ADEALM")) {
                    n2.setBody("Your proposal has been approved by the ADEALM! It will now be taken to the Dean.");
                }
                
                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Social Engagement Director")) {
                    n2.setBody("Your proposal has been approved by the SE Director! It will now be taken to the VP/VC.");
                }
                
                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("VP/VC")) {
                    n2.setBody("Your proposal has been approved by the VP/VC! It will now be taken to COSCA.");
                    
                    Notification n3 = new Notification();
                    n3.setTitle(UserDAO.getProgramName(Integer.parseInt(request.getParameter("approve"))));
                    n3.setBody("New SE Proposal ready for approval!");
                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getUserIDforNotifsNeil());

                    UserDAO.AddNotification(n3);
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Dean")) {
                    n2.setBody("Your proposal has been approved by the Dean! It will now be taken to COSCA.");

                    Notification n3 = new Notification();
                    n3.setTitle(UserDAO.getProgramName(Integer.parseInt(request.getParameter("approve"))));
                    n3.setBody("New SE Proposal ready for approval!");
                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getUserIDforNotifsNeil());

                    UserDAO.AddNotification(n3);
                }

                n2.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("approve"))));
                n2.setDt(sdf.format(dt));

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

                Notification n3 = new Notification();
                n3.setTitle(UserDAO.getProgramName(Integer.parseInt(request.getParameter("revise"))));
                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Department Chair")) {
                    UserDAO.reviseSE(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.updateDeptUnitRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("revise")));
                    n3.setBody("Your proposal has some revisions before it is approved by the Department Chair.");

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("revise"))));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("ADEALM")) {
                    UserDAO.reviseSE(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.updateExternalRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("revise")));
                    n3.setBody("Your proposal has some revisions before it is approved by the ADEALM.");

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("revise"))));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Dean")) {
                    UserDAO.reviseSE(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.updateDeanRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("revise")));
                    n3.setBody("Your proposal has some revisions before it is approved by the Dean.");

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("revise"))));
                }
                
                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Unit Chair")) {
                    UserDAO.reviseSE(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.updateUnitChairRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("revise")));
                    n3.setBody("Your proposal has some revisions before it is approved by the Unit Chair.");

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("revise"))));
                }
                
                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Social Engagement Director")) {
                    UserDAO.reviseSE(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.updateSEDirectorRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("revise")));
                    n3.setBody("Your proposal has some revisions before it is approved by the SE Director.");

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("revise"))));
                }
                
                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("VP/VC")) {
                    UserDAO.reviseSE(Integer.parseInt(request.getParameter("revise")));
                    UserDAO.updateVPVCRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("revise")));
                    n3.setBody("Your proposal has some revisions before it is approved by the VP/VC.");

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("revise"))));
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
                Notification n3 = new Notification();
                n3.setTitle(UserDAO.getProgramName(Integer.parseInt(request.getParameter("reject"))));

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Department Chair")) {
                    UserDAO.updateDeptUnitRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                    n3.setBody("Your proposal has been rejected by the Department Chair. Reason: " + request.getParameter("remarks1"));

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    UserDAO.rejectSE(Integer.parseInt(request.getParameter("reject")));

                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("reject"))));
                }
                
                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Unit Chair")) {
                    UserDAO.updateDeptUnitRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                    n3.setBody("Your proposal has been rejected by the Unit Chair. Reason: " + request.getParameter("remarks1"));

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    UserDAO.rejectSE(Integer.parseInt(request.getParameter("reject")));

                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("reject"))));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("ADEALM")) {
                    UserDAO.updateExternalRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                    n3.setBody("Your proposal has been rejected by the ADEALM. Reason: " + request.getParameter("remarks1"));

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("reject"))));
                }
                
                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Social Engagement Director")) {
                    UserDAO.updateExternalRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                    n3.setBody("Your proposal has been rejected by the SE Director. Reason: " + request.getParameter("remarks1"));

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("reject"))));
                }

                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("Dean")) {
                    UserDAO.updateDeanRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                    n3.setBody("Your proposal has been rejected by the Dean. Reason: " + request.getParameter("remarks1"));

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("reject"))));
                }
                
                if (session.getAttribute("unit").toString().equals(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))) && session.getAttribute("position").toString().contains("VP/VC")) {
                    UserDAO.updateDeanRemarks(request.getParameter("remarks1"), Integer.parseInt(request.getParameter("reject")));
                    n3.setBody("Your proposal has been rejected by the VP/VC. Reason: " + request.getParameter("remarks1"));

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    n3.setDt(sdf.format(dt));
                    n3.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("reject"))));
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

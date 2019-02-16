/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.Notification;
import entity.SE;
import entity.SEexpenses;
import entity.SEresponsible;
import entity.SEworkplan;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
public class editSE2 extends HttpServlet {

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
            SE SE;
            UserDAO UserDAO = new UserDAO();

            SE = (SE) session.getAttribute("SE");

            if (Double.parseDouble(request.getParameter("total")) == SE.getTotalAmount()) {
                ArrayList<SEworkplan> sework = new ArrayList();

                for (int i = 0; i < Integer.parseInt(request.getParameter("countproject")); i++) {
                    SEworkplan SEworkplan = new SEworkplan();
                    SEworkplan.setDate(Date.valueOf(request.getParameter("date" + i)));
                    SEworkplan.setActivity(request.getParameter("activity" + i));
                    SEworkplan.setTimestarttimeend(request.getParameter("time" + i));
                    SEworkplan.setTimestarttimeend2(request.getParameter("timeend" + i));
                    SEworkplan.setVenue(request.getParameter("venue" + i));
                    sework.add(SEworkplan);
                }

                SE.setWorkplan(sework);

                ArrayList<SEexpenses> seexpense = new ArrayList();

                for (int i = 0; i < Integer.parseInt(request.getParameter("countexpenses")); i++) {
                    SEexpenses SEexpenses = new SEexpenses();
                    SEexpenses.setItem(request.getParameter("seitem" + i));
                    SEexpenses.setUnitcost(Double.parseDouble(request.getParameter("seunitcost" + i)));
                    SEexpenses.setQuantity(Integer.parseInt(request.getParameter("sequantity" + i)));
                    SEexpenses.setSubtotal(Double.parseDouble(request.getParameter("sesubtotal" + i)));
                    seexpense.add(SEexpenses);
                }

                SE.setExpenses(seexpense);

                SE.setTotalpopulationAcademicStaff(Integer.parseInt(request.getParameter("seacademictotal")));
                SE.setExpectedAcademicStaff(Integer.parseInt(request.getParameter("seacademicexpected")));
                SE.setTotalpopulationSupportStaff(Integer.parseInt(request.getParameter("sesupporttotal")));
                SE.setExpectedSupportStaff(Integer.parseInt(request.getParameter("sesupportexpected")));
                SE.setTotalpopulationUndergraduate(Integer.parseInt(request.getParameter("seundergraduatetotal")));
                SE.setExpectedUndergraduate(Integer.parseInt(request.getParameter("seundergraduateexpected")));
                SE.setTotalPopulationGraduate(Integer.parseInt(request.getParameter("segraduatetotal")));
                SE.setExpectedGraduate(Integer.parseInt(request.getParameter("segraduateexpected")));

                ArrayList<SEresponsible> seresponsible = new ArrayList();

                for (int i = 0; i < Integer.parseInt(request.getParameter("countresponsible")); i++) {
                    SEresponsible SEresponsible = new SEresponsible();
                    SEresponsible.setName(request.getParameter("responsiblename" + i));
                    SEresponsible.setEmail(request.getParameter("responsibleemail" + i));
                    seresponsible.add(SEresponsible);
                }

                SE.setResponsible(seresponsible);

                ArrayList<Integer> measureID = (ArrayList) session.getAttribute("measureID");

                UserDAO.editMeasures(measureID, SE.getId());
                //UserDAO.checkEditedSE(SE);
                UserDAO.auditSE(SE.getId());
                UserDAO.EditSE(SE);

                UserDAO.completeReviseSE(SE.getId());
                
                java.util.Date dt = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
                java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                Notification n = new Notification();
                n.setBody("Program: " + SE.getName()+ "\n"  + sdf.format(dt));
                n.setTitle("Revised SE Proposal ready for Approval");
                n.setDt(sdf2.format(dt));

                if (UserDAO.getUnitTypeByName(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))).equals("Academic")) {
                    n.setUserID(UserDAO.getUserIDforNotifsDepartmentChair(session.getAttribute("unit").toString(), UserDAO.getDepartmentIDByUserID(Integer.parseInt(session.getAttribute("userID").toString()))));
                } else if (UserDAO.getUnitTypeByName(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))).equals("Non-Academic")) {
                    n.setUserID(UserDAO.getUserIDforNotifsUnitChair(session.getAttribute("unit").toString()));
                }

                n.setRedirect("/SIGNATORIES-approveSEProposal.jsp");
                n.setAttribute(SE.getId());
                UserDAO.AddNotification(n);

                request.setAttribute("reviseSE1", "You have successfully revised the SE!");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-pendingSEList.jsp");
                dispatcher.forward(request, response);
                
            } else if (Double.parseDouble(request.getParameter("total")) != SE.getTotalAmount()) {
                
                request.setAttribute("seID", request.getParameter("seID"));
                
                request.setAttribute("successSE", "Amount is not equal!");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-editSE2.jsp");
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.Budget;
import entity.Notification;
import entity.SE;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
public class createSEreport extends HttpServlet {

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
            } else if (request.getParameter("seID") != null) {

                request.setAttribute("seID", request.getParameter("seID"));
                ServletContext context = getServletContext();
                SE SE = UserDAO.retrieveSEBySEID(Integer.parseInt(request.getParameter("seID")));

                if (SE.getStudentorg() == 1) {
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/DSA-encodeSEReport.jsp");
                    dispatcher.forward(request, response);
                } else {
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-createSEReport.jsp");
                    dispatcher.forward(request, response);
                }
            } else if (request.getParameter("viewReport") != null) {

                request.setAttribute("seID", Integer.parseInt(request.getParameter("viewReport")));
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-viewSEReport.jsp");
                dispatcher.forward(request, response);
            } else if (request.getParameter("cancelProgram") != null) {
                SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-mm-dd");
                java.util.Date javaDate = new java.util.Date();
                java.sql.Date sqlDate = new java.sql.Date(javaDate.getTime());

                SE SE = UserDAO.retrieveSEBySEID(Integer.parseInt(request.getParameter("cancelProgram")));
                if (SE.getStep() == 8 && SE.getSourceOfFunds().equals("OVPLM")) {
                    Budget b = new Budget();
                    b.setCurrentBudget(UserDAO.getLatestBudget().getRemainingBudget());
                    b.setBudgetRequested(SE.getTotalAmount() * -1);
                    b.setRemainingBudget(b.getCurrentBudget() - b.getBudgetRequested());
                    b.setSeID(Integer.parseInt(request.getParameter("cancelProgram")));
                    b.setDate(sqlDate);

                    UserDAO.addLatestBudget(b);

                    UserDAO.updateStep(0, Integer.parseInt(request.getParameter("cancelProgram")));
                }

                Notification n = new Notification();
                n.setTitle(UserDAO.getProgramName(Integer.parseInt(request.getParameter("cancelProgram"))));
                n.setBody("The program has been cancelled! Php" + SE.getTotalAmount() + " returned");

                java.util.Date dt = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                n.setDt(sdf.format(dt));

                n.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Vice President for Lasallian Mission (OVPLM)"));
                UserDAO.AddNotification(n);
                n.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Executive Officer"));
                UserDAO.AddNotification(n);
                n.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Sir Jay Position"));
                UserDAO.AddNotification(n);

                request.setAttribute("cancelProgram", "You have successfully canceled the program!");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-socialEngagementProgramsList.jsp");
                dispatcher.forward(request, response);
            } else if (request.getParameter("updateBudget") != null) {

                request.setAttribute("seID", request.getParameter("updateBudget"));
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-updateUsedBudget.jsp");
                dispatcher.forward(request, response);

            } else {
                SE SE = new SE();
                SE = UserDAO.retrieveSEBySEID(Integer.parseInt(request.getParameter("viewreceipt")));

                OutputStream o = response.getOutputStream();
                o.write(UserDAO.viewReceipt(Integer.parseInt(request.getParameter("viewreceipt"))));
                o.flush();
                o.close();

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

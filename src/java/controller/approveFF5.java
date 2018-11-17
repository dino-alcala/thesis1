/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.Budget;
import entity.FF;
import entity.Notification;
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
public class approveFF5 extends HttpServlet {

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
        response.setContentType("image/jpg");

        UserDAO UserDAO = new UserDAO();
        HttpSession session = request.getSession();

        if (request.getParameter("auditFF") != null) {

            session.setAttribute("auditFF", request.getParameter("auditFF"));
            ServletContext context = getServletContext();
            RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-auditTrailFF.jsp");
            dispatcher.forward(request, response);
        }

        if (request.getParameter("prs") != null) {
            OutputStream o = response.getOutputStream();
            o.write(UserDAO.viewFFPRS(Integer.parseInt(request.getParameter("prs"))));
            o.flush();
            o.close();
        }

        if (request.getParameter("approve") != null) {

            FF FF = new FF();
            FF = UserDAO.retrieveFFByFFID(Integer.parseInt(request.getParameter("approve")));

            UserDAO.updateStepFF(8, Integer.parseInt(request.getParameter("approve")));

            Notification n2 = new Notification();
            n2.setTitle(UserDAO.getProjectName(Integer.parseInt(request.getParameter("approve"))));
            n2.setBody("Congratulations! Your FF Proposal has been approved!");

            java.util.Date dt = new java.util.Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            n2.setDt(sdf.format(dt));
            n2.setUserID(UserDAO.getFFOwner(Integer.parseInt(request.getParameter("approve"))));

            UserDAO.AddNotification(n2);

            Notification n3 = new Notification();
            n3.setTitle(UserDAO.getProjectName(Integer.parseInt(request.getParameter("approve"))));
            n3.setBody("Php" + FF.getTotalAmount() + " has been deducted to the budget!");
            n3.setDt(sdf.format(dt));
            
            n3.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Vice President for Lasallian Mission"));
            UserDAO.AddNotification(n3);
            n3.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Executive Officer"));
            UserDAO.AddNotification(n3);
            n3.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Sir Jay Position"));
            UserDAO.AddNotification(n3);

            Budget current = new Budget();

            current = UserDAO.getLatestBudget();

            Budget b = new Budget();

            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-mm-dd");
            java.util.Date javaDate = new java.util.Date();
            java.sql.Date sqlDate = new java.sql.Date(javaDate.getTime());

            b.setDate(sqlDate);
            b.setCurrentBudget(current.getRemainingBudget());
            b.setBudgetRequested(FF.getTotalAmount());
            b.setRemainingBudget(current.getRemainingBudget() - FF.getTotalAmount());
            b.setFfID(FF.getId());

            UserDAO.addLatestBudget(b);

            request.setAttribute("successFF1", "You have successfully approved the FF Proposal!");

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

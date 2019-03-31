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
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dino Alcala
 */
public class approveSECancellation extends HttpServlet {

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
            
            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-mm-dd");
            java.util.Date javaDate = new java.util.Date();
            java.sql.Date sqlDate = new java.sql.Date(javaDate.getTime());
            UserDAO UserDAO = new UserDAO();

            SE SE = UserDAO.retrieveSEBySEID(Integer.parseInt(request.getParameter("cancel")));
            if (SE.getSourceOfFunds().equals("OVPLM") && SE.getStep() == 8) {
                Budget b = new Budget();
                b.setCurrentBudget(UserDAO.getLatestBudget().getRemainingBudget());
                b.setBudgetRequested(SE.getTotalAmount() * -1);
                b.setRemainingBudget(b.getCurrentBudget() - b.getBudgetRequested());
                b.setSeID(Integer.parseInt(request.getParameter("cancel")));
                b.setDate(sqlDate);

                UserDAO.addLatestBudget(b);

                java.util.Date dt = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
                java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                Notification n = new Notification();
                n.setBody(UserDAO.getProgramName(Integer.parseInt(request.getParameter("cancel"))) + ": " + SE.getTotalAmount() + " returned" + "\n" + sdf.format(dt));
                n.setTitle("Program Cancelled");
                n.setDt(sdf2.format(dt));
                n.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Vice President for Lasallian Mission"));
                n.setRedirect("/MULTIPLE-viewSEProgramDetails.jsp");
                n.setAttribute(SE.getId());
                UserDAO.AddNotification(n);

                n.setBody(UserDAO.getProgramName(Integer.parseInt(request.getParameter("cancel"))) + ": " + SE.getTotalAmount() + " returned" + "\n" + sdf.format(dt));
                n.setTitle("Program Cancelled");
                n.setDt(sdf2.format(dt));
                n.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Sir Jay Position"));
                n.setRedirect("/MULTIPLE-viewSEProgramDetails.jsp");
                n.setAttribute(SE.getId());
                UserDAO.AddNotification(n);

                request.setAttribute("cancelProgram", "The program has been cancelled! Php" + SE.getTotalAmount() + " returned");
            } else {

                java.util.Date dt = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
                java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                Notification n = new Notification();
                n.setBody("Program: " + UserDAO.getProgramName(Integer.parseInt(request.getParameter("cancel"))) + "\n" + sdf.format(dt));
                n.setTitle("Program Cancelled");
                n.setDt(sdf2.format(dt));
                n.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Vice President for Lasallian Mission"));
                n.setRedirect("/MULTIPLE-viewSEProgramDetails.jsp");
                n.setAttribute(SE.getId());
                UserDAO.AddNotification(n);

                n.setBody("Program: " + UserDAO.getProgramName(Integer.parseInt(request.getParameter("cancel"))) + "\n" + sdf.format(dt));
                n.setTitle("Program Cancelled");
                n.setDt(sdf2.format(dt));
                n.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Sir Jay Position"));
                n.setRedirect("/MULTIPLE-viewSEProgramDetails.jsp");
                n.setAttribute(SE.getId());
                UserDAO.AddNotification(n);

                request.setAttribute("cancelProgram", "The Program has been Cancelled!");
            }

            UserDAO.updateStep(0, Integer.parseInt(request.getParameter("cancel")));
            ServletContext context = getServletContext();
            RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-seProgramsForCancellation.jsp");
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

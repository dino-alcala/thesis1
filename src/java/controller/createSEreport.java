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

            UserDAO UserDAO = new UserDAO();

            if (request.getParameter("seID") != null) {

                request.setAttribute("seID", request.getParameter("seID"));
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-createSEReport.jsp");
                dispatcher.forward(request, response);
            }

            if (request.getParameter("viewReport") != null) {

                request.setAttribute("seID", request.getParameter("viewReport"));
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-viewSEReport.jsp");
                dispatcher.forward(request, response);
            }

            if (request.getParameter("cancelProgram") != null) {

                SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-mm-dd");
                java.util.Date javaDate = new java.util.Date();
                java.sql.Date sqlDate = new java.sql.Date(javaDate.getTime());

                SE SE = UserDAO.retrieveSEBySEID(Integer.parseInt(request.getParameter("cancelProgram")));
                Budget b = new Budget();
                b.setCurrentBudget(UserDAO.getLatestBudget().getRemainingBudget());
                b.setBudgetRequested(SE.getTotalAmount() * -1);
                b.setRemainingBudget(b.getCurrentBudget() - b.getBudgetRequested());
                b.setSeID(Integer.parseInt(request.getParameter("cancelProgram")));
                b.setDate(sqlDate);

                UserDAO.addLatestBudget(b);

                UserDAO.updateStep(0, Integer.parseInt(request.getParameter("cancelProgram")));

                Notification n = new Notification();
                n.setTitle(UserDAO.getProgramName(Integer.parseInt(request.getParameter("cancelProgram"))));
                n.setBody("The program has been cancelled!");

                java.util.Date dt = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                n.setDt(sdf.format(dt));

                n.setUserID(17);

                UserDAO.AddNotification(n);

                request.setAttribute("cancelProgram", "You have successfully canceled the program!");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-socialEngagementProgramsList.jsp");
                dispatcher.forward(request, response);
            }

            if (request.getParameter("updateBudget") != null) {

                request.setAttribute("seID", request.getParameter("updateBudget"));
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-updateUsedBudget.jsp");
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

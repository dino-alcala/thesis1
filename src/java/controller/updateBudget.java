/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.Notification;
import entity.SEexpenses;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author dang
 */
@MultipartConfig(maxFileSize = 16177215)
public class updateBudget extends HttpServlet {

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
            ArrayList<SEexpenses> expenses = new ArrayList();

            for (int i = 0; i < Integer.parseInt(request.getParameter("countexpenses")); i++) {
                SEexpenses SEexpenses = new SEexpenses();
                SEexpenses.setItem(request.getParameter("seitem" + i));
                SEexpenses.setUnitcost(Double.parseDouble(request.getParameter("seunitcost" + i)));
                SEexpenses.setQuantity(Integer.parseInt(request.getParameter("sequantity" + i)));
                SEexpenses.setSubtotal(Double.parseDouble(request.getParameter("sesubtotal" + i)));
                SEexpenses.setAmountUsed(Double.parseDouble(request.getParameter("seamountused" + i)));
                SEexpenses.setSeproposalID(Integer.parseInt(request.getParameter("seID" + i)));
                expenses.add(SEexpenses);
            }

            UserDAO.updateBudgetSE(expenses);

            for (int i = 0; i < Integer.parseInt(request.getParameter("countexpenses")); i++) {
                InputStream inputStream = null;
                Part filePart = request.getPart("uploadreceipt0");
                if (filePart != null) {
                    inputStream = filePart.getInputStream();
                    UserDAO.uploadReceipt(inputStream, Integer.parseInt(request.getParameter("seID0")));
                }
            }

            Notification n = new Notification();
            n.setTitle(UserDAO.getProgramName(Integer.parseInt(request.getParameter("SE"))));
            n.setBody("A portion of the budget has been used!");

            java.util.Date dt = new java.util.Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            n.setDt(sdf.format(dt));

            n.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Vice President for Lasallian Mission"));
            UserDAO.AddNotification(n);
            n.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Executive Officer"));
            UserDAO.AddNotification(n);

            request.setAttribute("updateBudget", "You have successfully updated the Budget!");
            ServletContext context = getServletContext();
            RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-socialEngagementProgramsList.jsp");
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.FFexpenses;
import entity.Notification;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dang
 */
public class updateBudgetFF extends HttpServlet {

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
            ArrayList<FFexpenses> expenses = new ArrayList();

            for (int i = 0; i < Integer.parseInt(request.getParameter("countexpenses")); i++) {
                FFexpenses FFexpenses = new FFexpenses();
                FFexpenses.setItem(request.getParameter("ffitem" + i));
                FFexpenses.setUnitcost(Double.parseDouble(request.getParameter("ffunitcost" + i)));
                FFexpenses.setQuantity(Integer.parseInt(request.getParameter("ffquantity" + i)));
                FFexpenses.setSubtotal(Double.parseDouble(request.getParameter("ffsubtotal" + i)));
                FFexpenses.setAmountUsed(Double.parseDouble(request.getParameter("ffamountused" + i)));
                FFexpenses.setFfproposalID(Integer.parseInt(request.getParameter("ffID" + i)));
                expenses.add(FFexpenses);
            }

            UserDAO.updateBudgetFF(expenses);

            Notification n = new Notification();
            n.setTitle(UserDAO.getProjectName(Integer.parseInt(request.getParameter("FF"))));
            n.setBody("A portion of the budget has been used!");

            java.util.Date dt = new java.util.Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            n.setDt(sdf.format(dt));

            n.setUserID(16);

            UserDAO.AddNotification(n);

            request.setAttribute("updateBudget", "You have successfully updated the Budget!");
            ServletContext context = getServletContext();
            RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-faithFormationProgramsList.jsp");
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

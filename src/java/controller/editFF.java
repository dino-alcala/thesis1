/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.FF;
import entity.FFexpenses;
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
public class editFF extends HttpServlet {

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
            FF FF = new FF();

            if (Double.parseDouble(request.getParameter("total")) == Double.parseDouble(request.getParameter("pbudget"))) {
                FF.setId(Integer.parseInt(request.getParameter("ffID")));
                FF.setProgramHead(request.getParameter("programhead"));
                FF.setActivityClassification(request.getParameter("classification"));
                FF.setProjectName(request.getParameter("pname"));
                FF.setVenue(request.getParameter("pvenue"));
                FF.setSpeaker(request.getParameter("pspeaker"));
                FF.setObjectives(request.getParameter("objectives"));
                FF.setActualDate(Date.valueOf(request.getParameter("actualdate")));
                FF.setTotalAmount(Double.parseDouble(request.getParameter("pbudget")));
                FF.setSourceOfFunds(request.getParameter("funds"));

                if (UserDAO.getStepFF(Integer.parseInt(request.getParameter("ffID"))) == 1 || UserDAO.getStepFF(Integer.parseInt(request.getParameter("ffID"))) == 2 || UserDAO.getStepFF(Integer.parseInt(request.getParameter("ffID"))) == 3 || UserDAO.getStepFF(Integer.parseInt(request.getParameter("ffID"))) == 4) {
                    FF.setStep(1);
                }

                ArrayList<FFexpenses> ffexpense = new ArrayList();

                for (int i = 0; i < Integer.parseInt(request.getParameter("countexpenses")); i++) {
                    FFexpenses FFexpenses = new FFexpenses();
                    FFexpenses.setItem(request.getParameter("ffitem" + i));
                    FFexpenses.setUnitcost(Double.parseDouble(request.getParameter("ffunitcost" + i)));
                    FFexpenses.setQuantity(Integer.parseInt(request.getParameter("ffquantity" + i)));
                    FFexpenses.setSubtotal(Double.parseDouble(request.getParameter("ffsubtotal" + i)));
                    FFexpenses.setDatetime("2001-01-01 00:00:00.0");
                    ffexpense.add(FFexpenses);
                }

                FF.setExpenses(ffexpense);

                session.setAttribute("FF", FF);
                request.setAttribute("ffID", request.getParameter("ffID"));

                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-editFF2.jsp");
                dispatcher.forward(request, response);
                
            } else {
                request.setAttribute("ffID", request.getParameter("ffID"));
                
                request.setAttribute("successFF", "Amount is not equal!");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-editFF.jsp");
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

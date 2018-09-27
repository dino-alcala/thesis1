/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.OvplmDAO;
import entity.Goal;
import entity.KRA;
import entity.Measure;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
public class addKRA extends HttpServlet {

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
            KRA KRA = new KRA();
            OvplmDAO OvplmDAO = new OvplmDAO();

            KRA.setName(request.getParameter("kraname"));
            KRA.setDate(Date.valueOf(request.getParameter("date")));
            KRA.setUserID(Integer.parseInt(session.getAttribute("userID").toString()));

            for (int i = 1; i < 4; i++) {
                Goal g = new Goal();
                g.setName(request.getParameter("goalname" + i));
                g.setGoal(i);

                for (int j = 1; j < Integer.parseInt(request.getParameter("countmeasuregoal" + i)); j++) {
                    System.out.print("Measure size: "+ request.getParameter("countmeasuregoal" + i));
                    Measure m = new Measure();
                    m.setMeasure(Integer.parseInt(request.getParameter("goal" + i + "measure" + j)));
                    m.setTarget(request.getParameter("goal" + i + "target" + j));
                    g.addMeasure(m);
                }

                KRA.addGoal(g);
            }

            OvplmDAO.AddKRA(KRA);

            ServletContext context = getServletContext();
            RequestDispatcher dispatcher = context.getRequestDispatcher("/OVPLM-home.jsp");
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

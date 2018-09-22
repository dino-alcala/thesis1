/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.SEfunds;
import entity.SEobjectives;
import entity.SEreport;
import java.io.IOException;
import java.io.PrintWriter;
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
public class createSEreport3 extends HttpServlet {

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
            SEreport SEreport = new SEreport();

            SEreport = (SEreport) session.getAttribute("SEreport");

            SEreport.setSignificanceProject(request.getParameter("significance"));
            SEreport.setHappenedImplementationProject(request.getParameter("implementation"));
            SEreport.setWhenwhereProject(request.getParameter("whenwhere"));
            SEreport.setParticipantsProject(request.getParameter("whoparticipants"));
            SEreport.setHighlightsProject(request.getParameter("highlights"));

            ArrayList<SEobjectives> objectives = new ArrayList();

            for (int i = 0; i < Integer.parseInt(request.getParameter("countobjectives")); i++) {
                SEobjectives o = new SEobjectives();
                o.setExpectedOutcomes(request.getParameter("expected" + i));
                o.setActualAccomplishment(request.getParameter("actual" + i));
                o.setHinderingFactors(request.getParameter("hinder" + i));
                objectives.add(o);
            }

            SEreport.setObjectives(objectives);

            ArrayList<SEfunds> funds = new ArrayList();

            if (request.getParameter("funds").equals("OVPLM")) {
                for (int i = 0; i < Integer.parseInt(request.getParameter("countovplm")); i++) {
                    SEfunds f = new SEfunds();
                    f.setLineItem(request.getParameter("item" + i));
                    f.setApprovedAmount(Double.parseDouble(request.getParameter("approved" + i)));
                    f.setExpendedAmount(Double.parseDouble(request.getParameter("expended" + i)));
                    f.setVariance(Double.parseDouble(request.getParameter("variance" + i)));
                    f.setReasonVariance(request.getParameter("reason" + i));
                    funds.add(f);
                }
            } else {
                for (int i = 0; i < Integer.parseInt(request.getParameter("countothers")); i++) {
                    SEfunds f = new SEfunds();
                    f.setLineItem(request.getParameter("item" + i));
                    f.setApprovedAmount(Double.parseDouble(request.getParameter("approved" + i)));
                    f.setExpendedAmount(Double.parseDouble(request.getParameter("expended" + i)));
                    f.setVariance(Double.parseDouble(request.getParameter("variance" + i)));
                    f.setReasonVariance(request.getParameter("reason"));
                    funds.add(f);
                }
            }

            SEreport.setFunds(funds);

            session.setAttribute("SEreport", SEreport);
            ServletContext context = getServletContext();
            RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-createSEReport3.jsp");
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

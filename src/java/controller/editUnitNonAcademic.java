/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.Unit;
import java.io.IOException;
import java.io.PrintWriter;
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
public class editUnitNonAcademic extends HttpServlet {

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
            Unit unit = new Unit();

            unit.setUnitID(Integer.parseInt(request.getParameter("unit")));
            unit.setName(request.getParameter("unitname"));
            unit.setHead(request.getParameter("unithead"));
            unit.setCap(Integer.parseInt(request.getParameter("cap")));
            unit.setApsp(Integer.parseInt(request.getParameter("apsp")));
            unit.setAsf(Integer.parseInt(request.getParameter("asf")));
            unit.setFaculty(Integer.parseInt(request.getParameter("faculty")));
            unit.setAdmin(Integer.parseInt(request.getParameter("admin")));
            unit.setDirecthired(Integer.parseInt(request.getParameter("directhired")));
            unit.setIndependent(Integer.parseInt(request.getParameter("independent")));
            unit.setExternal(Integer.parseInt(request.getParameter("external")));
            unit.setDescription(request.getParameter("unitdesc"));
            unit.setActive(1);

            UserDAO.updateUnitNonAcademic(unit);

            request.setAttribute("successSE", "You have successfully edited the unit!");
            ServletContext context = getServletContext();
            RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-unitsList.jsp");
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

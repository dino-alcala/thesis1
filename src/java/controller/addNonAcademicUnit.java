/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.OvplmDAO;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author LA
 */
public class addNonAcademicUnit extends HttpServlet {

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

            Unit unit = new Unit();

            OvplmDAO OvplmDAO = new OvplmDAO();
            UserDAO UserDAO = new UserDAO();

            HttpSession session = request.getSession();

            unit.setName(request.getParameter("unitname"));
            unit.setAbbrev(request.getParameter("abbrev"));
            unit.setHead(request.getParameter("unithead"));
            unit.setDepartments(0);
            unit.setType("Non-Academic");
            unit.setDescription(request.getParameter("unitdescription"));
            unit.setUserID(Integer.parseInt(session.getAttribute("userID").toString()));
            unit.setFaculty(Integer.parseInt(request.getParameter("faculty")));
            unit.setAdmin(Integer.parseInt(request.getParameter("admin")));
            unit.setApsp(Integer.parseInt(request.getParameter("apsp")));
            unit.setAsf(Integer.parseInt(request.getParameter("asf")));
            unit.setCap(Integer.parseInt(request.getParameter("cap")));
            unit.setDirecthired(Integer.parseInt(request.getParameter("direct")));
            unit.setIndependent(Integer.parseInt(request.getParameter("independent")));
            unit.setExternal(Integer.parseInt(request.getParameter("external")));
            
            OvplmDAO.AddNonAcademicUnit(unit);
            
            int unitid = UserDAO.getUnitByName(request.getParameter("unitname")).getUnitID();
            UserDAO.addPositionsNonAcademic(unitid);

            if (session.getAttribute("unit").toString().equals("Office of the Vice President for Lasallian Mission (OVPLM)")) {
                request.setAttribute("success", "You ave successfully added a Non-Academic Unit! The system Admin may now add Users for this unit!");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/OVPLM-home.jsp");
                dispatcher.forward(request, response);
            }
            if (session.getAttribute("unit").toString().equals("Admin")) {
                request.setAttribute("success", "You ave successfully added a Non-Academic Unit!  You may now add Users for this Unit by clicking on  'Add User' in the sidebar");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/ADMIN-home.jsp");
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

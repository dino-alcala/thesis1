/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.OvplmDAO;
import entity.Department;
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
 * @author Dino Alcala
 */
public class addDepartmentAcademic extends HttpServlet {

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
            OvplmDAO OvplmDAO = new OvplmDAO();

            HttpSession session = request.getSession();
            Department d = new Department();
            Unit u = new Unit();

            d.setName(request.getParameter("unitname"));
            d.setFaculty(Integer.parseInt(request.getParameter("faculty")));
            d.setAdmin(Integer.parseInt(request.getParameter("admin")));
            d.setApsp(Integer.parseInt(request.getParameter("apsp")));
            d.setAsf(Integer.parseInt(request.getParameter("asf")));
            d.setCap(Integer.parseInt(request.getParameter("cap")));
            d.setDirecthired(Integer.parseInt(request.getParameter("direct")));
            d.setIndependent(Integer.parseInt(request.getParameter("independent")));
            d.setExternal(Integer.parseInt(request.getParameter("external")));
           
            OvplmDAO.AddDepartment(d, request.getParameter("unit"));
            
            if (session.getAttribute("unit").toString().equals("Office of the Vice President for Lasallian Mission (OVPLM)")) {
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/OVPLM-home.jsp");
                dispatcher.forward(request, response);
            }
            if (session.getAttribute("unit").toString().equals("Admin")) {
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

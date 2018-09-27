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
 * @author dang
 */
public class addAcademicUnit extends HttpServlet {

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
            
            Unit unit = new Unit();

            OvplmDAO OvplmDAO = new OvplmDAO();
            
            HttpSession session = request.getSession();

            unit.setName(request.getParameter("unitname"));
            unit.setHead(request.getParameter("unithead"));
            unit.setDepartments(Integer.parseInt(request.getParameter("numberdept")));
            unit.setStaff(Integer.parseInt(request.getParameter("staff")));
            unit.setFaculty(Integer.parseInt(request.getParameter("faculty")));
            unit.setAdmin(Integer.parseInt(request.getParameter("admin")));
            unit.setApsp(Integer.parseInt(request.getParameter("apsp")));
            unit.setSaf(Integer.parseInt(request.getParameter("saf")));
            unit.setCap(Integer.parseInt(request.getParameter("cap")));
            unit.setStudent(Integer.parseInt(request.getParameter("student")));
            unit.setDescription(request.getParameter("unitdesc"));
            unit.setUserID(Integer.parseInt(session.getAttribute("userID").toString()));
            
            ArrayList<Department> d = new ArrayList();

            for (int i = 0; i < Integer.parseInt(request.getParameter("numberdept")); i++) {
                Department department = new Department();
                department.setName(request.getParameter("department" + i));
                d.add(department);
            }

            OvplmDAO.AddUnit(unit, d);

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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.OvplmDAO;
import dao.UserDAO;
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
            UserDAO UserDAO = new UserDAO();

            HttpSession session = request.getSession();

            unit.setName(request.getParameter("unitname"));
            unit.setAbbrev(request.getParameter("unitabbrev"));
            unit.setHead(request.getParameter("unithead"));
            unit.setDepartments(Integer.parseInt(request.getParameter("numberdept")));
            unit.setType("Academic");
            unit.setDescription(request.getParameter("unitdescription"));
            unit.setUserID(Integer.parseInt(session.getAttribute("userID").toString()));
            unit.setActive(1);

            ArrayList<Department> d = new ArrayList();

            for (int i = 0; i < Integer.parseInt(request.getParameter("numberdept")); i++) {
                Department department = new Department();
                department.setName(request.getParameter("department" + i));
                department.setAbbrev(request.getParameter("unitabbrev") + request.getParameter("abbrev" + i));
                department.setFaculty(Integer.parseInt(request.getParameter("faculty" + i)));
                department.setAdmin(Integer.parseInt(request.getParameter("admin" + i)));
                department.setApsp(Integer.parseInt(request.getParameter("apsp" + i)));
                department.setAsf(Integer.parseInt(request.getParameter("asf" + i)));
                department.setCap(Integer.parseInt(request.getParameter("cap" + i)));
                department.setDirecthired(Integer.parseInt(request.getParameter("direct" + i)));
                department.setIndependent(Integer.parseInt(request.getParameter("independent" + i)));
                department.setExternal(Integer.parseInt(request.getParameter("external" + i)));
                d.add(department);
            }

            OvplmDAO.AddAcademicUnit(unit, d);
            
            ArrayList<Integer> deptid = new ArrayList();
            for (int i = 0; i < Integer.parseInt(request.getParameter("numberdept")); i++) {
                int id = UserDAO.getDepartmentIDByName(d.get(i).getName());
                deptid.add(id);
            }
            int unitid = UserDAO.getUnitByName(request.getParameter("unitname")).getUnitID();
            
            UserDAO.addPositionsAcademic(deptid, unitid);

            if (session.getAttribute("unit").toString().equals("Office of the Vice President for Lasallian Mission (OVPLM)")) {
                request.setAttribute("success", "You ave successfully added an Academic Unit! The system Admin may now add Users for this unit!");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/OVPLM-home.jsp");
                dispatcher.forward(request, response);
            }
            if (session.getAttribute("unit").toString().equals("Admin")) {
                request.setAttribute("success", "You ave successfully added an Academic Unit!  You may now add Users for this Unit by clicking on  'Add User' in the sidebar");
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

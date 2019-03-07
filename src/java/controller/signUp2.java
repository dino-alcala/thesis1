/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.Department;
import entity.Unit;
import entity.User;
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
public class signUp2 extends HttpServlet {

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
            User u = new User();

            u.setFirstName(request.getParameter("firstname"));
            u.setLastName(request.getParameter("lastname"));
            u.setEmail(request.getParameter("email"));
            u.setUnit(request.getParameter("unit"));
            u.setDepartment(Integer.parseInt(request.getParameter("dept")));
            u.setUsername(request.getParameter("username"));
            u.setPassword(request.getParameter("password"));
            
            if(UserDAO.getUnitTypeByName(request.getParameter("unit")).equals("Academic")){
                Unit unit = UserDAO.getUnitByName(request.getParameter("unit"));
                Department d = UserDAO.getDepartmentByID(Integer.parseInt(request.getParameter("dept")));
                u.setPosition(d.getAbbrev() + " - " + request.getParameter("position"));
            } else if(UserDAO.getUnitTypeByName(request.getParameter("unit")).equals("Non-Academic")){
                Unit unit = UserDAO.getUnitByName(request.getParameter("unit"));
                u.setPosition(unit.getAbbrev()+ " - " + request.getParameter("position"));
            }

            UserDAO.signUp(u);

            request.setAttribute("success", "You ave successfully added a New User!");
            ServletContext context = getServletContext();
            RequestDispatcher dispatcher = context.getRequestDispatcher("/ADMIN-home.jsp");
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

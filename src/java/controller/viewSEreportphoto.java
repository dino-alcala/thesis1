/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LA
 */
public class viewSEreportphoto extends HttpServlet {

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
        response.setContentType("image/jpg");

        UserDAO UserDAO = new UserDAO();

        if (request.getParameter("photo") != null) {
            OutputStream o = response.getOutputStream();
            o.write(UserDAO.viewSEPhoto(Integer.parseInt(request.getParameter("photo"))));
            o.flush();
            o.close();
        }

        if (request.getParameter("beneficiariesattendance") != null) {
            OutputStream o = response.getOutputStream();
            o.write(UserDAO.viewSEBeneficiariesAttendance(Integer.parseInt(request.getParameter("beneficiariesattendance"))));
            o.flush();
            o.close();
        }

        if (request.getParameter("dlsuattendance") != null) {
            OutputStream o = response.getOutputStream();
            o.write(UserDAO.viewSEDLSUAttendance(Integer.parseInt(request.getParameter("dlsuattendance"))));
            o.flush();
            o.close();
        }

        if (request.getParameter("beneficiariesletters") != null) {
            OutputStream o = response.getOutputStream();
            o.write(UserDAO.viewSEBeneficiariesLetters(Integer.parseInt(request.getParameter("beneficiariesletters"))));
            o.flush();
            o.close();
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

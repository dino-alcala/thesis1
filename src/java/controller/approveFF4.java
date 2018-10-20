/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.Budget;
import entity.FF;
import entity.Notification;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author LA
 */
@MultipartConfig(maxFileSize = 16177215)
public class approveFF4 extends HttpServlet {

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

            if (request.getParameter("viewAttendees") != null) {
                request.setAttribute("ffID", request.getParameter("viewAttendees"));

                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/SIGNATORIES-approveFFViewAttendeesList.jsp");
                dispatcher.forward(request, response);
            }

            InputStream inputStream = null;
            Part filePart = request.getPart("uploadprs");

            if (request.getParameter("ffID") != null) {
                if (filePart != null) {
                    inputStream = filePart.getInputStream();
                }

                if (request.getPart("uploadprs").getSize() == 0) {
                    request.setAttribute("successFF1", "You have not uploaded any file.");
                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-pendingFFList.jsp");
                    dispatcher.forward(request, response);

                } else if (!(request.getPart("uploadprs").getSize() == 0)) {

                    UserDAO.uploadFFPRS(inputStream, Integer.parseInt(request.getParameter("ffID")));
                    UserDAO.updateStepFF(7, Integer.parseInt(request.getParameter("ffID")));

                    Notification n = new Notification();
                    n.setTitle(UserDAO.getProjectName(Integer.parseInt(request.getParameter("ffID"))));
                    n.setBody("You have new FF Proposal ready for approval!");

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    n.setDt(sdf.format(dt));
                    n.setUserID(UserDAO.getUserIDforPositionNotifs("Vice President for Lasallian Mission"));

                    UserDAO.AddNotification(n);

                    request.setAttribute("successFF1", "You have successfully uploaded the PRS!. It will now be taken to Br. Michael Broughton for approval.");
                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-pendingFFList.jsp");
                    dispatcher.forward(request, response);

                }
            }

            if (request.getParameter("cancelProgram") != null) {

                UserDAO.updateStepFF(0, Integer.parseInt(request.getParameter("cancelProgram")));

                Notification n = new Notification();
                n.setTitle(UserDAO.getProjectName(Integer.parseInt(request.getParameter("cancelProgram"))));
                n.setBody("The program has been cancelled!");

                java.util.Date dt = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                n.setDt(sdf.format(dt));

                n.setUserID(17);

                UserDAO.AddNotification(n);

                request.setAttribute("cancelProgram", "You have successfully canceled the program!");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-pendingFFList.jsp");
                dispatcher.forward(request, response);
            }

            if (request.getParameter("revise") != null) {

                request.setAttribute("ffID", request.getParameter("revise"));
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

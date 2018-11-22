/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.Budget;
import entity.Notification;
import entity.SE;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class approveSE4 extends HttpServlet {

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
            InputStream inputStream = null;
            Part filePart = request.getPart("uploadprs");

            UserDAO UserDAO = new UserDAO();

            if (request.getParameter("auditSE") != null) {

                session.setAttribute("auditSE", request.getParameter("auditSE"));
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-auditTrailSE.jsp");
                dispatcher.forward(request, response);
            }

            if (request.getParameter("seID") != null) {
                if (filePart != null) {
                    inputStream = filePart.getInputStream();
                }

                if (request.getPart("uploadprs").getSize() == 0) {
                    request.setAttribute("successSE1", "You have not uploaded any file.");
                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-pendingSEList.jsp");
                    dispatcher.forward(request, response);

                } else if (!(request.getPart("uploadprs").getSize() == 0)) {

                    UserDAO.uploadPRS(inputStream, Integer.parseInt(request.getParameter("seID")));
                    UserDAO.updateStep(7, Integer.parseInt(request.getParameter("seID")));

                    Notification n = new Notification();
                    n.setTitle(UserDAO.getProgramName(Integer.parseInt(request.getParameter("seID"))));

                    SE SE = UserDAO.retrieveSEBySEID(Integer.parseInt(request.getParameter("seID")));
                    SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-mm-dd");
                    java.util.Date javaDate = new java.util.Date();
                    String input1 = new java.sql.Date(javaDate.getTime()).toString();
                    String input2 = SE.getActualDate().toString();

                    try {
                        java.util.Date date1 = myFormat.parse(input1);
                        java.util.Date date2 = myFormat.parse(input2);
                        long diff = date2.getTime() - date1.getTime();
                        long days = (diff / (1000 * 60 * 60 * 24));

                        if (days <= 14) {
                            n.setBody("URGENT SE PRS ready for approval!!");
                        } else if (days >= 15) {
                            n.setBody("You have new SE PRS ready for approval!");
                        }
                    } catch (ParseException ex) {
                        Logger.getLogger(addSE2.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    n.setDt(sdf.format(dt));
                    n.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Vice President for Lasallian Mission"));

                    UserDAO.AddNotification(n);

                    request.setAttribute("successSE1", "You have successfully uploaded the PRS!. It will now be taken to Br. Michael Broughton for approval.");
                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-pendingSEList.jsp");
                    dispatcher.forward(request, response);
                }

            }

            if (request.getParameter("cancelProgram") != null) {
                
                SE SE = UserDAO.retrieveSEBySEID(Integer.parseInt(request.getParameter("cancelProgram")));
                UserDAO.updateStep(0, Integer.parseInt(request.getParameter("cancelProgram")));

                Notification n = new Notification();
                n.setTitle(UserDAO.getProgramName(Integer.parseInt(request.getParameter("cancelProgram"))));
                n.setBody("The program has been cancelled! Php" + SE.getTotalAmount() + " returned");

                java.util.Date dt = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                n.setDt(sdf.format(dt));

                n.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Vice President for Lasallian Mission (OVPLM)"));
                UserDAO.AddNotification(n);
                n.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Executive Officer"));
                UserDAO.AddNotification(n);
                n.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Sir Jay Position"));
                UserDAO.AddNotification(n);

                request.setAttribute("cancelProgram", "You have successfully canceled the program!");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-pendingSEList.jsp");
                dispatcher.forward(request, response);
            }

            if (request.getParameter("revise") != null) {

                request.setAttribute("seID", request.getParameter("revise"));
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-editSE.jsp");
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

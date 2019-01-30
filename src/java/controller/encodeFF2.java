/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.Budget;
import entity.FF;
import entity.FFattendees;
import entity.Notification;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
public class encodeFF2 extends HttpServlet {

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
            FF FF;
            UserDAO UserDAO = new UserDAO();

            FF = (FF) session.getAttribute("FF");

            ArrayList<FFattendees> attendees = new ArrayList();

            for (int i = 0; i < Integer.parseInt(request.getParameter("countattendees")); i++) {
                FFattendees FFattendees = new FFattendees();
                FFattendees.setName(request.getParameter("attendee" + i));
                FFattendees.setEmail(request.getParameter("email" + i));
                attendees.add(FFattendees);
            }

            FF.setAttendees(attendees);
            FF.setUnittype(UserDAO.getUnitTypeByName(session.getAttribute("unit").toString()));
            FF.setStep(8);
            FF.setStudentorg(1);

            UserDAO.AddFF(FF);

            if (FF.getSourceOfFunds().equals("OVPLM")) {

                Budget current = new Budget();

                current = UserDAO.getLatestBudget();

                Budget b = new Budget();

                SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-mm-dd");
                java.util.Date javaDate = new java.util.Date();
                java.sql.Date sqlDate = new java.sql.Date(javaDate.getTime());

                b.setDate(sqlDate);
                b.setCurrentBudget(current.getRemainingBudget());
                b.setBudgetRequested(FF.getTotalAmount());
                b.setRemainingBudget(current.getRemainingBudget() - FF.getTotalAmount());
                b.setSeID(FF.getId());

                UserDAO.addLatestBudget(b);
                
                java.util.Date dt = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
                java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                Notification n3 = new Notification();
                n3.setTitle(UserDAO.getProjectName(FF.getId()));
                n3.setBody("New Student Org SE Proposal! Php" + FF.getTotalAmount() + " has been deducted to the budget! \n " + sdf.format(dt));
                n3.setDt(sdf2.format(dt));
                n3.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Vice President for Lasallian Mission"));
                UserDAO.AddNotification(n3);

                n3.setTitle(UserDAO.getProjectName(FF.getId()));
                n3.setBody("New Student Org SE Proposal! Php" + FF.getTotalAmount() + " has been deducted to the budget! \n " + sdf.format(dt));
                n3.setDt(sdf2.format(dt));
                n3.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Executive Officer"));
                UserDAO.AddNotification(n3);

                n3.setTitle(UserDAO.getProjectName(FF.getId()));
                n3.setBody("New Student Org SE Proposal! Php" + FF.getTotalAmount() + " has been deducted to the budget! \n " + sdf.format(dt));
                n3.setDt(sdf2.format(dt));
                n3.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Sir Jay Position"));
                UserDAO.AddNotification(n3);
                
            } else {
                java.util.Date dt = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
                java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                Notification n3 = new Notification();
                n3.setTitle(UserDAO.getProjectName(FF.getId()));
                n3.setBody("A New Student Org SE Proposal has been Encoded! \n " + sdf.format(dt));
                n3.setDt(sdf2.format(dt));

                n3.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Vice President for Lasallian Mission"));
                UserDAO.AddNotification(n3);

                n3.setTitle(UserDAO.getProjectName(FF.getId()));
                n3.setBody("A New Student Org SE Proposal has been Encoded! \n " + sdf.format(dt));
                n3.setDt(sdf2.format(dt));
                n3.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Executive Officer"));
                UserDAO.AddNotification(n3);

                n3.setTitle(UserDAO.getProjectName(FF.getId()));
                n3.setBody("A New Student Org SE Proposal has been Encoded! \n " + sdf.format(dt));
                n3.setDt(sdf2.format(dt));
                n3.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Sir Jay Position"));
                UserDAO.AddNotification(n3);
            }
            
                request.setAttribute("successSE", "You have successfully encoded a Student Org FF Proposal!");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/DSA-home.jsp");
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

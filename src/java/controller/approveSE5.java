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
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class approveSE5 extends HttpServlet {

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
        HttpSession session = request.getSession();

        if (request.getParameter("auditSE") != null) {

            session.setAttribute("auditSE", request.getParameter("auditSE"));
            ServletContext context = getServletContext();
            RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-auditTrailSE.jsp");
            dispatcher.forward(request, response);
        }

        if (request.getParameter("prs") != null) {
            OutputStream o = response.getOutputStream();
            o.write(UserDAO.viewPRS(Integer.parseInt(request.getParameter("prs"))));
            o.flush();
            o.close();
        }

        if (request.getParameter("approve") != null) {

            SE SE = UserDAO.retrieveSEBySEID(Integer.parseInt(request.getParameter("approve")));

            UserDAO.updateStep(8, Integer.parseInt(request.getParameter("approve")));

            java.util.Date dt = new java.util.Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
            java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            Notification n2 = new Notification();
            n2.setBody("Program: " + UserDAO.getProgramName(Integer.parseInt(request.getParameter("approve"))) + "\n" + sdf.format(dt));

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
                    n2.setTitle("Urguent SE Proposal Approved");
                } else if (days >= 15) {
                    n2.setTitle("SE Proposal Approved");
                }
            } catch (ParseException ex) {
                Logger.getLogger(addSE2.class.getName()).log(Level.SEVERE, null, ex);
            }

            n2.setDt(sdf2.format(dt));
            n2.setUserID(UserDAO.getSEOwner(Integer.parseInt(request.getParameter("approve"))));
            n2.setRedirect("/MULTIPLE-viewPendigSEProgramDetails.jsp");
            n2.setAttribute(SE.getId());
            UserDAO.AddNotification(n2);

            Notification n3 = new Notification();
            n3.setBody("Program: " + UserDAO.getProgramName(Integer.parseInt(request.getParameter("approve"))) + ": Php" + SE.getTotalAmount() + " has been deducted to the budget" + "\n" + sdf.format(dt));
            n3.setTitle("Program Approved");
            n3.setDt(sdf2.format(dt));
            n3.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Vice President for Lasallian Mission"));
            n3.setRedirect("/MULTIPLE-viewSEProgramDetails.jsp");
            n3.setAttribute(SE.getId());
            UserDAO.AddNotification(n3);

            n3.setBody("Program: " + UserDAO.getProgramName(Integer.parseInt(request.getParameter("approve"))) + ": Php" + SE.getTotalAmount() + " has been deducted to the budget" + "\n" + sdf.format(dt));
            n3.setTitle("Program Approved");
            n3.setDt(sdf2.format(dt));
            n3.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Executive Officer"));
            n3.setRedirect("/MULTIPLE-viewSEProgramDetails.jsp");
            n3.setAttribute(SE.getId());
            UserDAO.AddNotification(n3);

            n3.setBody("Program: " + UserDAO.getProgramName(Integer.parseInt(request.getParameter("approve"))) + ": Php" + SE.getTotalAmount() + " has been deducted to the budget" + "\n" + sdf.format(dt));
            n3.setTitle("Program Approved");
            n3.setDt(sdf2.format(dt));
            n3.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Sir Jay Position"));
            n3.setRedirect("/MULTIPLE-viewSEProgramDetails.jsp");
            n3.setAttribute(SE.getId());
            UserDAO.AddNotification(n3);

            Budget current = new Budget();

            current = UserDAO.getLatestBudget();

            Budget b = new Budget();

            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-mm-dd");
            javaDate = new java.util.Date();
            java.sql.Date sqlDate = new java.sql.Date(javaDate.getTime());

            b.setDate(sqlDate);
            b.setCurrentBudget(current.getRemainingBudget());
            b.setBudgetRequested(SE.getTotalAmount());
            b.setRemainingBudget(current.getRemainingBudget() - SE.getTotalAmount());
            b.setSeID(SE.getId());

            UserDAO.addLatestBudget(b);

            request.setAttribute("successSE1", "You have successfully approved the SE Proposal!");

            ServletContext context = getServletContext();
            RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-seProgramsForApproval.jsp");
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

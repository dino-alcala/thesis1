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
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
public class createFFreport extends HttpServlet {

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

            if (request.getParameter("auditFF") != null) {

                session.setAttribute("auditFF", request.getParameter("auditFF"));
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-auditTrailFF.jsp");
                dispatcher.forward(request, response);
            } else if (request.getParameter("viewAttendees") != null) {
                request.setAttribute("ffID", request.getParameter("viewAttendees"));

                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/SIGNATORIES-approveFFViewAttendeesList.jsp");
                dispatcher.forward(request, response);
            } else if (request.getParameter("ffID") != null) {

                request.setAttribute("ffID", request.getParameter("ffID"));
                ServletContext context = getServletContext();
                FF FF = UserDAO.retrieveFFByFFID(Integer.parseInt(request.getParameter("ffID")));

                if (FF.getStudentorg() == 1) {
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/DSA-encodeFFReport.jsp");
                    dispatcher.forward(request, response);
                } else if (FF.getStudentorg() != 1) {
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-createFFReport.jsp");
                    dispatcher.forward(request, response);
                }
            } else if (request.getParameter("attendance") != null){
                
                request.setAttribute("ffID", request.getParameter("attendance"));
                ServletContext context = getServletContext();
                FF FF = UserDAO.retrieveFFByFFID(Integer.parseInt(request.getParameter("attendance")));
                session.setAttribute("FF", FF);
                
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-createFFAttendanceSheet.jsp");
                dispatcher.forward(request, response);
                
            } else if (request.getParameter("viewReport") != null) {

                request.setAttribute("ffID", request.getParameter("viewReport"));
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-viewFFReport.jsp");
                dispatcher.forward(request, response);
            } else if (request.getParameter("cancelProgram") != null) {

                SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-mm-dd");
                java.util.Date javaDate = new java.util.Date();
                java.sql.Date sqlDate = new java.sql.Date(javaDate.getTime());

                FF FF = UserDAO.retrieveFFByFFID(Integer.parseInt(request.getParameter("cancelProgram")));
                if (FF.getStep() <= 9 && FF.getStep() >= 8 && FF.getSourceOfFunds().equals("OVPLM")) {
                    Budget b = new Budget();
                    b.setCurrentBudget(UserDAO.getLatestBudget().getRemainingBudget());
                    b.setBudgetRequested(FF.getTotalAmount() * -1);
                    b.setRemainingBudget(b.getCurrentBudget() - b.getBudgetRequested());
                    b.setFfID(Integer.parseInt(request.getParameter("cancelProgram")));
                    b.setDate(sqlDate);

                    UserDAO.addLatestBudget(b);
                    
                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
                    java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    Notification n = new Notification();
                    n.setTitle(UserDAO.getProjectName(Integer.parseInt(request.getParameter("cancelProgram"))));
                    n.setBody("The program has been cancelled! Php" + FF.getTotalAmount() + " returned \n " + sdf.format(dt));
                    n.setDt(sdf2.format(dt));
                    n.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Vice President for Lasallian Mission"));
                    UserDAO.AddNotification(n);
                    
                    n.setTitle(UserDAO.getProjectName(Integer.parseInt(request.getParameter("cancelProgram"))));
                    n.setBody("The program has been cancelled! Php" + FF.getTotalAmount() + " returned \n " + sdf.format(dt));
                    n.setDt(sdf2.format(dt));
                    n.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Executive Officer"));
                    UserDAO.AddNotification(n);
                    
                    n.setTitle(UserDAO.getProjectName(Integer.parseInt(request.getParameter("cancelProgram"))));
                    n.setBody("The program has been cancelled! Php" + FF.getTotalAmount() + " returned \n " + sdf.format(dt));
                    n.setDt(sdf2.format(dt));
                    n.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Sir Jay Position"));
                    UserDAO.AddNotification(n);
                } else {
                    
                    java.util.Date dt = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
                    java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    
                    Notification n = new Notification();
                    n.setTitle(UserDAO.getProjectName(Integer.parseInt(request.getParameter("cancelProgram"))));
                    n.setBody("The program has been cancelled! \n " + sdf.format(dt));
                    n.setDt(sdf2.format(dt));
                    n.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Vice President for Lasallian Mission"));
                    UserDAO.AddNotification(n);
                    
                    n.setTitle(UserDAO.getProjectName(Integer.parseInt(request.getParameter("cancelProgram"))));
                    n.setBody("The program has been cancelled! \n " + sdf.format(dt));
                    n.setDt(sdf2.format(dt));
                    n.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Executive Officer"));
                    UserDAO.AddNotification(n);
                    
                    n.setTitle(UserDAO.getProjectName(Integer.parseInt(request.getParameter("cancelProgram"))));
                    n.setBody("The program has been cancelled! \n " + sdf.format(dt));
                    n.setDt(sdf2.format(dt));
                    n.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Sir Jay Position"));
                    UserDAO.AddNotification(n);
                }

                UserDAO.updateStepFF(0, Integer.parseInt(request.getParameter("cancelProgram")));
                request.setAttribute("cancelProgram", "You have successfully canceled the program!");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-faithFormationProgramsList.jsp");
                dispatcher.forward(request, response);
            } else if (request.getParameter("updateBudget") != null) {

                request.setAttribute("ffID", request.getParameter("updateBudget"));
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-updateUsedBudgetFF.jsp");
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

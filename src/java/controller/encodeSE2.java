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
import entity.SEexpenses;
import entity.SEresponsible;
import entity.SEworkplan;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
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
 * @author Dino Alcala
 */
public class encodeSE2 extends HttpServlet {

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
            HttpSession session = request.getSession();
            SE SE;
            UserDAO UserDAO = new UserDAO();

            SE = (SE) session.getAttribute("SE");

            if (Double.parseDouble(request.getParameter("total")) == SE.getTotalAmount()) {
                ArrayList<SEworkplan> sework = new ArrayList();

                for (int i = 0; i < Integer.parseInt(request.getParameter("countproject")); i++) {
                    SEworkplan SEworkplan = new SEworkplan();
                    SEworkplan.setDate(Date.valueOf(request.getParameter("date" + i)));
                    SEworkplan.setActivity(request.getParameter("activity" + i));
                    SEworkplan.setTimestarttimeend(request.getParameter("time" + i));
                    SEworkplan.setTimestarttimeend2(request.getParameter("timeend" + i));
                    SEworkplan.setVenue(request.getParameter("venue" + i));
                    sework.add(SEworkplan);
                }

                SE.setWorkplan(sework);

                ArrayList<SEexpenses> seexpense = new ArrayList();

                for (int i = 0; i < Integer.parseInt(request.getParameter("countexpenses")); i++) {
                    SEexpenses SEexpenses = new SEexpenses();
                    SEexpenses.setItem(request.getParameter("seitem" + i));
                    SEexpenses.setUnitcost(Double.parseDouble(request.getParameter("seunitcost" + i)));
                    SEexpenses.setQuantity(Integer.parseInt(request.getParameter("sequantity" + i)));
                    SEexpenses.setSubtotal(Double.parseDouble(request.getParameter("sesubtotal" + i)));
                    seexpense.add(SEexpenses);
                }

                SE.setExpenses(seexpense);

                SE.setTotalpopulationAcademicStaff(Integer.parseInt(request.getParameter("seacademictotal")));
                SE.setExpectedAcademicStaff(Integer.parseInt(request.getParameter("seacademicexpected")));
                SE.setTotalpopulationSupportStaff(Integer.parseInt(request.getParameter("sesupporttotal")));
                SE.setExpectedSupportStaff(Integer.parseInt(request.getParameter("sesupportexpected")));
                SE.setTotalpopulationUndergraduate(Integer.parseInt(request.getParameter("seundergraduatetotal")));
                SE.setExpectedUndergraduate(Integer.parseInt(request.getParameter("seundergraduateexpected")));
                SE.setTotalPopulationGraduate(Integer.parseInt(request.getParameter("segraduatetotal")));
                SE.setExpectedGraduate(Integer.parseInt(request.getParameter("segraduateexpected")));
                SE.setUnittype(UserDAO.getUnitTypeByName(UserDAO.getUnitByUserID(Integer.parseInt(session.getAttribute("userID").toString()))));
                SE.setStudentorg(1);
                SE.setStep(8);

                ArrayList<SEresponsible> seresponsible = new ArrayList();

                for (int i = 0; i < Integer.parseInt(request.getParameter("countresponsible")); i++) {
                    SEresponsible SEresponsible = new SEresponsible();
                    SEresponsible.setName(request.getParameter("responsiblename" + i));
                    SEresponsible.setEmail(request.getParameter("responsibleemail" + i));
                    seresponsible.add(SEresponsible);
                }

                SE.setResponsible(seresponsible);

                UserDAO.AddSE(SE);

                ArrayList<Integer> measureID = (ArrayList) session.getAttribute("measureID");

                UserDAO.AddMeasures(measureID);

                if (SE.getSourceOfFunds().equals("OVPLM")) {

                    Budget current = new Budget();

                    current = UserDAO.getLatestBudget();

                    Budget b = new Budget();

                    SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-mm-dd");
                    java.util.Date javaDate = new java.util.Date();
                    java.sql.Date sqlDate = new java.sql.Date(javaDate.getTime());

                    b.setDate(sqlDate);
                    b.setCurrentBudget(current.getRemainingBudget());
                    b.setBudgetRequested(SE.getTotalAmount());
                    b.setRemainingBudget(current.getRemainingBudget() - SE.getTotalAmount());
                    b.setSeID(SE.getId());

                    UserDAO.addLatestBudget(b);
                }

                java.util.Date dt = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                Notification n3 = new Notification();
                n3.setTitle(UserDAO.getProgramName(SE.getId()));
                n3.setBody("Php" + SE.getTotalAmount() + " has been deducted to the budget!");
                n3.setDt(sdf.format(dt));

                n3.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Vice President for Lasallian Mission"));
                UserDAO.AddNotification(n3);

                n3.setTitle(UserDAO.getProgramName(SE.getId()));
                n3.setBody("Php" + SE.getTotalAmount() + " has been deducted to the budget!");
                n3.setDt(sdf.format(dt));
                n3.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Executive Officer"));
                UserDAO.AddNotification(n3);

                n3.setTitle(UserDAO.getProgramName(SE.getId()));
                n3.setBody("Php" + SE.getTotalAmount() + " has been deducted to the budget!");
                n3.setDt(sdf.format(dt));
                n3.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Sir Jay Position"));
                UserDAO.AddNotification(n3);

                request.setAttribute("successSE", "You have successfully encoded a Student Org SE Proposal!");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/DSA-home.jsp");
                dispatcher.forward(request, response);

            } else if (Double.parseDouble(request.getParameter("total")) != SE.getTotalAmount()) {
                request.setAttribute("successSE", "Amount is not equal!");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/DSA-encodeSE2.jsp");
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.Notification;
import entity.SE;
import entity.SEexpenses;
import entity.SEresponsible;
import entity.SEworkplan;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
 * @author LA
 */
public class addSE2 extends HttpServlet {

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
            SE SE;
            UserDAO UserDAO = new UserDAO();

            SE = (SE) session.getAttribute("SE");

            ArrayList<SEworkplan> sework = new ArrayList();

            for (int i = 0; i < Integer.parseInt(request.getParameter("countproject")); i++) {
                SEworkplan SEworkplan = new SEworkplan();
                SEworkplan.setDate(Date.valueOf(request.getParameter("date" + i)));
                SEworkplan.setActivity(request.getParameter("activity" + i));
                SEworkplan.setTimestarttimeend(request.getParameter("time" + i));
                SEworkplan.setTimestarttimeend2(request.getParameter("timeend"+i));
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
            SE.setStep(1);

            ArrayList<SEresponsible> seresponsible = new ArrayList();

            for (int i = 0; i < Integer.parseInt(request.getParameter("countresponsible")); i++) {
                SEresponsible SEresponsible = new SEresponsible();
                SEresponsible.setName(request.getParameter("responsiblename" + i));
                SEresponsible.setEmail(request.getParameter("responsibleemail" + i));
                seresponsible.add(SEresponsible);
            }

            SE.setResponsible(seresponsible);

            UserDAO.AddSE(SE);
            
            Notification n = new Notification();
            n.setTitle(SE.getName());
            n.setBody("You have new SE Proposal ready for approval!");
            
            java.util.Date dt = new java.util.Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            
            n.setDt(sdf.format(dt));
            n.setUserID(13);
            
            UserDAO.AddNotification(n);

            if (session.getAttribute("unit").toString().equals("Office of the Vice President for Lasallian Mission (OVPLM)")) {
                
                request.setAttribute("successSE", "You have successfully submitted your SE Proposal!");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/OVPLM-home.jsp");
                dispatcher.forward(request, response);
            }
            
            if(session.getAttribute("unit").toString().equals("College of Computer Studies (CCS)")|| (session.getAttribute("unit").toString().equals("Br. Andrew Gonzales College of Education")) || (session.getAttribute("unit").toString().equals("College of Law")) || (session.getAttribute("unit").toString().equals("College of Liberal Arts"))
                    || (session.getAttribute("unit").toString().equals("College of Science")) || (session.getAttribute("unit").toString().equals("Gokongwei College of Engineering (GCOE)")) || (session.getAttribute("unit").toString().equals("Ramon V. Del Rosario College of Business (RVRCOB)")) || (session.getAttribute("unit").toString().equals("School of Economics (SOE)"))){
                
                request.setAttribute("successSE", "You have successfully submitted your SE Proposal!");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/UR-home.jsp");
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

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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.concurrent.TimeUnit;
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
                    SEexpenses.setDatetime("2001-01-01 00:00:00.0");
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

                ArrayList<Integer> measureID = (ArrayList) session.getAttribute("measureID");

                UserDAO.AddMeasures(measureID);

                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
                java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                java.util.Date dt = new java.util.Date();
                
                Notification n = new Notification();
                n.setBody("Program: " + SE.getName() + "\n" + sdf.format(dt));

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
                        n.setTitle("Urgent SE Proposal ready for Approval");
                    } else if (days >= 15) {
                        n.setTitle("SE Proposal ready for approval");
                    }
                } catch (ParseException ex) {
                    Logger.getLogger(addSE2.class.getName()).log(Level.SEVERE, null, ex);
                }

                n.setDt(sdf2.format(dt));

                if (SE.getUnittype().equals("Academic")) {
                    n.setUserID(UserDAO.getUserIDforNotifsDepartmentChair(SE.getUnit(), UserDAO.getDepartmentIDByUserID(Integer.parseInt(session.getAttribute("userID").toString()))));
                } else if (SE.getUnittype().equals("Non-Academic")) {
                    n.setUserID(UserDAO.getUserIDforNotifsUnitChair(SE.getUnit()));
                }

                n.setRedirect("/SIGNATORIES-approveSEProposal.jsp");
                n.setAttribute(UserDAO.retrieveLatestSEID());
                UserDAO.AddNotification(n);

                if (session.getAttribute("unit").toString().equals("Office of the Vice President for Lasallian Mission (OVPLM)")) {
                    try {
                        java.util.Date date1 = myFormat.parse(input1);
                        java.util.Date date2 = myFormat.parse(input2);
                        long diff = date2.getTime() - date1.getTime();
                        long days = (diff / (1000 * 60 * 60 * 24));

                        if (days <= 14) {
                            request.setAttribute("successSE", "You have successfully submitted an URGENT SE Proposal! Target implementation date is less than 14 days from now.");
                        } else if (days >= 15) {
                            request.setAttribute("successSE", "You have successfully submitted your SE Proposal!");
                        }
                    } catch (ParseException ex) {
                        Logger.getLogger(addSE2.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/OVPLM-home.jsp");
                    dispatcher.forward(request, response);
                } else if (session.getAttribute("unit").equals("Center for Social Concern and Action (COSCA)")) {
                    try {
                        java.util.Date date1 = myFormat.parse(input1);
                        java.util.Date date2 = myFormat.parse(input2);
                        long diff = date2.getTime() - date1.getTime();
                        long days = (diff / (1000 * 60 * 60 * 24));

                        if (days <= 14) {
                            request.setAttribute("successSE", "You have successfully submitted an URGENT SE Proposal! Target implementation date is less than 14 days from now.");
                        } else if (days >= 15) {
                            request.setAttribute("successSE", "You have successfully submitted your SE Proposal!");
                        }
                    } catch (ParseException ex) {
                        Logger.getLogger(addSE2.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/COSCA-home.jsp");
                    dispatcher.forward(request, response);

                } else if (session.getAttribute("position").equals("Lasallian Pastoral Office (LSPO)")) {
                    try {
                        java.util.Date date1 = myFormat.parse(input1);
                        java.util.Date date2 = myFormat.parse(input2);
                        long diff = date2.getTime() - date1.getTime();
                        long days = (diff / (1000 * 60 * 60 * 24));

                        if (days <= 14) {
                            request.setAttribute("successSE", "You have successfully submitted an URGENT SE Proposal! Target implementation date is less than 14 days from now.");
                        } else if (days >= 15) {
                            request.setAttribute("successSE", "You have successfully submitted your SE Proposal!");
                        }
                    } catch (ParseException ex) {
                        Logger.getLogger(addSE2.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/LSPO-home.jsp");
                    dispatcher.forward(request, response);

                } else if (session.getAttribute("position").equals("Dean of Student Affairs (DSA)")) {
                    try {
                        java.util.Date date1 = myFormat.parse(input1);
                        java.util.Date date2 = myFormat.parse(input2);
                        long diff = date2.getTime() - date1.getTime();
                        long days = (diff / (1000 * 60 * 60 * 24));

                        if (days <= 14) {
                            request.setAttribute("successSE", "You have successfully submitted an URGENT SE Proposal! Target implementation date is less than 14 days from now.");
                        } else if (days >= 15) {
                            request.setAttribute("successSE", "You have successfully submitted your SE Proposal!");
                        }
                    } catch (ParseException ex) {
                        Logger.getLogger(addSE2.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/DSA-home.jsp");
                    dispatcher.forward(request, response);

                } else if (session.getAttribute("position").equals("Laguna Campus Lasallian Mission (LCLM)")) {
                    try {
                        java.util.Date date1 = myFormat.parse(input1);
                        java.util.Date date2 = myFormat.parse(input2);
                        long diff = date2.getTime() - date1.getTime();
                        long days = (diff / (1000 * 60 * 60 * 24));

                        if (days <= 14) {
                            request.setAttribute("successSE", "You have successfully submitted an URGENT SE Proposal! Target implementation date is less than 14 days from now.");
                        } else if (days >= 15) {
                            request.setAttribute("successSE", "You have successfully submitted your SE Proposal!");
                        }
                    } catch (ParseException ex) {
                        Logger.getLogger(addSE2.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/LCLM-home.jsp");
                    dispatcher.forward(request, response);

                } else if (session.getAttribute("position").toString().contains("ADEALM")) {
                    try {
                        java.util.Date date1 = myFormat.parse(input1);
                        java.util.Date date2 = myFormat.parse(input2);
                        long diff = date2.getTime() - date1.getTime();
                        long days = (diff / (1000 * 60 * 60 * 24));

                        if (days <= 14) {
                            request.setAttribute("successSE", "You have successfully submitted an URGENT SE Proposal! Target implementation date is less than 14 days from now.");
                        } else if (days >= 15) {
                            request.setAttribute("successSE", "You have successfully submitted your SE Proposal!");
                        }
                    } catch (ParseException ex) {
                        Logger.getLogger(addSE2.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/ADEALM-home.jsp");
                    dispatcher.forward(request, response);
                } else {
                    try {
                        java.util.Date date1 = myFormat.parse(input1);
                        java.util.Date date2 = myFormat.parse(input2);
                        long diff = date2.getTime() - date1.getTime();
                        long days = (diff / (1000 * 60 * 60 * 24));

                        if (days <= 14) {
                            request.setAttribute("successSE", "You have successfully submitted an URGENT SE Proposal! Target implementation date is less than 14 days from now.");
                        } else if (days >= 15) {
                            request.setAttribute("successSE", "You have successfully submitted your SE Proposal!");
                        }
                    } catch (ParseException ex) {
                        Logger.getLogger(addSE2.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/UR-home.jsp");
                    dispatcher.forward(request, response);

                }
            } else if (Double.parseDouble(request.getParameter("total")) != SE.getTotalAmount()) {
                request.setAttribute("successSE", "Amount is not equal!");
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-createSE2.jsp");
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.SE;
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
public class editSE extends HttpServlet {

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
            HttpSession session = request.getSession();
            SE SE = new SE();

            SE.setId(Integer.parseInt(request.getParameter("seID")));
            SE.setName(request.getParameter("programname"));
            SE.setProgramHead(request.getParameter("programhead"));
            SE.setActivityClassification(request.getParameter("classification"));
            SE.setTargetCommunity(Integer.parseInt(request.getParameter("community")));
            SE.setTargetKRA(Integer.parseInt(request.getParameter("kra")));
            SE.setTargetGoal(Integer.parseInt(request.getParameter("goal")));
            SE.setActualDate(Date.valueOf(request.getParameter("actualdate")));
            SE.setTotalAmount(Double.parseDouble(request.getParameter("totalamount")));
            SE.setSocialCommunityProblem(request.getParameter("problemaddressed"));
            SE.setNameSEbeneficiaries(request.getParameter("partnername"));
            SE.setAddressSEbeneficiaries(request.getParameter("partneraddress"));
            SE.setContactPersonSEbeneficiaries(request.getParameter("partnercontact"));
            SE.setMobileSEbeneficiaries(request.getParameter("partnernumber"));
            SE.setEmailSEbeneficiaries(request.getParameter("partneremail"));
            SE.setDescriptionSEbeneficiaries(request.getParameter("partnerdescription"));
            SE.setObjectives(request.getParameter("measureableoutcome"));
            SE.setSourceOfFunds(request.getParameter("funds"));

            if (UserDAO.getStep(Integer.parseInt(request.getParameter("seID"))) == 1 || UserDAO.getStep(Integer.parseInt(request.getParameter("seID"))) == 2 || UserDAO.getStep(Integer.parseInt(request.getParameter("seID"))) == 3 || UserDAO.getStep(Integer.parseInt(request.getParameter("seID"))) == 4) {
                SE.setStep(1);
            }

            String[] component;
            ArrayList<String> components = new ArrayList();

            component = request.getParameterValues("component");

            if (component != null) {
                for (int i = 0; i < component.length; i++) {
                    if (component[i].equals("Others")) {
                        components.add(request.getParameter("otherscomponent"));
                    } else {
                        components.add(component[i]);
                    }
                }
            }

            ArrayList<Integer> measureID = new ArrayList();
            
            measureID.add(Integer.parseInt(request.getParameter("measure")));

            if (Integer.parseInt(request.getParameter("measure2")) != 0) {
                measureID.add(Integer.parseInt(request.getParameter("measure2")));
            }

            if (Integer.parseInt(request.getParameter("measure3")) != 0) {
                measureID.add(Integer.parseInt(request.getParameter("measure3")));
            }

            SE.setExplanation(request.getParameter("sustainabilityexplanation"));
            SE.setComponent(components);

            session.setAttribute("SE", SE);
            request.setAttribute("seID", request.getParameter("seID"));
            session.setAttribute("measureID", measureID);

            ServletContext context = getServletContext();
            RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-editSE2.jsp");
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

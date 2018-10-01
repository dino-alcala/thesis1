/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
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
public class login extends HttpServlet {

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

            User u = new User();

            u.setUsername(request.getParameter("username"));
            u.setPassword(request.getParameter("password"));

            HttpSession session = request.getSession();

            if (UserDAO.Login(u)) {
                if (UserDAO.isAdmin(u.getUsername())) {
                    int id = UserDAO.getIDbyUsername(u.getUsername());
                    session.setAttribute("userID", id);
                    session.setAttribute("unit", "Admin");

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/ADMIN-home.jsp");
                    dispatcher.forward(request, response);
                } else if (UserDAO.isOVPLM(u.getUsername())) {

                    int id = UserDAO.getIDbyUsername(u.getUsername());
                    session.setAttribute("userID", id);
                    session.setAttribute("unit", "Office of the Vice President for Lasallian Mission (OVPLM)");

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/OVPLM-home.jsp");
                    dispatcher.forward(request, response);
                } else if (UserDAO.isLSPO(u.getUsername())) {

                    int id = UserDAO.getIDbyUsername(u.getUsername());
                    session.setAttribute("userID", id);
                    session.setAttribute("unit", "Lasallian Pastoral Office (LSPO)");

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/LSPO-home.jsp");
                    dispatcher.forward(request, response);
                } else if (UserDAO.isLMD(u.getUsername())) {

                    int id = UserDAO.getIDbyUsername(u.getUsername());
                    session.setAttribute("userID", id);
                    session.setAttribute("unit", "Lasallian Mission Director");

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/LMD-home.jsp");
                    dispatcher.forward(request, response);
                } else if (UserDAO.isLCLM(u.getUsername())) {

                    int id = UserDAO.getIDbyUsername(u.getUsername());
                    session.setAttribute("userID", id);
                    session.setAttribute("unit", "Laguna Campus Lasallian Mission");

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/LCLM-home.jsp");
                    dispatcher.forward(request, response);
                } else if (UserDAO.isDSA(u.getUsername())) {

                    int id = UserDAO.getIDbyUsername(u.getUsername());
                    session.setAttribute("userID", id);
                    session.setAttribute("unit", "Dean of Student Affairs");

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/DSA-home.jsp");
                    dispatcher.forward(request, response);
                } else if (UserDAO.isCOSCA(u.getUsername())) {

                    int id = UserDAO.getIDbyUsername(u.getUsername());
                    session.setAttribute("userID", id);
                    session.setAttribute("unit", "Center For Social Concern and Action (COSCA)");

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/COSCA-home.jsp");
                    dispatcher.forward(request, response);
                } else if (UserDAO.isOPMD(u.getUsername())) {

                    int id = UserDAO.getIDbyUsername(u.getUsername());
                    session.setAttribute("userID", id);
                    session.setAttribute("unit", "Office of Personnel Management Director");

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/OPMD-home.jsp");
                    dispatcher.forward(request, response);
                } else if (UserDAO.isADEALMCCS(u.getUsername())) {

                    int id = UserDAO.getIDbyUsername(u.getUsername());
                    session.setAttribute("userID", id);
                    session.setAttribute("unit", "Assistant Dean for External Affairs of the Lasallian Mission (ADEALM) - CCS");

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/ADEALM-home.jsp");
                    dispatcher.forward(request, response);
                } else if (UserDAO.isADEALMCOB(u.getUsername())) {

                    int id = UserDAO.getIDbyUsername(u.getUsername());
                    session.setAttribute("userID", id);
                    session.setAttribute("unit", "Assistant Dean for External Affairs of the Lasallian Mission (ADEALM) - COB");

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/ADEALM-home.jsp");
                    dispatcher.forward(request, response);
                } else if (UserDAO.isADEALMCLA(u.getUsername())) {

                    int id = UserDAO.getIDbyUsername(u.getUsername());
                    session.setAttribute("userID", id);
                    session.setAttribute("unit", "Assistant Dean for External Affairs of the Lasallian Mission (ADEALM) - CLA");

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/ADEALM-home.jsp");
                    dispatcher.forward(request, response);
                } else if (UserDAO.isADEALMGCOE(u.getUsername())) {

                    int id = UserDAO.getIDbyUsername(u.getUsername());
                    session.setAttribute("userID", id);
                    session.setAttribute("unit", "Assistant Dean for External Affairs of the Lasallian Mission (ADEALM) - GCOE");

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/ADEALM-home.jsp");
                    dispatcher.forward(request, response);
                } else if (UserDAO.isADEALMCOS(u.getUsername())) {

                    int id = UserDAO.getIDbyUsername(u.getUsername());
                    session.setAttribute("userID", id);
                    session.setAttribute("unit", "Assistant Dean for External Affairs of the Lasallian Mission (ADEALM) - COS");

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/ADEALM-home.jsp");
                    dispatcher.forward(request, response);
                } else if (UserDAO.isADEALMBAGCED(u.getUsername())) {

                    int id = UserDAO.getIDbyUsername(u.getUsername());
                    session.setAttribute("userID", id);
                    session.setAttribute("unit", "Assistant Dean for External Affairs of the Lasallian Mission (ADEALM) - BAGCED");

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/ADEALM-home.jsp");
                    dispatcher.forward(request, response);
                } else if (UserDAO.isADEALMSOE(u.getUsername())) {

                    int id = UserDAO.getIDbyUsername(u.getUsername());
                    session.setAttribute("userID", id);
                    session.setAttribute("unit", "Assistant Dean for External Affairs of the Lasallian Mission (ADEALM) - SOE");

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/ADEALM-home.jsp");
                    dispatcher.forward(request, response);
                } else if (UserDAO.isADEALMCOL(u.getUsername())) {

                    int id = UserDAO.getIDbyUsername(u.getUsername());
                    session.setAttribute("userID", id);
                    session.setAttribute("unit", "Assistant Dean for External Affairs of the Lasallian Mission (ADEALM) - COL");

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/ADEALM-home.jsp");
                    dispatcher.forward(request, response);
                } else if (UserDAO.isDeptUnit(u.getUsername())) {

                    int id = UserDAO.getIDbyUsername(u.getUsername());
                    session.setAttribute("userID", id);
                    session.setAttribute("unit", "Department / Unit Chair");

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/SIGNATORIES-home.jsp");
                    dispatcher.forward(request, response);
                } else if (UserDAO.isExternalDirector(u.getUsername())) {

                    int id = UserDAO.getIDbyUsername(u.getUsername());
                    session.setAttribute("userID", id);
                    session.setAttribute("unit", "External Affairs / Social Engagement Director");

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/SIGNATORIES-home.jsp");
                    dispatcher.forward(request, response);
                } else if (UserDAO.isDeanVPVC(u.getUsername())) {

                    int id = UserDAO.getIDbyUsername(u.getUsername());
                    session.setAttribute("userID", id);
                    session.setAttribute("unit", "Dean / VP / VC");

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/SIGNATORIES-home.jsp");
                    dispatcher.forward(request, response);
                } else if (UserDAO.isLMC(u.getUsername())) {

                    int id = UserDAO.getIDbyUsername(u.getUsername());
                    session.setAttribute("userID", id);
                    session.setAttribute("unit", "Lasallian Mission Council");

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/LMC-home.jsp");
                    dispatcher.forward(request, response);
                } else if (UserDAO.isChairDirector(u.getUsername())) {

                    int id = UserDAO.getIDbyUsername(u.getUsername());
                    session.setAttribute("userID", id);
                    session.setAttribute("unit", "Chairperson / Director");

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/SIGNATORIES-home2.jsp");
                    dispatcher.forward(request, response);
                } else if (UserDAO.isVPLM(u.getUsername())) {

                    int id = UserDAO.getIDbyUsername(u.getUsername());
                    session.setAttribute("userID", id);
                    session.setAttribute("unit", "Vice President for Lasallian Mission");

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/SIGNATORIES-home2.jsp");
                    dispatcher.forward(request, response);
                } else if (UserDAO.isDeanUnit(u.getUsername())) {

                    int id = UserDAO.getIDbyUsername(u.getUsername());
                    session.setAttribute("userID", id);
                    session.setAttribute("unit", "Dean / Unit Head");

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/SIGNATORIES-home2.jsp");
                    dispatcher.forward(request, response);
                } else if (UserDAO.isAssistantDean(u.getUsername())) {

                    int id = UserDAO.getIDbyUsername(u.getUsername());
                    session.setAttribute("userID", id);
                    session.setAttribute("unit", "Assistant Dean for Lasallian Mission / Assistant Unit Head");

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/SIGNATORIES-home2.jsp");
                    dispatcher.forward(request, response);
                } else if (UserDAO.isUnit(u.getUsername(), u.getPassword())) {
                    
                    int id = UserDAO.getIDbyUsername(u.getUsername());
                    session.setAttribute("userID", id);
                    session.setAttribute("type", "UR");
                    session.setAttribute("unit", UserDAO.getUnitByUserID(id));
                    
                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/UR-home.jsp");
                    dispatcher.forward(request, response);
                }

            } else {
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher = context.getRequestDispatcher("/index.jsp");
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.FF;
import entity.FFreport;
import entity.Notification;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Random;
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
public class createFFreport4 extends HttpServlet {

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

            FFreport FFreport = new FFreport();
            FFreport = (FFreport) session.getAttribute("FFreport");

            FFreport.setMajorProblems(request.getParameter("problem"));
            FFreport.setOtherRecommendations(request.getParameter("recommendation"));
            
            FF FF = UserDAO.retrieveFFByFFID(FFreport.getFfproposalID());
            if(request.getParameter("feedback1").equals("")){
                FFreport.setFeedback1(request.getParameter("feedback1"));
            } else {
                FFreport.setFeedback1("No Suggestion");
            }
            if(request.getParameter("feedback2").equals("")){
                FFreport.setFeedback2(request.getParameter("feedback2"));
            } else {
                FFreport.setFeedback2("No Suggestion");
            }
            if(request.getParameter("feedback3").equals("")){
                FFreport.setFeedback3(request.getParameter("feedback3"));
            } else {
                FFreport.setFeedback3("No Suggestion");
            }
            if(request.getParameter("feedback4").equals("")){
                FFreport.setFeedback4(request.getParameter("feedback4"));
            } else {
                FFreport.setFeedback4("No Suggestion");
            }
            if(request.getParameter("feedback5").equals("")){
                FFreport.setFeedback5(request.getParameter("feedback5"));
            } else {
                FFreport.setFeedback5("No Suggestion");
            }

            InputStream inputStream1 = null;
            Part filePart1 = request.getPart("uploadphoto");

            InputStream inputStream3 = null;
            Part filePart3 = request.getPart("uploadparticipants");

            if (filePart1 != null) {
                inputStream1 = filePart1.getInputStream();
            }

            if (filePart3 != null) {
                inputStream3 = filePart3.getInputStream();
            }

            FFreport.setAnnexes(inputStream1);
            FFreport.setAttendanceDLSU(inputStream3);

            session.setAttribute("FFreport", FFreport);
            ServletContext context = getServletContext();
            RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-createFFReport4.jsp");
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

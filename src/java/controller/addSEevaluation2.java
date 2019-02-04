/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.Notification;
import entity.SEevaluation;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
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
public class addSEevaluation2 extends HttpServlet {

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
            SEevaluation SEevaluation = new SEevaluation();
            HttpSession session = request.getSession();          
            
            SEevaluation = (SEevaluation) session.getAttribute("SEevaluation");

            SEevaluation.setLv51(Integer.parseInt(request.getParameter("q5.1")));
            SEevaluation.setLv52(Integer.parseInt(request.getParameter("q5.2")));
            SEevaluation.setLv53(Integer.parseInt(request.getParameter("q5.3")));
            SEevaluation.setLv54(Integer.parseInt(request.getParameter("q5.4")));
            SEevaluation.setLv55(Integer.parseInt(request.getParameter("q5.5")));
            SEevaluation.setPm61(Integer.parseInt(request.getParameter("q6.1")));
            SEevaluation.setPm62(Integer.parseInt(request.getParameter("q6.2")));
            SEevaluation.setPm63(Integer.parseInt(request.getParameter("q6.3")));
            SEevaluation.setPm64(Integer.parseInt(request.getParameter("q6.4")));
            SEevaluation.setPm65(Integer.parseInt(request.getParameter("q6.5")));
            SEevaluation.setPm66(Integer.parseInt(request.getParameter("q6.6")));
            SEevaluation.setPm67(Integer.parseInt(request.getParameter("q6.7")));
            SEevaluation.setPm68(Integer.parseInt(request.getParameter("q6.8")));
            SEevaluation.setPm69(Integer.parseInt(request.getParameter("q6.9")));
            SEevaluation.setPm610(Integer.parseInt(request.getParameter("q6.10")));
            SEevaluation.setPm611(Integer.parseInt(request.getParameter("q6.11")));
            SEevaluation.setPm612(Integer.parseInt(request.getParameter("q6.12")));
            SEevaluation.setPm613(Integer.parseInt(request.getParameter("q6.13")));
            SEevaluation.setOr71(Integer.parseInt(request.getParameter("q7.1")));
            SEevaluation.setFeedbacks(request.getParameter("feedback"));
            
            UserDAO.AddSEevaluation(SEevaluation);
            
            if(SEevaluation.isEvaluationnotified() == false && UserDAO.getNumberEvaluators(SEevaluation.getSeproposalID()) / UserDAO.getNumberParticipants(SEevaluation.getSeproposalID()) * 100 >= 50){
                
                SEevaluation.setEvaluationnotified(true);
                DecimalFormat df = new DecimalFormat("##.##");
                
                Notification n2 = new Notification();
                java.util.Date dt = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
                java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                
                n2.setTitle("Evaluation Received");
                n2.setBody(UserDAO.getSENameBySEID(SEevaluation.getSeproposalID()) + ":" + df.format(UserDAO.getNumberEvaluators(SEevaluation.getSeproposalID()) / UserDAO.getNumberParticipants(SEevaluation.getSeproposalID()) * 100) + "% of Attendees have now Evaluated!" + "\n"  + sdf.format(dt));
                n2.setDt(sdf2.format(dt));
                n2.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Vice President for Lasallian Mission"));
                UserDAO.AddNotification(n2);
                
                n2.setTitle("Evaluation Received");
                n2.setBody(UserDAO.getSENameBySEID(SEevaluation.getSeproposalID()) + ":" + df.format(UserDAO.getNumberEvaluators(SEevaluation.getSeproposalID()) / UserDAO.getNumberParticipants(SEevaluation.getSeproposalID()) * 100) + "% of Attendees have now Evaluated!" + "\n"  + sdf.format(dt));
                n2.setDt(sdf2.format(dt));
                n2.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Executive Officer"));
                UserDAO.AddNotification(n2);
                
                n2.setTitle("Evaluation Received");
                n2.setBody(UserDAO.getSENameBySEID(SEevaluation.getSeproposalID()) + ":" + df.format(UserDAO.getNumberEvaluators(SEevaluation.getSeproposalID()) / UserDAO.getNumberParticipants(SEevaluation.getSeproposalID()) * 100) + "% of Attendees have now Evaluated!" + "\n"  + sdf.format(dt));
                n2.setDt(sdf2.format(dt));
                n2.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Sir Jay Position"));
                UserDAO.AddNotification(n2);   
                
                UserDAO.updateSEEvaluationPercent(SEevaluation.getSeproposalID(), UserDAO.getNumberEvaluators(SEevaluation.getSeproposalID()) / UserDAO.getNumberParticipants(SEevaluation.getSeproposalID()) * 100);
            }
            
            request.setAttribute("successEvaluation", "You have successfully submitted the evaluation!");
            ServletContext context = getServletContext();
            RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-evaluationLogIn.jsp");
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

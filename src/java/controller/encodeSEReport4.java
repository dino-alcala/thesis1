/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.Notification;
import entity.SE;
import entity.SEattendees;
import entity.SEreport;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
public class encodeSEReport4 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private class SMTPAuthenticator extends Authenticator
    {
          private PasswordAuthentication authentication;

          public SMTPAuthenticator(String login, String password)
          {
               authentication = new PasswordAuthentication(login, password);
          }

          @Override
          protected PasswordAuthentication getPasswordAuthentication()
          {
               return authentication;
          }
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            UserDAO UserDAO = new UserDAO();
            HttpSession session = request.getSession();
            SEreport SEreport = new SEreport();
            SEreport = (SEreport) session.getAttribute("SEreport");
            SE SE = UserDAO.retrieveSEBySEID(SEreport.getSeproposalID());

            ArrayList<SEattendees> attendees = new ArrayList();

            for (int i = 0; i < Integer.parseInt(request.getParameter("countattendees")); i++) {
                SEattendees a = new SEattendees();
                a.setName(request.getParameter("attendee" + i));
                a.setEmail(request.getParameter("email" + i));
                a.setType(request.getParameter("type" + i));
                attendees.add(a);
            }

            SEreport.setAttendees(attendees);

            UserDAO.AddSEreport(SEreport);
            UserDAO.updateStep(9, SEreport.getSeproposalID());

            String characters = "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            int length = 10;
            Random rng = new Random();
            char[] text = new char[length];
            for (int i = 0; i < length; i++) {
                text[i] = characters.charAt(rng.nextInt(characters.length()));
            }
            String code = new String(text);

            UserDAO.updateSEProposalCodeBySEID(code, SEreport.getSeproposalID());
            
            for(int x = 0 ; x < attendees.size() ; x++){
                String from = "ovplmpms@gmail.com";
                String to = attendees.get(x).getEmail();
                String subject = "Evaluation Code";
                String message = "SE Evaluation Code for " + SE.getName() + ": " + code;
                String login = "ovplmpms@gmail.com";
                String password = "11434643ovplmpms";

                Properties props = new Properties();
                props.setProperty("mail.host", "smtp.gmail.com");
                props.setProperty("mail.smtp.port", "587");
                props.setProperty("mail.smtp.auth", "true");
                props.setProperty("mail.smtp.starttls.enable", "true");

                Authenticator auth = new encodeSEReport4.SMTPAuthenticator(login, password);

                Session session2 = Session.getInstance(props, auth);

                MimeMessage msg = new MimeMessage(session2);

                    try
                    {
                         msg.setText(message);
                         msg.setSubject(subject);
                         msg.setFrom(new InternetAddress(from));
                         msg.addRecipient(Message.RecipientType.TO, 
                         new InternetAddress(to));
                         Transport.send(msg);
                    }
                    catch (MessagingException ex)
                    {
                        
                    } 
            }

            Notification n = new Notification();
            n.setTitle(UserDAO.getProgramName(SEreport.getSeproposalID()));
            n.setBody("Accomplishment Report has been submitted!");

            java.util.Date dt = new java.util.Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            n.setDt(sdf.format(dt));
            n.setUserID(17);
            
            UserDAO.AddNotification(n);

            request.setAttribute("SEreport", "You have successfully encoded a Student Org SE Completion Report!");
            ServletContext context = getServletContext();
            RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-socialEngagementProgramsList.jsp");
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.FF;
import entity.FFreport;
import entity.FFreportattendees;
import entity.Notification;
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
public class encodeFFReport4 extends HttpServlet {

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
            FFreport FFreport = new FFreport();
            FFreport = (FFreport) session.getAttribute("FFreport");
            FF FF = UserDAO.retrieveFFByFFID(FFreport.getFfproposalID());

            ArrayList<FFreportattendees> attendees = new ArrayList();

            for (int i = 0; i < Integer.parseInt(request.getParameter("countattendees")); i++) {
                FFreportattendees a = new FFreportattendees();
                a.setName(request.getParameter("attendee" + i));
                a.setEmail(request.getParameter("email" + i));
                a.setType(request.getParameter("type" + i));
                attendees.add(a);
            }

            FFreport.setAttendees(attendees);

            UserDAO.AddFFreport(FFreport);
            UserDAO.updateStepFF(9, FFreport.getFfproposalID());

            String characters = "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            int length = 10;
            Random rng = new Random();
            char[] text = new char[length];
            for (int i = 0; i < length; i++) {
                text[i] = characters.charAt(rng.nextInt(characters.length()));
            }
            String code = new String(text);

            UserDAO.updateFFProposalCodeByFFID(code, FFreport.getFfproposalID());
            
            for(int x = 0 ; x < attendees.size() ; x++){
                String from = "ovplmpms@gmail.com";
                String to = attendees.get(x).getEmail();
                String subject = "Evaluation Code";
                String message = "FF Evaluation Code for " + FF.getProjectName() + ": " + code;
                String login = "ovplmpms@gmail.com";
                String password = "11434643ovplmpms";

                Properties props = new Properties();
                props.setProperty("mail.host", "smtp.gmail.com");
                props.setProperty("mail.smtp.port", "587");
                props.setProperty("mail.smtp.auth", "true");
                props.setProperty("mail.smtp.starttls.enable", "true");

                Authenticator auth = new encodeFFReport4.SMTPAuthenticator(login, password);

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
            
            java.util.Date dt = new java.util.Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
            java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            Notification n = new Notification();
            n.setBody("Program: " + UserDAO.getProjectName(FFreport.getFfproposalID()) + "\n"  + sdf.format(dt));
            n.setTitle("Accomplishment Report Submitted");
            n.setDt(sdf2.format(dt));
            n.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Vice President for Lasallian Mission"));
            UserDAO.AddNotification(n);
            
            n.setBody("Program: " + UserDAO.getProjectName(FFreport.getFfproposalID()) + "\n"  + sdf.format(dt));
            n.setTitle("Accomplishment Report Submitted");
            n.setDt(sdf2.format(dt));
            n.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Executive Officer"));
            UserDAO.AddNotification(n);
            
            n.setBody("Program: " + UserDAO.getProjectName(FFreport.getFfproposalID()) + "\n"  + sdf.format(dt));
            n.setTitle("Accomplishment Report Submitted");
            n.setDt(sdf2.format(dt));
            n.setUserID(UserDAO.getUserIDforNotifsPosition("OVPLM - Sir Jay Position"));
            UserDAO.AddNotification(n);

            request.setAttribute("FFreport", "You have successfully encoded a Student Org FF Completion Report!");
            ServletContext context = getServletContext();
            RequestDispatcher dispatcher = context.getRequestDispatcher("/MULTIPLE-faithFormationProgramsList.jsp");
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

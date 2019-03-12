/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.FF;
import entity.FFattendees;
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
public class createFFAttendanceSheet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private class SMTPAuthenticator extends Authenticator {

        private PasswordAuthentication authentication;

        public SMTPAuthenticator(String login, String password) {
            authentication = new PasswordAuthentication(login, password);
        }

        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return authentication;
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            HttpSession session = request.getSession();
            UserDAO UserDAO = new UserDAO();
            ArrayList<FFattendees> attendees = new ArrayList();
            FF FF = (FF) session.getAttribute("FF");

            for (int i = 0; i < Integer.parseInt(request.getParameter("countattendees")); i++) {
                FFattendees a = new FFattendees();
                a.setName(request.getParameter("attendee" + i));
                a.setEmail(request.getParameter("email" + i));
                a.setType(request.getParameter("type" + i));
                attendees.add(a);
            }
            UserDAO.AddFFAttendanceSheet(attendees, FF.getId());

            String characters = "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            int length = 10;
            Random rng = new Random();
            char[] text = new char[length];
            for (int i = 0; i < length; i++) {
                text[i] = characters.charAt(rng.nextInt(characters.length()));
            }
            String code = new String(text);

            UserDAO.updateFFProposalCodeByFFID(code, FF.getId());

            for (int x = 0; x < attendees.size(); x++) {
                String from = "ovplmpms@gmail.com";
                String to = attendees.get(x).getEmail();
                String subject = "Evaluation Code";
                String message = "Thank you for participating in our Faith Formation Program! Please follow the instructions below to evaluate your experience." + "\n" + "\n" +  "FF Evaluation Code for '" + FF.getProjectName() + "': " + code + "\n" + "\n" + "Please proceed to the OVPLM PMS Website, click the 'Evaluate' button at the bottom of the 'Login' button, and input this code, and evaluate the program." + "\n" + "\n" + "Thank You!";
                String login = "ovplmpms@gmail.com";
                String password = "11434643ovplmpms";

                Properties props = new Properties();
                props.setProperty("mail.host", "smtp.gmail.com");
                props.setProperty("mail.smtp.port", "587");
                props.setProperty("mail.smtp.auth", "true");
                props.setProperty("mail.smtp.starttls.enable", "true");

                Authenticator auth = new createFFAttendanceSheet.SMTPAuthenticator(login, password);

                Session session2 = Session.getInstance(props, auth);

                MimeMessage msg = new MimeMessage(session2);

                try {
                    msg.setText(message);
                    msg.setSubject(subject);
                    msg.setFrom(new InternetAddress(from));
                    msg.addRecipient(Message.RecipientType.TO,
                            new InternetAddress(to));
                    Transport.send(msg);
                } catch (MessagingException ex) {
                    System.out.println("DJSAKJKASJKLSA ERROR");
                }
            }
            
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

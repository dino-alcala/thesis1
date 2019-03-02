/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.FF;
import entity.Measure;
import entity.SE;
import entity.Unit;
import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dino Alcala
 */
public class TargetDAO {

    public double calculateTarget(Measure m, ArrayList<Integer> totals) {
        UserDAO UserDAO = new UserDAO();
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String query = "";

        int totalunits = totals.get(0);
        int totalstudentorgs = totals.get(1);
        int totalfacultydept = totals.get(2);
        int totalstaff = totals.get(3);
        int totalcap = totals.get(4);
        int totalapsp = totals.get(5);
        int totalasf = totals.get(6);
        int totalfaculty = totals.get(7);
        int totaladmin = totals.get(8);
        int totalgrad = totals.get(9);
        int totalundergrad = totals.get(10);
        int totalinternationalstudents = totals.get(11);
        int totaldepts = totals.get(12);
        int totalalumni = totals.get(13);
        double count = 0;
        double percent = 0;
        
        if(m.getTypetarget().equals("Faith Formation")){
            //for ff
            //se programs per units - n/a
            //no specified unit - yes
            //student orgs - yes
            //depts - yes
            //faculty depts - yes
            //staff - yes
            //cap - yes
            //apsp
            //asf
            //faculty
            //admin
            //grad
            //undergrad
            //international - yes
            //alumni
            //social engagement - n/a
            
            //
            //FOR FAITH FORMATION
            //UNIT TARGET: NO SPECIFIED UNIT
            //
            if(m.getUnittarget().equals("No Specified Unit") && m.getNumtypetarget().equals("Count")){
                ArrayList<FF> FF = UserDAO.retrieveALLFFProposal();
                if (m.getEngagingtarget().equals("N/A")) {
                    return -1;
                } else if (m.getEngagingtarget().equals("Alumni")) {
                    query = "SELECT count(f.id) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.id = ? AND f.step = 9 AND a.type IN ('Alumni')";
                } else if (m.getEngagingtarget().equals("Parents")) {
                    query = "SELECT count(f.id) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.id = ? AND f.step = 9 AND a.type IN ('Parent')";
                } else if (m.getEngagingtarget().equals("International Students")) {
                    query = "SELECT count(f.id) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.id = ? AND f.step = 9 AND a.type IN ('International')";
                }
                try {
                    if(query.equals("")){
                        return -1;
                    }
                    
                    for(int x = 0 ; x < FF.size() ; x++){
                        pstmt = conn.prepareStatement(query);
                        pstmt.setInt(1, FF.get(x).getId());
                        rs = pstmt.executeQuery();
                        
                        while (rs.next()) {
                            count = rs.getInt("count");
                        }
                    }
                    
                    return percent = count * 100 / m.getNumtarget();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR FAITH FORMATION
            //UNIT TARGET: STUDENT ORGS
            //
            else if(m.getUnittarget().equals("Student Organizations")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(department)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID WHERE f.step = 9 AND f.studentorg = 1";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(department)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type IN ('Alumni') AND f.studentorg = 1";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(department)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type IN ('Parent') AND f.studentorg = 1";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(department)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type IN ('International') AND f.studentorg = 1";
                }
                try {
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalstudentorgs) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }

                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR FAITH FORMATION
            //UNIT TARGET: DEPTS
            //
            else if(m.getUnittarget().equals("Departments")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(department)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID WHERE f.step = 9 AND f.studentorg != 1";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(department)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type IN ('Alumni') AND f.studentorg != 1";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(department)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type IN ('Parent') AND f.studentorg != 1";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(department)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type IN ('International') AND f.studentorg != 1";
                }
                try {
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totaldepts) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }

                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR FAITH FORMATION 
            //UNIT TARGET: FACULTY DEPT
            //
            else if(m.getUnittarget().equals("Faculty Departments")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(department)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID WHERE f.step = 9 AND f.studentorg != 1";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(department)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type IN ('Alumni') AND f.studentorg != 1";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(department)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type IN ('Parent') AND f.studentorg != 1";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(department)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type IN ('International') AND f.studentorg != 1";
                }
                try {
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalfacultydept) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }

                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR FAITH FORMATION
            //UNIT TARGET: STAFF
            //
            else if (m.getUnittarget().equals("Staff") && m.getNumtypetarget().equals("Percent")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'CAP' OR a.type = 'APSP' OR a.type = 'ASF' OR a.type = 'Faculty' OR a.type = 'Admin' OR a.type = 'Directhired' OR a.type = 'Independent' OR a.type = 'External'";                    
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'CAP' OR a.type = 'APSP' OR a.type = 'ASF' OR a.type = 'Faculty' OR a.type = 'Admin' OR a.type = 'Directhired' OR a.type = 'Independent' OR a.type = 'External' AND a.type IN('Parent')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'CAP' OR a.type = 'APSP' OR a.type = 'ASF' OR a.type = 'Faculty' OR a.type = 'Admin' OR a.type = 'Directhired' OR a.type = 'Independent' OR a.type = 'External' AND a.type IN('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'CAP' OR a.type = 'APSP' OR a.type = 'ASF' OR a.type = 'Faculty' OR a.type = 'Admin' OR a.type = 'Directhired' OR a.type = 'Independent' OR a.type = 'External' AND a.type IN('International')";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalstaff) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
                
            }
            //
            //FOR FAITH FORMATION
            //UNIT TARGET: CAP
            //
            else if(m.getUnittarget().equals("CAP")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'CAP'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'CAP' AND a.type IN('Parent')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'CAP' AND a.type IN('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'CAP' AND a.type IN('International')";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalcap) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR FAITH FORMATION
            //UNIT TARGET: APSP
            //
            else if(m.getUnittarget().equals("APSP")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'APSP'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'APSP' AND a.type IN('Parent')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'APSP' AND a.type IN('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'APSP' AND a.type IN('International')";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalapsp) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR FAITH FORMATION
            //UNIT TARGET: ASF
            //
            else if(m.getUnittarget().equals("ASF")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'ASF'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'ASF' AND a.type IN('Parent')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'ASF' AND a.type IN('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'ASF' AND a.type IN('International')";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalasf) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR FAITH FORMATION
            //UNIT TARGET: ASF
            //
            else if(m.getUnittarget().equals("Faculty Employees")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'Faculty'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'Faculty' AND a.type IN('Parent')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'Faculty' AND a.type IN('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'Faculty' AND a.type IN('International')";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalfaculty) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR FAITH FORMATION
            //UNIT TARGET: ADMINISTRATORS
            //
            else if(m.getUnittarget().equals("Administrators")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'Admin'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'Admin' AND a.type IN('Parent')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'Admin' AND a.type IN('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'Admin' AND a.type IN('International')";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totaladmin) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR FAITH FORMATION
            //UNIT TARGET: GRADUATE STUDENTS
            //
            else if(m.getUnittarget().equals("Graduate Students")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'Grad'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'Grad' AND a.type IN('Parent')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'Grad' AND a.type IN('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'Grad' AND a.type IN('International')";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalgrad) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR FAITH FORMATION
            //UNIT TARGET: UNDERGRADUATE STUDENTS
            //
            else if(m.getUnittarget().equals("Undergraduate Students")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'Undergrad'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'Undergrad' AND a.type IN('Parent')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'Undergrad' AND a.type IN('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'Undergrad' AND a.type IN('International')";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalundergrad) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR FAITH FORMATION
            //UNIT TARGET: INTERNATIONAL STUDENTS
            //
            else if(m.getUnittarget().equals("International Students")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'International'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'International' AND a.type IN ('Parent')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'International' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    return -1;
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalinternationalstudents) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR FAITH FORMATION
            //UNIT TARGET: ALUMNI
            //
            else if(m.getUnittarget().equals("Alumni")){
                if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'Alumni'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'Alumni' AND a.type IN('Parent')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'Alumni' AND a.type IN('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.step = 9 AND a.type = 'Alumni' AND a.type IN('International')";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalalumni) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //START OF
            //SOCIAL ENGAGEMENT
            //
        } else if(m.getTypetarget().equals("Social Engagement")){
            //
            //FOR SOCIAL ENGAGEMENT
            //UNIT TARGET: SE PROGRAMS PER UNIT
            //
            if(m.getUnittarget().equals("SE Programs Per Unit")){
                return - 1;
            } 
            //
            //FOR SOCIAL ENGAGEMENT
            //UNIT TARGET: NO SPECIFIED UNIT
            //
            else if(m.getUnittarget().equals("No Specified Unit") && m.getNumtypetarget().equals("Count")){
                ArrayList<SE> SE = UserDAO.retrieveALLSEProposal();
                if(m.getEngagingtarget().equals("Alumni")){
                        query = "SELECT count(s.id) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.id = ? AND s.step = 9 AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("Parents")){
                        query = "SELECT count(s.id) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.id = ? AND s.step = 9 AND a.type IN ('Parent')";
                } else if(m.getEngagingtarget().equals("International Students")){
                        query = "SELECT count(s.id) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.id = ? AND s.step = 9 AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                        query = "SELECT count(s.id) as count FROM seproposal s JOIN community c ON c.communityID = s.targetCommunity WHERE s.id = ? AND c.international = 1 AND s.step = 9";
                }
                try {
                    if (query.equals("")) {
                        return -1;
                    }
                    for (int x = 0; x < SE.size(); x++) {
                        pstmt = conn.prepareStatement(query);
                        pstmt.setInt(1, SE.get(x).getId());
                        rs = pstmt.executeQuery();
                    }

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }
     
                    return percent = count * 100 / m.getNumtarget();
                   
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SOCIAL ENGAGEMENT
            //UNIT TARGET: STUDENT ORGS
            //
            else if(m.getUnittarget().equals("Student Organizations")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID WHERE s.step = 9 AND s.studentorg = 1";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type IN ('Alumni') AND s.studentorg = 1";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type IN ('Parent') AND s.studentorg = 1";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type IN ('International') AND s.studentorg = 1";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN community c ON s.targetCommunity = c.communityID WHERE s.step = 9 AND c.international = 1 AND a.type IN ('International') AND s.studentorg = 1";
                }
                try {
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }
                    
                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalstudentorgs) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }

                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            } 
            //
            //FOR SOCIAL ENGAGEMENT
            //UNIT TARGET: FACULTY DEPTS
            //
            else if(m.getUnittarget().equals("Departments")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID WHERE s.step = 9 AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type IN ('Alumni') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type IN ('Parent') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type IN ('International') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN community c ON s.targetCommunity = c.communityID WHERE s.step = 9 AND c.international = 1 AND s.studentorg != 1";
                }
                try {
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totaldepts) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }

                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if(m.getUnittarget().equals("Faculty Departments")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID WHERE s.step = 9 AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type IN ('Alumni') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type IN ('Parent') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type IN ('International') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN community c ON s.targetCommunity = c.communityID WHERE s.step = 9 AND c.international = 1 AND s.studentorg != 1";
                }
                try {
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalfacultydept) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }

                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SOCIAL ENGAGEMENT
            //UNIT TARGET: STAFF
            //
            else if(m.getUnittarget().equals("Staff")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'CAP' OR a.type = 'APSP' OR a.type = 'ASF' OR a.type = 'Faculty' OR a.type = 'Admin' OR a.type = 'Directhired' OR a.type = 'Independent' OR a.type = 'External'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'CAP' OR a.type = 'APSP' OR a.type = 'ASF' OR a.type = 'Faculty' OR a.type = 'Admin' OR a.type = 'Directhired' OR a.type = 'Independent' OR a.type = 'External' AND a.type IN ('Parent')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'CAP' OR a.type = 'APSP' OR a.type = 'ASF' OR a.type = 'Faculty' OR a.type = 'Admin' OR a.type = 'Directhired' OR a.type = 'Independent' OR a.type = 'External' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'CAP' OR a.type = 'APSP' OR a.type = 'ASF' OR a.type = 'Faculty' OR a.type = 'Admin' OR a.type = 'Directhired' OR a.type = 'Independent' OR a.type = 'External' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c ON c.communityID = s.targetCommunity WHERE c.international = 1 AND s.step = 9 AND a.type = 'CAP' OR a.type = 'APSP' OR a.type = 'ASF' OR a.type = 'Faculty' OR a.type = 'Admin' OR a.type = 'Directhired' OR a.type = 'Independent' OR a.type = 'External'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalstaff) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SOCIAL ENGAGEMENT
            //UNIT TARGET: CAP
            //
            else if(m.getUnittarget().equals("CAP")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'CAP'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'CAP' AND a.type IN ('Parent')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'CAP' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'CAP' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c ON c.communityID = s.targetCommunity WHERE c.international = 1 AND s.step = 9 AND a.type = 'CAP'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalcap) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SOCIAL ENGAGEMENT
            //UNIT TARGET: APSP
            //
            else if(m.getUnittarget().equals("APSP")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'APSP'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'APSP' AND a.type IN ('Parent')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'APSP' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'APSP' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c ON c.communityID = s.targetCommunity WHERE c.international = 1 AND s.step = 9 AND a.type = 'APSP'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalapsp) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SOCIAL ENGAGEMENT
            //UNIT TARGET: ASF
            //
            else if(m.getUnittarget().equals("ASF")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'ASF'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'ASF' AND a.type IN ('Parent')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'ASF' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'ASF' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c ON c.communityID = s.targetCommunity WHERE c.international = 1 AND s.step = 9 AND a.type = 'ASF'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalasf) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SOCIAL ENGAGEMENT
            //UNIT TARGET: FACULTY
            //
            else if(m.getUnittarget().equals("Faculty Employees")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'Faculty'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'Faculty' AND a.type IN ('Parent')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'Faculty' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'Faculty' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c ON c.communityID = s.targetCommunity WHERE c.international = 1 AND s.step = 9 AND a.type = 'Faculty'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalfaculty) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SOCIAL ENGAGEMENT
            //UNIT TARGET: ADMINISTRATORS
            //
            else if(m.getUnittarget().equals("Administrators")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'Admin'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'Admin' AND a.type IN ('Parent')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'Admin' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'Admin' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c ON c.communityID = s.targetCommunity WHERE c.international = 1 AND s.step = 9 AND a.type = 'Admin'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totaladmin) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SOCIAL ENGAGEMENT
            //UNIT TARGET: GRADUATE STUDENTS
            //
            else if(m.getUnittarget().equals("Graduate Students")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'Grad'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'Grad' AND a.type IN ('Parent')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'Grad' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'Grad' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c ON c.communityID = s.targetCommunity WHERE c.international = 1 AND s.step = 9 AND a.type = 'Grad'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalgrad) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SOCIAL ENGAGEMENT
            //UNIT TARGET: UNDERGRADUATE STUDENTS
            //
            else if(m.getUnittarget().equals("Undergraduate Students")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'Undergrad'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'Undergrad' AND a.type IN ('Parent')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'Undergrad' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'Undergrad' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN comminity c ON c.communityID = s.targetCommunity WHERE c.international = 1 AND s.step = 9 AND a.type = 'Undergrad'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalundergrad) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SOCIAL ENGAGEMENT
            //UNIT TARGET: INTERNATIONAL STUDENTS
            //
            else if(m.getUnittarget().equals("International Students")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'International'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'International' AND a.type IN ('Parent')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'International' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'International' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c ON c.communityID = s.targetCommunity WHERE c.international = 1 AND s.step = 9 AND a.type = 'International'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalinternationalstudents) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SOCIAL ENGAGEMENT
            //UNIT TARGET: ALUMNI
            //
            else if(m.getUnittarget().equals("Alumni")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'Alumni'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'Alumni' AND a.type IN ('Parent')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'Alumni' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND a.type = 'Alumni' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c ON c.communityID = s.targetCommunity WHERE c.classification = 1 AND s.step = 9 AND a.type = 'Alumni'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalalumni) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SOCIAL ENGAGEMENT
            //UNIT TARGET: SE PROGRAMS
            //
            else if(m.getUnittarget().equals("Social Engagement Programs")){
                return - 1;
            }
        }
        //
        //START OF
        //INTERDISCIPLINARY FORA
        //
        else if(m.getTypetarget().equals("Interdisciplinary Fora")){
            //
            //FOR INTERDISCIPLINARY FORA
            //UNIT TARGET: SE PROGRAMS PER UNIT
            //
            if(m.getUnittarget().equals("SE Programs Per Unit")){
                ArrayList<Unit> units = UserDAO.retrieveUnits();
                int overallCount = 0;
                
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(id) FROM seproposal s WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND s.unit = ?";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(id) FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND s.unit = ? AND a.type IN ('Parent')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(id) FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND s.unit = ? AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(id) FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND s.unit = ? AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(id) FROM seproposal s JOIN community c ON s.targetCommunity = c.communityID WHERE c.international = 1 AND s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND s.unit = ?";
                }
                try {

                    if (query.equals("")) {
                        return -1;
                    }

                    for (int i = 0; i < units.size(); i++) {
                        double temppercent = 0;
                        
                        pstmt = conn.prepareStatement(query);
                        pstmt.setString(1, units.get(i).getName());
                        rs = pstmt.executeQuery();

                        while (rs.next()) {
                            count = rs.getInt("count(id)");
                        }

                        if (count != 0) {
                            temppercent = ((double) count / (double) UserDAO.countTotalProposalByUnit(units.get(i).getName()) * 100);
                        }

                        if (temppercent >= m.getNumtarget()) {
                            overallCount += 1;
                        }
                    }
                    
                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = (double) overallCount / (double) totalunits * 100;
                    } else if(m.getNumtypetarget().equals("Count")){
                        return percent = overallCount * 100 / m.getNumtarget();
                    }
                    
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR INTERDISCIPLINARY FORA
            //UNIT TARGET: NO SPECIFIED UNIT
            //
            else if(m.getUnittarget().equals("No Specified Unit") && m.getNumtypetarget().equals("Count")){
                ArrayList<SE> SE = UserDAO.retrieveALLSEProposal();
                if (m.getEngagingtarget().equals("N/A")) {
                    query = "SELECT count(s.id) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID WHERE s.id = ? AND s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora'";
                } else if (m.getEngagingtarget().equals("Alumni")) {
                    query = "SELECT count(s.id) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.id = ? AND s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type IN ('Alumni')";
                } else if (m.getEngagingtarget().equals("Parents")) {
                    query = "SELECT count(s.id) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.id = ? AND s.activityClassification = 'Interdisciplinary Fora' AND s.step = 9 AND a.type IN ('Parent')";
                } else if (m.getEngagingtarget().equals("International Students")) {
                    query = "SELECT count(s.id) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.id = ? AND s.activityClassification = 'Interdisciplinary Fora' AND s.step = 9 AND a.type IN ('International')";
                } else if (m.getEngagingtarget().equals("International Communities")) {
                    query = "SELECT count(s.id) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c ON c.communityID = s.targetCommunity WHERE c.international = 1 AND s.id = ? AND s.activityClassification = 'Interdisciplinary Fora' AND s.step = 9";
                }
                try {
                    if (query.equals("")) {
                        return -1;
                    }
                    for (int x = 0; x < SE.size(); x++) {
                        pstmt = conn.prepareStatement(query);
                        pstmt.setInt(1, SE.get(x).getId());
                        rs = pstmt.executeQuery();
                    }

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }
     
                    return percent = count * 100 / m.getNumtarget();
                   
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR INTERDISCIPLINARY FORA
            //UNIT TARGET: STUDENT ORGS
            //
            else if(m.getUnittarget().equals("Student Organizations")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND s.studentorg = 1";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type IN ('Alumni') AND s.studentorg = 1";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type IN ('Parent') AND s.studentorg = 1";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type IN ('International') AND s.studentorg = 1";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c ON c.communityID = s.targetCommunity WHERE c.international = 1 AND s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND s.studentorg = 1";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalstudentorgs) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR INTERDISCIPLINARY FORA
            //UNIT TARGET: DEPTS
            //
            else if(m.getUnittarget().equals("Departments")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type IN ('Alumni') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type IN ('Parent') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type IN ('International') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c ON c.communityID = s.targetCommunity WHERE c.international = 1 AND s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND s.studentorg != 1";
                }
                try {
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totaldepts) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }

                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR INTERDISCIPLINARY FORA
            //UNIT TARGET: FACULTY DEPTS
            //
            else if(m.getUnittarget().equals("Faculty Departments")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type IN ('Alumni') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type IN ('Parent') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type IN ('International') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c ON c.communityID = s.targetCommunity WHERE c.international = 1 AND s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type IN ('International') AND s.studentorg != 1";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalfacultydept) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR INTERDISCIPLINARY FORA
            //UNIT TARGET: STAFF
            //
            else if(m.getUnittarget().equals("Staff")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'CAP' OR a.type = 'APSP' OR a.type = 'ASF' OR a.type = 'Faculty' OR a.type = 'Admin' OR a.type = 'Directhired' OR a.type = 'Independent' OR a.type = 'External'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'CAP' OR a.type = 'APSP' OR a.type = 'ASF' OR a.type = 'Faculty' OR a.type = 'Admin' OR a.type = 'Directhired' OR a.type = 'Independent' OR a.type = 'External AND a.type IN('Parent')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'CAP' OR a.type = 'APSP' OR a.type = 'ASF' OR a.type = 'Faculty' OR a.type = 'Admin' OR a.type = 'Directhired' OR a.type = 'Independent' OR a.type = 'External AND a.type IN('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'CAP' OR a.type = 'APSP' OR a.type = 'ASF' OR a.type = 'Faculty' OR a.type = 'Admin' OR a.type = 'Directhired' OR a.type = 'Independent' OR a.type = 'External AND a.type IN('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c ON c.communityID = s.targetCommunity WHERE c.international = 1 AND s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'CAP' OR a.type = 'APSP' OR a.type = 'ASF' OR a.type = 'Faculty' OR a.type = 'Admin' OR a.type = 'Directhired' OR a.type = 'Independent' OR a.type = 'External'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalstaff) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR INTERDISCIPLINARY FORA
            //UNIT TARGET: CAP
            //
            else if(m.getUnittarget().equals("CAP")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'CAP'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'CAP' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'CAP' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'CAP' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND c.international = 1 AND a.type = 'CAP'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalcap) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR INTERDISCIPLINARY FORA
            //UNIT TARGET: APSP
            //
            else if(m.getUnittarget().equals("APSP")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'APSP'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'APSP' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'APSP' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'APSP' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND c.international = 1 AND a.type = 'APSP'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalapsp) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR INTERDISCIPLINARY FORA
            //UNIT TARGET: ASF
            //
            else if(m.getUnittarget().equals("ASF")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'ASF'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'ASF' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'ASF' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'ASF' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND c.international = 1 AND a.type = 'ASF'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalasf) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR INTERDISCIPLINARY FORA
            //UNIT TARGET: FACULTY EMPLOYEES
            //
            else if(m.getUnittarget().equals("Faculty Employees")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'Faculty'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'Faculty' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'Faculty' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'Faculty' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND c.international = 1 AND a.type = 'Faculty'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalfaculty) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR INTERDISCIPLINARY FORA
            //UNIT TARGET: ADMINISTRATORS
            //
            else if(m.getUnittarget().equals("Administrators")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'Admin'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'Admin' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'Admin' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'Admin' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND c.international = 1 AND a.type = 'Admin'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalcap) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR INTERDISCIPLINARY FORA
            //UNIT TARGET: GRADUATE STUDENTS
            //
            else if(m.getUnittarget().equals("Graduate Students")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'Grad'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'Grad' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'Grad' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'Grad' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND c.international = 1 AND a.type = 'Grad'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalgrad) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR INTERDISCIPLINARY FORA
            //UNIT TARGET: UNDERGRADUATE STUDENTS
            //
            else if(m.getUnittarget().equals("Undergraduate Students")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'Undergrad'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'Undergrad' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'Undergrad' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'Undergrad' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND c.international = 1 AND a.type = 'Undergrad'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalundergrad) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR INTERDISCIPLINARY FORA
            //UNIT TARGET: INTERNATIONAL STUDENTS
            //
            else if(m.getUnittarget().equals("International Students")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'International'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'International' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'International' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    return -1;
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.id = s.targetCommunity WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND c.international = 1 AND a.type = 'International'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalinternationalstudents) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR INTERDISCIPLINARY FORA
            //UNIT TARGET: ALUMNI
            //
            else if(m.getUnittarget().equals("Alumni")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'Alumni'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'Alumni' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'Alumni' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type = 'Alumni' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND c.international = 1 AND a.type = 'Alumni'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalalumni) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR INTERDISCIPLINARY FORA
            //UNIT TARGET: SE PROGRAMS
            //
            else if(m.getUnittarget().equals("Social Engagement Programs")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.activityClassification = 'Interdisciplinary Fora' AND c.international = 1";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) UserDAO.retrieveALLSEProposal().size()) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        //
        //START OF 
        //SUSTAINABLE SE
        //
        else if(m.getTypetarget().equals("Sustainable SE")){
            //
            //FOR SUSTAINABLE SE
            //UNIT TARGET: SE PROGRAMS PER UNIT
            //
            if(m.getUnittarget().equals("SE Programs Per Unit")){
                ArrayList<Unit> units = UserDAO.retrieveUnits();
                int overallCount = 0;
                
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(id) FROM seproposal s WHERE s.step = 9 AND s.sustainable = 1 AND s.unit = ?";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(id) FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND s.unit = ? AND a.type IN ('Parent')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(id) FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND s.unit = ? AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(id) FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND s.unit = ? AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(id) FROM seproposal s JOIN community c ON s.targetCommunity = c.communityID WHERE c.international = 1 AND s.step = 9 AND s.sustainable = 1 AND s.unit = ?";
                }
                try {

                    if (query.equals("")) {
                        return -1;
                    }

                    for (int i = 0; i < units.size(); i++) {
                        double temppercent = 0;
                        
                        pstmt = conn.prepareStatement(query);
                        pstmt.setString(1, units.get(i).getName());
                        rs = pstmt.executeQuery();

                        while (rs.next()) {
                            count = rs.getInt("count(id)");
                        }

                        if (count >= 1) {
                            temppercent =  (count / UserDAO.countTotalProposalByUnit(units.get(i).getName())) * 100;
                        }

                        if (temppercent >= m.getNumtarget()) {
                            overallCount += 1;
                        }
                    }
                    
                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = (double) overallCount / (double) totalunits * 100;
                    } else if(m.getNumtypetarget().equals("Count")){
                        return percent = overallCount * 100 / m.getNumtarget();
                    }
                    
                    
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SUSTAINABLE SE
            //UNIT TARGET: NO SPECIFIED UNIT
            //
            if (m.getUnittarget().equals("No Specified Unit") && m.getNumtypetarget().equals("Count")) {
                ArrayList<SE> SE = UserDAO.retrieveALLSEProposal();
                if (m.getEngagingtarget().equals("N/A")) {
                    query = "SELECT count(s.id) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID WHERE s.id = ? AND s.step = 9 AND s.sustainable = 1";
                } else if (m.getEngagingtarget().equals("Alumni")) {
                    query = "SELECT count(s.id) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.id = ? AND s.step = 9 AND s.sustainable = 1 AND a.type IN ('Alumni')";
                } else if (m.getEngagingtarget().equals("Parents")) {
                    query = "SELECT count(s.id) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.id = ? AND s.sustainable = 1 AND s.step = 9 AND a.type IN ('Parent')";
                } else if (m.getEngagingtarget().equals("International Students")) {
                    query = "SELECT count(s.id) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.id = ? AND s.sustainable = 1 AND s.step = 9 AND a.type IN ('International')";
                } else if (m.getEngagingtarget().equals("International Communities")) {
                    query = "SELECT count(s.id) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c ON c.communityID = s.targetCommunity WHERE c.international = 1 AND s.id = ? AND s.sustainable = 1 AND s.step = 9";
                }
                try {
                    if (query.equals("")) {
                        return -1;
                    }
                    for (int x = 0; x < SE.size(); x++) {
                        pstmt = conn.prepareStatement(query);
                        pstmt.setInt(1, SE.get(x).getId());
                        rs = pstmt.executeQuery();
                    }

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }
     
                    return percent = count * 100 / m.getNumtarget();
                   
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SUSTAINABLE SE
            //UNIT TARGET: STUDENT ORGS
            //
            else if(m.getUnittarget().equals("Student Organizations")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID WHERE s.step = 9 AND s.sustainable = 1 AND s.studentorg = 1";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type IN ('Alumni') AND s.studentorg = 1";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type IN ('Parent') AND s.studentorg = 1";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type IN ('International') AND s.studentorg = 1";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c ON c.communityID = s.targetCommunity WHERE c.international = 1 AND s.step = 9 AND s.sustainable = 1 AND s.studentorg = 1";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalstudentorgs) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SUSTAINABLE SE
            //UNIT TARGET: DEPARTMENTS
            //
            else if(m.getUnittarget().equals("Departments")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID WHERE s.step = 9 AND s.sustainable = 1 AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type IN ('Alumni') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type IN ('Parent') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type IN ('International') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c ON c.communityID = s.targetCommunity WHERE c.international = 1 AND s.step = 9 AND s.sustainable = 1 AND s.studentorg != 1";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totaldepts) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SUSTAINABLE SE
            //UNIT TARGET: FACULTY DEPARTMENTS
            //
            else if(m.getUnittarget().equals("Faculty Departments")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID WHERE s.step = 9 AND s.sustainable = 1 AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type IN ('Alumni') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type IN ('Parent') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type IN ('International') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c ON c.communityID = s.targetCommunity WHERE c.international = 1 AND s.step = 9 AND s.sustainable = 1 AND s.studentorg != 1";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalfacultydept) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SUSTAINABLE SE
            //UNIT TARGET: STAFF
            //
            else if(m.getUnittarget().equals("Staff")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'CAP' OR a.type = 'APSP' OR a.type = 'ASF' OR a.type = 'Faculty' OR a.type = 'Admin' OR a.type = 'Directhired' OR a.type = 'Independent' OR a.type = 'External'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'CAP' OR a.type = 'APSP' OR a.type = 'ASF' OR a.type = 'Faculty' OR a.type = 'Admin' OR a.type = 'Directhired' OR a.type = 'Independent' OR a.type = 'External AND a.type IN('Parent')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'CAP' OR a.type = 'APSP' OR a.type = 'ASF' OR a.type = 'Faculty' OR a.type = 'Admin' OR a.type = 'Directhired' OR a.type = 'Independent' OR a.type = 'External AND a.type IN('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'CAP' OR a.type = 'APSP' OR a.type = 'ASF' OR a.type = 'Faculty' OR a.type = 'Admin' OR a.type = 'Directhired' OR a.type = 'Independent' OR a.type = 'External AND a.type IN('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c ON c.communityID = s.targetCommunity WHERE c.international = 1 AND s.step = 9 AND s.sustainable = 1 AND a.type = 'CAP' OR a.type = 'APSP' OR a.type = 'ASF' OR a.type = 'Faculty' OR a.type = 'Admin' OR a.type = 'Directhired' OR a.type = 'Independent' OR a.type = 'External'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalstaff) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SUSTAINABLE SE
            //UNIT TARGET: CAP
            //
            else if(m.getUnittarget().equals("CAP")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'CAP'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'CAP' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'CAP' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'CAP' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.sustainable = 1 AND c.international = 1 AND a.type = 'CAP'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalcap) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SUSTAINABLE SE
            //UNIT TARGET: APSP
            //
            else if(m.getUnittarget().equals("APSP")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'APSP'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'APSP' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'APSP' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'APSP' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.sustainable = 1 AND c.international = 1 AND a.type = 'APSP'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalapsp) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SUSTAINABLE SE
            //UNIT TARGET: ASF
            //
            else if(m.getUnittarget().equals("ASF")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'ASF'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'ASF' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'ASF' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'ASF' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.sustainable = 1 AND c.international = 1 AND a.type = 'ASF'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalasf) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SUSTAINABLE SE
            //UNIT TARGET: ADMINISTRATORS
            //
            else if(m.getUnittarget().equals("Administrators")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'Admin'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'Admin' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'Admin' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'Admin' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.sustainable = 1 AND c.international = 1 AND a.type = 'Admin'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totaladmin) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SUSTAINABLE SE
            //UNIT TARGET: GRADUATE STUDENTS
            //
            else if(m.getUnittarget().equals("Graduate Students")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'Grad'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'Grad' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'Grad' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'Grad' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.sustainable = 1 AND c.international = 1 AND a.type = 'Grad'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalgrad) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SUSTAINABLE SE
            //UNIT TARGET: UNDERGRADUATE STUDENTS
            //
            else if(m.getUnittarget().equals("Undergraduate Students")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'Undergrad'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'Undergrad' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'Undergrad' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'Undergrad' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.sustainable = 1 AND c.international = 1 AND a.type = 'Undergrad'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalundergrad) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SUSTAINABLE SE
            //UNIT TARGET: INTERNATIONAL STUDENTS
            //
            else if(m.getUnittarget().equals("International Students")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'International'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'International' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'International' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    return - 1;
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.sustainable = 1 AND c.international = 1 AND a.type = 'International'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalinternationalstudents) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SUSTAINABLE SE
            //UNIT TARGET: ALUMNI
            //
            else if(m.getUnittarget().equals("Alumni")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'Alumni'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'Alumni' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    return - 1;
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type = 'Alumni' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.sustainable = 1 AND c.international = 1 AND a.type = 'Alumni'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalalumni) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SUSTAINABLE SE
            //UNIT TARGET: SOCIAL ENGAGEMENT PROGRAMS
            //
            else if(m.getUnittarget().equals("Social Engagement Programs")){
                ArrayList<SE> SE = UserDAO.retrieveALLSEProposal();
                int overallCount = 0;
                double total;
                
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(id) as count FROM seproposal s WHERE s.step = 9 AND s.sustainable = 1";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(id) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type IN('Alumni')";
                } else if(m.getEngagingtarget().equals("Parent")){
                    query = "SELECT count(id) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type IN('Parent')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(id) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.sustainable = 1 AND a.type IN('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(id) as count FROM seproposal s JOIN community c ON c.communityID = s.targetCommunity WHERE c.international = 1 AND s.step = 9 AND s.sustainable = 1";
                }
                try {

                    if (query.equals("")) {
                        return -1;
                    }

                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if (m.getNumtypetarget().equals("Percent")) {
                        return percent = ((double) count / (double) SE.size()) * 100;
                    } else if (m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                    
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        //
        //START OF
        //SDGLP
        //
        else if(m.getTypetarget().equals("Sustainable Development Goals Localization Project")){
            //
            //FOR SDGLP
            //UNIT TARGET: SE PROGRAMS PER UNIT
            //
            if(m.getUnittarget().equals("SE Programs Per Unit")){
                ArrayList<Unit> units = UserDAO.retrieveUnits();
                int overallCount = 0;
                
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(id) FROM seproposal s WHERE s.step = 9 AND s.classificationforkra != 'None' AND s.unit = ?";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(id) FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND s.unit = ? AND a.type IN ('Parent')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(id) FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND s.unit = ? AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(id) FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND s.unit = ? AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(id) FROM seproposal s JOIN community c ON s.targetCommunity = c.communityID WHERE c.international = 1 AND s.step = 9 AND s.classificationforkra != 'None' AND s.unit = ?";
                }
                try {

                    if (query.equals("")) {
                        return -1;
                    }

                    for (int i = 0; i < units.size(); i++) {
                        double temppercent = 0;
                        
                        pstmt = conn.prepareStatement(query);
                        pstmt.setString(1, units.get(i).getName());
                        rs = pstmt.executeQuery();

                        while (rs.next()) {
                            count = rs.getInt("count(id)");
                        }

                        if (count != 0) {
                            temppercent = ((double) count / (double) UserDAO.countTotalProposalByUnit(units.get(i).getName()) * 100);
                        }

                        if (temppercent >= m.getNumtarget()) {
                            overallCount += 1;
                        }
                    }
                    
                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = (double) overallCount / (double) totalunits * 100;
                    } else if(m.getNumtypetarget().equals("Count")){
                        return percent = overallCount * 100 / m.getNumtarget();
                    }
                    
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SDGLP
            //UNIT TARGET: NO SPECIFIED UNIT
            //
            else if(m.getUnittarget().equals("No Specified Unit") && m.getNumtypetarget().equals("Count")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(s.id) as count FROM seproposal s WHERE s.step = 9 AND s.classificationforkra != 'None'";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(s.id) as count FROM seproposal s JOIN sereport se ON se.seproposalID = s.id JOIN sereport_attendees a ON a.sereportID = se.id WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(s.id) as count FROM seproposal s JOIN sereport se ON se.seproposalID = s.id JOIN sereport_attendees a ON a.sereportID = se.id WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type IN ('Parent')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(s.id) as count FROM seproposal s JOIN sereport se ON se.seproposalID = s.id JOIN sereport_attendees a ON a.sereportID = se.id WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(s.id) as count FROM seproposal s JOIN community c ON c.communityID = s.targetCommunity WHERE c.international = 1 AND s.step = 9 AND s.classificationforkra != 'None'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return -1;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SDGLP
            //UNIT TARGET: STUDENT ORGS
            //
            else if(m.getUnittarget().equals("Student Organizations")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID WHERE s.step = 9 AND s.classificationforkra != 'None' AND s.studentorg = 1";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type IN ('Alumni') AND s.studentorg = 1";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type IN ('Parent') AND s.studentorg = 1";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type IN ('International') AND s.studentorg = 1";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c ON c.communityID = s.targetCommunity WHERE c.international = 1 AND s.step = 9 AND s.classificationforkra != 'None' AND s.studentorg = 1";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalstudentorgs) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SDGLP
            //UNIT TARGET: DEPARTMENTS
            //
            else if(m.getUnittarget().equals("Departments")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID WHERE s.step = 9 AND s.classificationforkra != 'None' AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type IN ('Alumni') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type IN ('Parent') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type IN ('International') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c ON c.communityID = s.targetCommunity WHERE c.international = 1 AND s.step = 9 AND s.classificationforkra != 'None' AND s.studentorg != 1";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totaldepts) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SDGLP
            //UNIT TARGET: FACULTY DEPARTMENTS
            //
            else if(m.getUnittarget().equals("Faculty Departments")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID WHERE s.step = 9 AND s.classificationforkra != 'None' AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type IN ('Alumni') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type IN ('Parent') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type IN ('International') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c ON c.communityID = s.targetCommunity WHERE c.international = 1 AND s.step = 9 AND s.classificationforkra != 'None' AND s.studentorg != 1";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalfacultydept) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SDGLP
            //UNIT TARGET: STAFF
            //
            else if(m.getUnittarget().equals("Staff")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'CAP' OR a.type = 'APSP' OR a.type = 'ASF' OR a.type = 'Faculty' OR a.type = 'Admin' OR a.type = 'Directhired' OR a.type = 'Independent' OR a.type = 'External'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'CAP' OR a.type = 'APSP' OR a.type = 'ASF' OR a.type = 'Faculty' OR a.type = 'Admin' OR a.type = 'Directhired' OR a.type = 'Independent' OR a.type = 'External AND a.type IN('Parent')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'CAP' OR a.type = 'APSP' OR a.type = 'ASF' OR a.type = 'Faculty' OR a.type = 'Admin' OR a.type = 'Directhired' OR a.type = 'Independent' OR a.type = 'External AND a.type IN('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'CAP' OR a.type = 'APSP' OR a.type = 'ASF' OR a.type = 'Faculty' OR a.type = 'Admin' OR a.type = 'Directhired' OR a.type = 'Independent' OR a.type = 'External AND a.type IN('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c ON c.communityID = s.targetCommunity WHERE c.international = 1 AND s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'CAP' OR a.type = 'APSP' OR a.type = 'ASF' OR a.type = 'Faculty' OR a.type = 'Admin' OR a.type = 'Directhired' OR a.type = 'Independent' OR a.type = 'External'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalstaff) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SDGLP
            //UNIT TARGET: CAP
            //
            else if(m.getUnittarget().equals("CAP")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'CAP'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'CAP' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'CAP' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'CAP' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.classificationforkra != 'None' AND c.international = 1 AND a.type = 'CAP'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalcap) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SDGLP
            //UNIT TARGET: APSP
            //
            else if(m.getUnittarget().equals("APSP")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'APSP'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'APSP' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'APSP' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'APSP' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.classificationforkra != 'None' AND c.international = 1 AND a.type = 'APSP'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalapsp) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SDGLP
            //UNIT TARGET: ASF
            //
            else if(m.getUnittarget().equals("ASF")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'ASF'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'ASF' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'ASF' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'ASF' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.classificationforkra != 'None' AND c.international = 1 AND a.type = 'ASF'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalasf) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SDGLP
            //UNIT TARGET: FACULTY EMPLOYEES
            //
            else if(m.getUnittarget().equals("Faculty Employees")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'Faculty'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'Faculty' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'Faculty' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'Faculty' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.classificationforkra != 'None' AND c.international = 1 AND a.type = 'Faculty'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalfaculty) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SDGLP
            //UNIT TARGET: ADMINISTRATORS
            //
            else if(m.getUnittarget().equals("Administrators")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'Admin'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'Admin' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'Admin' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'Admin' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.classificationforkra != 'None' AND c.international = 1 AND a.type = 'Admin'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totaladmin) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SDGLP
            //UNIT TARGET: GRADUATE STUDENTS
            //
            else if(m.getUnittarget().equals("Graduate Students")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'Grad'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'Grad' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'Grad' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'Grad' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.classificationforkra != 'None' AND c.international = 1 AND a.type = 'Grad'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalgrad) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SDGLP
            //UNIT TARGET: UNDERGRADUATE STUDENTS
            //
            else if(m.getUnittarget().equals("Undergraduate Students")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'Undergrad'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'Undergrad' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'Undergrad' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'Undergrad' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.classificationforkra != 'None' AND c.international = 1 AND a.type = 'Undergrad'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalundergrad) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SDGLP
            //UNIT TARGET: INTERNATIONAL STUDENTS
            //
            else if(m.getUnittarget().equals("International Students")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'International'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'International' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'International' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    return -1;
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.classificationforkra != 'None' AND c.international = 1 AND a.type = 'International'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalinternationalstudents) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SDGLP
            //UNIT TARGET: ALUMNI
            //
            else if(m.getUnittarget().equals("Alumni")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'Alumni'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'Alumni' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    return -1;
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type = 'Alumni' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.classificationforkra != 'None' AND c.international = 1 AND a.type = 'Alumni'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalalumni) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SDGLP
            //UNIT TARGET: SOCIAL ENGAGEMENT PROGRAMS
            //
            else if(m.getUnittarget().equals("Social Engagement Programs")){
                ArrayList<SE> SE = UserDAO.retrieveALLSEProposal();
                int overallCount = 0;
                double total;
                
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(id) as count FROM seproposal s WHERE s.step = 9 AND s.classificationforkra != 'None'";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(id) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type IN('Alumni')";
                } else if(m.getEngagingtarget().equals("Parent")){
                    query = "SELECT count(id) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type IN('Parent')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(id) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.classificationforkra != 'None' AND a.type IN('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(id) as count FROM seproposal s JOIN community c ON c.communityID = s.targetCommunity WHERE c.international = 1 AND s.step = 9 AND s.classificationforkra != 'None'";
                }
                try {

                    if (query.equals("")) {
                        return -1;
                    }

                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if (m.getNumtypetarget().equals("Percent")) {
                        return percent = ((double) count / (double) SE.size()) * 100;
                    } else if (m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                    
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        //
        //START OF
        //SERVICE-LEARNING
        //
        else if(m.getTypetarget().equals("Service-Learning")){
            //
            //FOR SERVICE-LEARNING
            //UNIT TARGET: SE PROGRAMS PER UNIT
            //
            if(m.getUnittarget().equals("SE Programs Per Unit")){
                ArrayList<Unit> units = UserDAO.retrieveUnits();
                int overallCount = 0;
                
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(id) FROM seproposal s WHERE s.step = 9 AND s.classificationforkra != 'None' AND s.unit = ?";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(id) FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND s.unit = ? AND a.type IN ('Parent')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(id) FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND s.unit = ? AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(id) FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND s.unit = ? AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(id) FROM seproposal s JOIN community c ON s.targetCommunity = c.communityID WHERE c.international = 1 AND s.step = 9 AND s.activityClassification = 'Service-Learning' AND s.unit = ?";
                }
                try {

                    if (query.equals("")) {
                        return -1;
                    }

                    for (int i = 0; i < units.size(); i++) {
                        double temppercent = 0;
                        
                        pstmt = conn.prepareStatement(query);
                        pstmt.setString(1, units.get(i).getName());
                        rs = pstmt.executeQuery();

                        while (rs.next()) {
                            count = rs.getInt("count(id)");
                        }

                        if (count != 0) {
                            temppercent = ((double) count / (double) UserDAO.countTotalProposalByUnit(units.get(i).getName()) * 100);
                        }

                        if (temppercent >= m.getNumtarget()) {
                            overallCount += 1;
                        }
                    }
                    
                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = (double) overallCount / (double) totalunits * 100;
                    } else if(m.getNumtypetarget().equals("Count")){
                        return percent = overallCount * 100 / m.getNumtarget();
                    }
                    
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SERVICE-LEARNING
            //UNIT TARGET: NO SPECIFIED UNIT
            //
            else if(m.getUnittarget().equals("No Specified Unit") && m.getNumtypetarget().equals("Count")){
                ArrayList<SE> SE = UserDAO.retrieveALLSEProposal();
                if (m.getEngagingtarget().equals("N/A")) {
                    query = "SELECT count(s.id) as count FROM seproposal WHERE s.id = ? AND s.step = 9 AND s.activityClassification = 'Service-Learning'";
                } else if (m.getEngagingtarget().equals("Alumni")) {
                    query = "SELECT count(s.id) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.id = ? AND s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type IN ('Alumni')";
                } else if (m.getEngagingtarget().equals("Parents")) {
                    query = "SELECT count(s.id) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.id = ? AND s.activityClassification = 'Service-Learning' AND s.step = 9 AND a.type IN ('Parent')";
                } else if (m.getEngagingtarget().equals("International Students")) {
                    query = "SELECT count(s.id) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.id = ? AND s.activityClassification = 'Service-Learning' AND s.step = 9 AND a.type IN ('International')";
                } else if (m.getEngagingtarget().equals("International Communities")) {
                    query = "SELECT count(s.id) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN community c ON s.targetCommunity = c.communityID WHERE c.international = 1 AND s.id = ? AND s.step = 9 AND s.activityClassification = 'Service-Learning'";
                }
                try {
                    if (query.equals("")) {
                        return -1;
                    }
                    for (int x = 0; x < SE.size(); x++) {
                        pstmt = conn.prepareStatement(query);
                        pstmt.setInt(1, SE.get(x).getId());
                        rs = pstmt.executeQuery();
                    }

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }
     
                    return percent = count * 100 / m.getNumtarget();
                   
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SERVICE-LEARNING
            //UNIT TARGET: STUDENT ORGS
            //
            else if(m.getUnittarget().equals("Student Organizations")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND s.studentorg = 1";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type IN ('Alumni') AND s.studentorg = 1";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type IN ('Parent') AND s.studentorg = 1";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type IN ('International') AND s.studentorg = 1";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalstudentorgs) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SERVICE-LEARNING
            //UNIT TARGET: DEPARTMENTS
            //
            else if(m.getUnittarget().equals("Departments")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type IN ('Alumni') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type IN ('Parent') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type IN ('International') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    
                }
                try {
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totaldepts) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }

                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SERVICE-LEARNING
            //UNIT TARGET: FACULTY DEPTS
            //
            else if(m.getUnittarget().equals("Faculty Departments")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type IN ('Alumni') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type IN ('Parent') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type IN ('International') AND s.studentorg != 1";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalfacultydept) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SERVICE-LEARNING
            //UNIT TARGET: STAFF
            //
            else if(m.getUnittarget().equals("Staff")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'CAP' OR a.type = 'APSP' OR a.type = 'ASF' OR a.type = 'Faculty' OR a.type = 'Admin' OR a.type = 'Directhired' OR a.type = 'Independent' OR a.type = 'External'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'CAP' OR a.type = 'APSP' OR a.type = 'ASF' OR a.type = 'Faculty' OR a.type = 'Admin' OR a.type = 'Directhired' OR a.type = 'Independent' OR a.type = 'External' AND a.type IN('Parent')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'CAP' OR a.type = 'APSP' OR a.type = 'ASF' OR a.type = 'Faculty' OR a.type = 'Admin' OR a.type = 'Directhired' OR a.type = 'Independent' OR a.type = 'External' AND a.type IN('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'CAP' OR a.type = 'APSP' OR a.type = 'ASF' OR a.type = 'Faculty' OR a.type = 'Admin' OR a.type = 'Directhired' OR a.type = 'Independent' OR a.type = 'External' AND a.type IN('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalstaff) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SERVICE-LEARNING
            //UNIT TARGET: CAP
            //
            else if(m.getUnittarget().equals("CAP")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'CAP'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'CAP' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'CAP' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'CAP' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND c.international = 1 AND a.type = 'CAP'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalcap) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SERVICE-LEARNING
            //UNIT TARGET: APSP
            //
            else if(m.getUnittarget().equals("APSP")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'APSP'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'APSP' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'APSP' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'APSP' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND c.international = 1 AND a.type = 'APSP'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalapsp) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SERVICE-LEARNING
            //UNIT TARGET: ASF
            //
            else if(m.getUnittarget().equals("ASF")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'ASF'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'ASF' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'ASF' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'ASF' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND c.international = 1 AND a.type = 'ASF'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalasf) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SERVICE-LEARNING
            //UNIT TARGET: FACULTY EMPLOYEES
            //
            else if(m.getUnittarget().equals("Faculty Employees")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'Faculty'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'Faculty' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'Faculty' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'Faculty' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND c.international = 1 AND a.type = 'Faculty'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalfaculty) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SERVICE-LEARNING
            //UNIT TARGET: ADMINISTRATORS
            //
            else if(m.getUnittarget().equals("Administrators")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'Admin'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'Admin' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'Admin' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'Admin' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND c.international = 1 AND a.type = 'Admin'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalcap) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SERVICE-LEARNING
            //UNIT TARGET: GRADUATE STUDENTS
            //
            else if(m.getUnittarget().equals("Graduate Students")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'Grad'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'Grad' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'Grad' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'Grad' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND c.international = 1 AND a.type = 'Grad'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalgrad) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SERVICE-LEARNING
            //UNIT TARGET: UNDERGRADUATE STUDENTS
            //
            else if(m.getUnittarget().equals("Undergraduate Students")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'Undergrad'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'Undergrad' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'Undergrad' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'Undergrad' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND c.international = 1 AND a.type = 'Undergrad'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalundergrad) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SERVICE-LEARNING
            //UNIT TARGET: INTERNATIONAL STUDENTS
            //
            else if(m.getUnittarget().equals("International Students")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'International'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'International' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'International' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    return -1;
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.id = s.targetCommunity WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND c.international = 1 AND a.type = 'International'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalinternationalstudents) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SERVICE-LEARNING
            //UNIT TARGET: ALUMNI
            //
            else if(m.getUnittarget().equals("Alumni")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'Alumni'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'Alumni' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'Alumni' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type = 'Alumni' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND c.international = 1 AND a.type = 'Alumni'";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) totalalumni) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //
            //FOR SERVICE-LEARNING
            //UNIT TARGET: SE PROGRAMS
            //
            else if(m.getUnittarget().equals("Social Engagement Programs")){
                if(m.getEngagingtarget().equals("N/A")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning'";
                } else if(m.getEngagingtarget().equals("Parents")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type IN ('Parents')";
                } else if(m.getEngagingtarget().equals("Alumni")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type IN ('Alumni')";
                } else if(m.getEngagingtarget().equals("International Students")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND a.type IN ('International')";
                } else if(m.getEngagingtarget().equals("International Communities")){
                    query = "SELECT count(distinct(name)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN sereport_attendees a ON se.id = a.sereportID JOIN community c on c.communityID = s.targetCommunity WHERE s.step = 9 AND s.activityClassification = 'Service-Learning' AND c.international = 1";
                }
                try{
                    if(query.equals("")){
                        return -1;
                    }
                    
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        count = rs.getInt("count");
                    }

                    if(m.getNumtypetarget().equals("Percent")){
                        return percent = ((double) count / (double) UserDAO.retrieveALLSEProposal().size()) * 100;
                    } else if(m.getNumtypetarget().equals("Count")) {
                        return percent = count * 100 / m.getNumtarget();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        if (query.equals("")) {
            return -1;
        }
        return -1;
    }
    
    public ArrayList<Integer> getTotals(){
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Integer> totals = new ArrayList();
        
        String query = "SELECT * FROM totals WHERE id = 1";

        try {
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();
            
            rs.next();
            int a = rs.getInt("totalunits");
            int b = rs.getInt("totalstudentorgs");
            int c = rs.getInt("totalfacultydept");
            int d = rs.getInt("totalstaff");
            int e = rs.getInt("totalcap");
            int f = rs.getInt("totalapsp");
            int g = rs.getInt("totalasf");
            int h = rs.getInt("totalfaculty");
            int i = rs.getInt("totaladmin");
            int j = rs.getInt("totalgrad");
            int k = rs.getInt("totalundergrad");
            int l = rs.getInt("totalinternationalstudents");
            int m = rs.getInt("totaldepts");
            int n = rs.getInt("totalalumni");
            
            totals.add(a);
            totals.add(b);
            totals.add(c);
            totals.add(d);
            totals.add(e);
            totals.add(f);
            totals.add(g);
            totals.add(h);
            totals.add(i);
            totals.add(j);
            totals.add(k);
            totals.add(l);
            totals.add(m);
            totals.add(n);
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return totals;
    }
    
    public void editTotals(ArrayList<Integer> totals){
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        
        String query = "UPDATE totals SET totalunits = ?, totalstudentorgs = ?, totalfacultydept = ?, totalstaff = ?, totalcap = ?, totalapsp = ?, totalasf = ?, totalfaculty = ?, totaladmin = ?, totalgrad = ?, totalundergrad = ?, totalinternationalstudents = ?, totaldepts = ?, totalalumni = ? WHERE id = 1";

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, totals.get(0));
            pstmt.setInt(2, totals.get(1));
            pstmt.setInt(3, totals.get(2));
            pstmt.setInt(4, totals.get(3));
            pstmt.setInt(5, totals.get(4));
            pstmt.setInt(6, totals.get(5));
            pstmt.setInt(7, totals.get(6));
            pstmt.setInt(8, totals.get(7));
            pstmt.setInt(9, totals.get(8));
            pstmt.setInt(10, totals.get(9));
            pstmt.setInt(11, totals.get(10));
            pstmt.setInt(12, totals.get(11));
            pstmt.setInt(13, totals.get(12));
            pstmt.setInt(14, totals.get(13));
            int rs = pstmt.executeUpdate();
            
            
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
    }
}

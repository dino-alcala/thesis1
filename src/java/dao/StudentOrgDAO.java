/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;


import entity.StudentOrg;
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
public class StudentOrgDAO {
    
    public ArrayList<StudentOrg> retrieveOrgList(){
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM studentorgs";
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<StudentOrg> student = new ArrayList();
        
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
 
            while (rs.next()) {
                StudentOrg s = new StudentOrg();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                student.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(StudentOrgDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                ps.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return student;
    }
    
    public void addStudentOrg(StudentOrg s){
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            String query = "INSERT INTO studentorgs (name, college) VALUES (?,?);";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, s.getName());
            pstmt.setString(2, s.getCollege());
            
            int rs2 = pstmt.executeUpdate();
            
            
        } catch (SQLException ex) {
            Logger.getLogger(StudentOrgDAO.class.getName()).log(Level.SEVERE, null, ex);
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
    }
    
    public String getCollegeByOrgName(String name){
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT college FROM studentorgs where name = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        String college = null;
        
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            rs = ps.executeQuery();
 
            while (rs.next()) {
                college = rs.getString("college");
            }

        } catch (SQLException ex) {
            Logger.getLogger(StudentOrgDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                ps.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return college;
    }
}

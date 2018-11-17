/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Budget;
import entity.Community;
import entity.Department;
import entity.FF;
import entity.FFattendees;
import entity.FFevaluation;
import entity.FFexpenses;
import entity.FFfunds;
import entity.FFobjectives;
import entity.FFparticipants;
import entity.FFreport;
import entity.Goal;
import entity.KRA;
import entity.Measure;
import entity.Notification;
import entity.SE;
import entity.SEattendees;
import entity.SEevaluation;
import entity.SEexpenses;
import entity.SEfunds;
import entity.SEobjectives;
import entity.SEparticipants;
import entity.SEreport;
import entity.SEresponsible;
import entity.SEworkplan;
import entity.Unit;
import entity.User;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LA
 */
public class UserDAO {

    public void signUp(User u) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        try {
            String query = "INSERT INTO informationsheet(firstName, lastName, emailAddress, unit, position, departmentID, username, password) VALUES(?,?,?,?,?,?,?,SHA2(?,512))";
            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, u.getFirstName());
            pstmt.setString(2, u.getLastName());
            pstmt.setString(3, u.getEmail());
            pstmt.setString(4, u.getUnit());
            pstmt.setString(5, u.getPosition());
            pstmt.setInt(6, u.getDepartment());
            pstmt.setString(7, u.getUsername());
            pstmt.setString(8, u.getPassword());

            int rs = pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public boolean Login(User u) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM informationsheet WHERE username = ? and password = SHA2(?, 512)";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            ps = conn.prepareStatement(query);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());

            rs = ps.executeQuery();

            while (rs.next()) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return false;
    }

    public boolean isAdmin(String username) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT departmentID FROM informationsheet WHERE username = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            ps = conn.prepareStatement(query);
            ps.setString(1, username);

            rs = ps.executeQuery();

            while (rs.next()) {
                if (rs.getInt("departmentID") == 1) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return false;
    }

    public boolean isOVPLM(String username) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT unit FROM informationsheet WHERE username = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            ps = conn.prepareStatement(query);
            ps.setString(1, username);

            rs = ps.executeQuery();

            while (rs.next()) {
                if (rs.getString("unit").equals("Office of the Vice President for Lasallian Mission (OVPLM)")) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return false;
    }

    public boolean isLSPO(String username) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT unit FROM informationsheet WHERE username = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            ps = conn.prepareStatement(query);
            ps.setString(1, username);

            rs = ps.executeQuery();

            while (rs.next()) {
                if (rs.getString("unit").equals("Lasallian Pastoral Office (LSPO)")) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return false;
    }

    public boolean isLMD(String username) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT unit FROM informationsheet WHERE username = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            ps = conn.prepareStatement(query);
            ps.setString(1, username);

            rs = ps.executeQuery();

            while (rs.next()) {
                if (rs.getString("unit").equals("Lasallian Mission Director (LMD)")) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return false;
    }

    public boolean isLCLM(String username) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT unit FROM informationsheet WHERE username = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            ps = conn.prepareStatement(query);
            ps.setString(1, username);

            rs = ps.executeQuery();

            while (rs.next()) {
                if (rs.getString("unit").equals("Laguna Campus Lasallian Mission (LCLM)")) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return false;
    }

    public boolean isDSA(String username) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT unit FROM informationsheet WHERE username = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            ps = conn.prepareStatement(query);
            ps.setString(1, username);

            rs = ps.executeQuery();

            while (rs.next()) {
                if (rs.getString("unit").equals("Dean of Student Affairs (DSA)")) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return false;
    }

    public boolean isADEALM(String username) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT position FROM informationsheet WHERE username = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            ps = conn.prepareStatement(query);
            ps.setString(1, username);

            rs = ps.executeQuery();

            while (rs.next()) {
                if (rs.getString("position").contains("ADEALM")) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return false;
    }

    public boolean isDean(String username) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT position FROM informationsheet WHERE username = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            ps = conn.prepareStatement(query);
            ps.setString(1, username);

            rs = ps.executeQuery();

            while (rs.next()) {
                if (rs.getString("position").equals("CCS - Dean") || rs.getString("position").equals("BAGCED - Dean") || rs.getString("position").equals("COL - Dean")
                        || rs.getString("position").equals("CLA - Dean") || rs.getString("position").equals("GCOE - Dean") || rs.getString("position").equals("COS - Dean")
                        || rs.getString("position").equals("RVRCOB - Dean") || rs.getString("position").equals("SOE - Dean")) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return false;
    }

    public boolean isAssistantDeanforLM(String username) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT position FROM informationsheet WHERE username = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            ps = conn.prepareStatement(query);
            ps.setString(1, username);

            rs = ps.executeQuery();

            while (rs.next()) {
                if (rs.getString("position").contains("ADLM")) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return false;
    }

    public boolean isChairperson(String username) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT position FROM informationsheet WHERE username = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            ps = conn.prepareStatement(query);
            ps.setString(1, username);

            rs = ps.executeQuery();

            while (rs.next()) {
                if (rs.getString("position").contains("Chairperson")) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return false;
    }

    public boolean isUnitHead(String username) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT position FROM informationsheet WHERE username = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            ps = conn.prepareStatement(query);
            ps.setString(1, username);

            rs = ps.executeQuery();

            while (rs.next()) {
                if (rs.getString("position").contains("Unit Head")) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return false;
    }

    public boolean isDirector(String username) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT position FROM informationsheet WHERE username = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            ps = conn.prepareStatement(query);
            ps.setString(1, username);

            rs = ps.executeQuery();

            while (rs.next()) {
                if (rs.getString("position").contains("Director")) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return false;
    }

    public boolean isDeptChair(String username) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT position FROM informationsheet WHERE username = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            ps = conn.prepareStatement(query);
            ps.setString(1, username);

            rs = ps.executeQuery();
            boolean y = false;

            while (rs.next()) {
                if (rs.getString("position").contains("Department Chair")) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return false;
    }

    public boolean isUnitChair(String username) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT position FROM informationsheet WHERE username = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            ps = conn.prepareStatement(query);
            ps.setString(1, username);

            rs = ps.executeQuery();
            boolean y = false;

            while (rs.next()) {
                if (rs.getString("position").contains("Unit Chair")) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return false;
    }

    public boolean isSEDirector(String username) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT position FROM informationsheet WHERE username = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            ps = conn.prepareStatement(query);
            ps.setString(1, username);

            rs = ps.executeQuery();
            boolean y = false;

            while (rs.next()) {
                if (rs.getString("position").contains("Social Engagement Director")) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return false;
    }

    public boolean isVpVc(String username) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT position FROM informationsheet WHERE username = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            ps = conn.prepareStatement(query);
            ps.setString(1, username);

            rs = ps.executeQuery();
            boolean y = false;

            while (rs.next()) {
                if (rs.getString("position").contains("VP/VC")) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return false;
    }

    public boolean isCOSCA(String username) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT unit FROM informationsheet WHERE username = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            ps = conn.prepareStatement(query);
            ps.setString(1, username);

            rs = ps.executeQuery();

            while (rs.next()) {
                if (rs.getString("unit").equals("Center for Social Concern and Action (COSCA)")) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return false;
    }

    public boolean isOPMD(String username) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT unit FROM informationsheet WHERE username = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            ps = conn.prepareStatement(query);
            ps.setString(1, username);

            rs = ps.executeQuery();

            while (rs.next()) {
                if (rs.getString("unit").equals("Office of Personnel Management Director (OPND)")) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return false;
    }

    public boolean isLMC(String username) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT unit FROM informationsheet WHERE username = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            ps = conn.prepareStatement(query);
            ps.setString(1, username);

            rs = ps.executeQuery();

            while (rs.next()) {
                if (rs.getString("unit").equals("Lasallian Mission Council")) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return false;
    }

    public boolean isUnit(String username, String password) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM informationsheet WHERE username = ? and password = SHA2(?, 512)";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);

            rs = ps.executeQuery();

            while (rs.next()) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return false;
    }

    public ArrayList<User> retrieveEmployees() {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM informationsheet i JOIN department d ON i.departmentID = d.departmentID";
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<User> users = new ArrayList();

        try {
            ps = conn.prepareStatement(query);

            rs = ps.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setFirstName(rs.getString("firstName"));
                u.setLastName(rs.getString("lastName"));
                u.setEmail(rs.getString("emailAddress"));
                u.setUnit(rs.getString("unit"));
                u.setDepartment(rs.getInt("departmentID"));
                u.setUsername(rs.getString("username"));
                u.setDepartmentType(rs.getString("department"));
                users.add(u);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return users;
    }

    public User getEmployee(int userID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM informationsheet i JOIN department d ON i.departmentID = d.departmentID WHERE i.id=?";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            rs = ps.executeQuery();

            while (rs.next()) {
                u.setId(rs.getInt("id"));
                u.setFirstName(rs.getString("firstName"));
                u.setLastName(rs.getString("lastName"));
                u.setEmail(rs.getString("emailAddress"));
                u.setUnit(rs.getString("unit"));
                u.setDepartment(rs.getInt("departmentID"));
                u.setUsername(rs.getString("username"));
                u.setDepartmentType(rs.getString("department"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return u;
    }

    public void updateEmployee(User u) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        try {
            String query = "UPDATE informationsheet SET firstName = ?, lastName = ?, emailAddress = ?, unit = ?, departmentID = ?, password = SHA2(?,512) WHERE id = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, u.getFirstName());
            pstmt.setString(2, u.getLastName());
            pstmt.setString(3, u.getEmail());
            pstmt.setString(4, u.getUnit());
            pstmt.setInt(5, u.getDepartment());
            pstmt.setString(6, u.getPassword());
            pstmt.setInt(7, u.getId());

            int rs = pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public int getIDbyUsername(String username) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM informationsheet WHERE username = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int id = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();

            while (rs.next()) {
                id = rs.getInt("id");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return id;
    }

    public String getNameByID(int userID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM informationsheet WHERE id = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;

        String name = "";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            rs = ps.executeQuery();

            while (rs.next()) {
                name = rs.getString("firstName") + " " + rs.getString("lastName");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return name;
    }

    public ArrayList<Unit> retrieveUnits() {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM unit";
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Unit> units = new ArrayList();

        try {
            ps = conn.prepareStatement(query);

            rs = ps.executeQuery();

            while (rs.next()) {

                Unit u = new Unit();
                u.setUnitID(rs.getInt("unitID"));
                u.setName(rs.getString("unitName"));
                u.setHead(rs.getString("unitHead"));
                u.setType(rs.getString("unitType"));
                u.setDepartments(rs.getInt("departments"));
                u.setFaculty(rs.getInt("numberOfFaculty"));
                u.setAdmin(rs.getInt("numberOfAdmin"));
                u.setApsp(rs.getInt("numberOfAPSP"));
                u.setAsf(rs.getInt("numberOfASF"));
                u.setCap(rs.getInt("numberOfCAP"));
                u.setDirecthired(rs.getInt("numberOfDirectHired"));
                u.setIndependent(rs.getInt("numberOfIndependent"));
                u.setExternal(rs.getInt("numberOfExternal"));
                u.setDescription(rs.getString("unitDescription"));
                u.setUserID(rs.getInt("userID"));
                units.add(u);

            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return units;
    }

    public ArrayList<Unit> retrieveUnitsAcademic() {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM unit where unitType = 'Academic'";
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Unit> units = new ArrayList();

        try {
            ps = conn.prepareStatement(query);

            rs = ps.executeQuery();

            while (rs.next()) {

                Unit u = new Unit();
                u.setUnitID(rs.getInt("unitID"));
                u.setName(rs.getString("unitName"));
                u.setHead(rs.getString("unitHead"));
                u.setType(rs.getString("unitType"));
                u.setDepartments(rs.getInt("departments"));
                u.setFaculty(rs.getInt("numberOfFaculty"));
                u.setAdmin(rs.getInt("numberOfAdmin"));
                u.setApsp(rs.getInt("numberOfAPSP"));
                u.setAsf(rs.getInt("numberOfASF"));
                u.setCap(rs.getInt("numberOfCAP"));
                u.setDirecthired(rs.getInt("numberOfDirectHired"));
                u.setIndependent(rs.getInt("numberOfIndependent"));
                u.setExternal(rs.getInt("numberOfExternal"));
                u.setDescription(rs.getString("unitDescription"));
                u.setUserID(rs.getInt("userID"));
                units.add(u);

            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return units;
    }

    public Unit getUnitbyID(int unitID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM unit WHERE unitID = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        Unit u = new Unit();

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, unitID);
            rs = ps.executeQuery();

            while (rs.next()) {

                u.setUnitID(rs.getInt("unitID"));
                u.setName(rs.getString("unitName"));
                u.setHead(rs.getString("unitHead"));
                u.setType(rs.getString("unitType"));
                u.setDepartments(rs.getInt("departments"));
                u.setFaculty(rs.getInt("numberOfFaculty"));
                u.setAdmin(rs.getInt("numberOfAdmin"));
                u.setApsp(rs.getInt("numberOfAPSP"));
                u.setAsf(rs.getInt("numberOfASF"));
                u.setCap(rs.getInt("numberOfCAP"));
                u.setDirecthired(rs.getInt("numberOfDirectHired"));
                u.setIndependent(rs.getInt("numberOfIndependent"));
                u.setExternal(rs.getInt("numberOfExternal"));
                u.setDescription(rs.getString("unitDescription"));
                u.setUserID(rs.getInt("userID"));

            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return u;
    }

    public ArrayList<Integer> retrieveDepartmentByUnitID(int unitID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM unit_department WHERE unitID = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Integer> deptid = new ArrayList();

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, unitID);
            rs = ps.executeQuery();

            while (rs.next()) {
                int dept = 0;
                dept = rs.getInt("departmentID");
                deptid.add(dept);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return deptid;
    }

    public ArrayList<Department> getDepartmentsIDsByUnitID(int unitID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT departmentID FROM unit_department WHERE unitID = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Department> Departments = new ArrayList<Department>();

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, unitID);
            rs = ps.executeQuery();

            while (rs.next()) {
                Department d = new Department();
                d.setDepartmentID(rs.getInt("departmentID"));
                Departments.add(d);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return Departments;
    }

    public Department getDepartmentByID(int departmentID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM department WHERE departmentID = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        Department dept = new Department();

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, departmentID);
            rs = ps.executeQuery();

            while (rs.next()) {
                dept.setName(rs.getString("department"));
                dept.setDepartmentID(rs.getInt("departmentID"));
                dept.setFaculty(rs.getInt("numberOfFaculty"));
                dept.setAdmin(rs.getInt("numberofAdmin"));
                dept.setApsp(rs.getInt("numberofAPSP"));
                dept.setAsf(rs.getInt("numberofASF"));
                dept.setCap(rs.getInt("numberofCAP"));
                dept.setDirecthired(rs.getInt("numberofDirectHired"));
                dept.setIndependent(rs.getInt("numberofIndependent"));
                dept.setExternal(rs.getInt("numberofExternal"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return dept;
    }

    public String getDepartmentByffID(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM ffproposal WHERE id = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        String department = "";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, ffID);
            rs = ps.executeQuery();

            while (rs.next()) {
                department = rs.getString("department");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return department;
    }

    public int getDepartmentIDByName(String department) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM department WHERE department = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        int departmentID = 0;

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, department);
            rs = ps.executeQuery();

            while (rs.next()) {
                departmentID = rs.getInt("departmentID");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return departmentID;
    }

    public void updateUnit(Unit u) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE unit SET unitName = ?, unitHead = ?, unitType = ?, numberOfStaff = ?, numberOfFaculty = ?, numberOfAdmin = ?, numberOfAPSP = ?, numberOfSAF = ?, numberOFCAP = ?, numberOfStudent = ?, unitDescription = ? WHERE unitID = ?";
            pstmt = conn.prepareStatement(query);
            /*
            pstmt.setString(1, u.getName());
            pstmt.setString(2, u.getHead());
            pstmt.setString(3, u.getType());
            pstmt.setInt(4, u.getStaff());
            pstmt.setInt(5, u.getFaculty());
            pstmt.setInt(6, u.getAdmin());
            pstmt.setInt(7, u.getApsp());
            pstmt.setInt(8, u.getSaf());
            pstmt.setInt(9, u.getCap());
            pstmt.setInt(10, u.getStudent());
            pstmt.setString(11, u.getDescription());
            pstmt.setInt(12, u.getUnitID());
             */
            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(OvplmDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public ArrayList<Community> retrieveCommunity() {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM community";
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Community> community = new ArrayList();

        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Community c = new Community();
                c.setId(rs.getInt("communityID"));
                c.setName(rs.getString("name"));
                c.setContactperson(rs.getString("contactPerson"));
                c.setContactnumber(rs.getString("contactNumber"));
                c.setUnitnumber(rs.getString("unitNumber"));
                c.setStreet(rs.getString("street"));
                c.setBarangay(rs.getString("barangay"));
                c.setCity(rs.getString("city"));
                c.setDescription(rs.getString("description"));
                community.add(c);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return community;
    }

    public Community retrieveCommunityByID(int communityID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM community WHERE communityID = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        Community c = new Community();
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, communityID);
            rs = ps.executeQuery();

            while (rs.next()) {
                c.setId(rs.getInt("communityID"));
                c.setName(rs.getString("name"));
                c.setContactperson(rs.getString("contactPerson"));
                c.setContactnumber(rs.getString("contactNumber"));
                c.setUnitnumber(rs.getString("unitNumber"));
                c.setStreet(rs.getString("street"));
                c.setBarangay(rs.getString("barangay"));
                c.setCity(rs.getString("city"));
                c.setDescription(rs.getString("description"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return c;
    }

    public String getDepartmentByUserID(int userID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM informationsheet i JOIN department d ON i.departmentID = d.departmentID where i.id = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        String department = "";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            rs = ps.executeQuery();

            while (rs.next()) {
                department = rs.getString("department");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return department;
    }

    public int getDepartmentIDByUserID(int userID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM informationsheet WHERE id = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        int department = 0;

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            rs = ps.executeQuery();

            while (rs.next()) {
                department = rs.getInt("departmentID");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return department;
    }

    public int getUserIDforNotifsDepartmentChair(String unit, int departmentID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM informationsheet WHERE unit = ? AND departmentID = ? AND position LIKE ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        int userID = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, unit);
            ps.setInt(2, departmentID);
            ps.setString(3, "%Department Chair%");
            rs = ps.executeQuery();

            while (rs.next()) {
                userID = rs.getInt("id");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return userID;
    }

    public int getUserIDforNotifsUnitChair(String unit) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM informationsheet WHERE unit = ?  AND position LIKE ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        int userID = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, unit);
            ps.setString(2, "%Unit Chair%");
            rs = ps.executeQuery();

            while (rs.next()) {
                userID = rs.getInt("id");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return userID;
    }

    public int getUserIDforNotifsChairperson(String unit, int departmentID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM informationsheet WHERE unit = ? AND departmentID = ? AND position LIKE ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        int userID = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, unit);
            ps.setInt(2, departmentID);
            ps.setString(3, "%Chairperson%");
            rs = ps.executeQuery();

            while (rs.next()) {
                userID = rs.getInt("id");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return userID;
    }

    public int getUserIDforNotifsAssistantDean(String unit) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM informationsheet WHERE unit = ? AND position LIKE ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        int userID = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, unit);
            ps.setString(2, "%ADLM%");
            rs = ps.executeQuery();

            while (rs.next()) {
                userID = rs.getInt("id");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return userID;
    }

    /*public int getUserIDforUnitNotifs(String unit) {
=======
=======
>>>>>>> e8211e87e8aa3ec1554b41e00596edb74fbd35b0

    public int getUserIDforNotifsAssistantDean(String unit) {
>>>>>>> e8211e87e8aa3ec1554b41e00596edb74fbd35b0
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM informationsheet WHERE unit = ? AND position LIKE ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        int userID = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, unit);
            ps.setString(2, "%ADEALM%");
            rs = ps.executeQuery();

            while (rs.next()) {
                userID = rs.getInt("id");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
            } catch (Exception e) {
                 }
            try {
                ps.close();
            } catch (Exception e) {
                 }
            try {
                conn.close();
            } catch (Exception e) {
                }
        }
        return userID;
    }*/
    public int getUserIDforNotifsADEALM(String unit) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM informationsheet WHERE unit = ? AND position LIKE ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        int userID = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, unit);
            ps.setString(2, "%ADEALM%");
            rs = ps.executeQuery();

            while (rs.next()) {
                userID = rs.getInt("id");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return userID;
    }

    public int getUserIDforNotifsDean(String unit) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM informationsheet WHERE unit = ? AND position LIKE ? LIMIT 1";
        PreparedStatement ps = null;
        ResultSet rs = null;
        int userID = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, unit);
            ps.setString(2, "%Dean%");
            rs = ps.executeQuery();

            while (rs.next()) {
                userID = rs.getInt("id");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return userID;
    }

    public int getUserIDforNotifsUnitHead(String unit) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM informationsheet WHERE unit = ? AND position LIKE ? LIMIT 1";
        PreparedStatement ps = null;
        ResultSet rs = null;
        int userID = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, unit);
            ps.setString(2, "%Unit Head%");
            rs = ps.executeQuery();

            while (rs.next()) {
                userID = rs.getInt("id");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return userID;
    }

    public int getUserIDforNotifsDirector(String unit) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM informationsheet WHERE unit = ? AND position LIKE ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        int userID = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, unit);
            ps.setString(2, "%Director%");
            rs = ps.executeQuery();

            while (rs.next()) {
                userID = rs.getInt("id");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return userID;
    }

    public int getUserIDforNotifsSEDirector(String unit) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM informationsheet WHERE unit = ? AND position LIKE ? LIMIT 1";
        PreparedStatement ps = null;
        ResultSet rs = null;
        int userID = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, unit);
            ps.setString(2, "%Social Engagement Director%");
            rs = ps.executeQuery();

            while (rs.next()) {
                userID = rs.getInt("id");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return userID;
    }

    public int getUserIDforNotifsVPVC(String unit) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM informationsheet WHERE unit = ? AND position LIKE ? LIMIT 1";
        PreparedStatement ps = null;
        ResultSet rs = null;
        int userID = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, unit);
            ps.setString(2, "%VP/VC%");
            rs = ps.executeQuery();

            while (rs.next()) {
                userID = rs.getInt("id");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return userID;
    }

    public int getUserIDforNotifsNeil() {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM informationsheet WHERE unit = ? AND position LIKE ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        int userID = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, "Center for Social Concern and Action (COSCA)");
            ps.setString(2, "%Sir Neil Position%");
            rs = ps.executeQuery();

            while (rs.next()) {
                userID = rs.getInt("id");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return userID;
    }

    public int getUserIDforNotifsJames() {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM informationsheet WHERE unit = ? AND position LIKE ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        int userID = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, "Lasallian Pastoral Office (LSPO)");
            ps.setString(2, "%Director%");
            rs = ps.executeQuery();

            while (rs.next()) {
                userID = rs.getInt("id");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return userID;
    }

    public int getUserIDforNotifsPosition(String position) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM informationsheet WHERE position LIKE ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        int userID = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + position + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                userID = rs.getInt("id");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return userID;
    }

    public String getUnitByUserID(int userID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT unit FROM informationsheet WHERE id = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        String unit = "";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            rs = ps.executeQuery();

            while (rs.next()) {
                unit = rs.getString("unit");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return unit;
    }

    public String getUnitTypeByName(String unitname) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT unitType FROM unit WHERE unitName = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        String unit = "";

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, unitname);
            rs = ps.executeQuery();

            while (rs.next()) {
                unit = rs.getString("unitType");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return unit;
    }

    public Unit getUnitByName(String unit) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM unit WHERE unitName = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        Unit u = new Unit();

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, unit);
            rs = ps.executeQuery();

            while (rs.next()) {
                u.setFaculty(rs.getInt("numberOfFaculty"));
                u.setApsp(rs.getInt("numberOfAPSP"));
                u.setAsf(rs.getInt("numberOfASF"));
                u.setDirecthired(rs.getInt("numberOfDirectHired"));
                u.setType(rs.getString("unitType"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return u;
    }

    public Unit getDepartmentDetailsByDepartment(String department) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM department WHERE department = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        Unit u = new Unit();

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, department);
            rs = ps.executeQuery();

            while (rs.next()) {
                u.setApsp(rs.getInt("numberOfAPSP"));
                u.setAsf(rs.getInt("numberOfASF"));
                u.setFaculty(rs.getInt("numberOfFaculty"));
                u.setDirecthired(rs.getInt("numberOfDirectHired"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return u;
    }

    public void AddSE(SE SE) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs2 = null;
        try {
            String query = "INSERT INTO seproposal(unit, department, datecreated, programHead, activityClassification, targetCommunity, targetKRA, targetGoal, actualImplementation, totalAmountRequested, nameOfPartner, address, contactPerson, mobileNumber, email, description, objectives, academicStaffPopulation, academicStaffExpected, supportStaffPopulation, supportStaffExpected, undergraduatePopulation, undergraduateExpected, graduatePopulation, graduateExpected, step, userID, programName, problemaddressed, sourceOfFunds, unittype, datetime, addressimplementation, studentorg, explanation) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(query);

            java.util.Date dt = new java.util.Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            pstmt.setString(1, SE.getUnit());
            pstmt.setString(2, SE.getDepartment());
            pstmt.setDate(3, SE.getDate());
            pstmt.setString(4, SE.getProgramHead());
            pstmt.setString(5, SE.getActivityClassification());
            pstmt.setInt(6, SE.getTargetCommunity());
            pstmt.setInt(7, SE.getTargetKRA());
            pstmt.setInt(8, SE.getTargetGoal());
            pstmt.setDate(9, SE.getActualDate());
            pstmt.setDouble(10, SE.getTotalAmount());
            pstmt.setString(11, SE.getNameSEbeneficiaries());
            pstmt.setString(12, SE.getAddressSEbeneficiaries());
            pstmt.setString(13, SE.getContactPersonSEbeneficiaries());
            pstmt.setString(14, SE.getMobileSEbeneficiaries());
            pstmt.setString(15, SE.getEmailSEbeneficiaries());
            pstmt.setString(16, SE.getDescriptionSEbeneficiaries());
            pstmt.setString(17, SE.getObjectives());
            pstmt.setInt(18, SE.getTotalpopulationAcademicStaff());
            pstmt.setInt(19, SE.getExpectedAcademicStaff());
            pstmt.setInt(20, SE.getTotalpopulationSupportStaff());
            pstmt.setInt(21, SE.getExpectedSupportStaff());
            pstmt.setInt(22, SE.getTotalpopulationUndergraduate());
            pstmt.setInt(23, SE.getExpectedUndergraduate());
            pstmt.setInt(24, SE.getTotalPopulationGraduate());
            pstmt.setInt(25, SE.getExpectedGraduate());
            pstmt.setInt(26, SE.getStep());
            pstmt.setInt(27, SE.getUserID());
            pstmt.setString(28, SE.getName());
            pstmt.setString(29, SE.getSocialCommunityProblem());
            pstmt.setString(30, SE.getSourceOfFunds());
            pstmt.setString(31, SE.getUnittype());
            pstmt.setString(32, sdf.format(dt));
            pstmt.setString(33, SE.getImplementationaddress());
            pstmt.setInt(34, SE.getStudentorg());
            pstmt.setString(35, SE.getExplanation());

            int rs = pstmt.executeUpdate();

            query = "SELECT * FROM seproposal ORDER BY id DESC LIMIT 1";

            pstmt = conn.prepareStatement(query);

            rs2 = pstmt.executeQuery();

            int seID = 0;

            while (rs2.next()) {
                seID = rs2.getInt("id");
            }

            for (int i = 0; i < SE.getComponent().size(); i++) {
                query = "INSERT INTO seproposal_component(seproposalID, component) VALUES(?,?)";

                pstmt = conn.prepareStatement(query);
                pstmt.setInt(1, seID);
                pstmt.setString(2, SE.getComponent().get(i));

                rs = pstmt.executeUpdate();
            }

            for (int i = 0; i < SE.getWorkplan().size(); i++) {
                query = "INSERT INTO seproposal_workplan(startdate, activity, timestartTimeend, venue, timeend, seproposalID) VALUES (?,?,?,?,?,?)";

                pstmt = conn.prepareStatement(query);
                pstmt.setDate(1, SE.getWorkplan().get(i).getDate());
                pstmt.setString(2, SE.getWorkplan().get(i).getActivity());
                pstmt.setString(3, SE.getWorkplan().get(i).getTimestarttimeend());
                pstmt.setString(4, SE.getWorkplan().get(i).getVenue());
                pstmt.setString(5, SE.getWorkplan().get(i).getTimestarttimeend2());
                pstmt.setInt(6, seID);

                rs = pstmt.executeUpdate();

            }

            for (int i = 0; i < SE.getExpenses().size(); i++) {
                query = "INSERT INTO seproposal_expenses(item, unitcost, quantity, subtotal, seproposalID) VALUES(?,?,?,?,?)";

                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, SE.getExpenses().get(i).getItem());
                pstmt.setDouble(2, SE.getExpenses().get(i).getUnitcost());
                pstmt.setInt(3, SE.getExpenses().get(i).getQuantity());
                pstmt.setDouble(4, SE.getExpenses().get(i).getSubtotal());
                pstmt.setInt(5, seID);

                rs = pstmt.executeUpdate();
            }

            for (int i = 0; i < SE.getResponsible().size(); i++) {
                query = "INSERT INTO seproposal_personresponsible(name, email, seproposalID) VALUES(?,?,?)";

                pstmt = conn.prepareCall(query);
                pstmt.setString(1, SE.getResponsible().get(i).getName());
                pstmt.setString(2, SE.getResponsible().get(i).getEmail());
                pstmt.setInt(3, seID);

                rs = pstmt.executeUpdate();
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void AddSEComponent(ArrayList<String> component, int seID, String explanation) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;

        try {
            String query = "UPDATE seproposal SET explanation = ? WHERE id = ?";

            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, explanation);
            pstmt.setInt(2, seID);

            int rs = pstmt.executeUpdate();

            for (int i = 0; i < component.size(); i++) {
                query = "INSERT INTO seproposal_component(seproposalID, component) VALUES(?,?)";

                pstmt = conn.prepareStatement(query);
                pstmt.setInt(1, seID);
                pstmt.setString(2, component.get(i));

                rs = pstmt.executeUpdate();
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void auditSE(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs2 = null;

        int rs = 0;
        try {

            String query = "INSERT INTO seproposal_revisions(seproposalID, unit, department, datecreated, programHead, activityClassification, targetCommunity, targetKRA, targetGoal, targetMeasure, titleOfActivity, actualImplementation, totalAmountRequested, nameOfPartner, address, contactPerson, mobileNumber, email, description, objectives, explanation, academicStaffPopulation, academicStaffExpected, supportStaffPopulation, supportStaffExpected, undergraduatePopulation, undergraduateExpected, graduatePopulation, graduateExpected, step, deptunitRemarks, externaldirectorRemarks, deanRemarks, coscaRemarks, unitchairremarks, sedirectorremarks, vpvcremarks, programName, problemaddressed, sourceOfFunds, deptunitdatetime, externaldirectordatetime, deandatetime, coscadatetime, unitchairdatetime, sedirectordatetime, vpvcdatetime, isRevise, datetime) SELECT id, unit, department, datecreated, programHead, activityClassification, targetCommunity, targetKRA, targetGoal, targetMeasure, titleOfActivity, actualImplementation, totalAmountRequested, nameOfPartner, address, contactPerson, mobileNumber, email, description, objectives, explanation, academicStaffPopulation, academicStaffExpected, supportStaffPopulation, supportStaffExpected, undergraduatePopulation, undergraduateExpected, graduatePopulation, graduateExpected, step, deptunitRemarks, externaldirectorRemarks, deanRemarks, coscaRemarks, unitchairremarks, sedirectorremarks, vpvcremarks, programName, problemaddressed, sourceOfFunds, deptunitdatetime, externaldirectordatetime, deandatetime, coscadatetime, unitchairdatetime, sedirectordatetime, vpvcdatetime, isRevise, datetime FROM seproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs = pstmt.executeUpdate();

            query = "SELECT * FROM seproposal_revisions ORDER BY id DESC LIMIT 1";
            pstmt = conn.prepareStatement(query);

            int newID = 0;

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                newID = rs2.getInt("id");
            }

            query = "INSERT INTO seproposal_revisions_component(seproposalID, component) SELECT seproposalID, component FROM seproposal_component WHERE seproposalID = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs = pstmt.executeUpdate();

            query = "UPDATE seproposal_revisions_component SET revisionID = ? WHERE revisionID is null";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, newID);

            rs = pstmt.executeUpdate();

            query = "INSERT INTO seproposal_revisions_workplan(startdate, activity, timestartTimeend, venue, timeend, seproposalID) SELECT startdate, activity, timestartTimeend, venue, timeend, seproposalID FROM seproposal_workplan WHERE seproposalID = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs = pstmt.executeUpdate();

            query = "UPDATE seproposal_revisions_workplan SET revisionID = ? WHERE revisionID is null";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, newID);

            rs = pstmt.executeUpdate();

            query = "INSERT INTO seproposal_revisions_expenses(item, unitcost, quantity, subtotal, seproposalID) SELECT item, unitcost, quantity, subtotal, seproposalID FROM seproposal_expenses WHERE seproposalID = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs = pstmt.executeUpdate();

            query = "UPDATE seproposal_revisions_expenses SET revisionID = ? WHERE revisionID is null";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, newID);

            rs = pstmt.executeUpdate();

            query = "INSERT INTO seproposal_revisions_personresponsible(name, email, seproposalID) SELECT name, email, seproposalID FROM seproposal_personresponsible WHERE seproposalID = ?";

            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs = pstmt.executeUpdate();

            query = "UPDATE seproposal_revisions_personresponsible SET revisionID = ? WHERE revisionID is null";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, newID);

            rs = pstmt.executeUpdate();

            query = "INSERT INTO seproposal_revisions_measures(seproposalID, measureID) SELECT seproposalID, measureID FROM se_measures WHERE seproposalID = ?";

            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs = pstmt.executeUpdate();

            query = "UPDATE seproposal_revisions_measures SET revisionID = ? WHERE revisionID is null";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, newID);

            rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void auditFF(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs2 = null;

        int rs = 0;
        try {

            String query = "INSERT INTO ffproposal_revisions(ffproposalID, unit, department, datecreated, programHead, activityClassification, projectName, venue, speaker, objectives, actualImplementation, totalAmount, sourceOfFunds, step, chairdirectorRemarks, vplmRemarks, deanunitRemarks, lspoRemarks, unitheadremarks, directorremarks, chairdirectordatetime, vplmdatetime, deanunitdatetime, lspodatetime, unitheaddatetime, directordatetime, datetime) SELECT id, unit, department, datecreated, programHead, activityClassification, projectName, venue, speaker, objectives, actualImplementation, totalAmount, sourceOfFunds, step, chairdirectorRemarks, vplmRemarks, deanunitRemarks, lspoRemarks, unitheadremarks, directorremarks, chairdirectordatetime, vplmdatetime, deanunitdatetime, lspodatetime, unitheaddatetime, directordatetime, datetime FROM ffproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            rs = pstmt.executeUpdate();

            query = "SELECT * FROM ffproposal_revisions ORDER BY id DESC LIMIT 1";
            pstmt = conn.prepareStatement(query);

            int newID = 0;

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                newID = rs2.getInt("id");
            }

            query = "INSERT INTO ffproposal_revisions_attendees(ffproposalID, name, email) SELECT ffproposalID, name, email FROM ffproposal_attendees WHERE ffproposalID = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            rs = pstmt.executeUpdate();

            query = "UPDATE ffproposal_revisions_attendees SET revisionID = ? WHERE revisionID is null";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, newID);

            rs = pstmt.executeUpdate();

            query = "INSERT INTO ffproposal_revisions_expenses(item, unitcost, quantity, subtotal, ffproposalID) SELECT item, unitcost, quantity, subtotal, ffproposalID FROM ffproposal_expenses WHERE ffproposalID = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            rs = pstmt.executeUpdate();

            query = "UPDATE ffproposal_revisions_expenses SET revisionID = ? WHERE revisionID is null";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, newID);

            rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void EditSE(SE SE) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs2 = null;
        try {
            String query = "UPDATE seproposal SET programHead = ?, activityClassification = ?, targetCommunity = ?, targetKRA = ?, targetGoal = ?, targetMeasure = ?, titleOfActivity = ?, actualImplementation = ?, totalAmountRequested = ?, nameOfPartner = ?, address = ?, contactPerson = ?, mobileNumber = ?, email = ?, description = ?, objectives = ?, explanation = ?, academicStaffPopulation = ?, academicStaffExpected = ?, supportStaffPopulation = ?, supportStaffExpected = ?, undergraduatePopulation = ?, undergraduateExpected = ?, graduatePopulation = ?, graduateExpected = ?, step = ?, programName = ?, problemaddressed = ?, sourceOfFunds = ?, datetime = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);

            java.util.Date dt = new java.util.Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            pstmt.setString(1, SE.getProgramHead());
            pstmt.setString(2, SE.getActivityClassification());
            pstmt.setInt(3, SE.getTargetCommunity());
            pstmt.setInt(4, SE.getTargetKRA());
            pstmt.setInt(5, SE.getTargetGoal());
            pstmt.setInt(6, SE.getTargetMeasure());
            pstmt.setString(7, SE.getTitleActivity());
            pstmt.setDate(8, SE.getActualDate());
            pstmt.setDouble(9, SE.getTotalAmount());
            pstmt.setString(10, SE.getNameSEbeneficiaries());
            pstmt.setString(11, SE.getAddressSEbeneficiaries());
            pstmt.setString(12, SE.getContactPersonSEbeneficiaries());
            pstmt.setString(13, SE.getMobileSEbeneficiaries());
            pstmt.setString(14, SE.getEmailSEbeneficiaries());
            pstmt.setString(15, SE.getDescriptionSEbeneficiaries());
            pstmt.setString(16, SE.getObjectives());
            pstmt.setString(17, SE.getExplanation());
            pstmt.setInt(18, SE.getTotalpopulationAcademicStaff());
            pstmt.setInt(19, SE.getExpectedAcademicStaff());
            pstmt.setInt(20, SE.getTotalpopulationSupportStaff());
            pstmt.setInt(21, SE.getExpectedSupportStaff());
            pstmt.setInt(22, SE.getTotalpopulationUndergraduate());
            pstmt.setInt(23, SE.getExpectedUndergraduate());
            pstmt.setInt(24, SE.getTotalPopulationGraduate());
            pstmt.setInt(25, SE.getExpectedGraduate());
            pstmt.setInt(26, SE.getStep());
            pstmt.setString(27, SE.getName());
            pstmt.setString(28, SE.getSocialCommunityProblem());
            pstmt.setString(29, SE.getSourceOfFunds());
            pstmt.setString(30, sdf.format(dt));
            pstmt.setInt(31, SE.getId());

            int rs = pstmt.executeUpdate();

            query = "DELETE FROM seproposal_component WHERE seproposalID = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, SE.getId());

            rs = pstmt.executeUpdate();

            for (int i = 0; i < SE.getComponent().size(); i++) {
                query = "INSERT INTO seproposal_component(seproposalID, component) VALUES(?,?)";

                pstmt = conn.prepareStatement(query);
                pstmt.setInt(1, SE.getId());
                pstmt.setString(2, SE.getComponent().get(i));

                rs = pstmt.executeUpdate();
            }

            query = "DELETE FROM seproposal_workplan WHERE seproposalID = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, SE.getId());

            rs = pstmt.executeUpdate();

            for (int i = 0; i < SE.getWorkplan().size(); i++) {
                query = "INSERT INTO seproposal_workplan(startdate, activity, timestartTimeend, venue, timeend, seproposalID) VALUES (?,?,?,?,?,?)";

                pstmt = conn.prepareStatement(query);
                pstmt.setDate(1, SE.getWorkplan().get(i).getDate());
                pstmt.setString(2, SE.getWorkplan().get(i).getActivity());
                pstmt.setString(3, SE.getWorkplan().get(i).getTimestarttimeend());
                pstmt.setString(4, SE.getWorkplan().get(i).getVenue());
                pstmt.setString(5, SE.getWorkplan().get(i).getTimestarttimeend2());
                pstmt.setInt(6, SE.getId());

                rs = pstmt.executeUpdate();

            }

            query = "DELETE FROM seproposal_expenses WHERE seproposalID = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, SE.getId());

            rs = pstmt.executeUpdate();

            for (int i = 0; i < SE.getExpenses().size(); i++) {
                query = "INSERT INTO seproposal_expenses(item, unitcost, quantity, subtotal, seproposalID) VALUES(?,?,?,?,?)";

                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, SE.getExpenses().get(i).getItem());
                pstmt.setDouble(2, SE.getExpenses().get(i).getUnitcost());
                pstmt.setInt(3, SE.getExpenses().get(i).getQuantity());
                pstmt.setDouble(4, SE.getExpenses().get(i).getSubtotal());
                pstmt.setInt(5, SE.getId());

                rs = pstmt.executeUpdate();
            }

            query = "DELETE FROM seproposal_personresponsible WHERE seproposalID = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, SE.getId());

            rs = pstmt.executeUpdate();

            for (int i = 0; i < SE.getResponsible().size(); i++) {
                query = "INSERT INTO seproposal_personresponsible(name, email, seproposalID) VALUES(?,?,?)";

                pstmt = conn.prepareCall(query);
                pstmt.setString(1, SE.getResponsible().get(i).getName());
                pstmt.setString(2, SE.getResponsible().get(i).getEmail());
                pstmt.setInt(3, SE.getId());

                rs = pstmt.executeUpdate();
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void AddFF(FF FF) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs2 = null;
        try {

            String query = "INSERT INTO ffproposal(unit, department, datecreated, programHead, activityClassification, projectName, venue, speaker, objectives, totalAmount, sourceOfFunds, step, userID, actualImplementation, unittype, datetime, studentorg) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(query);

            java.util.Date dt = new java.util.Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            pstmt.setString(1, FF.getUnit());
            pstmt.setString(2, FF.getDepartment());
            pstmt.setDate(3, FF.getDatecreated());
            pstmt.setString(4, FF.getProgramHead());
            pstmt.setString(5, FF.getActivityClassification());
            pstmt.setString(6, FF.getProjectName());
            pstmt.setString(7, FF.getVenue());
            pstmt.setString(8, FF.getSpeaker());
            pstmt.setString(9, FF.getObjectives());
            pstmt.setDouble(10, FF.getTotalAmount());
            pstmt.setString(11, FF.getSourceOfFunds());
            pstmt.setInt(12, FF.getStep());
            pstmt.setInt(13, FF.getUserID());
            pstmt.setDate(14, FF.getActualDate());
            pstmt.setString(15, FF.getUnittype());
            pstmt.setString(16, sdf.format(dt));
            pstmt.setInt(17, FF.getStudentorg());

            int rs = pstmt.executeUpdate();

            query = "SELECT * FROM ffproposal ORDER BY id DESC LIMIT 1";

            pstmt = conn.prepareStatement(query);

            rs2 = pstmt.executeQuery();

            int ffID = 0;

            while (rs2.next()) {
                ffID = rs2.getInt("id");
            }

            for (int i = 0; i < FF.getExpenses().size(); i++) {
                query = "INSERT INTO ffproposal_expenses(item, unitcost, quantity, subtotal, ffproposalID) VALUES(?,?,?,?,?)";

                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, FF.getExpenses().get(i).getItem());
                pstmt.setDouble(2, FF.getExpenses().get(i).getUnitcost());
                pstmt.setInt(3, FF.getExpenses().get(i).getQuantity());
                pstmt.setDouble(4, FF.getExpenses().get(i).getSubtotal());
                pstmt.setInt(5, ffID);

                rs = pstmt.executeUpdate();
            }

            for (int i = 0; i < FF.getAttendees().size(); i++) {
                query = "INSERT INTO ffproposal_attendees(name, email, ffproposalID) VALUES(?,?,?)";

                pstmt = conn.prepareCall(query);
                pstmt.setString(1, FF.getAttendees().get(i).getName());
                pstmt.setString(2, FF.getAttendees().get(i).getEmail());
                pstmt.setInt(3, ffID);

                rs = pstmt.executeUpdate();
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void EditFF(FF FF) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs2 = null;
        try {
            String query = "UPDATE ffproposal SET programHead = ?, activityClassification = ?, projectName = ?, venue = ?, speaker = ?, objectives = ?, totalAmount = ?, sourceOfFunds = ?, step = ?, actualImplementation = ?, datetime = ? WHERE id = ?";

            java.util.Date dt = new java.util.Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, FF.getProgramHead());
            pstmt.setString(2, FF.getActivityClassification());
            pstmt.setString(3, FF.getProjectName());
            pstmt.setString(4, FF.getVenue());
            pstmt.setString(5, FF.getSpeaker());
            pstmt.setString(6, FF.getObjectives());
            pstmt.setDouble(7, FF.getTotalAmount());
            pstmt.setString(8, FF.getSourceOfFunds());
            pstmt.setInt(9, FF.getStep());
            pstmt.setDate(10, FF.getActualDate());
            pstmt.setString(11, sdf.format(dt));
            pstmt.setInt(12, FF.getId());

            int rs = pstmt.executeUpdate();

            query = "DELETE FROM ffproposal_expenses WHERE ffproposalID = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, FF.getId());

            rs = pstmt.executeUpdate();

            for (int i = 0; i < FF.getExpenses().size(); i++) {
                query = "INSERT INTO ffproposal_expenses(item, unitcost, quantity, subtotal, ffproposalID) VALUES(?,?,?,?,?)";

                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, FF.getExpenses().get(i).getItem());
                pstmt.setDouble(2, FF.getExpenses().get(i).getUnitcost());
                pstmt.setInt(3, FF.getExpenses().get(i).getQuantity());
                pstmt.setDouble(4, FF.getExpenses().get(i).getSubtotal());
                pstmt.setInt(5, FF.getId());

                rs = pstmt.executeUpdate();
            }

            query = "DELETE FROM ffproposal_attendees WHERE ffproposalID = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, FF.getId());

            rs = pstmt.executeUpdate();

            for (int i = 0; i < FF.getAttendees().size(); i++) {
                query = "INSERT INTO ffproposal_attendees(name, email, ffproposalID) VALUES(?,?,?)";

                pstmt = conn.prepareCall(query);
                pstmt.setString(1, FF.getAttendees().get(i).getName());
                pstmt.setString(2, FF.getAttendees().get(i).getEmail());
                pstmt.setInt(3, FF.getId());

                rs = pstmt.executeUpdate();
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void AddNotification(Notification n) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "INSERT INTO notification(title, body, datetime, userID) VALUES(?,?,?,?)";
            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, n.getTitle());
            pstmt.setString(2, n.getBody());
            pstmt.setString(3, n.getDt());
            pstmt.setInt(4, n.getUserID());

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public ArrayList<Notification> retrieveNotificationByUserID(int userID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<Notification> Notification = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM notification WHERE userID = ? ORDER BY id DESC";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, userID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                Notification n = new Notification();
                n.setTitle(rs2.getString("title"));
                n.setBody(rs2.getString("body"));
                n.setDt(rs2.getString("datetime"));
                Notification.add(n);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return Notification;
    }

    public ArrayList<SE> retrieveSEProposalByStep(int step) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<SE> SE = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM seproposal WHERE step = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, step);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SE s = new SE();
                s.setActualDate(rs2.getDate("actualImplementation"));
                s.setName(rs2.getString("programName"));
                s.setProgramHead(rs2.getString("programHead"));
                s.setUnit(rs2.getString("unit"));
                s.setDepartment(rs2.getString("department"));
                s.setActivityClassification(rs2.getString("activityClassification"));
                s.setId(rs2.getInt("id"));
                SE.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return SE;
    }

    public ArrayList<SE> retrieveSEProposalByStepUnit(int step, String unit) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<SE> SE = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM seproposal WHERE step = ? AND unit = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, step);
            pstmt.setString(2, unit);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SE s = new SE();
                s.setActualDate(rs2.getDate("actualImplementation"));
                s.setName(rs2.getString("programName"));
                s.setProgramHead(rs2.getString("programHead"));
                s.setUnit(rs2.getString("unit"));
                s.setDepartment(rs2.getString("department"));
                s.setActivityClassification(rs2.getString("activityClassification"));
                s.setId(rs2.getInt("id"));
                SE.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return SE;
    }

    public ArrayList<SE> retrieveSEProposalByDepartment(String department) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<SE> SE = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM seproposal WHERE step = 1 AND department = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, department);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SE s = new SE();
                s.setActualDate(rs2.getDate("actualImplementation"));
                s.setName(rs2.getString("programName"));
                s.setProgramHead(rs2.getString("programHead"));
                s.setUnit(rs2.getString("unit"));
                s.setDepartment(rs2.getString("department"));
                s.setActivityClassification(rs2.getString("activityClassification"));
                s.setId(rs2.getInt("id"));
                SE.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return SE;
    }

    public ArrayList<FF> retrieveFFProposalByUnit(String unit) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM ffproposal WHERE step = 1 AND unit = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, unit);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FF f = new FF();
                f.setDatecreated(rs2.getDate("datecreated"));
                f.setProjectName(rs2.getString("projectName"));
                f.setProgramHead(rs2.getString("programHead"));
                f.setUnit(rs2.getString("unit"));
                f.setDepartment(rs2.getString("department"));
                f.setActivityClassification(rs2.getString("activityClassification"));
                f.setId(rs2.getInt("id"));
                FF.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FF;
    }

    public ArrayList<FF> retrieveFFProposalByDepartment(String department) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM ffproposal WHERE step = 2 AND department = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, department);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FF f = new FF();
                f.setActualDate(rs2.getDate("actualImplementation"));
                f.setProjectName(rs2.getString("projectName"));
                f.setProgramHead(rs2.getString("programHead"));
                f.setUnit(rs2.getString("unit"));
                f.setDepartment(rs2.getString("department"));
                f.setActivityClassification(rs2.getString("activityClassification"));
                f.setId(rs2.getInt("id"));
                FF.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FF;
    }

    public ArrayList<SE> retrieveSEProposalByCompleted(int userID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<SE> SE = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM seproposal WHERE userID != ? AND step = 8";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, userID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SE s = new SE();
                s.setActualDate(rs2.getDate("actualImplementation"));
                s.setName(rs2.getString("programName"));
                s.setProgramHead(rs2.getString("programHead"));
                s.setUnit(rs2.getString("unit"));
                s.setDepartment(rs2.getString("department"));
                s.setId(rs2.getInt("id"));
                SE.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return SE;
    }

    public ArrayList<SE> retrieveSEProposalByCancelled(int userID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<SE> SE = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM seproposal WHERE userID != ? AND step = 0";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, userID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SE s = new SE();
                s.setDate(rs2.getDate("datecreated"));
                s.setName(rs2.getString("programName"));
                s.setProgramHead(rs2.getString("programHead"));
                s.setUnit(rs2.getString("unit"));
                s.setDepartment(rs2.getString("department"));
                s.setId(rs2.getInt("id"));
                SE.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return SE;
    }

    public ArrayList<SE> retrieveSEProposalByRejected(int userID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<SE> SE = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM seproposal WHERE userID != ? AND step = -1";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, userID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SE s = new SE();
                s.setDate(rs2.getDate("datecreated"));
                s.setName(rs2.getString("programName"));
                s.setProgramHead(rs2.getString("programHead"));
                s.setUnit(rs2.getString("unit"));
                s.setDepartment(rs2.getString("department"));
                s.setId(rs2.getInt("id"));
                SE.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return SE;
    }

    public ArrayList<FF> retrieveFFProposalByRejected(int userID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM seproposal WHERE userID != ? AND step = -1";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, userID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FF f = new FF();
                f.setDatecreated(rs2.getDate("datecreated"));
                f.setProjectName(rs2.getString("programName"));
                f.setProgramHead(rs2.getString("programHead"));
                f.setUnit(rs2.getString("unit"));
                f.setDepartment(rs2.getString("department"));
                f.setId(rs2.getInt("id"));
                FF.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FF;
    }

    public ArrayList<SE> retrieveSEProposalByCompletedOwner(int userID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<SE> SE = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM seproposal WHERE userID = ? AND step = 8";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, userID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SE s = new SE();
                s.setActualDate(rs2.getDate("actualImplementation"));
                s.setName(rs2.getString("programName"));
                s.setProgramHead(rs2.getString("programHead"));
                s.setUnit(rs2.getString("unit"));
                s.setDepartment(rs2.getString("department"));
                s.setId(rs2.getInt("id"));
                SE.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return SE;
    }

    public ArrayList<SE> retrieveSEProposalByCancelledOwner(int userID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<SE> SE = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM seproposal WHERE userID = ? AND step = 0";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, userID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SE s = new SE();
                s.setDate(rs2.getDate("datecreated"));
                s.setName(rs2.getString("programName"));
                s.setProgramHead(rs2.getString("programHead"));
                s.setUnit(rs2.getString("unit"));
                s.setDepartment(rs2.getString("department"));
                s.setId(rs2.getInt("id"));
                SE.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return SE;
    }

    public ArrayList<SE> retrieveSEProposalByRejectedOwner(int userID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<SE> SE = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM seproposal WHERE userID = ? AND step = -1";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, userID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SE s = new SE();
                s.setDate(rs2.getDate("datecreated"));
                s.setName(rs2.getString("programName"));
                s.setProgramHead(rs2.getString("programHead"));
                s.setUnit(rs2.getString("unit"));
                s.setDepartment(rs2.getString("department"));
                s.setId(rs2.getInt("id"));
                SE.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return SE;
    }

    public ArrayList<FF> retrieveFFProposalByRejectedOwner(int userID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM ffproposal WHERE userID = ? AND step = -1";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, userID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FF f = new FF();
                f.setDatecreated(rs2.getDate("datecreated"));
                f.setProjectName(rs2.getString("programName"));
                f.setProgramHead(rs2.getString("programHead"));
                f.setUnit(rs2.getString("unit"));
                f.setDepartment(rs2.getString("department"));
                f.setId(rs2.getInt("id"));
                FF.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FF;
    }

    public ArrayList<FF> retrieveFFProposalByStep(int step) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM ffproposal WHERE step = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, step);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FF f = new FF();
                f.setActualDate(rs2.getDate("actualImplementation"));
                f.setProjectName(rs2.getString("projectName"));
                f.setProgramHead(rs2.getString("programHead"));
                f.setUnit(rs2.getString("unit"));
                f.setDepartment(rs2.getString("department"));
                f.setActivityClassification(rs2.getString("activityClassification"));
                f.setId(rs2.getInt("id"));
                FF.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FF;
    }

    public ArrayList<FF> retrieveFFProposalByStepUnit(int step, String unit) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM ffproposal WHERE step = ? AND unit = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, step);
            pstmt.setString(2, unit);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FF f = new FF();
                f.setActualDate(rs2.getDate("actualImplementation"));
                f.setProjectName(rs2.getString("projectName"));
                f.setProgramHead(rs2.getString("programHead"));
                f.setUnit(rs2.getString("unit"));
                f.setDepartment(rs2.getString("department"));
                f.setActivityClassification(rs2.getString("activityClassification"));
                f.setId(rs2.getInt("id"));
                FF.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FF;
    }

    public ArrayList<SE> retrievePendingSEProposalByUserID(int userID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<SE> SE = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM seproposal WHERE userID = ? AND step != 8 AND STEP != 0 AND step != -1";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, userID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SE s = new SE();
                s.setActualDate(rs2.getDate("actualImplementation"));
                s.setName(rs2.getString("programName"));
                s.setProgramHead(rs2.getString("programHead"));
                s.setUnit(rs2.getString("unit"));
                s.setDepartment(rs2.getString("department"));
                s.setId(rs2.getInt("id"));
                SE.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return SE;
    }

    public ArrayList<SE> retrievePendingSEProposalByOthers(int userID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<SE> SE = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM seproposal WHERE userID != ? AND step != 8 AND STEP != 0 AND step != -1";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, userID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SE s = new SE();
                s.setActualDate(rs2.getDate("actualImplementation"));
                s.setName(rs2.getString("programName"));
                s.setProgramHead(rs2.getString("programHead"));
                s.setUnit(rs2.getString("unit"));
                s.setDepartment(rs2.getString("department"));
                s.setId(rs2.getInt("id"));
                SE.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return SE;
    }

    public ArrayList<FF> retrieveFFProposalByCompletedOwner(int userID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM ffproposal WHERE userID = ? AND step = 8";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, userID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FF f = new FF();
                f.setActualDate(rs2.getDate("actualImplementation"));
                f.setProjectName(rs2.getString("projectName"));
                f.setProgramHead(rs2.getString("programHead"));
                f.setUnit(rs2.getString("unit"));
                f.setDepartment(rs2.getString("department"));
                f.setId(rs2.getInt("id"));
                FF.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FF;
    }

    public ArrayList<FF> retrieveFFProposalByCompleted(int userID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM ffproposal WHERE userID != ? AND step = 8";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, userID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FF f = new FF();
                f.setActualDate(rs2.getDate("actualImplementation"));
                f.setProjectName(rs2.getString("projectName"));
                f.setProgramHead(rs2.getString("programHead"));
                f.setUnit(rs2.getString("unit"));
                f.setDepartment(rs2.getString("department"));
                f.setId(rs2.getInt("id"));
                FF.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FF;
    }

    public ArrayList<FF> retrievePendingFFProposalByUserID(int userID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM ffproposal WHERE userID = ? AND step != 8 AND step != 0 AND step != -1";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, userID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FF f = new FF();
                f.setActualDate(rs2.getDate("actualImplementation"));
                f.setProjectName(rs2.getString("projectName"));
                f.setProgramHead(rs2.getString("programHead"));
                f.setUnit(rs2.getString("unit"));
                f.setDepartment(rs2.getString("department"));
                f.setId(rs2.getInt("id"));
                FF.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FF;
    }

    public ArrayList<FF> retrieveRejectedFFProposalByUserID(int userID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM ffproposal WHERE userID = ? AND step = -1";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, userID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FF f = new FF();
                f.setDatecreated(rs2.getDate("datecreated"));
                f.setProjectName(rs2.getString("projectName"));
                f.setProgramHead(rs2.getString("programHead"));
                f.setUnit(rs2.getString("unit"));
                f.setDepartment(rs2.getString("department"));
                f.setId(rs2.getInt("id"));
                FF.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FF;
    }

    public ArrayList<FF> retrieveCancelledFFProposalByUserID(int userID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM ffproposal WHERE userID = ? AND step = 0";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, userID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FF f = new FF();
                f.setDatecreated(rs2.getDate("datecreated"));
                f.setProjectName(rs2.getString("projectName"));
                f.setProgramHead(rs2.getString("programHead"));
                f.setUnit(rs2.getString("unit"));
                f.setDepartment(rs2.getString("department"));
                f.setId(rs2.getInt("id"));
                FF.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FF;
    }

    public ArrayList<FF> retrievePendingFFProposalByOthers(int userID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM ffproposal WHERE userID != ? AND step != 9 AND step != 0 AND step != -1";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, userID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FF f = new FF();
                f.setActualDate(rs2.getDate("actualImplementation"));
                f.setProjectName(rs2.getString("projectName"));
                f.setProgramHead(rs2.getString("programHead"));
                f.setUnit(rs2.getString("unit"));
                f.setDepartment(rs2.getString("department"));
                f.setId(rs2.getInt("id"));
                FF.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FF;
    }

    public ArrayList<FF> retrieveRejectedFFProposalByOthers(int userID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM ffproposal WHERE userID != ? AND step = -1";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, userID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FF f = new FF();
                f.setDatecreated(rs2.getDate("datecreated"));
                f.setProjectName(rs2.getString("projectName"));
                f.setProgramHead(rs2.getString("programHead"));
                f.setUnit(rs2.getString("unit"));
                f.setDepartment(rs2.getString("department"));
                f.setId(rs2.getInt("id"));
                FF.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FF;
    }

    public ArrayList<FF> retrieveCancelledFFProposalByOthers(int userID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM ffproposal WHERE userID != ? AND step = 0";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, userID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FF f = new FF();
                f.setDatecreated(rs2.getDate("datecreated"));
                f.setProjectName(rs2.getString("projectName"));
                f.setProgramHead(rs2.getString("programHead"));
                f.setUnit(rs2.getString("unit"));
                f.setDepartment(rs2.getString("department"));
                f.setId(rs2.getInt("id"));
                FF.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FF;
    }

    public SE retrieveSEBySEID(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs2 = null;
        SE SE = new SE();
        try {
            String query = "SELECT * FROM seproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, seID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SE.setId(rs2.getInt("id"));
                SE.setUnit(rs2.getString("unit"));
                SE.setDepartment(rs2.getString("department"));
                SE.setDate(rs2.getDate("datecreated"));
                SE.setName(rs2.getString("programName"));
                SE.setProgramHead(rs2.getString("programHead"));
                SE.setActivityClassification(rs2.getString("activityClassification"));
                SE.setTargetCommunity(rs2.getInt("targetCommunity"));
                SE.setTargetKRA(rs2.getInt("targetKRA"));
                SE.setTargetGoal(rs2.getInt("targetGoal"));
                SE.setActualDate(rs2.getDate("actualImplementation"));
                SE.setImplementationaddress(rs2.getString("addressimplementation"));
                SE.setTotalAmount(rs2.getDouble("totalAmountRequested"));
                SE.setSocialCommunityProblem(rs2.getString("problemaddressed"));
                SE.setNameSEbeneficiaries(rs2.getString("nameOfPartner"));
                SE.setAddressSEbeneficiaries(rs2.getString("address"));
                SE.setContactPersonSEbeneficiaries(rs2.getString("contactPerson"));
                SE.setMobileSEbeneficiaries(rs2.getString("mobileNumber"));
                SE.setEmailSEbeneficiaries(rs2.getString("email"));
                SE.setDescriptionSEbeneficiaries(rs2.getString("description"));
                SE.setObjectives(rs2.getString("objectives"));
                SE.setExplanation(rs2.getString("explanation"));
                SE.setTotalpopulationAcademicStaff(rs2.getInt("academicStaffPopulation"));
                SE.setExpectedAcademicStaff(rs2.getInt("academicStaffExpected"));
                SE.setTotalpopulationSupportStaff(rs2.getInt("supportStaffPopulation"));
                SE.setExpectedSupportStaff(rs2.getInt("supportStaffExpected"));
                SE.setTotalpopulationUndergraduate(rs2.getInt("undergraduatePopulation"));
                SE.setExpectedUndergraduate(rs2.getInt("undergraduateExpected"));
                SE.setTotalPopulationGraduate(rs2.getInt("graduatePopulation"));
                SE.setExpectedGraduate(rs2.getInt("graduateExpected"));
                SE.setStep(rs2.getInt("step"));
                SE.setDeptunitRemarks(rs2.getString("deptunitRemarks"));
                SE.setExternaldirectorRemarks(rs2.getString("externaldirectorRemarks"));
                SE.setDeanRemarks(rs2.getString("deanRemarks"));
                SE.setJayRemarks(rs2.getString("ovplm1Remarks"));
                SE.setCarmelRemarks(rs2.getString("ovplm2Remarks"));
                SE.setCoscaRemarks(rs2.getString("coscaRemarks"));
                SE.setLmc1Remarks(rs2.getString("lmc1Remarks"));
                SE.setLmc2Remarks(rs2.getString("lmc2Remarks"));
                SE.setLmc3Remarks(rs2.getString("lmc3Remarks"));
                SE.setLmc4Remarks(rs2.getString("lmc4Remarks"));
                SE.setLmc5Remarks(rs2.getString("lmc5Remarks"));
                SE.setLmc6Remarks(rs2.getString("lmc6Remarks"));
                SE.setLmc7Remarks(rs2.getString("lmc7Remarks"));
                SE.setLmc8Remarks(rs2.getString("lmc8Remarks"));
                SE.setUnitChairRemarks(rs2.getString("unitchairremarks"));
                SE.setSeDirectorRemarks(rs2.getString("sedirectorremarks"));
                SE.setVpVcRemarks(rs2.getString("vpvcremarks"));
                SE.setSourceOfFunds(rs2.getString("sourceOfFunds"));
                SE.setUserID(rs2.getInt("userID"));
                SE.setRevisionTime(rs2.getString("datetime"));
                SE.setDeptunitdatetime(rs2.getString("deptunitdatetime"));
                SE.setExternaldirectordatetime(rs2.getString("externaldirectordatetime"));
                SE.setDeandatetime(rs2.getString("deandatetime"));
                SE.setCoscadatetime(rs2.getString("coscadatetime"));
                SE.setUnitchairdatetime(rs2.getString("unitchairdatetime"));
                SE.setSedirectordatetime(rs2.getString("sedirectordatetime"));
                SE.setVpvcdatetime(rs2.getString("vpvcdatetime"));
                SE.setIsRevise(rs2.getInt("isRevise"));
                SE.setApprove1(rs2.getInt("approve1"));
                SE.setApprove2(rs2.getInt("approve2"));
                SE.setApprove3(rs2.getInt("approve3"));
                SE.setApprove4(rs2.getInt("approve4"));
                SE.setRevise1(rs2.getInt("revise1"));
                SE.setRevise2(rs2.getInt("revise2"));
                SE.setRevise3(rs2.getInt("revise3"));
                SE.setRevise4(rs2.getInt("revise4"));
                SE.setReject1(rs2.getInt("reject1"));
                SE.setReject2(rs2.getInt("reject2"));
                SE.setReject3(rs2.getInt("reject3"));
                SE.setReject4(rs2.getInt("reject4"));
                SE.setStudentorg(rs2.getInt("studentorg"));
            }

            ArrayList<String> component = new ArrayList();

            query = "SELECT * FROM seproposal_component WHERE seproposalID = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, seID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                component.add(rs2.getString("component"));
            }

            SE.setComponent(component);

            ArrayList<SEexpenses> expenses = new ArrayList();

            query = "SELECT * FROM seproposal_expenses WHERE seproposalID = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, seID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SEexpenses se = new SEexpenses();
                se.setItem(rs2.getString("item"));
                se.setUnitcost(rs2.getDouble("unitcost"));
                se.setQuantity(rs2.getInt("quantity"));
                se.setSubtotal(rs2.getDouble("subtotal"));
                se.setAmountUsed(rs2.getDouble("amountUsed"));
                expenses.add(se);
            }

            SE.setExpenses(expenses);

            ArrayList<SEresponsible> responsible = new ArrayList();

            query = "SELECT * FROM seproposal_personresponsible WHERE seproposalID = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, seID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SEresponsible p = new SEresponsible();
                p.setName(rs2.getString("name"));
                p.setEmail(rs2.getString("email"));
                responsible.add(p);
            }

            SE.setResponsible(responsible);

            ArrayList<SEworkplan> workplan = new ArrayList();

            query = "SELECT * FROM seproposal_workplan WHERE seproposalID = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, seID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SEworkplan plan = new SEworkplan();
                plan.setDate(rs2.getDate("startdate"));
                plan.setActivity(rs2.getString("activity"));
                plan.setTimestarttimeend(rs2.getString("timestartTimeend"));
                plan.setVenue(rs2.getString("venue"));
                plan.setTimestarttimeend2(rs2.getString("timeend"));
                workplan.add(plan);
            }

            SE.setWorkplan(workplan);

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return SE;
    }

    public SE retrieveSERevisionBySEID(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs2 = null;
        SE SE = new SE();
        try {
            String query = "SELECT * FROM seproposal_revisions WHERE id = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, seID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SE.setId(rs2.getInt("id"));
                SE.setUnit(rs2.getString("unit"));
                SE.setDepartment(rs2.getString("department"));
                SE.setDate(rs2.getDate("datecreated"));
                SE.setName(rs2.getString("programName"));
                SE.setProgramHead(rs2.getString("programHead"));
                SE.setActivityClassification(rs2.getString("activityClassification"));
                SE.setTargetCommunity(rs2.getInt("targetCommunity"));
                SE.setTargetKRA(rs2.getInt("targetKRA"));
                SE.setTargetGoal(rs2.getInt("targetGoal"));
                //SE.setTargetMeasure(rs2.getInt("targetMeasure"));
                SE.setActualDate(rs2.getDate("actualImplementation"));
                SE.setTotalAmount(rs2.getDouble("totalAmountRequested"));
                SE.setSocialCommunityProblem(rs2.getString("problemaddressed"));
                SE.setNameSEbeneficiaries(rs2.getString("nameOfPartner"));
                SE.setAddressSEbeneficiaries(rs2.getString("address"));
                SE.setContactPersonSEbeneficiaries(rs2.getString("contactPerson"));
                SE.setMobileSEbeneficiaries(rs2.getString("mobileNumber"));
                SE.setEmailSEbeneficiaries(rs2.getString("email"));
                SE.setDescriptionSEbeneficiaries(rs2.getString("description"));
                SE.setObjectives(rs2.getString("objectives"));
                SE.setExplanation(rs2.getString("explanation"));
                SE.setTotalpopulationAcademicStaff(rs2.getInt("academicStaffPopulation"));
                SE.setExpectedAcademicStaff(rs2.getInt("academicStaffExpected"));
                SE.setTotalpopulationSupportStaff(rs2.getInt("supportStaffPopulation"));
                SE.setExpectedSupportStaff(rs2.getInt("supportStaffExpected"));
                SE.setTotalpopulationUndergraduate(rs2.getInt("undergraduatePopulation"));
                SE.setExpectedUndergraduate(rs2.getInt("undergraduateExpected"));
                SE.setTotalPopulationGraduate(rs2.getInt("graduatePopulation"));
                SE.setExpectedGraduate(rs2.getInt("graduateExpected"));
                SE.setStep(rs2.getInt("step"));
                SE.setDeptunitRemarks(rs2.getString("deptunitRemarks"));
                SE.setExternaldirectorRemarks(rs2.getString("externaldirectorRemarks"));
                SE.setDeanRemarks(rs2.getString("deanRemarks"));
                SE.setJayRemarks(rs2.getString("ovplm1Remarks"));
                SE.setCarmelRemarks(rs2.getString("ovplm2Remarks"));
                SE.setCoscaRemarks(rs2.getString("coscaRemarks"));
                SE.setLmc1Remarks(rs2.getString("lmc1Remarks"));
                SE.setLmc2Remarks(rs2.getString("lmc2Remarks"));
                SE.setLmc3Remarks(rs2.getString("lmc3Remarks"));
                SE.setLmc4Remarks(rs2.getString("lmc4Remarks"));
                SE.setLmc5Remarks(rs2.getString("lmc5Remarks"));
                SE.setLmc6Remarks(rs2.getString("lmc6Remarks"));
                SE.setLmc7Remarks(rs2.getString("lmc7Remarks"));
                SE.setLmc8Remarks(rs2.getString("lmc8Remarks"));
                SE.setUnitChairRemarks(rs2.getString("unitchairremarks"));
                SE.setSeDirectorRemarks(rs2.getString("sedirectorremarks"));
                SE.setVpVcRemarks(rs2.getString("vpvcremarks"));
                SE.setSourceOfFunds(rs2.getString("sourceOfFunds"));
                SE.setUserID(rs2.getInt("userID"));
                SE.setRevisionTime(rs2.getString("datetime"));
                SE.setDeptunitdatetime(rs2.getString("deptunitdatetime"));
                SE.setExternaldirectordatetime(rs2.getString("externaldirectordatetime"));
                SE.setDeandatetime(rs2.getString("deandatetime"));
                SE.setCoscadatetime(rs2.getString("coscadatetime"));
                SE.setUnitchairdatetime(rs2.getString("unitchairdatetime"));
                SE.setSedirectordatetime(rs2.getString("sedirectordatetime"));
                SE.setVpvcdatetime(rs2.getString("vpvcdatetime"));
                SE.setIsRevise(rs2.getInt("isRevise"));
            }

            ArrayList<String> component = new ArrayList();

            query = "SELECT * FROM seproposal_revisions_component WHERE revisionID = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, seID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                component.add(rs2.getString("component"));
            }

            SE.setComponent(component);

            ArrayList<SEexpenses> expenses = new ArrayList();

            query = "SELECT * FROM seproposal_revisions_expenses WHERE revisionID = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, seID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SEexpenses se = new SEexpenses();
                se.setItem(rs2.getString("item"));
                se.setUnitcost(rs2.getDouble("unitcost"));
                se.setQuantity(rs2.getInt("quantity"));
                se.setSubtotal(rs2.getDouble("subtotal"));
                se.setAmountUsed(rs2.getDouble("amountUsed"));
                expenses.add(se);
            }

            SE.setExpenses(expenses);

            ArrayList<SEresponsible> responsible = new ArrayList();

            query = "SELECT * FROM seproposal_revisions_personresponsible WHERE revisionID = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, seID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SEresponsible p = new SEresponsible();
                p.setName(rs2.getString("name"));
                p.setEmail(rs2.getString("email"));
                responsible.add(p);
            }

            SE.setResponsible(responsible);

            ArrayList<SEworkplan> workplan = new ArrayList();

            query = "SELECT * FROM seproposal_revisions_workplan WHERE revisionID = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, seID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SEworkplan plan = new SEworkplan();
                plan.setDate(rs2.getDate("startdate"));
                plan.setActivity(rs2.getString("activity"));
                plan.setTimestarttimeend(rs2.getString("timestartTimeend"));
                plan.setVenue(rs2.getString("venue"));
                plan.setTimestarttimeend2(rs2.getString("timeend"));
                workplan.add(plan);
            }

            SE.setWorkplan(workplan);

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return SE;
    }

    public FF retrieveFFByFFID(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs2 = null;
        FF FF = new FF();
        try {
            String query = "SELECT * FROM ffproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, ffID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FF.setId(rs2.getInt("id"));
                FF.setUnit(rs2.getString("unit"));
                FF.setDepartment(rs2.getString("department"));
                FF.setDatecreated(rs2.getDate("datecreated"));
                FF.setProjectName(rs2.getString("projectName"));
                FF.setProgramHead(rs2.getString("programHead"));
                FF.setActivityClassification(rs2.getString("activityClassification"));
                FF.setActualDate(rs2.getDate("actualImplementation"));
                FF.setTotalAmount(rs2.getDouble("totalAmount"));
                FF.setStep(rs2.getInt("step"));
                FF.setSourceOfFunds(rs2.getString("sourceOfFunds"));
                FF.setVenue(rs2.getString("venue"));
                FF.setSpeaker(rs2.getString("speaker"));
                FF.setObjectives(rs2.getString("objectives"));
                FF.setUserID(rs2.getInt("userID"));
                FF.setChairdirectorRemarks(rs2.getString("chairdirectorRemarks"));
                FF.setVplmRemarks(rs2.getString("vplmRemarks"));
                FF.setDeanunitRemarks(rs2.getString("deanunitRemarks"));
                FF.setAssistantdeanRemarks(rs2.getString("assistantdeanRemarks"));
                FF.setJayRemarks(rs2.getString("ovplm1Remarks"));
                FF.setCarmelRemarks(rs2.getString("ovplm2Remarks"));
                FF.setLspoRemarks(rs2.getString("lspoRemarks"));
                FF.setLmc1Remarks(rs2.getString("lmc1Remarks"));
                FF.setLmc2Remarks(rs2.getString("lmc2Remarks"));
                FF.setLmc3Remarks(rs2.getString("lmc3Remarks"));
                FF.setLmc4Remarks(rs2.getString("lmc4Remarks"));
                FF.setLmc5Remarks(rs2.getString("lmc5Remarks"));
                FF.setUnitheadremarks(rs2.getString("unitheadremarks"));
                FF.setDirectorremarks(rs2.getString("directorremarks"));
                FF.setRevisionTime(rs2.getString("datetime"));
                FF.setChairdirectordatetime(rs2.getString("chairdirectordatetime"));
                FF.setVplmdatetime(rs2.getString("vplmdatetime"));
                FF.setDeanunitdatetime(rs2.getString("deanunitdatetime"));
                FF.setLspodatetime(rs2.getString("lspodatetime"));
                FF.setUnitheaddatetime(rs2.getString("unitheaddatetime"));
                FF.setDirectordatetime(rs2.getString("directordatetime"));
                FF.setApprove1(rs2.getInt("approve1"));
                FF.setApprove2(rs2.getInt("approve2"));
                FF.setApprove3(rs2.getInt("approve3"));
                FF.setApprove4(rs2.getInt("approve4"));
                FF.setRevise1(rs2.getInt("revise1"));
                FF.setRevise2(rs2.getInt("revise2"));
                FF.setRevise3(rs2.getInt("revise3"));
                FF.setRevise4(rs2.getInt("revise4"));
                FF.setReject1(rs2.getInt("reject1"));
                FF.setReject2(rs2.getInt("reject2"));
                FF.setReject3(rs2.getInt("reject3"));
                FF.setReject4(rs2.getInt("reject4"));
                FF.setStudentorg(rs2.getInt("studentorg"));
            }

            ArrayList<FFexpenses> expenses = new ArrayList();

            query = "SELECT * FROM ffproposal_expenses WHERE ffproposalID = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, ffID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FFexpenses ff = new FFexpenses();
                ff.setItem(rs2.getString("item"));
                ff.setUnitcost(rs2.getDouble("unitcost"));
                ff.setQuantity(rs2.getInt("quantity"));
                ff.setSubtotal(rs2.getDouble("subtotal"));
                ff.setAmountUsed(rs2.getDouble("amountUsed"));
                expenses.add(ff);
            }

            FF.setExpenses(expenses);

            ArrayList<FFattendees> attendees = new ArrayList();

            query = "SELECT * FROM ffproposal_attendees WHERE ffproposalID = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, ffID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FFattendees attendee = new FFattendees();
                attendee.setName(rs2.getString("name"));
                attendee.setEmail(rs2.getString("email"));
                attendees.add(attendee);
            }

            FF.setAttendees(attendees);

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FF;
    }

    public FF retrieveFFRevisionByFFID(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs2 = null;
        FF FF = new FF();
        try {
            String query = "SELECT * FROM ffproposal_revisions WHERE id = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, ffID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FF.setId(rs2.getInt("id"));
                FF.setUnit(rs2.getString("unit"));
                FF.setDepartment(rs2.getString("department"));
                FF.setDatecreated(rs2.getDate("datecreated"));
                FF.setProjectName(rs2.getString("projectName"));
                FF.setProgramHead(rs2.getString("programHead"));
                FF.setActivityClassification(rs2.getString("activityClassification"));
                FF.setActualDate(rs2.getDate("actualImplementation"));
                FF.setTotalAmount(rs2.getDouble("totalAmount"));
                FF.setStep(rs2.getInt("step"));
                FF.setSourceOfFunds(rs2.getString("sourceOfFunds"));
                FF.setVenue(rs2.getString("venue"));
                FF.setSpeaker(rs2.getString("speaker"));
                FF.setObjectives(rs2.getString("objectives"));
                FF.setUserID(rs2.getInt("userID"));
                FF.setChairdirectorRemarks(rs2.getString("chairdirectorRemarks"));
                FF.setVplmRemarks(rs2.getString("vplmRemarks"));
                FF.setDeanunitRemarks(rs2.getString("deanunitRemarks"));
                FF.setAssistantdeanRemarks(rs2.getString("assistantdeanRemarks"));
                FF.setJayRemarks(rs2.getString("ovplm1Remarks"));
                FF.setCarmelRemarks(rs2.getString("ovplm2Remarks"));
                FF.setLspoRemarks(rs2.getString("lspoRemarks"));
                FF.setLmc1Remarks(rs2.getString("lmc1Remarks"));
                FF.setLmc2Remarks(rs2.getString("lmc2Remarks"));
                FF.setLmc3Remarks(rs2.getString("lmc3Remarks"));
                FF.setLmc4Remarks(rs2.getString("lmc4Remarks"));
                FF.setLmc5Remarks(rs2.getString("lmc5Remarks"));
                FF.setUnitheadremarks(rs2.getString("unitheadremarks"));
                FF.setDirectorremarks(rs2.getString("directorremarks"));
                FF.setRevisionTime(rs2.getString("datetime"));
                FF.setChairdirectordatetime(rs2.getString("chairdirectordatetime"));
                FF.setVplmdatetime(rs2.getString("vplmdatetime"));
                FF.setDeanunitdatetime(rs2.getString("deanunitdatetime"));
                FF.setLspodatetime(rs2.getString("lspodatetime"));
                FF.setUnitheaddatetime(rs2.getString("unitheaddatetime"));
                FF.setDirectordatetime(rs2.getString("directordatetime"));
            }

            ArrayList<FFexpenses> expenses = new ArrayList();

            query = "SELECT * FROM ffproposal_revisions_expenses WHERE revisionID = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, ffID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FFexpenses ff = new FFexpenses();
                ff.setItem(rs2.getString("item"));
                ff.setUnitcost(rs2.getDouble("unitcost"));
                ff.setQuantity(rs2.getInt("quantity"));
                ff.setSubtotal(rs2.getDouble("subtotal"));
                ff.setAmountUsed(rs2.getDouble("amountUsed"));
                expenses.add(ff);
            }

            FF.setExpenses(expenses);

            ArrayList<FFattendees> attendees = new ArrayList();

            query = "SELECT * FROM ffproposal_revisions_attendees WHERE revisionID = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, ffID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FFattendees attendee = new FFattendees();
                attendee.setName(rs2.getString("name"));
                attendee.setEmail(rs2.getString("email"));
                attendees.add(attendee);
            }

            FF.setAttendees(attendees);

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FF;
    }

    public void updateStep(int step, int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET step = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, step);
            pstmt.setInt(2, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void approveDeptChair(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET approve1 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void approveUnitChair(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET approve1 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void approveADEALM(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET approve2 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void approveSEDirector(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET approve2 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void approveDean(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET approve3 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void approveVPVC(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET approve3 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void approveCOSCA(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET approve4 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void reviseDeptChair(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET revise1 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void reviseUnitChair(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET revise1 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void reviseADEALM(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET revise2 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void reviseSEDirector(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET revise2 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void reviseDean(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET revise3 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void reviseVPVC(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET revise3 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void reviseCOSCA(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET revise4 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void rejectDeptChair(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET reject1 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void rejectUnitChair(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET reject1 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void rejectADEALM(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET reject2 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void rejectSEDirector(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET reject2 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void rejectDean(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET reject3 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void rejectVPVC(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET reject3 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void rejectCOSCA(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET reject4 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void approveADLM(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET approve1 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void approveChairperson(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET approve2 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void approveUnitHead(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET approve2 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void approveFFDean(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET approve3 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void approveDirector(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET approve3 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void approveLSPO(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET approve4 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void reviseADLM(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET revise1 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void reviseUnitHead(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET revise2 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void reviseChairperson(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET revise2 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void reviseFFDean(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET revise3 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void reviseDirector(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET revise3 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void reviseLSPO(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET revise4 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void rejectADLM(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET reject1 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void rejectChairperson(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET reject2 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void rejectUnitHead(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET reject2 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void rejectFFDean(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET reject3 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void rejectDirector(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET reject3 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void rejectLSPO(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET reject4 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void resetVoteSE(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET lmc1 = null, lmc2 = null, lmc3 = null, lmc4 = null, lmc5 = null, hasVoted1 = null, hasVoted2 = null, hasVoted3 = null, hasVoted4 = null, hasVoted5 = null, lmcApprovalCount = null, lmcReviseCount = null, lmcRejectCount = null WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void rejectSE(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET step = -1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void rejectFF(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET step = -1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void reviseSE(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET isRevise = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void reviseFF(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET isRevise = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void completeReviseSE(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET isRevise = 0 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void completeReviseFF(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET isRevise = 0 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public boolean isRevise(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;

        try {
            String query = "SELECT isRevise FROM seproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                if (rs2.getInt("isRevise") == 1) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return false;
    }

    public boolean isFFRevise(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;

        try {
            String query = "SELECT isRevise FROM ffproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                if (rs2.getInt("isRevise") == 1) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return false;
    }

    public void updateStepFF(int step, int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET step = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, step);
            pstmt.setInt(2, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updateDeptUnitRemarks(String remarks, int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET deptunitRemarks = ?, deptunitdatetime = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);

            java.util.Date dt = new java.util.Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            pstmt.setString(1, remarks);
            pstmt.setString(2, sdf.format(dt));
            pstmt.setInt(3, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updateUnitChairRemarks(String remarks, int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET unitchairremarks = ?, unitchairdatetime = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);

            java.util.Date dt = new java.util.Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            pstmt.setString(1, remarks);
            pstmt.setString(2, sdf.format(dt));
            pstmt.setInt(3, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updateSEDirectorRemarks(String remarks, int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET sedirectorremarks = ?, sedirectordatetime = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);

            java.util.Date dt = new java.util.Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            pstmt.setString(1, remarks);
            pstmt.setString(2, sdf.format(dt));
            pstmt.setInt(3, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updateVPVCRemarks(String remarks, int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET vpvcremarks = ?, vpvcdatetime = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);

            java.util.Date dt = new java.util.Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            pstmt.setString(1, remarks);
            pstmt.setString(2, sdf.format(dt));
            pstmt.setInt(3, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updateChairDirectorRemarks(String remarks, int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET chairdirectorRemarks = ?, chairdirectordatetime = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);

            java.util.Date dt = new java.util.Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            pstmt.setString(1, remarks);
            pstmt.setString(2, sdf.format(dt));
            pstmt.setInt(3, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updateUnitHeadRemarks(String remarks, int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET unitheadremarks = ?, unitheaddatetim = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);

            java.util.Date dt = new java.util.Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            pstmt.setString(1, remarks);
            pstmt.setString(2, sdf.format(dt));
            pstmt.setInt(3, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updateDirectorRemarks(String remarks, int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET directorremarks = ?, directordatetime = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);

            java.util.Date dt = new java.util.Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            pstmt.setString(1, remarks);
            pstmt.setString(2, sdf.format(dt));
            pstmt.setInt(3, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updateVPLMRemarks(String remarks, int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET vplmRemarks = ?, vplmdatetime = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);

            java.util.Date dt = new java.util.Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            pstmt.setString(1, remarks);
            pstmt.setString(2, sdf.format(dt));
            pstmt.setInt(3, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updateDeanunitRemarks(String remarks, int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET deanunitRemarks = ?, deanunitdatetime = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);

            java.util.Date dt = new java.util.Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            pstmt.setString(1, remarks);
            pstmt.setString(2, sdf.format(dt));
            pstmt.setInt(3, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updateAssistantdeanRemarks(String remarks, int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET assistantdeanRemarks = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, remarks);
            pstmt.setInt(2, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public String getProgramName(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs = null;

        String name = "";
        try {
            String query = "SELECT programName FROM seproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                name = rs.getString("programName");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return name;
    }

    public String getProjectName(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs = null;

        String name = "";
        try {
            String query = "SELECT projectName FROM ffproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                name = rs.getString("projectName");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return name;
    }

    public int getSEOwner(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs = null;

        int userID = 0;
        try {
            String query = "SELECT userID FROM seproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                userID = rs.getInt("userID");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return userID;
    }

    public int getFFOwner(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs = null;

        int userID = 0;
        try {
            String query = "SELECT userID FROM ffproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                userID = rs.getInt("userID");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return userID;
    }

    public void updateExternalRemarks(String remarks, int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET externaldirectorRemarks = ?, externaldirectordatetime = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);

            java.util.Date dt = new java.util.Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            pstmt.setString(1, remarks);
            pstmt.setString(2, sdf.format(dt));
            pstmt.setInt(3, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updateDeanRemarks(String remarks, int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET deanRemarks = ?, deandatetime = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);

            java.util.Date dt = new java.util.Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            pstmt.setString(1, remarks);
            pstmt.setString(2, sdf.format(dt));
            pstmt.setInt(3, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updateOvplm1Remarks(String remarks, int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET ovplm1Remarks = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, remarks);
            pstmt.setInt(2, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updateFFOvplm1Remarks(String remarks, int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET ovplm1Remarks = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, remarks);
            pstmt.setInt(2, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updateOvplm2Remarks(String remarks, int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET ovplm2Remarks = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, remarks);
            pstmt.setInt(2, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updateFFOvplm2Remarks(String remarks, int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET ovplm2Remarks = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, remarks);
            pstmt.setInt(2, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updatelsporemarks(String remarks, int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        java.util.Date dt = new java.util.Date();
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        try {
            String query = "UPDATE ffproposal SET lspoRemarks = ?, lspodatetime = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, remarks);
            pstmt.setString(2, sdf.format(dt));
            pstmt.setInt(3, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updatecoscaRemarks(String remarks, int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET coscaRemarks = ?, coscadatetime = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);

            java.util.Date dt = new java.util.Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            pstmt.setString(1, remarks);
            pstmt.setString(2, sdf.format(dt));
            pstmt.setInt(3, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void voteMichael(int seID, int vote) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET lmc1 = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, vote);
            pstmt.setInt(2, seID);

            int rs = pstmt.executeUpdate();

            query = "UPDATE seproposal SET hasVoted1 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void voteFFMichael(int ffID, int vote) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET lmc1 = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, vote);
            pstmt.setInt(2, ffID);

            int rs = pstmt.executeUpdate();

            query = "UPDATE ffproposal SET hasVoted1 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void addVote(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;

        try {
            String query = "SELECT lmcApprovalCount FROM seproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);
            rs2 = pstmt.executeQuery();

            int count = 0;

            while (rs2.next()) {
                count = rs2.getInt("lmcApprovalCount");
            }

            count += 1;

            query = "UPDATE seproposal SET lmcApprovalCount = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, count);
            pstmt.setInt(2, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void addFFVote(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;

        try {
            String query = "SELECT lmcApprovalCount FROM ffproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);
            rs2 = pstmt.executeQuery();

            int count = 0;

            while (rs2.next()) {
                count = rs2.getInt("lmcApprovalCount");
            }

            count += 1;

            query = "UPDATE ffproposal SET lmcApprovalCount = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, count);
            pstmt.setInt(2, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void addReviseVote(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;

        try {
            String query = "SELECT lmcReviseCount FROM seproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);
            rs2 = pstmt.executeQuery();

            int count = 0;

            while (rs2.next()) {
                count = rs2.getInt("lmcReviseCount");
            }

            count += 1;

            query = "UPDATE seproposal SET lmcReviseCount = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, count);
            pstmt.setInt(2, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void addFFReviseVote(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;

        try {
            String query = "SELECT lmcReviseCount FROM ffproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);
            rs2 = pstmt.executeQuery();

            int count = 0;

            while (rs2.next()) {
                count = rs2.getInt("lmcReviseCount");
            }

            count += 1;

            query = "UPDATE ffproposal SET lmcReviseCount = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, count);
            pstmt.setInt(2, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void addRejectVote(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;

        try {
            String query = "SELECT lmcRejectCount FROM seproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);
            rs2 = pstmt.executeQuery();

            int count = 0;

            while (rs2.next()) {
                count = rs2.getInt("lmcRejectCount");
            }

            count += 1;

            query = "UPDATE seproposal SET lmcRejectCount = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, count);
            pstmt.setInt(2, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void addFFRejectVote(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;

        try {
            String query = "SELECT lmcRejectCount FROM ffproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);
            rs2 = pstmt.executeQuery();

            int count = 0;

            while (rs2.next()) {
                count = rs2.getInt("lmcRejectCount");
            }

            count += 1;

            query = "UPDATE ffproposal SET lmcRejectCount = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, count);
            pstmt.setInt(2, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updatelmc1Remarks(String remarks, int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET lmc1Remarks = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, remarks);
            pstmt.setInt(2, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updateFFlmc1Remarks(String remarks, int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET lmc1Remarks = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, remarks);
            pstmt.setInt(2, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public int getVoteCount(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT lmcApprovalCount FROM seproposal WHERE id = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;

        int vote = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            rs = ps.executeQuery();

            while (rs.next()) {
                vote = rs.getInt("lmcApprovalCount");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return vote;
    }

    public int getFFVoteCount(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT lmcApprovalCount FROM ffproposal WHERE id = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;

        int vote = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, ffID);
            rs = ps.executeQuery();

            while (rs.next()) {
                vote = rs.getInt("lmcApprovalCount");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return vote;
    }

    public int getReviseVoteCount(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT lmcReviseCount FROM seproposal WHERE id = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;

        int vote = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            rs = ps.executeQuery();

            while (rs.next()) {
                vote = rs.getInt("lmcReviseCount");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return vote;
    }

    public int getFFReviseVoteCount(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT lmcReviseCount FROM ffproposal WHERE id = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;

        int vote = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, ffID);
            rs = ps.executeQuery();

            while (rs.next()) {
                vote = rs.getInt("lmcReviseCount");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return vote;
    }

    public int getRejectVoteCount(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT lmcRejectCount FROM seproposal WHERE id = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;

        int vote = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            rs = ps.executeQuery();

            while (rs.next()) {
                vote = rs.getInt("lmcRejectCount");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return vote;
    }

    public int getFFRejectVoteCount(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT lmcRejectCount FROM ffproposal WHERE id = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;

        int vote = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, ffID);
            rs = ps.executeQuery();

            while (rs.next()) {
                vote = rs.getInt("lmcRejectCount");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return vote;
    }

    public String tallyVote(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT lmcApprovalCount, lmcReviseCount, lmcRejectCount FROM seproposal WHERE id = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;

        int approvecount = 0;
        int revisecount = 0;
        int rejectcount = 0;

        String winner = "";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            rs = ps.executeQuery();

            while (rs.next()) {
                approvecount = rs.getInt("lmcApprovalCount");
                revisecount = rs.getInt("lmcReviseCount");
                rejectcount = rs.getInt("lmcRejectCount");
            }

            if (approvecount > revisecount && approvecount > rejectcount) {
                winner = "approve";
            }

            if (revisecount > approvecount && revisecount > rejectcount) {
                winner = "revise";
            }

            if (rejectcount > approvecount && rejectcount > revisecount) {
                winner = "reject";
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return winner;
    }

    public String FFtallyVote(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT lmcApprovalCount, lmcReviseCount, lmcRejectCount FROM ffproposal WHERE id = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;

        int approvecount = 0;
        int revisecount = 0;
        int rejectcount = 0;

        String winner = "";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, ffID);
            rs = ps.executeQuery();

            while (rs.next()) {
                approvecount = rs.getInt("lmcApprovalCount");
                revisecount = rs.getInt("lmcReviseCount");
                rejectcount = rs.getInt("lmcRejectCount");
            }

            if (approvecount > revisecount && approvecount > rejectcount) {
                winner = "approve";
            }

            if (revisecount > approvecount && revisecount > rejectcount) {
                winner = "revise";
            }

            if (rejectcount > approvecount && rejectcount > revisecount) {
                winner = "reject";
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return winner;
    }

    public void voteNelca(int seID, int vote) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET lmc2 = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, vote);
            pstmt.setInt(2, seID);

            int rs = pstmt.executeUpdate();

            query = "UPDATE seproposal SET hasVoted2 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void voteFFNelca(int ffID, int vote) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET lmc2 = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, vote);
            pstmt.setInt(2, ffID);

            int rs = pstmt.executeUpdate();

            query = "UPDATE ffproposal SET hasVoted2 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updatelmc2Remarks(String remarks, int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET lmc2Remarks = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, remarks);
            pstmt.setInt(2, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updateFFlmc2Remarks(String remarks, int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET lmc2Remarks = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, remarks);
            pstmt.setInt(2, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void voteMargarita(int seID, int vote) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET lmc3 = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, vote);
            pstmt.setInt(2, seID);

            int rs = pstmt.executeUpdate();

            query = "UPDATE seproposal SET hasVoted3 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void voteFFMargarita(int ffID, int vote) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET lmc3 = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, vote);
            pstmt.setInt(2, ffID);

            int rs = pstmt.executeUpdate();

            query = "UPDATE ffproposal SET hasVoted3 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updatelmc3Remarks(String remarks, int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET lmc3Remarks = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, remarks);
            pstmt.setInt(2, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updateFFlmc3Remarks(String remarks, int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET lmc3Remarks = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, remarks);
            pstmt.setInt(2, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void voteJames(int seID, int vote) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET lmc4 = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, vote);
            pstmt.setInt(2, seID);

            int rs = pstmt.executeUpdate();

            query = "UPDATE seproposal SET hasVoted4 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void voteFFJames(int ffID, int vote) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET lmc4 = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, vote);
            pstmt.setInt(2, ffID);

            int rs = pstmt.executeUpdate();

            query = "UPDATE ffproposal SET hasVoted4 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updatelmc4Remarks(String remarks, int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET lmc4Remarks = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, remarks);
            pstmt.setInt(2, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updateFFlmc4Remarks(String remarks, int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET lmc4Remarks = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, remarks);
            pstmt.setInt(2, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void voteFritzie(int seID, int vote) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET lmc5 = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, vote);
            pstmt.setInt(2, seID);

            int rs = pstmt.executeUpdate();

            query = "UPDATE seproposal SET hasVoted5 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void voteFFFritzie(int ffID, int vote) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET lmc5 = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, vote);
            pstmt.setInt(2, ffID);

            int rs = pstmt.executeUpdate();

            query = "UPDATE ffproposal SET hasVoted5 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updatelmc5Remarks(String remarks, int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET lmc5Remarks = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, remarks);
            pstmt.setInt(2, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updateFFlmc5Remarks(String remarks, int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET lmc5Remarks = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, remarks);
            pstmt.setInt(2, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void approveGelo(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET lmc6 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            int rs = pstmt.executeUpdate();

            query = "UPDATE seproposal SET hasVoted6 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updatelmc6Remarks(String remarks, int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET lmc6Remarks = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, remarks);
            pstmt.setInt(2, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void approveRito(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET lmc7 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            int rs = pstmt.executeUpdate();

            query = "UPDATE seproposal SET hasVoted7 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updatelmc7Remarks(String remarks, int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET lmc7Remarks = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, remarks);
            pstmt.setInt(2, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void approveLysander(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET lmc8 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            int rs = pstmt.executeUpdate();

            query = "UPDATE seproposal SET hasVoted8 = 1 WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updatelmc8Remarks(String remarks, int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET lmc8Remarks = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, remarks);
            pstmt.setInt(2, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public boolean hasEveryoneVoted(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;
        try {
            String query = "SELECT hasVoted1, hasVoted2, hasVoted3, hasVoted4, hasVoted5 FROM seproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                if (rs2.getInt("hasVoted1") == 1 && rs2.getInt("hasVoted2") == 1 && rs2.getInt("hasVoted3") == 1 && rs2.getInt("hasVoted4") == 1 && rs2.getInt("hasVoted5") == 1) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return false;
    }

    public boolean hasFFEveryoneVoted(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;
        try {
            String query = "SELECT hasVoted1, hasVoted2, hasVoted3, hasVoted5 FROM ffproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                if (rs2.getInt("hasVoted1") == 1 && rs2.getInt("hasVoted2") == 1 && rs2.getInt("hasVoted3") == 1 && rs2.getInt("hasVoted5") == 1) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return false;
    }

    public boolean hasMichaelVoted(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;
        try {
            String query = "SELECT hasVoted1 FROM seproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                if (rs2.getInt("hasVoted1") == 1) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return false;
    }

    public boolean hasMichaelFFVoted(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;
        try {
            String query = "SELECT hasVoted1 FROM ffproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                if (rs2.getInt("hasVoted1") == 1) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return false;
    }

    public boolean hasNelcaVoted(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;
        try {
            String query = "SELECT hasVoted2 FROM seproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                if (rs2.getInt("hasVoted2") == 1) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return false;
    }

    public boolean hasNelcaFFVoted(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;
        try {
            String query = "SELECT hasVoted2 FROM ffproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                if (rs2.getInt("hasVoted2") == 1) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return false;
    }

    public boolean hasMargaritaVoted(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;
        try {
            String query = "SELECT hasVoted3 FROM seproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                if (rs2.getInt("hasVoted3") == 1) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return false;
    }

    public boolean hasMargaritaFFVoted(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;
        try {
            String query = "SELECT hasVoted3 FROM ffproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                if (rs2.getInt("hasVoted3") == 1) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return false;
    }

    public boolean hasJamesVoted(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;
        try {
            String query = "SELECT hasVoted4 FROM seproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                if (rs2.getInt("hasVoted4") == 1) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return false;
    }

    public boolean hasJamesFFVoted(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;
        try {
            String query = "SELECT hasVoted4 FROM ffproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                if (rs2.getInt("hasVoted4") == 1) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return false;
    }

    public boolean hasFritzieVoted(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;
        try {
            String query = "SELECT hasVoted5 FROM seproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                if (rs2.getInt("hasVoted5") == 1) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return false;
    }

    public boolean hasFritzieFFVoted(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;
        try {
            String query = "SELECT hasVoted5 FROM ffproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                if (rs2.getInt("hasVoted5") == 1) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return false;
    }

    public boolean hasGeloVoted(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;
        try {
            String query = "SELECT hasVoted6 FROM seproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                if (rs2.getInt("hasVoted6") == 1) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return false;
    }

    public boolean hasRitoVoted(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;
        try {
            String query = "SELECT hasVoted7 FROM seproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                if (rs2.getInt("hasVoted7") == 1) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return false;
    }

    public boolean hasLysanderVoted(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;
        try {
            String query = "SELECT hasVoted8 FROM seproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                if (rs2.getInt("hasVoted8") == 1) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return false;
    }

    public int getStep(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT step FROM seproposal WHERE id = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;

        int step = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            rs = ps.executeQuery();

            while (rs.next()) {
                step = rs.getInt("step");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return step;
    }

    public String getSourceOfFunds(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT sourceOfFunds FROM seproposal WHERE id = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;

        String source = "";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            rs = ps.executeQuery();

            while (rs.next()) {
                source = rs.getString("sourceOfFunds");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return source;
    }

    public int getStepFF(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT step FROM ffproposal WHERE id = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;

        int step = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, ffID);
            rs = ps.executeQuery();

            while (rs.next()) {
                step = rs.getInt("step");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return step;
    }

    public void uploadPRS(InputStream prs, int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE seproposal SET prs = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setBlob(1, prs);
            pstmt.setInt(2, seID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void uploadFFPRS(InputStream prs, int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        try {
            String query = "UPDATE ffproposal SET prs = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setBlob(1, prs);
            pstmt.setInt(2, ffID);

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public byte[] viewPRS(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        byte[] imgData = null;
        Blob image = null;

        try {

            String query = "SELECT prs FROM seproposal WHERE id = ?";

            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                image = rs.getBlob("prs");
                imgData = image.getBytes(1, (int) image.length());
            }

            return imgData;

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
        return null;
    }

    public byte[] viewSEPhoto(int sereportID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        byte[] imgData = null;
        Blob image = null;

        try {

            String query = "SELECT annexes FROM sereport WHERE id = ?";

            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, sereportID);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                image = rs.getBlob("annexes");
                imgData = image.getBytes(1, (int) image.length());
            }

            return imgData;

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
        return null;
    }

    public byte[] viewFFPhoto(int ffreportID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        byte[] imgData = null;
        Blob image = null;

        try {

            String query = "SELECT annexes FROM ffreport WHERE id = ?";

            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffreportID);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                image = rs.getBlob("annexes");
                imgData = image.getBytes(1, (int) image.length());
            }

            return imgData;

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
        return null;
    }

    public byte[] viewSEBeneficiariesAttendance(int sereportID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        byte[] imgData = null;
        Blob image = null;

        try {

            String query = "SELECT attendanceBeneficiaries FROM sereport WHERE id = ?";

            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, sereportID);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                image = rs.getBlob("attendanceBeneficiaries");
                imgData = image.getBytes(1, (int) image.length());
            }

            return imgData;

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
        return null;
    }

    public byte[] viewSEDLSUAttendance(int sereportID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        byte[] imgData = null;
        Blob image = null;

        try {

            String query = "SELECT attendanceDLSU FROM sereport WHERE id = ?";

            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, sereportID);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                image = rs.getBlob("attendanceDLSU");
                imgData = image.getBytes(1, (int) image.length());
            }

            return imgData;

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
        return null;
    }

    public byte[] viewFFDLSUAttendance(int ffreportID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        byte[] imgData = null;
        Blob image = null;

        try {

            String query = "SELECT attendanceDLSU FROM ffreport WHERE id = ?";

            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffreportID);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                image = rs.getBlob("attendanceDLSU");
                imgData = image.getBytes(1, (int) image.length());
            }

            return imgData;

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
        return null;
    }

    public byte[] viewSEBeneficiariesLetters(int sereportID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        byte[] imgData = null;
        Blob image = null;

        try {

            String query = "SELECT beneficiariesLetters FROM sereport WHERE id = ?";

            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, sereportID);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                image = rs.getBlob("beneficiariesLetters");
                imgData = image.getBytes(1, (int) image.length());
            }

            return imgData;

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
        return null;
    }

    public byte[] viewFFPRS(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        byte[] imgData = null;
        Blob image = null;

        try {

            String query = "SELECT prs FROM ffproposal WHERE id = ?";

            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                image = rs.getBlob("prs");
                imgData = image.getBytes(1, (int) image.length());
            }

            return imgData;

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
        return null;
    }

    public String getCommunitynameByID(int cID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT name FROM community WHERE communityID = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        String name = "";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, cID);
            rs = ps.executeQuery();

            while (rs.next()) {
                name = rs.getString("name");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return name;
    }

    public String getKRAnameByID(int kraID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT name FROM kra WHERE kraID = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        String name = "";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, kraID);
            rs = ps.executeQuery();

            while (rs.next()) {
                name = rs.getString("name");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return name;
    }

    public String getGoalnameByID(int goalID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT name FROM goal WHERE goalID = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        String name = "";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, goalID);
            rs = ps.executeQuery();

            while (rs.next()) {
                name = rs.getString("name");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return name;
    }

    public String getMeasurenameByID(int measureID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT description FROM measure WHERE measureID = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        String name = "";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, measureID);
            rs = ps.executeQuery();

            while (rs.next()) {
                name = rs.getString("description");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return name;
    }

    public boolean isOVPLMSource(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;

        try {
            String query = "SELECT sourceOfFunds FROM seproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                if (rs2.getString("sourceOfFunds").equals("OVPLM")) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return false;
    }

    public boolean isOVPLMSourceFF(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;

        try {
            String query = "SELECT sourceOfFunds FROM ffproposal WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                if (rs2.getString("sourceOfFunds").equals("OVPLM")) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return false;
    }

    public Budget getLatestBudget() {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM budget ORDER BY id DESC LIMIT 1";
        PreparedStatement ps = null;
        ResultSet rs = null;
        Budget b = new Budget();

        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                b.setId(rs.getInt("id"));
                b.setDate(rs.getDate("date"));
                b.setCurrentBudget(rs.getDouble("currentBudget"));
                b.setBudgetRequested(rs.getDouble("budgetRequested"));
                b.setRemainingBudget(rs.getDouble("remainingBudget"));
                b.setSeID(rs.getInt("seID"));
                b.setFfID(rs.getInt("ffID"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return b;
    }

    public void setClassificationforKRA(int seid, String classification) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "UPDATE seproposal SET classificationforkra = ? where id = ?";
        PreparedStatement ps = null;
        int rs = 0;

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, classification);
            ps.setInt(2, seid);

            rs = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
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
    }

    public void addLatestBudget(Budget b) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "INSERT INTO budget(date, currentBudget, budgetRequested, remainingBudget, seID, ffID) VALUES(?,?,?,?,?,?)";
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            ps = conn.prepareStatement(query);
            ps.setDate(1, b.getDate());
            ps.setDouble(2, b.getCurrentBudget());
            ps.setDouble(3, b.getBudgetRequested());
            ps.setDouble(4, b.getRemainingBudget());
            ps.setInt(5, b.getSeID());
            ps.setInt(6, b.getFfID());

            int rs2 = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
    }

    public boolean hasSEReport(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;

        try {
            String query = "SELECT * FROM sereport WHERE seproposalID = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs2 = pstmt.executeQuery();

            if (rs2.next()) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return false;
    }

    public boolean hasFFReport(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;

        try {
            String query = "SELECT * FROM ffreport WHERE ffproposalID = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            rs2 = pstmt.executeQuery();

            if (rs2.next()) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return false;
    }

    public void AddSEreport(SEreport SEreport) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs2 = null;
        try {
            String query = "INSERT INTO sereport(projectTitle, targetKRA, targetGoal, projectProponent, numberOfBeneficiaries, projectBeneficiaries, addressBeneficiaries, implementationdate, addressOfProject, amountReceivedOVPLM, significanceProject, happenedImplementationProject, whenwhereProject, participantsProject, highlightsProject, majorProblems, otherRecommendations, annexes, attendanceBeneficiaries, attendanceDLSU, beneficiariesLetters, date, seproposalID, cap, apsp, asf, faculty, admin, directhired, independent, external, gsheets, graduate, undergraduate, alumni, parents) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, SEreport.getProjectTitle());
            pstmt.setString(2, SEreport.getTargetKRA());
            pstmt.setString(3, SEreport.getTargetGoal());
            pstmt.setString(4, SEreport.getProjectProponent());
            pstmt.setInt(5, SEreport.getNumberOfBeneficiaries());
            pstmt.setString(6, SEreport.getProjectBeneficiaries());
            pstmt.setString(7, SEreport.getAddressBeneficiaries());
            pstmt.setDate(8, SEreport.getImplementationdate());
            pstmt.setString(9, SEreport.getAddressOfProject());
            pstmt.setDouble(10, SEreport.getAmountReceivedOVPLM());
            pstmt.setString(11, SEreport.getSignificanceProject());
            pstmt.setString(12, SEreport.getHappenedImplementationProject());
            pstmt.setString(13, SEreport.getWhenwhereProject());
            pstmt.setString(14, SEreport.getParticipantsProject());
            pstmt.setString(15, SEreport.getHighlightsProject());
            pstmt.setString(16, SEreport.getMajorProblems());
            pstmt.setString(17, SEreport.getOtherRecommendations());
            pstmt.setBlob(18, SEreport.getAnnexes());
            pstmt.setBlob(19, SEreport.getAttendanceBeneficiaries());
            pstmt.setBlob(20, SEreport.getAttendanceDLSU());
            pstmt.setBlob(21, SEreport.getBeneficiariesLetters());
            pstmt.setDate(22, SEreport.getDate());
            pstmt.setInt(23, SEreport.getSeproposalID());
            pstmt.setInt(24, SEreport.getCap());
            pstmt.setInt(25, SEreport.getApsp());
            pstmt.setInt(26, SEreport.getAsf());
            pstmt.setInt(27, SEreport.getFaculty());
            pstmt.setInt(28, SEreport.getAdmin());
            pstmt.setInt(29, SEreport.getDirecthired());
            pstmt.setInt(30, SEreport.getIndependent());
            pstmt.setInt(31, SEreport.getExternal());
            pstmt.setString(32, SEreport.getGsheets());
            pstmt.setInt(33, SEreport.getGraduate());
            pstmt.setInt(34, SEreport.getUndergraduate());
            pstmt.setInt(35, SEreport.getAlumni());
            pstmt.setInt(36, SEreport.getParents());

            int rs = pstmt.executeUpdate();

            query = "SELECT * FROM sereport ORDER BY id DESC LIMIT 1";

            pstmt = conn.prepareStatement(query);

            rs2 = pstmt.executeQuery();

            int sereportID = 0;

            while (rs2.next()) {
                sereportID = rs2.getInt("id");
            }

            for (int i = 0; i < SEreport.getObjectives().size(); i++) {
                query = "INSERT INTO sereport_objectives(expectedOutcomes, actualAccomplishment, hinderingFactors, sereportID) VALUES (?,?,?,?)";

                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, SEreport.getObjectives().get(i).getExpectedOutcomes());
                pstmt.setString(2, SEreport.getObjectives().get(i).getActualAccomplishment());
                pstmt.setString(3, SEreport.getObjectives().get(i).getHinderingFactors());
                pstmt.setInt(4, sereportID);

                rs = pstmt.executeUpdate();

            }

            double totalApproved = 0;
            double totalExpended = 0;

            for (int i = 0; i < SEreport.getFunds().size(); i++) {
                query = "INSERT INTO sereport_funds(lineItem, approvedAmount, expendedAmount, variance, reasonVariance, sereportID) VALUES(?,?,?,?,?,?)";

                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, SEreport.getFunds().get(i).getLineItem());
                pstmt.setDouble(2, SEreport.getFunds().get(i).getApprovedAmount());
                pstmt.setDouble(3, SEreport.getFunds().get(i).getExpendedAmount());
                pstmt.setDouble(4, SEreport.getFunds().get(i).getVariance());
                pstmt.setString(5, SEreport.getFunds().get(i).getReasonVariance());
                pstmt.setInt(6, sereportID);

                totalApproved += SEreport.getFunds().get(i).getApprovedAmount();
                totalExpended += SEreport.getFunds().get(i).getExpendedAmount();

                rs = pstmt.executeUpdate();
            }

            if (totalApproved > totalExpended && this.isOVPLMSource(SEreport.getSeproposalID())) {
                Budget b = new Budget();

                java.util.Date javaDate = new java.util.Date();
                java.sql.Date sqlDate = new java.sql.Date(javaDate.getTime());

                b.setDate(sqlDate);
                b.setCurrentBudget(this.getLatestBudget().getRemainingBudget());
                b.setBudgetRequested(totalExpended - totalApproved);
                b.setRemainingBudget(b.getCurrentBudget() - b.getBudgetRequested());
                b.setSeID(SEreport.getSeproposalID());
                this.addLatestBudget(b);
            }

            for (int i = 0; i < SEreport.getAttendees().size(); i++) {
                query = "INSERT INTO sereport_attendees(name, email, type, sereportID) VALUES(?,?,?,?)";

                pstmt = conn.prepareCall(query);
                pstmt.setString(1, SEreport.getAttendees().get(i).getName());
                pstmt.setString(2, SEreport.getAttendees().get(i).getEmail());
                pstmt.setString(3, SEreport.getAttendees().get(i).getType());
                pstmt.setInt(4, sereportID);

                rs = pstmt.executeUpdate();
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public SEreport retrieveSEreportBySEID(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs2 = null;
        SEreport SEreport = new SEreport();
        try {
            String query = "SELECT * FROM sereport WHERE seproposalID = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, seID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SEreport.setId(rs2.getInt("id"));
                SEreport.setDate(rs2.getDate("date"));
                SEreport.setProjectTitle(rs2.getString("projectTitle"));
                SEreport.setTargetKRA(rs2.getString("targetKRA"));
                SEreport.setTargetGoal(rs2.getString("targetGoal"));
                SEreport.setProjectProponent(rs2.getString("projectProponent"));
                SEreport.setNumberOfBeneficiaries(rs2.getInt("numberOfBeneficiaries"));
                SEreport.setProjectBeneficiaries(rs2.getString("projectBeneficiaries"));
                SEreport.setAddressBeneficiaries(rs2.getString("addressBeneficiaries"));
                SEreport.setAddressOfProject(rs2.getString("addressOfProject"));
                SEreport.setAmountReceivedOVPLM(rs2.getDouble("amountReceivedOVPLM"));
                SEreport.setSignificanceProject(rs2.getString("significanceProject"));
                SEreport.setHappenedImplementationProject(rs2.getString("happenedImplementationProject"));
                SEreport.setWhenwhereProject(rs2.getString("whenwhereProject"));
                SEreport.setParticipantsProject(rs2.getString("participantsProject"));
                SEreport.setHighlightsProject(rs2.getString("highlightsProject"));
                SEreport.setMajorProblems(rs2.getString("majorProblems"));
                SEreport.setOtherRecommendations(rs2.getString("otherRecommendations"));
                SEreport.setSeproposalID(rs2.getInt("seproposalID"));
                SEreport.setCap(rs2.getInt("cap"));
                SEreport.setApsp(rs2.getInt("apsp"));
                SEreport.setAsf(rs2.getInt("asf"));
                SEreport.setFaculty(rs2.getInt("faculty"));
                SEreport.setAdmin(rs2.getInt("admin"));
                SEreport.setDirecthired(rs2.getInt("directhired"));
                SEreport.setIndependent(rs2.getInt("independent"));
                SEreport.setExternal(rs2.getInt("external"));
                SEreport.setImplementationdate(rs2.getDate("implementationdate"));
                SEreport.setGsheets(rs2.getString("gsheets"));
                SEreport.setGraduate(rs2.getInt("graduate"));
                SEreport.setUndergraduate(rs2.getInt("undergraduate"));
                SEreport.setAlumni(rs2.getInt("alumni"));
                SEreport.setParents(rs2.getInt("parents"));
            }

            ArrayList<SEobjectives> objectives = new ArrayList();

            query = "SELECT * FROM sereport_objectives WHERE sereportID = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, SEreport.getId());

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SEobjectives o = new SEobjectives();
                o.setExpectedOutcomes(rs2.getString("expectedOutcomes"));
                o.setActualAccomplishment(rs2.getString("actualAccomplishment"));
                o.setHinderingFactors(rs2.getString("hinderingFactors"));
                objectives.add(o);
            }

            SEreport.setObjectives(objectives);

            ArrayList<SEfunds> funds = new ArrayList();

            query = "SELECT * FROM sereport_funds WHERE sereportID = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, SEreport.getId());

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SEfunds f = new SEfunds();
                f.setLineItem(rs2.getString("lineItem"));
                f.setApprovedAmount(rs2.getDouble("approvedAmount"));
                f.setExpendedAmount(rs2.getDouble("expendedAmount"));
                f.setVariance(rs2.getDouble("variance"));
                f.setReasonVariance(rs2.getString("reasonVariance"));
                funds.add(f);
            }

            SEreport.setFunds(funds);

            ArrayList<SEattendees> attendees = new ArrayList();

            query = "SELECT * FROM sereport_attendees WHERE sereportID = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, SEreport.getId());

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SEattendees a = new SEattendees();
                a.setName(rs2.getString("name"));
                a.setEmail(rs2.getString("email"));
                attendees.add(a);
            }

            SEreport.setAttendees(attendees);

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return SEreport;
    }

    public FFreport retrieveFFreportByFFID(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs2 = null;
        FFreport FFreport = new FFreport();
        try {
            String query = "SELECT * FROM ffreport WHERE ffproposalID = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, ffID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FFreport.setId(rs2.getInt("id"));
                FFreport.setDate(rs2.getDate("date"));
                FFreport.setProjectTitle(rs2.getString("projectTitle"));
                FFreport.setProjectProponent(rs2.getString("projectProponent"));
                FFreport.setNameOfFacilitator(rs2.getString("facilitatorName"));
                FFreport.setAmountReceivedOVPLM(rs2.getDouble("amountReceivedOVPLM"));
                FFreport.setSignificanceProject(rs2.getString("significanceProject"));
                FFreport.setHighlightsProject(rs2.getString("highlightsProject"));
                FFreport.setMajorProblems(rs2.getString("majorProblems"));
                FFreport.setOtherRecommendations(rs2.getString("otherRecommendations"));
                FFreport.setFfproposalID(rs2.getInt("ffproposalID"));
                FFreport.setCap(rs2.getInt("cap"));
                FFreport.setApsp(rs2.getInt("apsp"));
                FFreport.setAsf(rs2.getInt("asf"));
                FFreport.setFaculty(rs2.getInt("faculty"));
                FFreport.setAdmin(rs2.getInt("admin"));
                FFreport.setDirecthired(rs2.getInt("directhired"));
                FFreport.setIndependent(rs2.getInt("independent"));
                FFreport.setExternal(rs2.getInt("external"));
                FFreport.setImplementationdate(rs2.getDate("implementationdate"));
                FFreport.setVenue(rs2.getString("venue"));
                FFreport.setGsheets(rs2.getString("gsheets"));
                FFreport.setGraduate(rs2.getInt("graduate"));
                FFreport.setUndergraduate(rs2.getInt("undergraduate"));
                FFreport.setAlumni(rs2.getInt("alumni"));
                FFreport.setParents(rs2.getInt("parents"));
            }

            ArrayList<FFparticipants> participants = new ArrayList();

            query = "SELECT * FROM ffreport_participants WHERE ffreportID = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, FFreport.getId());

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FFparticipants p = new FFparticipants();
                p.setClassification(rs2.getString("classification"));
                p.setNumberOfIndividuals(rs2.getInt("numberOfIndividuals"));
                participants.add(p);
            }

            FFreport.setParticipants(participants);

            ArrayList<FFobjectives> objectives = new ArrayList();

            query = "SELECT * FROM ffreport_objectives WHERE ffreportID = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, FFreport.getId());

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FFobjectives o = new FFobjectives();
                o.setExpectedOutcomes(rs2.getString("expectedOutcomes"));
                o.setActualAccomplishment(rs2.getString("actualAccomplishment"));
                o.setHinderingFactors(rs2.getString("hinderingFactors"));
                objectives.add(o);
            }

            FFreport.setObjectives(objectives);

            ArrayList<FFfunds> funds = new ArrayList();

            query = "SELECT * FROM ffreport_funds WHERE ffreportID = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, FFreport.getId());

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FFfunds f = new FFfunds();
                f.setLineItem(rs2.getString("lineItem"));
                f.setApprovedAmount(rs2.getDouble("approvedAmount"));
                f.setVariance(rs2.getDouble("variance"));
                f.setExpendedAmount(rs2.getDouble("expendedAmount"));
                f.setReasonVariance(rs2.getString("reasonVariance"));
                funds.add(f);
            }

            FFreport.setFunds(funds);

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FFreport;
    }

    public void AddFFreport(FFreport FFreport) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs2 = null;
        try {
            String query = "INSERT INTO ffreport(projectTitle, projectProponent, facilitatorName, amountReceivedOVPLM, significanceProject, highlightsProject, majorProblems, otherRecommendations, annexes, attendanceDLSU, date, ffproposalID, cap, apsp, asf, faculty, admin, directhired, independent, external, implementationdate, venue, gsheets, graduate, undergraduate, alumni, parents) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, FFreport.getProjectTitle());
            pstmt.setString(2, FFreport.getProjectProponent());
            pstmt.setString(3, FFreport.getNameOfFacilitator());
            pstmt.setDouble(4, FFreport.getAmountReceivedOVPLM());
            pstmt.setString(5, FFreport.getSignificanceProject());
            pstmt.setString(6, FFreport.getHighlightsProject());
            pstmt.setString(7, FFreport.getMajorProblems());
            pstmt.setString(8, FFreport.getOtherRecommendations());
            pstmt.setBlob(9, FFreport.getAnnexes());
            pstmt.setBlob(10, FFreport.getAttendanceDLSU());
            pstmt.setDate(11, FFreport.getDate());
            pstmt.setInt(12, FFreport.getFfproposalID());
            pstmt.setInt(13, FFreport.getCap());
            pstmt.setInt(14, FFreport.getApsp());
            pstmt.setInt(15, FFreport.getAsf());
            pstmt.setInt(16, FFreport.getFaculty());
            pstmt.setInt(17, FFreport.getAdmin());
            pstmt.setInt(18, FFreport.getDirecthired());
            pstmt.setInt(19, FFreport.getIndependent());
            pstmt.setInt(20, FFreport.getExternal());
            pstmt.setDate(21, FFreport.getImplementationdate());
            pstmt.setString(22, FFreport.getVenue());
            pstmt.setString(23, FFreport.getGsheets());
            pstmt.setInt(24, FFreport.getGraduate());
            pstmt.setInt(25, FFreport.getUndergraduate());
            pstmt.setInt(26, FFreport.getAlumni());
            pstmt.setInt(27, FFreport.getParents());

            int rs = pstmt.executeUpdate();

            query = "SELECT * FROM ffreport ORDER BY id DESC LIMIT 1";

            pstmt = conn.prepareStatement(query);

            rs2 = pstmt.executeQuery();

            int ffreportID = 0;

            while (rs2.next()) {
                ffreportID = rs2.getInt("id");
            }

            for (int i = 0; i < FFreport.getObjectives().size(); i++) {
                query = "INSERT INTO ffreport_objectives(expectedOutcomes, actualAccomplishment, hinderingFactors, ffreportID) VALUES (?,?,?,?)";

                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, FFreport.getObjectives().get(i).getExpectedOutcomes());
                pstmt.setString(2, FFreport.getObjectives().get(i).getActualAccomplishment());
                pstmt.setString(3, FFreport.getObjectives().get(i).getHinderingFactors());
                pstmt.setInt(4, ffreportID);

                rs = pstmt.executeUpdate();

            }

            double totalApproved = 0;
            double totalExpended = 0;

            for (int i = 0; i < FFreport.getFunds().size(); i++) {
                query = "INSERT INTO ffreport_funds(lineItem, approvedAmount, expendedAmount, variance, reasonVariance, ffreportID) VALUES(?,?,?,?,?,?)";

                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, FFreport.getFunds().get(i).getLineItem());
                pstmt.setDouble(2, FFreport.getFunds().get(i).getApprovedAmount());
                pstmt.setDouble(3, FFreport.getFunds().get(i).getExpendedAmount());
                pstmt.setDouble(4, FFreport.getFunds().get(i).getVariance());
                pstmt.setString(5, FFreport.getFunds().get(i).getReasonVariance());
                pstmt.setInt(6, ffreportID);

                totalApproved += FFreport.getFunds().get(i).getApprovedAmount();
                totalExpended += FFreport.getFunds().get(i).getExpendedAmount();

                rs = pstmt.executeUpdate();
            }

            if (totalApproved > totalExpended && this.isOVPLMSourceFF(FFreport.getFfproposalID())) {
                Budget b = new Budget();

                java.util.Date javaDate = new java.util.Date();
                java.sql.Date sqlDate = new java.sql.Date(javaDate.getTime());

                b.setDate(sqlDate);
                b.setCurrentBudget(this.getLatestBudget().getRemainingBudget());
                b.setBudgetRequested(totalExpended - totalApproved);
                b.setRemainingBudget(b.getCurrentBudget() - b.getBudgetRequested());
                b.setFfID(FFreport.getFfproposalID());
                this.addLatestBudget(b);
            }

            for (int i = 0; i < FFreport.getAttendees().size(); i++) {
                query = "INSERT INTO ffreport_attendees(name, email, type, ffreportID) VALUES(?,?,?,?)";

                pstmt = conn.prepareCall(query);
                pstmt.setString(1, FFreport.getAttendees().get(i).getName());
                pstmt.setString(2, FFreport.getAttendees().get(i).getEmail());
                pstmt.setString(3, FFreport.getAttendees().get(i).getType());
                pstmt.setInt(4, ffreportID);

                rs = pstmt.executeUpdate();
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public ArrayList<SEreport> retrieveSEReport() {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<SEreport> SEreport = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM sereport s JOIN seproposal t ON s.seproposalID = t.id";
            pstmt = conn.prepareStatement(query);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SEreport s = new SEreport();
                s.setSeproposalID(rs2.getInt("seproposalID"));
                s.setProjectTitle(rs2.getString("projectTitle"));
                s.setUnit(rs2.getString("unit"));
                s.setProgramhead(rs2.getString("programHead"));
                s.setDate(rs2.getDate("date"));
                SEreport.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return SEreport;
    }

    public ArrayList<FFreport> retrieveFFReport() {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FFreport> FFreport = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM ffreport f JOIN ffproposal t ON f.ffproposalID = t.id";
            pstmt = conn.prepareStatement(query);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FFreport f = new FFreport();
                f.setFfproposalID(rs2.getInt("ffproposalID"));
                f.setProjectTitle(rs2.getString("projectTitle"));
                f.setUnit(rs2.getString("unit"));
                f.setProgramHead(rs2.getString("programHead"));
                f.setDate(rs2.getDate("date"));
                FFreport.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FFreport;
    }

    public void updateSEProposalCodeBySEID(String code, int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        try {
            String query = "UPDATE seproposal SET code = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, code);
            pstmt.setInt(2, seID);

            int rs = pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void updateFFProposalCodeByFFID(String code, int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        try {
            String query = "UPDATE ffproposal SET code = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, code);
            pstmt.setInt(2, ffID);

            int rs = pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public boolean isSEValidCode(String code) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM seproposal WHERE code = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            ps = conn.prepareStatement(query);
            ps.setString(1, code);

            rs = ps.executeQuery();

            if (rs.next()) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return false;
    }

    public boolean isFFValidCode(String code) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM ffproposal WHERE code = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            ps = conn.prepareStatement(query);
            ps.setString(1, code);

            rs = ps.executeQuery();

            if (rs.next()) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return false;
    }

    public int getSEIDbyCode(String code) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM seproposal WHERE code = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        int seID = 0;
        try {

            ps = conn.prepareStatement(query);
            ps.setString(1, code);

            rs = ps.executeQuery();

            while (rs.next()) {
                seID = rs.getInt("id");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return seID;
    }

    public int getFFIDbyCode(String code) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM ffproposal WHERE code = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        int ffID = 0;
        try {

            ps = conn.prepareStatement(query);
            ps.setString(1, code);

            rs = ps.executeQuery();

            while (rs.next()) {
                ffID = rs.getInt("id");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return ffID;
    }

    public void AddSEevaluation(SEevaluation SEevaluation) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs2 = null;
        try {
            String query = "INSERT INTO seevaluation(date, name, detail, subjectName, sl11, sl12, sl13, sl14, sl15, ss21, ss22, ss23, ss24, ss25, pe31, pj41, lv51, lv52, lv53, lv54, lv55, pm61, pm62, pm63, pm64, pm65, pm66, pm67, pm68, pm69, pm610, pm611, pm612, pm613, or71, feedbacks, seproposalID) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(query);
            pstmt.setDate(1, SEevaluation.getDate());
            pstmt.setString(2, SEevaluation.getName());
            pstmt.setString(3, SEevaluation.getDetail());
            pstmt.setString(4, SEevaluation.getSubjectName());
            pstmt.setInt(5, SEevaluation.getSl11());
            pstmt.setInt(6, SEevaluation.getSl12());
            pstmt.setInt(7, SEevaluation.getSl13());
            pstmt.setInt(8, SEevaluation.getSl14());
            pstmt.setInt(9, SEevaluation.getSl15());
            pstmt.setInt(10, SEevaluation.getSs21());
            pstmt.setInt(11, SEevaluation.getSs22());
            pstmt.setInt(12, SEevaluation.getSs23());
            pstmt.setInt(13, SEevaluation.getSs24());
            pstmt.setInt(14, SEevaluation.getSs25());
            pstmt.setInt(15, SEevaluation.getPe31());
            pstmt.setInt(16, SEevaluation.getPj41());
            pstmt.setInt(17, SEevaluation.getLv51());
            pstmt.setInt(18, SEevaluation.getLv52());
            pstmt.setInt(19, SEevaluation.getLv53());
            pstmt.setInt(20, SEevaluation.getLv54());
            pstmt.setInt(21, SEevaluation.getLv55());
            pstmt.setInt(22, SEevaluation.getPm61());
            pstmt.setInt(23, SEevaluation.getPm62());
            pstmt.setInt(24, SEevaluation.getPm63());
            pstmt.setInt(25, SEevaluation.getPm64());
            pstmt.setInt(26, SEevaluation.getPm65());
            pstmt.setInt(27, SEevaluation.getPm66());
            pstmt.setInt(28, SEevaluation.getPm67());
            pstmt.setInt(29, SEevaluation.getPm68());
            pstmt.setInt(30, SEevaluation.getPm69());
            pstmt.setInt(31, SEevaluation.getPm610());
            pstmt.setInt(32, SEevaluation.getPm611());
            pstmt.setInt(33, SEevaluation.getPm612());
            pstmt.setInt(34, SEevaluation.getPm613());
            pstmt.setInt(35, SEevaluation.getOr71());
            pstmt.setString(36, SEevaluation.getFeedbacks());
            pstmt.setInt(37, SEevaluation.getSeproposalID());

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void AddFFevaluation(FFevaluation FFevaluation) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs2 = null;
        try {
            String query = "INSERT INTO ffevaluation(date, name, q1, q2, q3, q4, q5, q6, q7, q8, q9, learning, memorable, feedback, ffproposalID) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(query);
            pstmt.setDate(1, FFevaluation.getDate());
            pstmt.setString(2, FFevaluation.getName());
            pstmt.setInt(3, FFevaluation.getQ1());
            pstmt.setInt(4, FFevaluation.getQ2());
            pstmt.setInt(5, FFevaluation.getQ3());
            pstmt.setInt(6, FFevaluation.getQ4());
            pstmt.setInt(7, FFevaluation.getQ5());
            pstmt.setInt(8, FFevaluation.getQ6());
            pstmt.setInt(9, FFevaluation.getQ7());
            pstmt.setInt(10, FFevaluation.getQ8());
            pstmt.setInt(11, FFevaluation.getQ9());
            pstmt.setString(12, FFevaluation.getLearning());
            pstmt.setString(13, FFevaluation.getMemorable());
            pstmt.setString(14, FFevaluation.getFeedback());
            pstmt.setInt(15, FFevaluation.getFfproposalID());

            int rs = pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public boolean hasSEEvaluation(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;

        try {
            String query = "SELECT * FROM seevaluation WHERE seproposalID = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs2 = pstmt.executeQuery();

            if (rs2.next()) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return false;
    }

    public boolean hasFFEvaluation(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;

        try {
            String query = "SELECT * FROM ffevaluation WHERE ffproposalID = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            rs2 = pstmt.executeQuery();

            if (rs2.next()) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return false;
    }

    public int countsl11(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(sl11) FROM seevaluation WHERE seproposalID = ? && sl11 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(sl11)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countsl12(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(sl12) FROM seevaluation WHERE seproposalID = ? && sl12 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(sl12)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countsl13(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(sl13) FROM seevaluation WHERE seproposalID = ? && sl13 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(sl13)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countsl14(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(sl14) FROM seevaluation WHERE seproposalID = ? && sl14 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(sl14)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countsl15(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(sl15) FROM seevaluation WHERE seproposalID = ? && sl15 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(sl15)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countss21(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(ss21) FROM seevaluation WHERE seproposalID = ? && ss21 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(ss21)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countss22(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(ss22) FROM seevaluation WHERE seproposalID = ? && ss22 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(ss22)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countss23(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(ss23) FROM seevaluation WHERE seproposalID = ? && ss23 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(ss23)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countss24(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(ss24) FROM seevaluation WHERE seproposalID = ? && ss24 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(ss24)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countss25(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(ss25) FROM seevaluation WHERE seproposalID = ? && ss25 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(ss25)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countpe31(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(pe31) FROM seevaluation WHERE seproposalID = ? && pe31 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(pe31)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countpj41(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(pj41) FROM seevaluation WHERE seproposalID = ? && pj41 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(pj41)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countlv51(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(lv51) FROM seevaluation WHERE seproposalID = ? && lv51 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(lv51)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countlv52(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(lv52) FROM seevaluation WHERE seproposalID = ? && lv52 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(lv52)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countlv53(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(lv53) FROM seevaluation WHERE seproposalID = ? && lv53 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(lv53)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countlv54(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(lv54) FROM seevaluation WHERE seproposalID = ? && lv54 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(lv54)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countlv55(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(lv55) FROM seevaluation WHERE seproposalID = ? && lv55 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(lv55)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countpm61(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(pm61) FROM seevaluation WHERE seproposalID = ? && pm61 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(pm61)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countpm62(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(pm62) FROM seevaluation WHERE seproposalID = ? && pm62 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(pm62)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countpm63(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(pm63) FROM seevaluation WHERE seproposalID = ? && pm63 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(pm63)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countpm64(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(pm64) FROM seevaluation WHERE seproposalID = ? && pm64 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(pm64)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countpm65(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(pm65) FROM seevaluation WHERE seproposalID = ? && pm65 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(pm65)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countpm66(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(pm66) FROM seevaluation WHERE seproposalID = ? && pm66 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(pm66)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countpm67(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(pm67) FROM seevaluation WHERE seproposalID = ? && pm67 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(pm67)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countpm68(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(pm68) FROM seevaluation WHERE seproposalID = ? && pm68 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(pm68)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countpm69(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(pm69) FROM seevaluation WHERE seproposalID = ? && pm69 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(pm69)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countpm610(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(pm610) FROM seevaluation WHERE seproposalID = ? && pm610 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(pm610)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countpm611(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(pm611) FROM seevaluation WHERE seproposalID = ? && pm611 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(pm611)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countpm612(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(pm612) FROM seevaluation WHERE seproposalID = ? && pm612 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(pm612)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countpm613(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(pm613) FROM seevaluation WHERE seproposalID = ? && pm613 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(pm613)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countor71(int seID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(or71) FROM seevaluation WHERE seproposalID = ? && or71 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(or71)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countq1(int ffID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(q1) FROM ffevaluation WHERE ffproposalID = ? && q1 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, ffID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(q1)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countq2(int ffID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(q2) FROM ffevaluation WHERE ffproposalID = ? && q2 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, ffID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(q2)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countq3(int ffID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(q3) FROM ffevaluation WHERE ffproposalID = ? && q3 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, ffID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(q3)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countq4(int ffID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(q4) FROM ffevaluation WHERE ffproposalID = ? && q4 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, ffID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(q4)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countq5(int ffID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(q5) FROM ffevaluation WHERE ffproposalID = ? && q5 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, ffID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(q5)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countq6(int ffID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(q6) FROM ffevaluation WHERE ffproposalID = ? && q6 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, ffID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(q6)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countq7(int ffID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(q7) FROM ffevaluation WHERE ffproposalID = ? && q7 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, ffID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(q7)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countq8(int ffID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(q8) FROM ffevaluation WHERE ffproposalID = ? && q8 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, ffID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(q8)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countq9(int ffID, int answer) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(q9) FROM ffevaluation WHERE ffproposalID = ? && q9 = ?;";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, ffID);
            ps.setInt(2, answer);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(q9)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public ArrayList<String> getFeedbackEvaluation(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT feedbacks FROM seevaluation WHERE seproposalID = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<String> feedbacks = new ArrayList();

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);
            rs = ps.executeQuery();

            while (rs.next()) {
                String s = rs.getString("feedbacks");
                feedbacks.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return feedbacks;
    }

    public ArrayList<String> getLearningEvaluation(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT learning FROM ffevaluation WHERE ffproposalID = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<String> learnings = new ArrayList();

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, ffID);
            rs = ps.executeQuery();

            while (rs.next()) {
                String s = rs.getString("learning");
                learnings.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return learnings;
    }

    public ArrayList<String> getMemorableEvaluation(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT memorable FROM ffevaluation WHERE ffproposalID = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<String> memorable = new ArrayList();

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, ffID);
            rs = ps.executeQuery();

            while (rs.next()) {
                String s = rs.getString("memorable");
                memorable.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return memorable;
    }

    public ArrayList<String> getFeedbackFFEvaluation(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT feedback FROM ffevaluation WHERE ffproposalID = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<String> feedbacks = new ArrayList();

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, ffID);
            rs = ps.executeQuery();

            while (rs.next()) {
                String s = rs.getString("feedback");
                feedbacks.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return feedbacks;
    }

    public ArrayList<KRA> retrieveSORTEDKRA() {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<KRA> kra = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT count(k.name) as TOTAL, k.name, k.kraID FROM kra k JOIN (SELECT targetKRA FROM seproposal WHERE step = 8 UNION ALL SELECT targetKRA from ffproposal WHERE step = 9) as a ON a.targetKRA = k.kraID GROUP BY k.name DESC";
            pstmt = conn.prepareStatement(query);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                KRA k = new KRA();
                k.setTotal(rs2.getInt("TOTAL"));
                k.setId(rs2.getInt("kraID"));
                k.setName(rs2.getString("name"));
                kra.add(k);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return kra;
    }

    public ArrayList<KRA> insertPercentage(ArrayList<KRA> k) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;
        try {

            for (int i = 0; i < k.size(); i++) {
                String query = "SELECT SUM(m.target) FROM measure m WHERE m.kraID = ?";
                pstmt = conn.prepareStatement(query);
                pstmt.setInt(1, k.get(i).getId());

                rs2 = pstmt.executeQuery();

                while (rs2.next()) {
                    k.get(i).setTargetTotal(rs2.getInt("SUM(m.target)"));
                    k.get(i).setPercentage((int) Math.round((double) k.get(i).getTotal() / rs2.getInt("SUM(m.target)") * 100));
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return k;
    }

    public ArrayList<SE> retrieveSEProposalByKRAID(int kraID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<SE> SE = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM seproposal s JOIN kra k ON s.targetKRA = k.kraID WHERE k.kraID = ? AND s.step = 8";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, kraID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SE s = new SE();
                s.setName(rs2.getString("programName"));
                s.setProgramHead(rs2.getString("programHead"));
                s.setUnit(rs2.getString("unit"));
                s.setDepartment(rs2.getString("department"));
                s.setTargetGoal(rs2.getInt("targetGoal"));
                s.setTargetMeasure(rs2.getInt("targetMeasure"));
                s.setId(rs2.getInt("id"));
                SE.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return SE;
    }

    public ArrayList<FF> retrieveFFProposalByKRAID(int kraID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM ffproposal f JOIN kra k ON f.targetKRA = k.kraID WHERE k.kraID = ? AND f.step = 9";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, kraID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FF f = new FF();
                f.setProjectName(rs2.getString("projectName"));
                f.setProgramHead(rs2.getString("programHead"));
                f.setUnit(rs2.getString("unit"));
                f.setDepartment(rs2.getString("department"));
                f.setId(rs2.getInt("id"));
                FF.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FF;
    }

    public ArrayList<KRA> retrieveTermEndSortedKRA(Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<KRA> kra = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT count(k.name) as TOTAL, k.name, k.kraID FROM kra k JOIN (SELECT targetKRA FROM seproposal WHERE step = 8 AND datecreated >= ? AND datecreated <= ? UNION ALL SELECT targetKRA from ffproposal WHERE step = 9 AND datecreated >= ? AND datecreated <= ?) as a ON a.targetKRA = k.kraID  GROUP BY k.name DESC";
            pstmt = conn.prepareStatement(query);
            pstmt.setDate(1, startDate);
            pstmt.setDate(2, endDate);
            pstmt.setDate(3, startDate);
            pstmt.setDate(4, endDate);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                KRA k = new KRA();
                k.setTotal(rs2.getInt("TOTAL"));
                k.setId(rs2.getInt("kraID"));
                k.setName(rs2.getString("name"));
                kra.add(k);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return kra;
    }

    public KRA retrieveKRAByIDTermEnd(int kraID, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM KRA where kraID = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        KRA kra = new KRA();

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, kraID);
            rs = ps.executeQuery();

            while (rs.next()) {
                kra.setId(rs.getInt("kraID"));
                kra.setName(rs.getString("name"));
                kra.setDate(rs.getDate("date"));
                kra.setUserID(rs.getInt("userID"));
            }

            ArrayList<Goal> goals = new ArrayList();

            query = "SELECT * FROM goal WHERE kraID = ?";

            ps = conn.prepareStatement(query);
            ps.setInt(1, kraID);
            rs = ps.executeQuery();

            while (rs.next()) {
                Goal g = new Goal();
                g.setGoalID(rs.getInt("goalID"));
                g.setGoal(rs.getInt("goalNumber"));
                g.setName(rs.getString("name"));
                goals.add(g);
            }

            for (int i = 0; i < goals.size(); i++) {

                ArrayList<Measure> measures = new ArrayList();

                query = "SELECT * FROM measure WHERE goalID = ?";

                ps = conn.prepareStatement(query);
                ps.setInt(1, goals.get(i).getGoalID());
                rs = ps.executeQuery();

                while (rs.next()) {
                    Measure m = new Measure();
                    m.setMeasureID(rs.getInt("measureID"));
                    m.setMeasure(rs.getString("measure"));
                    m.setTarget(rs.getString("target"));
                    measures.add(m);
                }
                goals.get(i).setMeasures(measures);
            }

            for (int i = 0; i < goals.size(); i++) {

                for (int j = 0; j < goals.get(i).getMeasures().size(); j++) {
                    query = "SELECT count(m.measure) as TOTAL, m.description, m.measureID FROM measure m JOIN (SELECT targetMeasure FROM seproposal WHERE step = 8 AND datecreated >= ? AND datecreated <= ? UNION ALL SELECT targetMeasure from ffproposal WHERE step = 9 AND datecreated >= ? AND datecreated <= ?) as a ON a.targetMeasure = m.measureID GROUP BY m.description DESC";

                    ps = conn.prepareStatement(query);
                    ps.setDate(1, startDate);
                    ps.setDate(2, endDate);
                    ps.setDate(3, startDate);
                    ps.setDate(4, endDate);
                    rs = ps.executeQuery();

                    while (rs.next()) {
                        if (goals.get(i).getMeasures().get(j).getMeasureID() == rs.getInt("m.measureID")) {
                            goals.get(i).getMeasures().get(j).setNumOfPrograms(rs.getInt("count(m.measure"));
                        }
                    }
                }
            }

            kra.setGoals(goals);

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return kra;
    }

    public int countFFProposalByDate(Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        int count = 0;
        try {
            String query = "SELECT count(id) FROM ffproposal WHERE step = 8 AND datecreated >= ? AND datecreated <= ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setDate(1, startDate);
            pstmt.setDate(2, endDate);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                count = rs2.getInt("count(id)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return count;
    }

    public int countSEProposalByDate(Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        int count = 0;
        try {
            String query = "SELECT count(id) FROM seproposal WHERE step = 8 AND datecreated >= ? AND datecreated <= ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setDate(1, startDate);
            pstmt.setDate(2, endDate);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                count = rs2.getInt("count(id)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return count;
    }

    public int countSEProposalByClassificationDate(String classification, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        int count = 0;
        try {
            String query = "SELECT count(id) FROM seproposal WHERE step = 8 AND activityClassification = ? AND datecreated >= ? AND datecreated <= ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, classification);
            pstmt.setDate(2, startDate);
            pstmt.setDate(3, endDate);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                count = rs2.getInt("count(id)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return count;
    }

    public ArrayList<SE> retrieveSEProposalByClassificationDate(String classification, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<SE> SE = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM seproposal WHERE step = 8 AND activityClassification = ? AND datecreated >= ? AND datecreated <= ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, classification);
            pstmt.setDate(2, startDate);
            pstmt.setDate(3, endDate);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SE s = new SE();
                s.setDate(rs2.getDate("datecreated"));
                s.setName(rs2.getString("programName"));
                s.setProgramHead(rs2.getString("programHead"));
                s.setActivityClassification(rs2.getString("activityClassification"));
                s.setTargetCommunity(rs2.getInt("targetCommunity"));
                s.setSourceOfFunds(rs2.getString("sourceOfFunds"));
                s.setId(rs2.getInt("id"));
                SE.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return SE;
    }

    public ArrayList<SE> retrieveALLSEProposalByDate(Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<SE> SE = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM seproposal WHERE step = 8 AND datecreated >= ? AND datecreated <= ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setDate(1, startDate);
            pstmt.setDate(2, endDate);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SE s = new SE();
                s.setDate(rs2.getDate("datecreated"));
                s.setName(rs2.getString("programName"));
                s.setProgramHead(rs2.getString("programHead"));
                s.setActivityClassification(rs2.getString("activityClassification"));
                s.setTargetCommunity(rs2.getInt("targetCommunity"));
                s.setSourceOfFunds(rs2.getString("sourceOfFunds"));
                s.setId(rs2.getInt("id"));
                SE.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return SE;
    }

    public int countFFProposalByClassificationDate(String classification, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        int count = 0;
        try {
            String query = "SELECT count(id) FROM ffproposal WHERE step = 8 AND activityClassification = ? AND datecreated >= ? AND datecreated <= ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, classification);
            pstmt.setDate(2, startDate);
            pstmt.setDate(3, endDate);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                count = rs2.getInt("count(id)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return count;
    }

    public ArrayList<FF> retrieveFFProposalByClassificationDate(String classification, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM ffproposal WHERE step = 8 AND activityClassification = ? AND datecreated >= ? AND datecreated <= ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, classification);
            pstmt.setDate(2, startDate);
            pstmt.setDate(3, endDate);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FF f = new FF();
                f.setDatecreated(rs2.getDate("datecreated"));
                f.setProjectName(rs2.getString("projectName"));
                f.setProgramHead(rs2.getString("programHead"));
                f.setActivityClassification(rs2.getString("activityClassification"));
                f.setSourceOfFunds(rs2.getString("sourceOfFunds"));
                f.setId(rs2.getInt("id"));
                FF.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FF;
    }

    public ArrayList<FF> retrieveALLFFProposalByDate(Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM ffproposal WHERE step = 8 AND datecreated >= ? AND datecreated <= ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setDate(1, startDate);
            pstmt.setDate(2, endDate);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FF f = new FF();
                f.setDatecreated(rs2.getDate("datecreated"));
                f.setProjectName(rs2.getString("projectName"));
                f.setProgramHead(rs2.getString("programHead"));
                f.setActivityClassification(rs2.getString("activityClassification"));
                f.setSourceOfFunds(rs2.getString("sourceOfFunds"));
                f.setId(rs2.getInt("id"));
                FF.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FF;
    }

    public int countSEProposalByUnit(String unit, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        int count = 0;
        try {
            String query = "SELECT count(unit) FROM seproposal WHERE step = 8 AND unit = ? AND datecreated >= ? AND datecreated <= ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, unit);
            pstmt.setDate(2, startDate);
            pstmt.setDate(3, endDate);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                count = rs2.getInt("count(unit)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return count;
    }

    public int countFFProposalByUnit(String unit, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        int count = 0;
        try {
            String query = "SELECT count(unit) FROM ffproposal WHERE step = 8 AND unit = ? AND datecreated >= ? AND datecreated <= ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, unit);
            pstmt.setDate(2, startDate);
            pstmt.setDate(3, endDate);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                count = rs2.getInt("count(unit)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return count;
    }

    public ArrayList<SE> retrieveSEbyUnit(String unit) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<SE> SE = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM seproposal WHERE unit = ? AND step != 8 AND step != 0 AND step != -1 ORDER BY id DESC LIMIT 5";
            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, unit);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SE s = new SE();
                s.setDate(rs2.getDate("datecreated"));
                s.setName(rs2.getString("programName"));
                s.setProgramHead(rs2.getString("programHead"));
                s.setUnit(rs2.getString("unit"));
                s.setDepartment(rs2.getString("department"));
                s.setSourceOfFunds(rs2.getString("sourceOfFunds"));
                s.setStep(rs2.getInt("step"));
                s.setId(rs2.getInt("id"));
                SE.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return SE;
    }

    public ArrayList<SE> retrieveSEbyDepartment(String department) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<SE> SE = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM seproposal WHERE department = ? AND step != 8 AND step != 0 AND step != -1 ORDER BY id DESC LIMIT 5";
            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, department);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SE s = new SE();
                s.setDate(rs2.getDate("datecreated"));
                s.setName(rs2.getString("programName"));
                s.setProgramHead(rs2.getString("programHead"));
                s.setUnit(rs2.getString("unit"));
                s.setDepartment(rs2.getString("department"));
                s.setSourceOfFunds(rs2.getString("sourceOfFunds"));
                s.setStep(rs2.getInt("step"));
                s.setId(rs2.getInt("id"));
                SE.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return SE;
    }

    public ArrayList<FF> retrieveFFbyUnit(String unit) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM ffproposal WHERE unit = ? AND step != 9 AND STEP != 0 ORDER BY id DESC LIMIT 5";
            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, unit);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FF f = new FF();
                f.setDatecreated(rs2.getDate("datecreated"));
                f.setProjectName(rs2.getString("projectName"));
                f.setProgramHead(rs2.getString("programHead"));
                f.setUnit(rs2.getString("unit"));
                f.setDepartment(rs2.getString("department"));
                f.setSourceOfFunds(rs2.getString("sourceOfFunds"));
                f.setStep(rs2.getInt("step"));
                f.setId(rs2.getInt("id"));
                FF.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FF;
    }

    public ArrayList<FF> retrieveFFbyDepartment(String department) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM ffproposal WHERE department = ? AND step != 9 AND STEP != 0 ORDER BY id DESC LIMIT 5";
            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, department);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FF f = new FF();
                f.setDatecreated(rs2.getDate("datecreated"));
                f.setProjectName(rs2.getString("projectName"));
                f.setProgramHead(rs2.getString("programHead"));
                f.setUnit(rs2.getString("unit"));
                f.setDepartment(rs2.getString("department"));
                f.setSourceOfFunds(rs2.getString("sourceOfFunds"));
                f.setStep(rs2.getInt("step"));
                f.setId(rs2.getInt("id"));
                FF.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FF;
    }

    public ArrayList<SE> retrieveSEProposalToAssessByStep(int step) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<SE> SE = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM seproposal WHERE step = ? ORDER BY id DESC LIMIT 5";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, step);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SE s = new SE();
                s.setDate(rs2.getDate("datecreated"));
                s.setName(rs2.getString("programName"));
                s.setProgramHead(rs2.getString("programHead"));
                s.setUnit(rs2.getString("unit"));
                s.setDepartment(rs2.getString("department"));
                s.setId(rs2.getInt("id"));
                SE.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return SE;
    }

    public ArrayList<FF> retrieveFFProposalToAssessByStep(int step) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM ffproposal WHERE step = ? ORDER BY id DESC LIMIT 5";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, step);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FF f = new FF();
                f.setDatecreated(rs2.getDate("datecreated"));
                f.setProjectName(rs2.getString("projectName"));
                f.setProgramHead(rs2.getString("programHead"));
                f.setUnit(rs2.getString("unit"));
                f.setDepartment(rs2.getString("department"));
                f.setId(rs2.getInt("id"));
                FF.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FF;
    }

    public ArrayList<Community> retrieveProgramsCommunityByDate(Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<Community> communities = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT c.name, count(c.name) as TOTAL FROM community c JOIN seproposal s ON s.targetCommunity = c.communityID WHERE step = 8 AND datecreated >= ? AND datecreated <= ? GROUP BY c.name";
            pstmt = conn.prepareStatement(query);
            pstmt.setDate(1, startDate);
            pstmt.setDate(2, endDate);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                Community c = new Community();
                c.setName(rs2.getString("c.name"));
                c.setNumberOfPrograms(rs2.getInt("TOTAL"));
                communities.add(c);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return communities;
    }

    public double getInitialBudgetByDate(Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs = null;

        double budget = 0;
        try {
            String query = "SELECT remainingBudget FROM budget WHERE date >= ? AND date <= ? ORDER BY remainingBudget DESC LIMIT 1";
            pstmt = conn.prepareStatement(query);
            pstmt.setDate(1, startDate);
            pstmt.setDate(2, endDate);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                budget = rs.getDouble("remainingBudget");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return budget;
    }

    public double getRemainingBudgetByDate(Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs = null;

        double budget = 0;
        try {
            String query = "SELECT remainingBudget FROM budget WHERE date >= ? AND date <= ? ORDER BY id DESC LIMIT 1";
            pstmt = conn.prepareStatement(query);
            pstmt.setDate(1, startDate);
            pstmt.setDate(2, endDate);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                budget = rs.getDouble("remainingBudget");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return budget;
    }

    public double getBudgetRequestedByDate(Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs = null;

        double budget = 0;
        try {
            String query = "SELECT SUM(total.totalAmountRequested) as totalRequestedBudget FROM (SELECT totalAmountRequested FROM seproposal WHERE step = 8 AND datecreated >= ? AND datecreated <= ? AND sourceOfFunds = 'OVPLM' UNION ALL SELECT totalAmount as totalAmountRequested from ffproposal WHERE step = 8 AND datecreated >= ? AND datecreated <= ? AND sourceOfFunds = 'OVPLM') as total";
            pstmt = conn.prepareStatement(query);
            pstmt.setDate(1, startDate);
            pstmt.setDate(2, endDate);
            pstmt.setDate(3, startDate);
            pstmt.setDate(4, endDate);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                budget = rs.getDouble("totalRequestedBudget");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return budget;
    }

    public double getSEUtilizedBudgetByDate(Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs = null;

        double budget = 0;
        try {
            String query = "SELECT SUM(sf.expendedAmount) as total FROM sereport_funds sf JOIN sereport se ON sf.sereportID = se.id JOIN seproposal s ON s.id = se.seproposalID WHERE s.step = 8 AND s.datecreated >= ? AND s.datecreated <= ? AND s.sourceOfFunds = 'OVPLM'";
            pstmt = conn.prepareStatement(query);
            pstmt.setDate(1, startDate);
            pstmt.setDate(2, endDate);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                budget = rs.getDouble("total");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return budget;
    }

    public double getFFUtilizedBudgetByDate(Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs = null;

        double budget = 0;
        try {
            String query = "SELECT SUM(ff.expendedAmount) as total FROM ffreport_funds ff JOIN ffreport fr ON ff.ffreportID = fr.id JOIN ffproposal f ON f.id = fr.ffproposalID WHERE f.step = 8 AND f.datecreated >= ? AND f.datecreated <= ? AND f.sourceOfFunds = 'OVPLM'";
            pstmt = conn.prepareStatement(query);
            pstmt.setDate(1, startDate);
            pstmt.setDate(2, endDate);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                budget = rs.getDouble("total");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return budget;
    }

    public ArrayList<SE> retrieveSEProposalAmountRequestedByDate(Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<SE> SE = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM seproposal WHERE step = 8 AND datecreated >= ? AND datecreated <= ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setDate(1, startDate);
            pstmt.setDate(2, endDate);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SE s = new SE();
                s.setDate(rs2.getDate("datecreated"));
                s.setName(rs2.getString("programName"));
                s.setTotalAmount(rs2.getDouble("totalAmountRequested"));
                s.setUnit(rs2.getString("unit"));
                s.setDepartment(rs2.getString("department"));
                s.setId(rs2.getInt("id"));
                SE.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return SE;
    }

    public ArrayList<FF> retrieveFFProposalAmountRequestedByDate(Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM ffproposal WHERE step = 8 AND datecreated >= ? AND datecreated <= ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setDate(1, startDate);
            pstmt.setDate(2, endDate);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FF f = new FF();
                f.setDatecreated(rs2.getDate("datecreated"));
                f.setProjectName(rs2.getString("projectName"));
                f.setTotalAmount(rs2.getDouble("totalAmount"));
                f.setUnit(rs2.getString("unit"));
                f.setDepartment(rs2.getString("department"));
                f.setId(rs2.getInt("id"));
                FF.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FF;
    }

    public int countProgramsCompletedByCommunityID(int communityID, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(s.targetCommunity) as programsCompleted FROM seproposal s JOIN sereport se ON s.ID = se.seproposalID WHERE s.targetCommunity = ? AND s.datecreated >= ? AND s.datecreated <= ?";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, communityID);
            ps.setDate(2, startDate);
            ps.setDate(3, endDate);

            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("programsCompleted");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countProgramsActivityClassificationCompletedByCommunityID(int communityID, String activityClassification, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(s.activityClassification) as programsCompleted FROM seproposal s JOIN sereport se ON s.ID = se.seproposalID WHERE s.targetCommunity = ? AND s.activityClassification = ? AND s.datecreated >= ? AND s.datecreated <= ?";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, communityID);
            ps.setString(2, activityClassification);
            ps.setDate(3, startDate);
            ps.setDate(4, endDate);

            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("programsCompleted");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public ArrayList<SE> retrieveSEProposalCompletedByCommunityID(int communityID, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<SE> SE = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT s.datecreated, s.programName, s.programHead, s.unit, s.department, s.sourceOfFunds, s.Id, s.activityClassification FROM seproposal s JOIN sereport se ON s.ID = se.seproposalID WHERE s.targetCommunity = ? AND s.datecreated >= ? AND s.datecreated <= ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, communityID);
            pstmt.setDate(2, startDate);
            pstmt.setDate(3, endDate);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SE s = new SE();
                s.setDate(rs2.getDate("datecreated"));
                s.setName(rs2.getString("programName"));
                s.setProgramHead(rs2.getString("programHead"));
                s.setUnit(rs2.getString("unit"));
                s.setDepartment(rs2.getString("department"));
                s.setId(rs2.getInt("id"));
                s.setSourceOfFunds(rs2.getString("sourceOfFunds"));
                s.setActivityClassification(rs2.getString("activityClassification"));
                SE.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return SE;
    }

    public int countProgramsUnitCompletedByCommunityID(int communityID, String unit, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(s.unit) as programsCompleted FROM seproposal s JOIN sereport se ON s.ID = se.seproposalID WHERE s.targetCommunity = ? AND s.unit = ? AND s.datecreated >= ? AND s.datecreated <= ?";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, communityID);
            ps.setString(2, unit);
            ps.setDate(3, startDate);
            ps.setDate(4, endDate);

            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("programsCompleted");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countProgramsUnitAffliatedCompletedByCommunityID(int communityID, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(DISTINCT s.unit) as programsCompleted FROM seproposal s JOIN sereport se ON s.ID = se.seproposalID WHERE s.targetCommunity = ? AND s.datecreated >= ? AND s.datecreated <= ?";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, communityID);
            ps.setDate(2, startDate);
            ps.setDate(3, endDate);

            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("programsCompleted");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public ArrayList<KRA> retrieveProgramsMeasureByKRA(int kraID, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<KRA> kra = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT count(m.measure) as TOTAL, m.description, m.measureID, m.kraID, m.goalID FROM measure m JOIN (SELECT targetMeasure FROM seproposal WHERE step = 8 AND datecreated >= ? AND datecreated <= ? UNION ALL SELECT targetMeasure from ffproposal WHERE step = 8 AND datecreated >= ? AND datecreated <= ?) as a ON a.targetMeasure = m.measureID WHERE m.kraID = ? GROUP BY m.description DESC";
            pstmt = conn.prepareStatement(query);
            pstmt.setDate(1, startDate);
            pstmt.setDate(2, endDate);
            pstmt.setDate(3, startDate);
            pstmt.setDate(4, endDate);
            pstmt.setInt(5, kraID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                KRA k = new KRA();
                k.setTotalCountperMeasure(rs2.getInt("TOTAL"));
                k.setId(rs2.getInt("kraID"));
                k.setMeasureID(rs2.getInt("measureID"));
                k.setGoalID(rs2.getInt("goalID"));
                kra.add(k);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return kra;
    }

    public ArrayList<KRA> retrieveALLProgramsMeasure(Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<KRA> kra = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT count(m.measure) as TOTAL, m.description, m.measureID, m.kraID, m.goalID FROM measure m JOIN (SELECT targetMeasure FROM seproposal WHERE step = 8 AND datecreated >= ? AND datecreated <= ? UNION ALL SELECT targetMeasure from ffproposal WHERE step = 9 AND datecreated >= ? AND datecreated <= ?) as a ON a.targetMeasure = m.measureID GROUP BY m.description DESC";
            pstmt = conn.prepareStatement(query);
            pstmt.setDate(1, startDate);
            pstmt.setDate(2, endDate);
            pstmt.setDate(3, startDate);
            pstmt.setDate(4, endDate);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                KRA k = new KRA();
                k.setTotalCountperMeasure(rs2.getInt("TOTAL"));
                k.setId(rs2.getInt("kraID"));
                k.setMeasureID(rs2.getInt("measureID"));
                k.setGoalID(rs2.getInt("goalID"));
                kra.add(k);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return kra;
    }

    public double getUtilizedBudgetByDate(Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs = null;

        double budget = 0;
        try {
            String query = "SELECT SUM(a.expendedAmount) FROM (SELECT sf.expendedAmount FROM sereport_funds sf JOIN sereport se ON sf.sereportID = se.id JOIN seproposal s ON s.id = se.seproposalID WHERE s.step = 8 AND s.datecreated >= ? AND s.datecreated <= ? AND s.sourceOfFunds = 'OVPLM' UNION ALL SELECT ff.expendedAmount FROM ffreport_funds ff JOIN ffreport fr ON ff.ffreportID = fr.id JOIN ffproposal f ON f.id = fr.ffproposalID WHERE f.step = 8 AND f.datecreated >= ? AND f.datecreated <= ? AND f.sourceOfFunds = 'OVPLM') as a";
            pstmt = conn.prepareStatement(query);
            pstmt.setDate(1, startDate);
            pstmt.setDate(2, endDate);
            pstmt.setDate(3, startDate);
            pstmt.setDate(4, endDate);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                budget = rs.getDouble("SUM(a.expendedAmount)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return budget;
    }

    public double getUtilizedBudgetBySEIDDate(int seID, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs = null;

        double budget = 0;
        try {
            String query = "SELECT SUM(sf.expendedAmount) FROM sereport_funds sf JOIN sereport se ON sf.sereportID = se.id JOIN seproposal s ON s.id = se.seproposalID WHERE s.step = 8 AND s.id = ? AND s.datecreated >= ? AND s.datecreated <= ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);
            pstmt.setDate(2, startDate);
            pstmt.setDate(3, endDate);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                budget = rs.getDouble("SUM(sf.expendedAmount)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return budget;
    }

    public double getUtilizedBudgetByFFIDDate(int ffID, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs = null;

        double budget = 0;
        try {
            String query = "SELECT SUM(ff.expendedAmount) FROM ffreport_funds ff JOIN ffreport fe ON ff.ffreportID = fe.id JOIN ffproposal f ON f.id = fe.ffproposalID WHERE f.step = 8 AND f.id = ? AND f.datecreated >= ? AND f.datecreated <= ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);
            pstmt.setDate(2, startDate);
            pstmt.setDate(3, endDate);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                budget = rs.getDouble("SUM(ff.expendedAmount)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return budget;
    }

    public ArrayList<SE> retrieveSEProposalByUnitClassificationDate(String unit, String classification, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<SE> SE = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM seproposal WHERE step = 8 AND unit = ? AND activityClassification = ? AND datecreated >= ? AND datecreated <= ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, unit);
            pstmt.setString(2, classification);
            pstmt.setDate(3, startDate);
            pstmt.setDate(4, endDate);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SE s = new SE();
                s.setDate(rs2.getDate("datecreated"));
                s.setName(rs2.getString("programName"));
                s.setProgramHead(rs2.getString("programHead"));
                s.setActivityClassification(rs2.getString("activityClassification"));
                s.setTargetCommunity(rs2.getInt("targetCommunity"));
                s.setSourceOfFunds(rs2.getString("sourceOfFunds"));
                s.setDepartment(rs2.getString("department"));
                s.setId(rs2.getInt("id"));
                SE.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return SE;
    }

    public ArrayList<SE> retrieveALLSEProposalByUnitDate(String unit, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<SE> SE = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM seproposal WHERE step = 8 AND unit = ? AND datecreated >= ? AND datecreated <= ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, unit);
            pstmt.setDate(2, startDate);
            pstmt.setDate(3, endDate);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SE s = new SE();
                s.setDate(rs2.getDate("datecreated"));
                s.setName(rs2.getString("programName"));
                s.setProgramHead(rs2.getString("programHead"));
                s.setActivityClassification(rs2.getString("activityClassification"));
                s.setTargetCommunity(rs2.getInt("targetCommunity"));
                s.setSourceOfFunds(rs2.getString("sourceOfFunds"));
                s.setDepartment(rs2.getString("department"));
                s.setId(rs2.getInt("id"));
                SE.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return SE;
    }

    public ArrayList<FF> retrieveFFProposalByUnitClassificationDate(String unit, String classification, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM ffproposal WHERE step = 8 AND unit = ? AND activityClassification = ? AND datecreated >= ? AND datecreated <= ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, unit);
            pstmt.setString(2, classification);
            pstmt.setDate(3, startDate);
            pstmt.setDate(4, endDate);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FF f = new FF();
                f.setDatecreated(rs2.getDate("datecreated"));
                f.setProjectName(rs2.getString("projectName"));
                f.setProgramHead(rs2.getString("programHead"));
                f.setActivityClassification(rs2.getString("activityClassification"));
                f.setSourceOfFunds(rs2.getString("sourceOfFunds"));
                f.setDepartment(rs2.getString("department"));
                f.setId(rs2.getInt("id"));
                FF.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FF;
    }

    public ArrayList<FF> retrieveALLFFProposalByUnitDate(String unit, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM ffproposal WHERE step = 8 AND unit = ? AND datecreated >= ? AND datecreated <= ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, unit);
            pstmt.setDate(2, startDate);
            pstmt.setDate(3, endDate);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FF f = new FF();
                f.setDatecreated(rs2.getDate("datecreated"));
                f.setProjectName(rs2.getString("projectName"));
                f.setProgramHead(rs2.getString("programHead"));
                f.setActivityClassification(rs2.getString("activityClassification"));
                f.setSourceOfFunds(rs2.getString("sourceOfFunds"));
                f.setDepartment(rs2.getString("department"));
                f.setId(rs2.getInt("id"));
                FF.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FF;
    }

    public ArrayList<KRA> retrieveUnitSortedKRA(String unit, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<KRA> kra = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT count(k.name) as TOTAL, k.name, k.kraID FROM kra k JOIN (SELECT targetKRA FROM seproposal WHERE step = 8 AND unit = ? AND datecreated >= ? AND datecreated <= ? UNION ALL SELECT targetKRA from ffproposal WHERE step = 8 AND unit = ? AND datecreated >= ? AND datecreated <= ?) as a ON a.targetKRA = k.kraID  GROUP BY k.name DESC";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, unit);
            pstmt.setDate(2, startDate);
            pstmt.setDate(3, endDate);
            pstmt.setString(4, unit);
            pstmt.setDate(5, startDate);
            pstmt.setDate(6, endDate);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                KRA k = new KRA();
                k.setTotal(rs2.getInt("TOTAL"));
                k.setId(rs2.getInt("kraID"));
                k.setName(rs2.getString("name"));
                kra.add(k);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return kra;
    }

    public ArrayList<KRA> retrieveProgramsUnitMeasureByKRA(String unit, int kraID, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<KRA> kra = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT count(m.measure) as TOTAL, m.description, m.measureID, m.kraID, m.goalID, a.programName, a.datecreated FROM measure m JOIN (SELECT targetMeasure, programName, datecreated FROM seproposal WHERE step = 8 AND unit = ? AND datecreated >= ? AND datecreated <= ? UNION ALL SELECT targetMeasure, projectName AS programName, datecreated from ffproposal WHERE step = 9 AND unit = ? AND datecreated >= ? AND datecreated <= ?) as a ON a.targetMeasure = m.measureID WHERE m.kraID = ? GROUP BY m.description DESC";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, unit);
            pstmt.setDate(2, startDate);
            pstmt.setDate(3, endDate);
            pstmt.setString(4, unit);
            pstmt.setDate(5, startDate);
            pstmt.setDate(6, endDate);
            pstmt.setInt(7, kraID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                KRA k = new KRA();
                k.setDate(rs2.getDate("a.datecreated"));
                k.setTotalCountperMeasure(rs2.getInt("TOTAL"));
                k.setId(rs2.getInt("kraID"));
                k.setMeasureID(rs2.getInt("measureID"));
                k.setGoalID(rs2.getInt("goalID"));
                k.setProgramName(rs2.getString("a.programName"));
                kra.add(k);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return kra;
    }

    public ArrayList<KRA> retrieveALLProgramsUnitMeasure(String unit, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<KRA> kra = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT count(m.measure) as TOTAL, m.description, m.measureID, m.kraID, m.goalID, a.programName, a.datecreated FROM measure m JOIN (SELECT targetMeasure, programName, datecreated FROM seproposal WHERE step = 8 AND unit = ? AND datecreated >= ? AND datecreated <= ? UNION ALL SELECT targetMeasure, projectName AS programName, datecreated from ffproposal WHERE step = 9 AND unit = ? AND datecreated >= ? AND datecreated <= ?) as a ON a.targetMeasure = m.measureID GROUP BY m.description DESC";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, unit);
            pstmt.setDate(2, startDate);
            pstmt.setDate(3, endDate);
            pstmt.setString(4, unit);
            pstmt.setDate(5, startDate);
            pstmt.setDate(6, endDate);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                KRA k = new KRA();
                k.setDate(rs2.getDate("a.datecreated"));
                k.setTotalCountperMeasure(rs2.getInt("TOTAL"));
                k.setId(rs2.getInt("kraID"));
                k.setMeasureID(rs2.getInt("measureID"));
                k.setGoalID(rs2.getInt("goalID"));
                k.setProgramName(rs2.getString("a.programName"));
                kra.add(k);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return kra;
    }

    public ArrayList<Community> retrieveProgramsUnitCommunityByDate(String unit, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<Community> communities = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT c.name, count(c.name) as TOTAL FROM community c JOIN seproposal s ON s.targetCommunity = c.communityID WHERE step = 8 AND unit = ? AND datecreated >= ? AND datecreated <= ? GROUP BY c.name";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, unit);
            pstmt.setDate(2, startDate);
            pstmt.setDate(3, endDate);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                Community c = new Community();
                c.setName(rs2.getString("c.name"));
                c.setNumberOfPrograms(rs2.getInt("TOTAL"));
                communities.add(c);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return communities;
    }

    public double getBudgetRequestedByUnitDate(String unit, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs = null;

        double budget = 0;
        try {
            String query = "SELECT SUM(total.totalAmountRequested) as totalRequestedBudget FROM (SELECT totalAmountRequested FROM seproposal WHERE step = 8 AND unit = ? AND datecreated >= ? AND datecreated <= ? AND sourceOfFunds = 'OVPLM' UNION ALL SELECT totalAmount as totalAmountRequested from ffproposal WHERE step = 8 AND unit = ? AND datecreated >= ? AND datecreated <= ? AND sourceOfFunds = 'OVPLM') as total";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, unit);
            pstmt.setDate(2, startDate);
            pstmt.setDate(3, endDate);
            pstmt.setString(4, unit);
            pstmt.setDate(5, startDate);
            pstmt.setDate(6, endDate);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                budget = rs.getDouble("totalRequestedBudget");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return budget;
    }

    public double getUtilizedBudgetUnitByDate(String unit, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs = null;

        double budget = 0;
        try {
            String query = "SELECT SUM(a.expendedAmount) FROM (SELECT sf.expendedAmount FROM sereport_funds sf JOIN sereport se ON sf.sereportID = se.id JOIN seproposal s ON s.id = se.seproposalID WHERE s.step = 8 AND s.unit = ? AND s.datecreated >= ? AND s.datecreated <= ? AND s.sourceOfFunds = 'OVPLM' UNION ALL SELECT ff.expendedAmount FROM ffreport_funds ff JOIN ffreport fr ON ff.ffreportID = fr.id JOIN ffproposal f ON f.id = fr.ffproposalID WHERE f.step = 8 AND f.unit = ? AND f.datecreated >= ? AND f.datecreated <= ? AND f.sourceOfFunds = 'OVPLM') as a";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, unit);
            pstmt.setDate(2, startDate);
            pstmt.setDate(3, endDate);
            pstmt.setString(4, unit);
            pstmt.setDate(5, startDate);
            pstmt.setDate(6, endDate);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                budget = rs.getDouble("SUM(a.expendedAmount)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return budget;
    }

    public ArrayList<SE> retrieveSEProposalAmountRequestedByUnitDate(String unit, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<SE> SE = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM seproposal WHERE step = 8 AND unit = ? AND datecreated >= ? AND datecreated <= ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, unit);
            pstmt.setDate(2, startDate);
            pstmt.setDate(3, endDate);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SE s = new SE();
                s.setDate(rs2.getDate("datecreated"));
                s.setName(rs2.getString("programName"));
                s.setTotalAmount(rs2.getDouble("totalAmountRequested"));
                s.setUnit(rs2.getString("unit"));
                s.setDepartment(rs2.getString("department"));
                s.setId(rs2.getInt("id"));
                SE.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return SE;
    }

    public ArrayList<FF> retrieveFFProposalAmountRequestedByUnitDate(String unit, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM ffproposal WHERE step = 8 AND unit = ? AND datecreated >= ? AND datecreated <= ?";
            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, unit);
            pstmt.setDate(2, startDate);
            pstmt.setDate(3, endDate);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FF f = new FF();
                f.setDatecreated(rs2.getDate("datecreated"));
                f.setProjectName(rs2.getString("projectName"));
                f.setTotalAmount(rs2.getDouble("totalAmount"));
                f.setUnit(rs2.getString("unit"));
                f.setDepartment(rs2.getString("department"));
                f.setId(rs2.getInt("id"));
                FF.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FF;
    }

    public int countCommunitiesVisited(String unit, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs = null;

        int count = 0;
        try {
            String query = "SELECT count(DISTINCT c.name) as TOTAL FROM community c JOIN seproposal s ON s.targetCommunity = c.communityID WHERE step = 8 AND unit = ? AND datecreated >= ? AND datecreated <= ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, unit);
            pstmt.setDate(2, startDate);
            pstmt.setDate(3, endDate);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                count = rs.getInt("TOTAL");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return count;
    }

    public double getIndividualSEBudgetRequestedByUnitDate(String unit, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs = null;

        double budget = 0;
        try {
            String query = "SELECT SUM(totalAmountRequested) FROM seproposal WHERE step = 8 AND unit = ? AND sourceOfFunds = 'OVPLM' AND datecreated >= ? AND datecreated <= ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, unit);
            pstmt.setDate(2, startDate);
            pstmt.setDate(3, endDate);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                budget = rs.getDouble("SUM(totalAmountRequested)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return budget;
    }

    public double getIndividualFFBudgetRequestedByUnitDate(String unit, Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs = null;

        double budget = 0;
        try {
            String query = "SELECT SUM(totalAmount) FROM ffproposal WHERE step = 8 AND unit = ? AND sourceOfFunds = 'OVPLM' AND datecreated >= ? AND datecreated <= ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, unit);
            pstmt.setDate(2, startDate);
            pstmt.setDate(3, endDate);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                budget = rs.getDouble("SUM(totalAmount)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return budget;
    }

    public int countOVPLMPrograms(Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(a.sourceOfFunds) FROM (SELECT sourceOfFunds FROM seproposal WHERE step = 8 AND datecreated >= ? AND datecreated <= ? UNION ALL SELECT sourceOfFunds from ffproposal WHERE step = 8 AND datecreated >= ? AND datecreated <= ?) as a WHERE a.sourceOfFunds = 'OVPLM'";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setDate(1, startDate);
            ps.setDate(2, endDate);
            ps.setDate(3, startDate);
            ps.setDate(4, endDate);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(a.sourceOfFunds)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int countOtherPrograms(Date startDate, Date endDate) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(a.sourceOfFunds) FROM (SELECT sourceOfFunds FROM seproposal WHERE step = 8 AND datecreated >= ? AND datecreated <= ? UNION ALL SELECT sourceOfFunds from ffproposal WHERE step = 8 AND datecreated >= ? AND datecreated <= ?) as a WHERE a.sourceOfFunds = 'Others'";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setDate(1, startDate);
            ps.setDate(2, endDate);
            ps.setDate(3, startDate);
            ps.setDate(4, endDate);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(a.sourceOfFunds)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public void updateBudgetSE(ArrayList<SEexpenses> expenses) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs2 = null;
        try {

            String query = "DELETE FROM seproposal_expenses WHERE seproposalID = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, expenses.get(0).getSeproposalID());

            int rs = pstmt.executeUpdate();

            for (int i = 0; i < expenses.size(); i++) {
                query = "INSERT INTO seproposal_expenses(item, unitcost, quantity, subtotal, amountUsed, seproposalID) VALUES(?,?,?,?,?,?)";

                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, expenses.get(i).getItem());
                pstmt.setDouble(2, expenses.get(i).getUnitcost());
                pstmt.setInt(3, expenses.get(i).getQuantity());
                pstmt.setDouble(4, expenses.get(i).getSubtotal());
                pstmt.setDouble(5, expenses.get(i).getAmountUsed());
                pstmt.setInt(6, expenses.get(i).getSeproposalID());

                rs = pstmt.executeUpdate();
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public ArrayList<SEexpenses> retrieveExpenses(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM seproposal_expenses WHERE seproposalID = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<SEexpenses> expenses = new ArrayList();

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);

            rs = ps.executeQuery();

            while (rs.next()) {
                SEexpenses e = new SEexpenses();
                e.setItem(rs.getString("item"));
                e.setUnitcost(rs.getDouble("unitcost"));
                e.setQuantity(rs.getInt("quantity"));
                e.setSubtotal(rs.getDouble("subtotal"));
                e.setSeproposalID(rs.getInt("seproposalID"));
                e.setAmountUsed(rs.getDouble("amountUsed"));
                expenses.add(e);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return expenses;
    }

    public void updateBudgetFF(ArrayList<FFexpenses> expenses) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs2 = null;
        try {

            String query = "DELETE FROM ffproposal_expenses WHERE ffproposalID = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, expenses.get(0).getFfproposalID());

            int rs = pstmt.executeUpdate();

            for (int i = 0; i < expenses.size(); i++) {
                query = "INSERT INTO ffproposal_expenses(item, unitcost, quantity, subtotal, amountUsed, ffproposalID) VALUES(?,?,?,?,?,?)";

                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, expenses.get(i).getItem());
                pstmt.setDouble(2, expenses.get(i).getUnitcost());
                pstmt.setInt(3, expenses.get(i).getQuantity());
                pstmt.setDouble(4, expenses.get(i).getSubtotal());
                pstmt.setDouble(5, expenses.get(i).getAmountUsed());
                pstmt.setInt(6, expenses.get(i).getFfproposalID());

                rs = pstmt.executeUpdate();
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public ArrayList<FFexpenses> retrieveExpensesFF(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM ffproposal_expenses WHERE ffproposalID = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<FFexpenses> expenses = new ArrayList();

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, ffID);

            rs = ps.executeQuery();

            while (rs.next()) {
                FFexpenses f = new FFexpenses();
                f.setItem(rs.getString("item"));
                f.setUnitcost(rs.getDouble("unitcost"));
                f.setQuantity(rs.getInt("quantity"));
                f.setSubtotal(rs.getDouble("subtotal"));
                f.setFfproposalID(rs.getInt("ffproposalID"));
                f.setAmountUsed(rs.getDouble("amountUsed"));
                expenses.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return expenses;
    }

    public ArrayList<SE> retrieveSEProposalAmountRequestedByAll() {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<SE> SE = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM seproposal WHERE step = 8";
            pstmt = conn.prepareStatement(query);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                SE s = new SE();
                s.setDate(rs2.getDate("datecreated"));
                s.setName(rs2.getString("programName"));
                s.setTotalAmount(rs2.getDouble("totalAmountRequested"));
                s.setUnit(rs2.getString("unit"));
                s.setDepartment(rs2.getString("department"));
                s.setId(rs2.getInt("id"));
                SE.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return SE;
    }

    public double getUtilizedBudgetBySEID(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs = null;

        double budget = 0;
        try {
            String query = "SELECT SUM(sf.expendedAmount) FROM sereport_funds sf JOIN sereport se ON sf.sereportID = se.id JOIN seproposal s ON s.id = se.seproposalID WHERE s.step = 8 AND s.id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                budget = rs.getDouble("SUM(sf.expendedAmount)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return budget;
    }

    public ArrayList<FF> retrieveFFProposalAmountRequestedByAll() {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM ffproposal WHERE step = 9";
            pstmt = conn.prepareStatement(query);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FF f = new FF();
                f.setDatecreated(rs2.getDate("datecreated"));
                f.setProjectName(rs2.getString("projectName"));
                f.setTotalAmount(rs2.getDouble("totalAmount"));
                f.setUnit(rs2.getString("unit"));
                f.setDepartment(rs2.getString("department"));
                f.setId(rs2.getInt("id"));
                FF.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FF;
    }

    public double getUtilizedBudgetByFFID(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs = null;

        double budget = 0;
        try {
            String query = "SELECT SUM(ff.expendedAmount) FROM ffreport_funds ff JOIN ffreport fe ON ff.ffreportID = fe.id JOIN ffproposal f ON f.id = fe.ffproposalID WHERE f.step = 9 AND f.id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                budget = rs.getDouble("SUM(ff.expendedAmount)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return budget;
    }

    public String getPosition(String username) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT position FROM informationsheet WHERE username = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        String position = "";

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();

            while (rs.next()) {
                position = rs.getString("position");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return position;
    }

    public void AddMeasures(ArrayList<Integer> measureID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM seproposal ORDER by id DESC LIMIT 1";

            int seproposalID = 0;

            pstmt = conn.prepareStatement(query);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                seproposalID = rs2.getInt("id");
            }

            for (int i = 0; i < measureID.size(); i++) {
                query = "INSERT INTO se_measures (seproposalID,measureID) VALUES (?,?)";
                pstmt = conn.prepareStatement(query);

                pstmt.setInt(1, seproposalID);
                pstmt.setInt(2, measureID.get(i));

                int rs = pstmt.executeUpdate();

            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public void editMeasures(ArrayList<Integer> measureID, int seproposalID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs2 = null;
        try {
            String query = "DELETE FROM se_measures WHERE seproposalID = ?";

            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seproposalID);

            int rs = pstmt.executeUpdate();

            for (int i = 0; i < measureID.size(); i++) {
                query = "INSERT INTO se_measures (seproposalID,measureID) VALUES (?,?)";
                pstmt = conn.prepareStatement(query);

                pstmt.setInt(1, seproposalID);
                pstmt.setInt(2, measureID.get(i));

                rs = pstmt.executeUpdate();

            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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

    public ArrayList<Integer> GetMeasures(int id) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<Integer> ids = new ArrayList();

        ResultSet rs2 = null;
        try {
            String query = "SELECT measureID FROM se_measures WHERE seproposalID = ?";

            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, id);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                ids.add(rs2.getInt("measureID"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }

        return ids;
    }

    public ArrayList<Integer> GetRevisionsMeasures(int id) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<Integer> ids = new ArrayList();

        ResultSet rs2 = null;
        try {
            String query = "SELECT measureID FROM seproposal_revisions_measures WHERE revisionID = ?";

            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, id);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                ids.add(rs2.getInt("measureID"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }

        return ids;
    }

    public Measure GetMeasureObject(int id) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        Measure m = new Measure();

        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM measure WHERE measureID = ?";

            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, id);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                m.setMeasure(rs2.getString("measure"));
                m.setDescription(rs2.getString("description"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }

        return m;
    }

    public String getFirstName(int id) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        String name = null;
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        Measure m = new Measure();

        ResultSet rs2 = null;
        try {
            String query = "SELECT firstName FROM informationsheet WHERE id = ?";

            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, id);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                name = (rs2.getString("firstName"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }

        return name;
    }

    public String getLastName(int id) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        String name = null;
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        Measure m = new Measure();

        ResultSet rs2 = null;
        try {
            String query = "SELECT lastName FROM informationsheet WHERE id = ?";

            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, id);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                name = (rs2.getString("lastName"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }

        return name;
    }

    public boolean hasRevisionsAuditSE(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;

        try {
            String query = "SELECT * FROM seproposal_revisions WHERE seproposalID = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, seID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return false;
    }

    public boolean hasRevisionsAuditFF(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs2 = null;

        try {
            String query = "SELECT * FROM ffproposal_revisions WHERE ffproposalID = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ffID);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return false;
    }

    public ArrayList<SE> retrieveSERevisions(int seID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM seproposal_revisions WHERE seproposalID = ? ORDER BY datetime DESC";
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<SE> se = new ArrayList();

        se.add(this.retrieveSEBySEID(seID));

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, seID);

            rs = ps.executeQuery();

            while (rs.next()) {
                SE s = new SE();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("programName"));
                s.setRevisionTime(rs.getString("datetime"));
                s.setDeanRemarks(rs.getString("deanRemarks"));
                s.setJayRemarks(rs.getString("ovplm1Remarks"));
                s.setCarmelRemarks(rs.getString("ovplm2Remarks"));
                s.setCoscaRemarks(rs.getString("coscaRemarks"));
                se.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return se;
    }

    public ArrayList<FF> retrieveFFRevisions(int ffID) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT * FROM ffproposal_revisions WHERE ffproposalID = ? ORDER BY datetime DESC";
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<FF> ff = new ArrayList();

        ff.add(this.retrieveFFByFFID(ffID));

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, ffID);

            rs = ps.executeQuery();

            while (rs.next()) {
                FF f = new FF();
                f.setId(rs.getInt("id"));
                f.setProjectName(rs.getString("projectName"));
                f.setRevisionTime(rs.getString("datetime"));
                ff.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return ff;
    }

    public int countDepartments() {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(distinct(department)) - 1 FROM department";
        PreparedStatement ps = null;
        ResultSet rs = null;

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(distinct(department)) - 1");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public double secondTarget() {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(distinct(department)) as count FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID WHERE f.step = 8 AND f.studentorg != 1";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        double count = 0;

        double percent = 0;
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count");
            }

            percent = (count / this.countDepartments()) * 100;

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return percent;
    }

    public int countStudentOrgs() {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(distinct(name)) FROM studentorgs";
        PreparedStatement ps = null;
        ResultSet rs = null;

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(distinct(name))");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public double firstTarget() {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(distinct(department)) as count FROM ffproposal f JOIN studentorgs so ON f.department = so.name JOIN ffreport ff ON ff.ffproposalID = f.id WHERE f.step = 8";
        PreparedStatement ps = null;
        ResultSet rs = null;

        double count = 0;

        double percent = 0;
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count");
            }

            percent = (count / this.countStudentOrgs()) * 100;

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return percent;
    }

    public int countUnits() {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(distinct(unitName)) FROM unit";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(distinct(unitName))");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public double NinthTarget() {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        PreparedStatement ps = null;
        ResultSet rs = null;

        ArrayList<Unit> units = this.retrieveUnits();

        int overallCount = 0;

        double total = 0;
        try {
            for (int i = 0; i < units.size(); i++) {

                String query = "SELECT count(unit) FROM seproposal s JOIN seproposal_component sc ON s.id = sc.seproposalID JOIN sereport se ON s.id = se.seproposalID WHERE s.step = 8 AND s.unit = ? AND studentorg != 1";

                ps = conn.prepareStatement(query);
                ps.setString(1, units.get(i).getName());
                rs = ps.executeQuery();

                int count = 0;

                while (rs.next()) {
                    count = rs.getInt("count(unit)");
                }

                double percent = 0;

                if (count != 0) {
                    percent = ((double) count / (double) this.countTotalProposalByUnit(units.get(i).getName()) * 100);
                }

                if (percent >= 20) {
                    overallCount += 1;
                }
            }

            total = (double) overallCount / (double) units.size() * 100;

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return total;
    }

    public int countTotalProposalByUnit(String unit) {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(unit) FROM seproposal s JOIN sereport se ON s.id = se.seproposalID WHERE s.step = 8 AND s.unit = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;

        int count = 0;
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, unit);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(unit)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public double tenthTarget() {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(distinct(unit)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID WHERE s.step = 8 AND s.studentorg = 1";
        PreparedStatement ps = null;
        ResultSet rs = null;

        double count = 0;

        double percent = 0;
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count");
            }

            percent = (count / this.countStudentOrgs()) * 100;

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return percent;
    }

    public double twelfthTarget() {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        String query = "SELECT count(distinct(department)) as count FROM seproposal s JOIN sereport se ON s.id = se.seproposalID WHERE s.step = 8 AND s.studentorg != 1";
        PreparedStatement ps = null;
        ResultSet rs = null;

        User u = new User();

        double count = 0;

        double percent = 0;
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count");
            }

            percent = (count / this.countDepartments()) * 100;

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return percent;
    }

    public double thirteenthTarget() {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        PreparedStatement ps = null;
        ResultSet rs = null;

        double total = 0;
        try {

            String query = "SELECT count(unit) FROM seproposal s JOIN sereport se ON s.id = se.seproposalID WHERE s.step = 8 AND s.classificationforkra != 'None'";

            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            int count = 0;

            while (rs.next()) {
                count = rs.getInt("count(unit)");
            }

            double percent = 0;

            total = (double) count / (double) 16 * 100;

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return total;
    }

    public int sixteenthTarget() {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        PreparedStatement ps = null;
        ResultSet rs = null;

        int count = 0;

        try {

            String query = "SELECT count(c.international) FROM seproposal s JOIN sereport se ON s.id = se.seproposalID JOIN community c ON s.targetCommunity = c.communityID WHERE s.step = 8 AND s.activityClassification = 'Service-Learning' AND c.international = 1";

            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(c.international)");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public int sixthTarget() {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        int count = 0;
        try {
            String query = "SELECT count(unit) FROM seproposal s JOIN sereport se ON s.id = se.seproposalID WHERE s.step = 8 AND s.activityClassification = 'Interdisciplinary Fora'";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt("count(unit)");
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return count;
    }

    public boolean fifthTarget() {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();

        PreparedStatement ps = null;
        ResultSet rs = null;

        ArrayList<FF> FF = this.retrieveALLFFProposal();

        int count;

        boolean positive = false;

        try {

            for (int i = 0; i < FF.size(); i++) {
                count = 0;
                
                String query = "SELECT f.id FROM ffproposal f JOIN ffreport ff ON f.id = ff.ffproposalID JOIN ffreport_attendees a ON ff.id = a.ffreportID WHERE f.id = ? f.step = 8 AND a.type IN ('Alumni', 'Parent')";

                ps = conn.prepareStatement(query);
                ps.setInt(1, FF.get(i).getId());
                rs = ps.executeQuery();

                while (rs.next()) {
                    count += 1;
                }

                if (count >= 2) {
                    positive = true;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return positive;
    }

    public ArrayList<FF> retrieveALLFFProposal() {
        DBConnectionFactory myFactory = DBConnectionFactory.getInstance();
        Connection conn = myFactory.getConnection();
        PreparedStatement pstmt = null;

        ArrayList<FF> FF = new ArrayList();
        ResultSet rs2 = null;
        try {
            String query = "SELECT * FROM ffproposal WHERE step = 8";
            pstmt = conn.prepareStatement(query);

            rs2 = pstmt.executeQuery();

            while (rs2.next()) {
                FF f = new FF();
                f.setDatecreated(rs2.getDate("datecreated"));
                f.setProjectName(rs2.getString("projectName"));
                f.setProgramHead(rs2.getString("programHead"));
                f.setActivityClassification(rs2.getString("activityClassification"));
                f.setSourceOfFunds(rs2.getString("sourceOfFunds"));
                f.setId(rs2.getInt("id"));
                FF.add(f);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                /* ignored */ }
            try {
                conn.close();
            } catch (Exception e) {
                /* ignored */ }
        }
        return FF;
    }
}

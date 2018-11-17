/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.InputStream;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author LA
 */
public class FFreport {

    protected int id;
    protected Date date;
    protected Date implementationdate;
    protected String venue;
    protected String projectTitle;
    protected String projectProponent;
    protected String nameOfFacilitator;
    protected double amountReceivedOVPLM;
    protected String significanceProject;
    protected String highlightsProject;
    protected String majorProblems;
    protected String otherRecommendations;
    protected InputStream annexes;
    protected InputStream attendanceDLSU;
    protected ArrayList<FFparticipants> participants = new ArrayList();
    protected ArrayList<FFobjectives> objectives = new ArrayList();
    protected ArrayList<FFfunds> funds = new ArrayList();
    protected int ffproposalID;
    protected String unit;
    protected String programHead;
    protected int cap;
    protected int apsp;
    protected int asf;
    protected int faculty;
    protected int admin;
    protected int directhired;
    protected int independent;
    protected int graduate;
    protected int undergraduate;
    protected int alumni;
    protected int parents;
    protected int external;
    protected String gsheets;
    protected ArrayList<FFreportattendees> attendees = new ArrayList();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getProjectTitle() {
        return projectTitle;
    }

    public void setProjectTitle(String projectTitle) {
        this.projectTitle = projectTitle;
    }

    public String getProjectProponent() {
        return projectProponent;
    }

    public void setProjectProponent(String projectProponent) {
        this.projectProponent = projectProponent;
    }


    public String getNameOfFacilitator() {
        return nameOfFacilitator;
    }

    public void setNameOfFacilitator(String nameOfFacilitator) {
        this.nameOfFacilitator = nameOfFacilitator;
    }

    public double getAmountReceivedOVPLM() {
        return amountReceivedOVPLM;
    }

    public void setAmountReceivedOVPLM(double amountReceivedOVPLM) {
        this.amountReceivedOVPLM = amountReceivedOVPLM;
    }

    public String getSignificanceProject() {
        return significanceProject;
    }

    public void setSignificanceProject(String significanceProject) {
        this.significanceProject = significanceProject;
    }

    public String getHighlightsProject() {
        return highlightsProject;
    }

    public void setHighlightsProject(String highlightsProject) {
        this.highlightsProject = highlightsProject;
    }

    public String getMajorProblems() {
        return majorProblems;
    }

    public void setMajorProblems(String majorProblems) {
        this.majorProblems = majorProblems;
    }

    public String getOtherRecommendations() {
        return otherRecommendations;
    }

    public void setOtherRecommendations(String otherRecommendations) {
        this.otherRecommendations = otherRecommendations;
    }

    public InputStream getAnnexes() {
        return annexes;
    }

    public void setAnnexes(InputStream annexes) {
        this.annexes = annexes;
    }

    public InputStream getAttendanceDLSU() {
        return attendanceDLSU;
    }

    public void setAttendanceDLSU(InputStream attendanceDLSU) {
        this.attendanceDLSU = attendanceDLSU;
    }

    public ArrayList<FFparticipants> getParticipants() {
        return participants;
    }

    public void setParticipants(ArrayList<FFparticipants> participants) {
        this.participants = participants;
    }

    public ArrayList<FFobjectives> getObjectives() {
        return objectives;
    }

    public void setObjectives(ArrayList<FFobjectives> objectives) {
        this.objectives = objectives;
    }

    public ArrayList<FFfunds> getFunds() {
        return funds;
    }

    public void setFunds(ArrayList<FFfunds> funds) {
        this.funds = funds;
    }

    public int getFfproposalID() {
        return ffproposalID;
    }

    public void setFfproposalID(int ffproposalID) {
        this.ffproposalID = ffproposalID;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getProgramHead() {
        return programHead;
    }

    public void setProgramHead(String programHead) {
        this.programHead = programHead;
    }

    public int getCap() {
        return cap;
    }

    public void setCap(int cap) {
        this.cap = cap;
    }

    public int getApsp() {
        return apsp;
    }

    public void setApsp(int apsp) {
        this.apsp = apsp;
    }

    public int getAsf() {
        return asf;
    }

    public void setAsf(int asf) {
        this.asf = asf;
    }

    public int getFaculty() {
        return faculty;
    }

    public void setFaculty(int faculty) {
        this.faculty = faculty;
    }

    public int getAdmin() {
        return admin;
    }

    public void setAdmin(int admin) {
        this.admin = admin;
    }

    public int getDirecthired() {
        return directhired;
    }

    public void setDirecthired(int directhired) {
        this.directhired = directhired;
    }

    public int getIndependent() {
        return independent;
    }

    public void setIndependent(int independent) {
        this.independent = independent;
    }

    public int getExternal() {
        return external;
    }

    public void setExternal(int external) {
        this.external = external;
    }

    public Date getImplementationdate() {
        return implementationdate;
    }

    public void setImplementationdate(Date implementationdate) {
        this.implementationdate = implementationdate;
    }

    public String getVenue() {
        return venue;
    }

    public void setVenue(String venue) {
        this.venue = venue;
    }

    public String getGsheets() {
        return gsheets;
    }

    public void setGsheets(String gsheets) {
        this.gsheets = gsheets;
    }

    public int getGraduate() {
        return graduate;
    }

    public void setGraduate(int graduate) {
        this.graduate = graduate;
    }

    public int getUndergraduate() {
        return undergraduate;
    }

    public void setUndergraduate(int undergraduate) {
        this.undergraduate = undergraduate;
    }

    public int getAlumni() {
        return alumni;
    }

    public void setAlumni(int alumni) {
        this.alumni = alumni;
    }

    public int getParents() {
        return parents;
    }

    public void setParents(int parents) {
        this.parents = parents;
    }

    public ArrayList<FFreportattendees> getAttendees() {
        return attendees;
    }

    public void setAttendees(ArrayList<FFreportattendees> attendees) {
        this.attendees = attendees;
    }
    
    
}

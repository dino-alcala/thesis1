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
public class SEreport {
    protected int id;
    protected Date date;
    protected Date implementationdate;
    protected String projectTitle;
    protected String targetKRA;
    protected String targetGoal;
    protected String projectProponent;
    protected String personResponsible;
    protected int numberOfBeneficiaries;
    protected String projectBeneficiaries;
    protected String addressBeneficiaries;
    protected String addressOfProject;
    protected double amountReceivedOVPLM;
    protected String significanceProject;
    protected String happenedImplementationProject;
    protected String whenwhereProject;
    protected String participantsProject;
    protected String highlightsProject;
    protected String majorProblems;
    protected String otherRecommendations;
    protected InputStream annexes;
    protected InputStream attendanceBeneficiaries;
    protected InputStream attendanceDLSU;
    protected InputStream beneficiariesLetters;
    protected ArrayList<SEparticipants> participants = new ArrayList();
    protected ArrayList<SEobjectives> objectives = new ArrayList();
    protected ArrayList<SEfunds> funds = new ArrayList();
    protected ArrayList<SEattendees> attendees = new ArrayList();
    protected int seproposalID;
    protected String unit;
    protected String programhead;
    protected int cap;
    protected int apsp;
    protected int asf;
    protected int faculty;
    protected int admin;
    protected int directhired;
    protected int independent;
    protected int external;
    protected ArrayList<Measure> targetmeasures;

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

    public String getTargetKRA() {
        return targetKRA;
    }

    public void setTargetKRA(String targetKRA) {
        this.targetKRA = targetKRA;
    }

    public String getTargetGoal() {
        return targetGoal;
    }

    public void setTargetGoal(String targetGoal) {
        this.targetGoal = targetGoal;
    }

    public ArrayList<Measure> getTargetmeasures() {
        return targetmeasures;
    }

    public void setTargetmeasures(ArrayList<Measure> targetmeasures) {
        this.targetmeasures = targetmeasures;
    }

   

    public String getProjectProponent() {
        return projectProponent;
    }

    public void setProjectProponent(String projectProponent) {
        this.projectProponent = projectProponent;
    }

    public String getPersonResponsible() {
        return personResponsible;
    }

    public void setPersonResponsible(String personResponsible) {
        this.personResponsible = personResponsible;
    }

    public int getNumberOfBeneficiaries() {
        return numberOfBeneficiaries;
    }

    public void setNumberOfBeneficiaries(int numberOfBeneficiaries) {
        this.numberOfBeneficiaries = numberOfBeneficiaries;
    }

    public String getProjectBeneficiaries() {
        return projectBeneficiaries;
    }

    public void setProjectBeneficiaries(String projectBeneficiaries) {
        this.projectBeneficiaries = projectBeneficiaries;
    }

    public String getAddressBeneficiaries() {
        return addressBeneficiaries;
    }

    public void setAddressBeneficiaries(String addressBeneficiaries) {
        this.addressBeneficiaries = addressBeneficiaries;
    }

    public String getAddressOfProject() {
        return addressOfProject;
    }

    public void setAddressOfProject(String addressOfProject) {
        this.addressOfProject = addressOfProject;
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

    public String getHappenedImplementationProject() {
        return happenedImplementationProject;
    }

    public void setHappenedImplementationProject(String happenedImplementationProject) {
        this.happenedImplementationProject = happenedImplementationProject;
    }

    public String getWhenwhereProject() {
        return whenwhereProject;
    }

    public void setWhenwhereProject(String whenwhereProject) {
        this.whenwhereProject = whenwhereProject;
    }

    public String getParticipantsProject() {
        return participantsProject;
    }

    public void setParticipantsProject(String participantsProject) {
        this.participantsProject = participantsProject;
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

    public InputStream getAttendanceBeneficiaries() {
        return attendanceBeneficiaries;
    }

    public void setAttendanceBeneficiaries(InputStream attendanceBeneficiaries) {
        this.attendanceBeneficiaries = attendanceBeneficiaries;
    }

    public InputStream getAttendanceDLSU() {
        return attendanceDLSU;
    }

    public void setAttendanceDLSU(InputStream attendanceDLSU) {
        this.attendanceDLSU = attendanceDLSU;
    }

    public InputStream getBeneficiariesLetters() {
        return beneficiariesLetters;
    }

    public void setBeneficiariesLetters(InputStream beneficiariesLetters) {
        this.beneficiariesLetters = beneficiariesLetters;
    }

    public int getSeproposalID() {
        return seproposalID;
    }

    public void setSeproposalID(int seproposalID) {
        this.seproposalID = seproposalID;
    }

    public ArrayList<SEparticipants> getParticipants() {
        return participants;
    }

    public void setParticipants(ArrayList<SEparticipants> participants) {
        this.participants = participants;
    }

    public ArrayList<SEobjectives> getObjectives() {
        return objectives;
    }

    public void setObjectives(ArrayList<SEobjectives> objectives) {
        this.objectives = objectives;
    }

    public ArrayList<SEfunds> getFunds() {
        return funds;
    }

    public void setFunds(ArrayList<SEfunds> funds) {
        this.funds = funds;
    }

    public ArrayList<SEattendees> getAttendees() {
        return attendees;
    }

    public void setAttendees(ArrayList<SEattendees> attendees) {
        this.attendees = attendees;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getProgramhead() {
        return programhead;
    }

    public void setProgramhead(String programhead) {
        this.programhead = programhead;
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
    
    
}

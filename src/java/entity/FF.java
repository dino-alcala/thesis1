/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author LA
 */
public class FF {

    protected int id;
    protected String unit;
    protected String department;
    protected Date datecreated;
    protected String programHead;
    protected String activityClassification;
    protected int targetCommunity;
    protected int targetKRA;
    protected int targetGoal;
    protected int targetMeasure;
    protected String projectName;
    protected String venue;
    protected String speaker;
    protected String objectives;
    protected Date actualDate;
    protected Double totalAmount;
    protected String sourceOfFunds;
    protected ArrayList<FFexpenses> expenses = new ArrayList();
    protected ArrayList<FFattendees> attendees = new ArrayList();
    protected int step;
    protected int userID;
    protected String chairdirectorRemarks;
    protected String vplmRemarks;
    protected String deanunitRemarks;
    protected String assistantdeanRemarks;
    protected String unitheadremarks;
    protected String directorremarks;
    protected String jayRemarks;
    protected String carmelRemarks;
    protected String lspoRemarks;
    protected String lmc1Remarks;
    protected String lmc2Remarks;
    protected String lmc3Remarks;
    protected String lmc4Remarks;
    protected String lmc5Remarks;
    protected String unittype;
    protected String revisionTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public Date getDatecreated() {
        return datecreated;
    }

    public void setDatecreated(Date datecreated) {
        this.datecreated = datecreated;
    }

    public String getProgramHead() {
        return programHead;
    }

    public void setProgramHead(String programHead) {
        this.programHead = programHead;
    }

    public String getActivityClassification() {
        return activityClassification;
    }

    public void setActivityClassification(String activityClassification) {
        this.activityClassification = activityClassification;
    }

    public int getTargetCommunity() {
        return targetCommunity;
    }

    public void setTargetCommunity(int targetCommunity) {
        this.targetCommunity = targetCommunity;
    }

    public int getTargetKRA() {
        return targetKRA;
    }

    public void setTargetKRA(int targetKRA) {
        this.targetKRA = targetKRA;
    }

    public int getTargetGoal() {
        return targetGoal;
    }

    public void setTargetGoal(int targetGoal) {
        this.targetGoal = targetGoal;
    }

    public int getTargetMeasure() {
        return targetMeasure;
    }

    public void setTargetMeasure(int targetMeasure) {
        this.targetMeasure = targetMeasure;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getVenue() {
        return venue;
    }

    public void setVenue(String venue) {
        this.venue = venue;
    }

    public String getSpeaker() {
        return speaker;
    }

    public void setSpeaker(String speaker) {
        this.speaker = speaker;
    }

    public String getObjectives() {
        return objectives;
    }

    public void setObjectives(String objectives) {
        this.objectives = objectives;
    }

    public Date getActualDate() {
        return actualDate;
    }

    public void setActualDate(Date actualDate) {
        this.actualDate = actualDate;
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getSourceOfFunds() {
        return sourceOfFunds;
    }

    public void setSourceOfFunds(String sourceOfFunds) {
        this.sourceOfFunds = sourceOfFunds;
    }

    public ArrayList<FFexpenses> getExpenses() {
        return expenses;
    }

    public void setExpenses(ArrayList<FFexpenses> expenses) {
        this.expenses = expenses;
    }

    public ArrayList<FFattendees> getAttendees() {
        return attendees;
    }

    public void setAttendees(ArrayList<FFattendees> attendees) {
        this.attendees = attendees;
    }

    public int getStep() {
        return step;
    }

    public void setStep(int step) {
        this.step = step;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getChairdirectorRemarks() {
        return chairdirectorRemarks;
    }

    public void setChairdirectorRemarks(String chairdirectorRemarks) {
        this.chairdirectorRemarks = chairdirectorRemarks;
    }

    public String getVplmRemarks() {
        return vplmRemarks;
    }

    public void setVplmRemarks(String vplmRemarks) {
        this.vplmRemarks = vplmRemarks;
    }

    public String getDeanunitRemarks() {
        return deanunitRemarks;
    }

    public void setDeanunitRemarks(String deanunitRemarks) {
        this.deanunitRemarks = deanunitRemarks;
    }

    public String getAssistantdeanRemarks() {
        return assistantdeanRemarks;
    }

    public void setAssistantdeanRemarks(String assistantdeanRemarks) {
        this.assistantdeanRemarks = assistantdeanRemarks;
    }

    public String getJayRemarks() {
        return jayRemarks;
    }

    public void setJayRemarks(String jayRemarks) {
        this.jayRemarks = jayRemarks;
    }

    public String getCarmelRemarks() {
        return carmelRemarks;
    }

    public void setCarmelRemarks(String carmelRemarks) {
        this.carmelRemarks = carmelRemarks;
    }

    public String getLspoRemarks() {
        return lspoRemarks;
    }

    public void setLspoRemarks(String lspoRemarks) {
        this.lspoRemarks = lspoRemarks;
    }

    public String getLmc1Remarks() {
        return lmc1Remarks;
    }

    public void setLmc1Remarks(String lmc1Remarks) {
        this.lmc1Remarks = lmc1Remarks;
    }

    public String getLmc2Remarks() {
        return lmc2Remarks;
    }

    public void setLmc2Remarks(String lmc2Remarks) {
        this.lmc2Remarks = lmc2Remarks;
    }

    public String getLmc3Remarks() {
        return lmc3Remarks;
    }

    public void setLmc3Remarks(String lmc3Remarks) {
        this.lmc3Remarks = lmc3Remarks;
    }

    public String getLmc4Remarks() {
        return lmc4Remarks;
    }

    public void setLmc4Remarks(String lmc4Remarks) {
        this.lmc4Remarks = lmc4Remarks;
    }

    public String getLmc5Remarks() {
        return lmc5Remarks;
    }

    public void setLmc5Remarks(String lmc5Remarks) {
        this.lmc5Remarks = lmc5Remarks;
    }

    public String getUnitheadremarks() {
        return unitheadremarks;
    }

    public void setUnitheadremarks(String unitheadremarks) {
        this.unitheadremarks = unitheadremarks;
    }

    public String getDirectorremarks() {
        return directorremarks;
    }

    public void setDirectorremarks(String directorremarks) {
        this.directorremarks = directorremarks;
    }

    public String getUnittype() {
        return unittype;
    }

    public void setUnittype(String unittype) {
        this.unittype = unittype;
    }

    public String getRevisionTime() {
        return revisionTime;
    }

    public void setRevisionTime(String revisionTime) {
        this.revisionTime = revisionTime;
    }
    
}

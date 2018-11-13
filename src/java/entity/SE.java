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
public class SE {

    protected int id;
    protected String name;
    protected String unit;
    protected String department;
    protected Date date;
    protected String implementationaddress;
    protected String programHead;
    protected String activityClassification;
    protected int targetCommunity;
    protected int targetKRA;
    protected int targetGoal;
    protected int targetMeasure;
    protected String titleActivity;
    protected Date actualDate;
    protected double totalAmount;
    protected String socialCommunityProblem;
    protected String nameSEbeneficiaries;
    protected String addressSEbeneficiaries;
    protected String contactPersonSEbeneficiaries;
    protected String mobileSEbeneficiaries;
    protected String emailSEbeneficiaries;
    protected String descriptionSEbeneficiaries;
    protected String objectives;
    protected ArrayList<String> component = new ArrayList();
    protected String explanation;
    protected ArrayList<SEworkplan> workplan = new ArrayList();
    protected ArrayList<SEexpenses> expenses = new ArrayList();
    protected ArrayList<SEresponsible> responsible = new ArrayList();
    protected int totalpopulationAcademicStaff;
    protected int expectedAcademicStaff;
    protected int totalpopulationSupportStaff;
    protected int expectedSupportStaff;
    protected int totalpopulationUndergraduate;
    protected int expectedUndergraduate;
    protected int totalPopulationGraduate;
    protected int expectedGraduate;
    protected int step;
    protected int userID;
    protected String deptunitRemarks;
    protected String externaldirectorRemarks;
    protected String deanRemarks;
    protected String unitChairRemarks;
    protected String seDirectorRemarks;
    protected String vpVcRemarks;
    protected String jayRemarks;
    protected String carmelRemarks;
    protected String coscaRemarks;
    protected String lmc1Remarks;
    protected String lmc2Remarks;
    protected String lmc3Remarks;
    protected String lmc4Remarks;
    protected String lmc5Remarks;
    protected String lmc6Remarks;
    protected String lmc7Remarks;
    protected String lmc8Remarks;
    protected String sourceOfFunds;
    protected String classificationforKRA;
    protected String unittype;
    protected String revisionTime;
    protected String deptunitdatetime;
    protected String externaldirectordatetime;
    protected String deandatetime;
    protected String coscadatetime;
    protected String unitchairdatetime;
    protected String sedirectordatetime;
    protected String vpvcdatetime;
    protected int isRevise;
    protected int approve1;
    protected int approve2;
    protected int approve3;
    protected int approve4;
    protected int revise1;
    protected int revise2;
    protected int revise3;
    protected int revise4;
    protected int reject1;
    protected int reject2;
    protected int reject3;
    protected int reject4;
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
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

    public String getTitleActivity() {
        return titleActivity;
    }

    public void setTitleActivity(String titleActivity) {
        this.titleActivity = titleActivity;
    }

    public Date getActualDate() {
        return actualDate;
    }

    public void setActualDate(Date actualDate) {
        this.actualDate = actualDate;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public String getClassificationforKRA() {
        return classificationforKRA;
    }

    public void setClassificationforKRA(String classificationforKRA) {
        this.classificationforKRA = classificationforKRA;
    }

    
    
    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getSocialCommunityProblem() {
        return socialCommunityProblem;
    }

    public void setSocialCommunityProblem(String socialCommunityProblem) {
        this.socialCommunityProblem = socialCommunityProblem;
    }

    public String getNameSEbeneficiaries() {
        return nameSEbeneficiaries;
    }

    public void setNameSEbeneficiaries(String nameSEbeneficiaries) {
        this.nameSEbeneficiaries = nameSEbeneficiaries;
    }

    public String getAddressSEbeneficiaries() {
        return addressSEbeneficiaries;
    }

    public void setAddressSEbeneficiaries(String addressSEbeneficiaries) {
        this.addressSEbeneficiaries = addressSEbeneficiaries;
    }

    public String getContactPersonSEbeneficiaries() {
        return contactPersonSEbeneficiaries;
    }

    public void setContactPersonSEbeneficiaries(String contactPersonSEbeneficiaries) {
        this.contactPersonSEbeneficiaries = contactPersonSEbeneficiaries;
    }

    public String getMobileSEbeneficiaries() {
        return mobileSEbeneficiaries;
    }

    public void setMobileSEbeneficiaries(String mobileSEbeneficiaries) {
        this.mobileSEbeneficiaries = mobileSEbeneficiaries;
    }

    public String getEmailSEbeneficiaries() {
        return emailSEbeneficiaries;
    }

    public void setEmailSEbeneficiaries(String emailSEbeneficiaries) {
        this.emailSEbeneficiaries = emailSEbeneficiaries;
    }

    public String getDescriptionSEbeneficiaries() {
        return descriptionSEbeneficiaries;
    }

    public void setDescriptionSEbeneficiaries(String descriptionSEbeneficiaries) {
        this.descriptionSEbeneficiaries = descriptionSEbeneficiaries;
    }

    public String getObjectives() {
        return objectives;
    }

    public void setObjectives(String objectives) {
        this.objectives = objectives;
    }

    public ArrayList<String> getComponent() {
        return component;
    }

    public void setComponent(ArrayList<String> component) {
        this.component = component;
    }

    public String getExplanation() {
        return explanation;
    }

    public void setExplanation(String explanation) {
        this.explanation = explanation;
    }

    public ArrayList<SEworkplan> getWorkplan() {
        return workplan;
    }

    public void setWorkplan(ArrayList<SEworkplan> workplan) {
        this.workplan = workplan;
    }

    public ArrayList<SEexpenses> getExpenses() {
        return expenses;
    }

    public void setExpenses(ArrayList<SEexpenses> expenses) {
        this.expenses = expenses;
    }

    public ArrayList<SEresponsible> getResponsible() {
        return responsible;
    }

    public void setResponsible(ArrayList<SEresponsible> responsible) {
        this.responsible = responsible;
    }

    public int getTotalpopulationAcademicStaff() {
        return totalpopulationAcademicStaff;
    }

    public void setTotalpopulationAcademicStaff(int totalpopulationAcademicStaff) {
        this.totalpopulationAcademicStaff = totalpopulationAcademicStaff;
    }

    public int getExpectedAcademicStaff() {
        return expectedAcademicStaff;
    }

    public void setExpectedAcademicStaff(int expectedAcademicStaff) {
        this.expectedAcademicStaff = expectedAcademicStaff;
    }

    public int getTotalpopulationSupportStaff() {
        return totalpopulationSupportStaff;
    }

    public void setTotalpopulationSupportStaff(int totalpopulationSupportStaff) {
        this.totalpopulationSupportStaff = totalpopulationSupportStaff;
    }

    public int getExpectedSupportStaff() {
        return expectedSupportStaff;
    }

    public void setExpectedSupportStaff(int expectedSupportStaff) {
        this.expectedSupportStaff = expectedSupportStaff;
    }

    public int getTotalpopulationUndergraduate() {
        return totalpopulationUndergraduate;
    }

    public void setTotalpopulationUndergraduate(int totalpopulationUndergraduate) {
        this.totalpopulationUndergraduate = totalpopulationUndergraduate;
    }

    public int getExpectedUndergraduate() {
        return expectedUndergraduate;
    }

    public void setExpectedUndergraduate(int expectedUndergraduate) {
        this.expectedUndergraduate = expectedUndergraduate;
    }

    public int getTotalPopulationGraduate() {
        return totalPopulationGraduate;
    }

    public void setTotalPopulationGraduate(int totalPopulationGraduate) {
        this.totalPopulationGraduate = totalPopulationGraduate;
    }

    public int getExpectedGraduate() {
        return expectedGraduate;
    }

    public void setExpectedGraduate(int expectedGraduate) {
        this.expectedGraduate = expectedGraduate;
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

    public String getDeptunitRemarks() {
        return deptunitRemarks;
    }

    public void setDeptunitRemarks(String deptunitRemarks) {
        this.deptunitRemarks = deptunitRemarks;
    }

    public String getExternaldirectorRemarks() {
        return externaldirectorRemarks;
    }

    public void setExternaldirectorRemarks(String externaldirectorRemarks) {
        this.externaldirectorRemarks = externaldirectorRemarks;
    }

    public String getDeanRemarks() {
        return deanRemarks;
    }

    public void setDeanRemarks(String deanRemarks) {
        this.deanRemarks = deanRemarks;
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

    public String getCoscaRemarks() {
        return coscaRemarks;
    }

    public void setCoscaRemarks(String coscaRemarks) {
        this.coscaRemarks = coscaRemarks;
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

    public String getLmc6Remarks() {
        return lmc6Remarks;
    }

    public void setLmc6Remarks(String lmc6Remarks) {
        this.lmc6Remarks = lmc6Remarks;
    }

    public String getLmc7Remarks() {
        return lmc7Remarks;
    }

    public void setLmc7Remarks(String lmc7Remarks) {
        this.lmc7Remarks = lmc7Remarks;
    }

    public String getLmc8Remarks() {
        return lmc8Remarks;
    }

    public void setLmc8Remarks(String lmc8Remarks) {
        this.lmc8Remarks = lmc8Remarks;
    }

    public String getSourceOfFunds() {
        return sourceOfFunds;
    }

    public void setSourceOfFunds(String sourceOfFunds) {
        this.sourceOfFunds = sourceOfFunds;
    }

    public String getUnittype() {
        return unittype;
    }

    public void setUnittype(String unittype) {
        this.unittype = unittype;
    }

    public String getUnitChairRemarks() {
        return unitChairRemarks;
    }

    public void setUnitChairRemarks(String unitChairRemarks) {
        this.unitChairRemarks = unitChairRemarks;
    }

    public String getSeDirectorRemarks() {
        return seDirectorRemarks;
    }

    public void setSeDirectorRemarks(String seDirectorRemarks) {
        this.seDirectorRemarks = seDirectorRemarks;
    }

    public String getVpVcRemarks() {
        return vpVcRemarks;
    }

    public void setVpVcRemarks(String vpVcRemarks) {
        this.vpVcRemarks = vpVcRemarks;
    }

    public String getRevisionTime() {
        return revisionTime;
    }

    public void setRevisionTime(String revisionTime) {
        this.revisionTime = revisionTime;
    }

    public String getImplementationaddress() {
        return implementationaddress;
    }

    public void setImplementationaddress(String implementationaddress) {
        this.implementationaddress = implementationaddress;
    }

    public String getDeptunitdatetime() {
        return deptunitdatetime;
    }

    public void setDeptunitdatetime(String deptunitdatetime) {
        this.deptunitdatetime = deptunitdatetime;
    }

    public String getExternaldirectordatetime() {
        return externaldirectordatetime;
    }

    public void setExternaldirectordatetime(String externaldirectordatetime) {
        this.externaldirectordatetime = externaldirectordatetime;
    }

    public String getDeandatetime() {
        return deandatetime;
    }

    public void setDeandatetime(String deandatetime) {
        this.deandatetime = deandatetime;
    }

    public String getCoscadatetime() {
        return coscadatetime;
    }

    public void setCoscadatetime(String coscadatetime) {
        this.coscadatetime = coscadatetime;
    }

    public String getUnitchairdatetime() {
        return unitchairdatetime;
    }

    public void setUnitchairdatetime(String unitchairdatetime) {
        this.unitchairdatetime = unitchairdatetime;
    }

    public String getSedirectordatetime() {
        return sedirectordatetime;
    }

    public void setSedirectordatetime(String sedirectordatetime) {
        this.sedirectordatetime = sedirectordatetime;
    }

    public String getVpvcdatetime() {
        return vpvcdatetime;
    }

    public void setVpvcdatetime(String vpvcdatetime) {
        this.vpvcdatetime = vpvcdatetime;
    }

    public int getIsRevise() {
        return isRevise;
    }

    public void setIsRevise(int isRevise) {
        this.isRevise = isRevise;
    }

    public int getApprove1() {
        return approve1;
    }

    public void setApprove1(int approve1) {
        this.approve1 = approve1;
    }

    public int getApprove2() {
        return approve2;
    }

    public void setApprove2(int approve2) {
        this.approve2 = approve2;
    }

    public int getApprove3() {
        return approve3;
    }

    public void setApprove3(int approve3) {
        this.approve3 = approve3;
    }

    public int getApprove4() {
        return approve4;
    }

    public void setApprove4(int approve4) {
        this.approve4 = approve4;
    }

    public int getRevise1() {
        return revise1;
    }

    public void setRevise1(int revise1) {
        this.revise1 = revise1;
    }

    public int getRevise2() {
        return revise2;
    }

    public void setRevise2(int revise2) {
        this.revise2 = revise2;
    }

    public int getRevise3() {
        return revise3;
    }

    public void setRevise3(int revise3) {
        this.revise3 = revise3;
    }

    public int getRevise4() {
        return revise4;
    }

    public void setRevise4(int revise4) {
        this.revise4 = revise4;
    }

    public int getReject1() {
        return reject1;
    }

    public void setReject1(int reject1) {
        this.reject1 = reject1;
    }

    public int getReject2() {
        return reject2;
    }

    public void setReject2(int reject2) {
        this.reject2 = reject2;
    }

    public int getReject3() {
        return reject3;
    }

    public void setReject3(int reject3) {
        this.reject3 = reject3;
    }

    public int getReject4() {
        return reject4;
    }

    public void setReject4(int reject4) {
        this.reject4 = reject4;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author LA
 */
public class SEparticipants {
    protected String classification;
    protected int numberOfIndividuals;
    protected int sereportID;

    public String getClassification() {
        return classification;
    }

    public void setClassification(String classification) {
        this.classification = classification;
    }

    public int getNumberOfIndividuals() {
        return numberOfIndividuals;
    }

    public void setNumberOfIndividuals(int numberOfIndividuals) {
        this.numberOfIndividuals = numberOfIndividuals;
    }

    public int getSereportID() {
        return sereportID;
    }

    public void setSereportID(int sereportID) {
        this.sereportID = sereportID;
    }
}

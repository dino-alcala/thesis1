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
public class SEobjectives {
    protected String expectedOutcomes;
    protected String actualAccomplishment;
    protected String hinderingFactors;
    protected int sereportID;

    public String getExpectedOutcomes() {
        return expectedOutcomes;
    }

    public void setExpectedOutcomes(String expectedOutcomes) {
        this.expectedOutcomes = expectedOutcomes;
    }

    public String getActualAccomplishment() {
        return actualAccomplishment;
    }

    public void setActualAccomplishment(String actualAccomplishment) {
        this.actualAccomplishment = actualAccomplishment;
    }

    public String getHinderingFactors() {
        return hinderingFactors;
    }

    public void setHinderingFactors(String hinderingFactors) {
        this.hinderingFactors = hinderingFactors;
    }

    public int getSereportID() {
        return sereportID;
    }

    public void setSereportID(int sereportID) {
        this.sereportID = sereportID;
    }
}

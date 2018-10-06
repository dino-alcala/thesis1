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
public class Measure {
    protected int measureID;
    protected String measure;
    protected String description;
    protected String target;
    protected int kraID;
    protected int goalID;
    protected int numOfPrograms;

    public int getMeasureID() {
        return measureID;
    }

    public void setMeasureID(int measureID) {
        this.measureID = measureID;
    }

    public String getMeasure() {
        return measure;
    }

    public void setMeasure(String measure) {
        this.measure = measure;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    
    
    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public int getKraID() {
        return kraID;
    }

    public void setKraID(int kraID) {
        this.kraID = kraID;
    }

    public int getGoalID() {
        return goalID;
    }

    public void setGoalID(int goalID) {
        this.goalID = goalID;
    }

    public int getNumOfPrograms() {
        return numOfPrograms;
    }

    public void setNumOfPrograms(int numOfPrograms) {
        this.numOfPrograms = numOfPrograms;
    }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.ArrayList;

/**
 *
 * @author LA
 */
public class Goal {
    protected int goalID;
    protected int goal;
    protected String name;
    protected int kraID;
    protected ArrayList<Measure> measures = new ArrayList();

    public int getGoalID() {
        return goalID;
    }

    public void setGoalID(int goalID) {
        this.goalID = goalID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getKraID() {
        return kraID;
    }

    public void setKraID(int kraID) {
        this.kraID = kraID;
    }

    public ArrayList<Measure> getMeasures() {
        return measures;
    }

    public void setMeasures(ArrayList<Measure> measures) {
        this.measures = measures;
    }
    
    public void addMeasure(Measure m){
        this.measures.add(m);
    }

    public int getGoal() {
        return goal;
    }

    public void setGoal(int goal) {
        this.goal = goal;
    }
    
}

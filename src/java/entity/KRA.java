/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Comparator;

/**
 *
 * @author LA
 */
public class KRA {
    protected int id;
    protected String name;
    protected Date date;
    protected int userID;
    protected ArrayList<Goal> goals = new ArrayList();
    protected int total;
    protected int percentage;
    protected int targetTotal;
    protected int measureID;
    protected int goalID;
    protected int totalCountperMeasure;
    protected String programName;
    protected int active;

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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public ArrayList<Goal> getGoals() {
        return goals;
    }

    public void setGoals(ArrayList<Goal> goals) {
        this.goals = goals;
    }
    
    public void addGoal(Goal g){
        this.goals.add(g);
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getPercentage() {
        return percentage;
    }

    public void setPercentage(int percentage) {
        this.percentage = percentage;
    }
    
    public static Comparator<KRA> compareDESCPercentage = new Comparator<KRA>(){
        @Override
        public int compare(KRA one, KRA two){
            Integer percentageone = one.getPercentage();
            Integer percentagetwo = two.getPercentage();
            return percentagetwo.compareTo(percentageone);
        }
    };
    
    public static Comparator<KRA> sortBottomPercentage = new Comparator<KRA>(){
        @Override
        public int compare(KRA one, KRA two){
            Integer percentageone = one.getPercentage();
            Integer percentagetwo = two.getPercentage();
            return percentageone.compareTo(percentagetwo);
        }
    };

    public int getTargetTotal() {
        return targetTotal;
    }

    public void setTargetTotal(int targetTotal) {
        this.targetTotal = targetTotal;
    }

    public int getMeasureID() {
        return measureID;
    }

    public void setMeasureID(int measureID) {
        this.measureID = measureID;
    }

    public int getGoalID() {
        return goalID;
    }

    public void setGoalID(int goalID) {
        this.goalID = goalID;
    }

    public int getTotalCountperMeasure() {
        return totalCountperMeasure;
    }

    public void setTotalCountperMeasure(int totalCountperMeasure) {
        this.totalCountperMeasure = totalCountperMeasure;
    }

    public String getProgramName() {
        return programName;
    }

    public void setProgramName(String programName) {
        this.programName = programName;
    }
    
    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }
}

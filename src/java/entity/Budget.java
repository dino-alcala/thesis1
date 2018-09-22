/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Date;

/**
 *
 * @author LA
 */
public class Budget {
    protected int id;
    protected Date Date;
    protected double currentBudget;
    protected double budgetRequested;
    protected double remainingBudget;
    protected int seID;
    protected int ffID;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return Date;
    }

    public void setDate(Date Date) {
        this.Date = Date;
    }

    public double getCurrentBudget() {
        return currentBudget;
    }

    public void setCurrentBudget(double currentBudget) {
        this.currentBudget = currentBudget;
    }

    public double getBudgetRequested() {
        return budgetRequested;
    }

    public void setBudgetRequested(double budgetRequested) {
        this.budgetRequested = budgetRequested;
    }

    public double getRemainingBudget() {
        return remainingBudget;
    }

    public void setRemainingBudget(double remainingBudget) {
        this.remainingBudget = remainingBudget;
    }

    public int getSeID() {
        return seID;
    }

    public void setSeID(int seID) {
        this.seID = seID;
    }

    public int getFfID() {
        return ffID;
    }

    public void setFfID(int ffID) {
        this.ffID = ffID;
    }
}

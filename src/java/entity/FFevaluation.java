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
public class FFevaluation {
    protected Date date;
    protected String name;
    protected int q1;
    protected int q2;
    protected int q3;
    protected int q4;
    protected int q5;
    protected int q6;
    protected int q7;
    protected int q8;
    protected int q9;
    protected String learning;
    protected String memorable;
    protected String feedback;
    protected int ffproposalID;
    protected boolean evaluationnotified = false;

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQ1() {
        return q1;
    }

    public void setQ1(int q1) {
        this.q1 = q1;
    }

    public int getQ2() {
        return q2;
    }

    public void setQ2(int q2) {
        this.q2 = q2;
    }

    public int getQ3() {
        return q3;
    }

    public void setQ3(int q3) {
        this.q3 = q3;
    }

    public int getQ4() {
        return q4;
    }

    public void setQ4(int q4) {
        this.q4 = q4;
    }

    public int getQ5() {
        return q5;
    }

    public void setQ5(int q5) {
        this.q5 = q5;
    }

    public int getQ6() {
        return q6;
    }

    public void setQ6(int q6) {
        this.q6 = q6;
    }

    public int getQ7() {
        return q7;
    }

    public void setQ7(int q7) {
        this.q7 = q7;
    }

    public int getQ8() {
        return q8;
    }

    public void setQ8(int q8) {
        this.q8 = q8;
    }

    public int getQ9() {
        return q9;
    }

    public void setQ9(int q9) {
        this.q9 = q9;
    }

    public String getLearning() {
        return learning;
    }

    public void setLearning(String learning) {
        this.learning = learning;
    }

    public String getMemorable() {
        return memorable;
    }

    public void setMemorable(String memorable) {
        this.memorable = memorable;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public int getFfproposalID() {
        return ffproposalID;
    }

    public void setFfproposalID(int ffproposalID) {
        this.ffproposalID = ffproposalID;
    } 

    public boolean isEvaluationnotified() {
        return evaluationnotified;
    }

    public void setEvaluationnotified(boolean evaluationnotified) {
        this.evaluationnotified = evaluationnotified;
    }
    
    
    
}

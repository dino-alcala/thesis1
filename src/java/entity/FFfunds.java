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
public class FFfunds {
    protected String lineItem;
    protected double approvedAmount;
    protected double expendedAmount;
    protected double variance;
    protected String reasonVariance;
    protected int sereportID;

    public String getLineItem() {
        return lineItem;
    }

    public void setLineItem(String lineItem) {
        this.lineItem = lineItem;
    }

    public double getApprovedAmount() {
        return approvedAmount;
    }

    public void setApprovedAmount(double approvedAmount) {
        this.approvedAmount = approvedAmount;
    }

    public double getExpendedAmount() {
        return expendedAmount;
    }

    public void setExpendedAmount(double expendedAmount) {
        this.expendedAmount = expendedAmount;
    }

    public double getVariance() {
        return variance;
    }

    public void setVariance(double variance) {
        this.variance = variance;
    }

    public String getReasonVariance() {
        return reasonVariance;
    }

    public void setReasonVariance(String reasonVariance) {
        this.reasonVariance = reasonVariance;
    }

    public int getSereportID() {
        return sereportID;
    }

    public void setSereportID(int sereportID) {
        this.sereportID = sereportID;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Blob;
import java.util.Date;

/**
 *
 * @author LA
 */
public class SEexpenses {
    protected int id;
    protected String item;
    protected double unitcost;
    protected int quantity;
    protected double subtotal;
    protected int seproposalID;
    protected double amountUsed;
    protected String datetime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getItem() {
        return item;
    }

    public void setItem(String item) {
        this.item = item;
    }

    public double getUnitcost() {
        return unitcost;
    }

    public void setUnitcost(double unitcost) {
        this.unitcost = unitcost;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public int getSeproposalID() {
        return seproposalID;
    }

    public void setSeproposalID(int seproposalID) {
        this.seproposalID = seproposalID;
    }

    public double getAmountUsed() {
        return amountUsed;
    }

    public void setAmountUsed(double amountUsed) {
        this.amountUsed = amountUsed;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }
    
    
}

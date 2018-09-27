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
public class Unit {
    
    protected String name;
    protected String head;
    protected String type;
    protected int departments;
    protected int faculty;
    protected int admin;
    protected int apsp;
    protected int asf;
    protected int cap;
    protected String description;
    protected int userID;
    protected int unitID;
    protected int directhired;
    protected int independent;
    protected int external;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHead() {
        return head;
    }

    public void setHead(String head) {
        this.head = head;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getDepartments() {
        return departments;
    }

    public void setDepartments(int departments) {
        this.departments = departments;
    }

    public int getFaculty() {
        return faculty;
    }

    public void setFaculty(int faculty) {
        this.faculty = faculty;
    }

    public int getAdmin() {
        return admin;
    }

    public void setAdmin(int admin) {
        this.admin = admin;
    }

    public int getApsp() {
        return apsp;
    }

    public void setApsp(int apsp) {
        this.apsp = apsp;
    }

    public int getCap() {
        return cap;
    }

    public void setCap(int cap) {
        this.cap = cap;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getUnitID() {
        return unitID;
    }

    public void setUnitID(int unitID) {
        this.unitID = unitID;
    }

    public int getAsf() {
        return asf;
    }

    public void setAsf(int asf) {
        this.asf = asf;
    }

    public int getDirecthired() {
        return directhired;
    }

    public void setDirecthired(int directhired) {
        this.directhired = directhired;
    }

    public int getIndependent() {
        return independent;
    }

    public void setIndependent(int independent) {
        this.independent = independent;
    }

    public int getExternal() {
        return external;
    }

    public void setExternal(int external) {
        this.external = external;
    }

}

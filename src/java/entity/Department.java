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
public class Department {
    
    protected String name;
    protected int departmentID;
    protected int faculty;
    protected int admin;
    protected int apsp;
    protected int asf;
    protected int cap;
    protected int directhired;
    protected int independent;
    protected int external;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getDepartmentID() {
        return departmentID;
    }

    public void setDepartmentID(int departmentID) {
        this.departmentID = departmentID;
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

    public int getAsf() {
        return asf;
    }

    public void setAsf(int asf) {
        this.asf = asf;
    }

    public int getCap() {
        return cap;
    }

    public void setCap(int cap) {
        this.cap = cap;
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

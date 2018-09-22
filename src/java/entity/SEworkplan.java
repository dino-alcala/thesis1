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
public class SEworkplan {
    protected int id;
    protected Date date;
    protected String activity;
    protected String timestarttimeend;
    protected String timestarttimeend2;
    protected String venue;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }

    public String getTimestarttimeend() {
        return timestarttimeend;
    }

    public void setTimestarttimeend(String timestarttimeend) {
        this.timestarttimeend = timestarttimeend;
    }

    public String getTimestarttimeend2() {
        return timestarttimeend2;
    }

    public void setTimestarttimeend2(String timestarttimeend2) {
        this.timestarttimeend2 = timestarttimeend2;
    }

    public String getVenue() {
        return venue;
    }

    public void setVenue(String venue) {
        this.venue = venue;
    }
    
    
}

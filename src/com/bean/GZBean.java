package com.bean;

import java.sql.Timestamp;
import java.util.Date;

public class GZBean {

    private int id;
    private String xm;
    private String tz;
    private double kqjj;
    private double kqfk;
    private double jljj;
    private double jlfk;
    private Timestamp sj;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getXm() {
        return xm;
    }

    public void setXm(String xm) {
        this.xm = xm;
    }

    public String getTz() {
        return tz;
    }

    public void setTz(String tz) {
        this.tz = tz;
    }

    public double getKqjj() {
        return kqjj;
    }

    public void setKqjj(double kqjj) {
        this.kqjj = kqjj;
    }

    public double getKqfk() {
        return kqfk;
    }

    public void setKqfk(double kqfk) {
        this.kqfk = kqfk;
    }

    public double getJljj() {
        return jljj;
    }

    public void setJljj(double jljj) {
        this.jljj = jljj;
    }

    public double getJlfk() {
        return jlfk;
    }

    public void setJlfk(double jlfk) {
        this.jlfk = jlfk;
    }

    public Date getSj() {
        return sj;
    }

    public void setSj(Timestamp sj) {
        this.sj = sj;
    }
}

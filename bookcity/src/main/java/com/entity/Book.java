package com.entity;

import java.io.Serializable;

public class Book implements Serializable {
    String bno,bname,bauthor,bnationality,blabel;
    Integer byear;

    public String getBno() {
        return bno;
    }

    public void setBno(String bno) {
        this.bno = bno;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public String getBauthor() {
        return bauthor;
    }

    public void setBauthor(String bauthor) {
        this.bauthor = bauthor;
    }

    public String getBnationality() {
        return bnationality;
    }

    public void setBnationality(String bnationality) {
        this.bnationality = bnationality;
    }

    public String getBlabel() {
        return blabel;
    }

    public void setBlabel(String blabel) {
        this.blabel = blabel;
    }

    public Integer getByear() {
        return byear;
    }

    public void setByear(Integer byear) {
        this.byear = byear;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bno='" + bno + '\'' +
                ", bname='" + bname + '\'' +
                ", bauthor='" + bauthor + '\'' +
                ", bnationnality='" + bnationality + '\'' +
                ", blabel='" + blabel + '\'' +
                ", byear=" + byear +
                '}';
    }
}

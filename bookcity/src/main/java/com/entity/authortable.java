package com.entity;

import java.io.Serializable;

public class authortable implements Serializable {
    String bauthor,bnationality,bname;
    Integer sums;

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

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public Integer getSums() {
        return sums;
    }

    public void setSums(Integer sums) {
        this.sums = sums;
    }

    @Override
    public String toString() {
        return "authortable{" +
                "bauthor='" + bauthor + '\'' +
                ", bnationality='" + bnationality + '\'' +
                ", bname='" + bname + '\'' +
                ", sums=" + sums +
                '}';
    }
}

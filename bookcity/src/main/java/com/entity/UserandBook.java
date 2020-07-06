package com.entity;

import java.io.Serializable;

public class UserandBook implements Serializable {
    String username,bno;
    Integer pages,weight;

    public Integer getWeight() {
        return weight;
    }

    public void setWeight(Integer weight) {
        this.weight = weight;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getBno() {
        return bno;
    }

    public void setBno(String bno) {
        this.bno = bno;
    }

    public Integer getPages() {
        return pages;
    }

    public void setPages(Integer pages) {
        this.pages = pages;
    }

    @Override
    public String toString() {
        return "UserandBook{" +
                "username='" + username + '\'' +
                ", bno='" + bno + '\'' +
                ", pages=" + pages +
                '}';
    }
}

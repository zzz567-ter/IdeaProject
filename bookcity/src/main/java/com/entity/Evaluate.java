package com.entity;

public class Evaluate {
    String alias,btext,username,bno,bdate;
    Integer stars;

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public String getBtext() {
        return btext;
    }

    public void setBtext(String btext) {
        this.btext = btext;
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

    public String getBdate() {
        return bdate;
    }

    public void setBdate(String bdate) {
        this.bdate = bdate;
    }

    public Integer getStars() {
        return stars;
    }

    public void setStars(Integer stars) {
        this.stars = stars;
    }

    @Override
    public String toString() {
        return "evaluate{" +
                "alias='" + alias + '\'' +
                ", text='" + btext + '\'' +
                ", username='" + username + '\'' +
                ", bno='" + bno + '\'' +
                ", bdate='" + bdate + '\'' +
                ", stars=" + stars +
                '}';
    }
}

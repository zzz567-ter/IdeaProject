package com.entity;

import java.io.Serializable;

public class Bookmsg implements Serializable {
    String bno,publish,introduce;
    Integer wordnumber;

    public String getBno() {
        return bno;
    }

    public void setBno(String bno) {
        this.bno = bno;
    }

    public String getPublish() {
        return publish;
    }

    public void setPublish(String publish) {
        this.publish = publish;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public Integer getWordnumber() {
        return wordnumber;
    }

    public void setWordnumber(Integer wordnumber) {
        this.wordnumber = wordnumber;
    }

    @Override
    public String toString() {
        return "Bookmsg{" +
                "bno='" + bno + '\'' +
                ", publish='" + publish + '\'' +
                ", introduce='" + introduce + '\'' +
                ", wordnumber=" + wordnumber +
                '}';
    }
}

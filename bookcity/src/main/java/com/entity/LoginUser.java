package com.entity;

public class LoginUser {
    String username,password,email,alias;
    Integer loginyear;

    public String getAlias() {
        return alias;
    }
    public void setAlias(String alias) {
        this.alias = alias;
    }
    public Integer getLoginyear() {
        return loginyear;
    }

    public void setLoginyear(Integer loginyear) {
        this.loginyear = loginyear;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "LoginUser{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", alias='" + alias + '\'' +
                ", loginyear=" + loginyear +
                '}';
    }
}

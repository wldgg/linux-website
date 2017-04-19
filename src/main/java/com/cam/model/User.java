package com.cam.model;

import java.util.Date;

/**
 * Created by Zhangxq on 2016/7/15.
 */
public class User {

    private Integer userid;
    private String username;
    private String userPwd;
    private Integer userRole;
    private String userEmail;
    private Date registerTime;

    @Override
    public String toString() {
        return "username:"+username+";userEmail:"+userEmail;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public Integer getUserRole() {
        return userRole;
    }

    public void setUserRole(Integer userRole) {
        this.userRole = userRole;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }
}

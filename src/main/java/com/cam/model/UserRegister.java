package com.cam.model;

import java.util.Date;

/**
 * Created by wangl on 2017/3/9.
 */
public class UserRegister {

    private String username;
    private String userPwd;
    private String userPwdCheck;
    private String userClass;
    private String userSex;
    private String userEmail;

    public String getUserClass() {
        return userClass;
    }

    public void setUserClass(String userClass) {
        this.userClass = userClass;
    }

    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex;
    }

    public String getUsername() {
        return username;
    }

    public String getUserPwdCheck() {
        return userPwdCheck;
    }

    public void setUserPwdCheck(String userPwdCheck) {
        this.userPwdCheck = userPwdCheck;
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

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

}

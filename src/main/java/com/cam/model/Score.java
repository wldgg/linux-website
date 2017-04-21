package com.cam.model;

import java.util.Date;

/**
 * Created by wangl on 2017/4/16.
 */
public class Score {

    private Integer id;
    private String evaluatename;
    private String username;
    private Integer score;
    private Date addtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEvaluatename() {
        return evaluatename;
    }

    public void setEvaluatename(String evaluatename) {
        this.evaluatename = evaluatename;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}

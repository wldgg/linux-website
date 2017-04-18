package com.cam.model;

import java.util.Date;

/**
 * Created by rain on 2017/4/8.
 */
public class Judge {

    private Integer judgeid;
    private String judgebody;
    private String judgeanswer;
    private Date addtime;

    public Integer getJudgeid() {
        return judgeid;
    }

    public void setJudgeid(Integer judgeid) {
        this.judgeid = judgeid;
    }

    public String getJudgebody() {
        return judgebody;
    }

    public void setJudgebody(String judgebody) {
        this.judgebody = judgebody;
    }

    public String getJudgeanswer() {
        return judgeanswer;
    }

    public void setJudgeanswer(String judgeanswer) {
        this.judgeanswer = judgeanswer;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}

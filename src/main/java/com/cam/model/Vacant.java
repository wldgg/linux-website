package com.cam.model;

import java.util.Date;

/**
 * Created by rain on 2017/4/7.
 */
public class Vacant {

    private Integer vacantid;
    private String vacantbody;
    private String vacantanswer;
    private Date addtime;

    public Integer getVacantid() {
        return vacantid;
    }

    public void setVacantid(Integer vacantid) {
        this.vacantid = vacantid;
    }

    public String getVacantbody() {
        return vacantbody;
    }

    public void setVacantbody(String vacantbody) {
        this.vacantbody = vacantbody;
    }

    public String getVacantanswer() {
        return vacantanswer;
    }

    public void setVacantanswer(String vacantanswer) {
        this.vacantanswer = vacantanswer;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}

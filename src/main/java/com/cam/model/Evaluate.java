package com.cam.model;

import java.util.Date;

/**
 * Created by rain on 2017/4/7.
 */
public class Evaluate {

    private int evaluateid;
    private String evaluatename;
    private int choosenum;
    private String chooselist;
    private int vacantnum;
    private String vacantlist;
    private int judgenum;
    private String judgelist;
    private int shortanswernum;
    private String shortanswerlist;
    private Date addtime;

    public int getEvaluateid() {
        return evaluateid;
    }

    public void setEvaluateid(int evaluateid) {
        this.evaluateid = evaluateid;
    }

    public String getEvaluatename() {
        return evaluatename;
    }

    public void setEvaluatename(String evaluatename) {
        this.evaluatename = evaluatename;
    }

    public int getChoosenum() {
        return choosenum;
    }

    public void setChoosenum(int choosenum) {
        this.choosenum = choosenum;
    }

    public String getChooselist() {
        return chooselist;
    }

    public void setChooselist(String chooselist) {
        this.chooselist = chooselist;
    }

    public int getVacantnum() {
        return vacantnum;
    }

    public void setVacantnum(int vacantnum) {
        this.vacantnum = vacantnum;
    }

    public String getVacantlist() {
        return vacantlist;
    }

    public void setVacantlist(String vacantlist) {
        this.vacantlist = vacantlist;
    }

    public int getJudgenum() {
        return judgenum;
    }

    public void setJudgenum(int judgenum) {
        this.judgenum = judgenum;
    }

    public String getJudgelist() {
        return judgelist;
    }

    public void setJudgelist(String judgelist) {
        this.judgelist = judgelist;
    }

    public int getShortanswernum() {
        return shortanswernum;
    }

    public void setShortanswernum(int shortanswernum) {
        this.shortanswernum = shortanswernum;
    }

    public String getShortanswerlist() {
        return shortanswerlist;
    }

    public void setShortanswerlist(String shortanswerlist) {
        this.shortanswerlist = shortanswerlist;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}

package com.cam.model;

import java.util.List;

/**
 * Created by rain on 2017/4/8.
 */
public class EvaluateAnswerList {

    private List<String> chooseList;
    private List<String> chooseAns;
    private List<String> judgeList;
    private List<String> judgeAns;
    private List<String> vacantList;
    private List<String> vacantAns;
    private List<String> shortAnswerList;
    private List<String> shortAnswerAns;

    public List<String> getJudgeAns() {
        return judgeAns;
    }

    public void setJudgeAns(List<String> judgeAns) {
        this.judgeAns = judgeAns;
    }

    public List<String> getVacantAns() {
        return vacantAns;
    }

    public void setVacantAns(List<String> vacantAns) {
        this.vacantAns = vacantAns;
    }

    public List<String> getShortAnswerAns() {
        return shortAnswerAns;
    }

    public void setShortAnswerAns(List<String> shortAnswerAns) {
        this.shortAnswerAns = shortAnswerAns;
    }

    public List<String> getChooseAns() {
        return chooseAns;
    }

    public void setChooseAns(List<String> chooseAns) {
        this.chooseAns = chooseAns;
    }

    public List<String> getChooseList() {
        return chooseList;
    }

    public void setChooseList(List<String> chooseList) {
        this.chooseList = chooseList;
    }

    public List<String> getJudgeList() {
        return judgeList;
    }

    public void setJudgeList(List<String> judgeList) {
        this.judgeList = judgeList;
    }

    public List<String> getVacantList() {
        return vacantList;
    }

    public void setVacantList(List<String> vacantList) {
        this.vacantList = vacantList;
    }

    public List<String> getShortAnswerList() {
        return shortAnswerList;
    }

    public void setShortAnswerList(List<String> shortAnswerList) {
        this.shortAnswerList = shortAnswerList;
    }
}

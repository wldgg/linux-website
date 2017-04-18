package com.cam.model;

import java.util.Date;

/**
 * Created by rain on 2017/4/4.
 */
public class Experiment {

    private Integer experimentid;
    private String experimentname;
    private String experimentbody;
    private String experimentfile;
    private Date starttime;
    private Date finishtime;
    private Date addtime;

    public Integer getExperimentid() {
        return experimentid;
    }

    public void setExperimentid(Integer experimentid) {
        this.experimentid = experimentid;
    }

    public String getExperimentname() {
        return experimentname;
    }

    public void setExperimentname(String experimentname) {
        this.experimentname = experimentname;
    }

    public String getExperimentbody() {
        return experimentbody;
    }

    public void setExperimentbody(String experimentbody) {
        this.experimentbody = experimentbody;
    }

    public String getExperimentfile() {
        return experimentfile;
    }

    public void setExperimentfile(String experimentfile) {
        this.experimentfile = experimentfile;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getFinishtime() {
        return finishtime;
    }

    public void setFinishtime(Date finishtime) {
        this.finishtime = finishtime;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}

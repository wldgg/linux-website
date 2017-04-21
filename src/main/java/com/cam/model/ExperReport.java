package com.cam.model;

import java.util.Date;

/**
 * Created by wangl on 2017/4/16.
 */
public class ExperReport {

    private Integer id;
    private Integer downloadcnt;
    private String experimentname;
    private String username;
    private String filename;
    private Date addtime;

    public Integer getDownloadcnt() {
        return downloadcnt;
    }

    public void setDownloadcnt(Integer downloadcnt) {
        this.downloadcnt = downloadcnt;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getExperimentname() {
        return experimentname;
    }

    public void setExperimentname(String experimentname) {
        this.experimentname = experimentname;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}

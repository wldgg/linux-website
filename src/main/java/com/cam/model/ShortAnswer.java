package com.cam.model;

import java.util.Date;

/**
 * Created by rain on 2017/4/8.
 */
public class ShortAnswer {

    private Integer shortanswerid;
    private String shortanswerbody;
    private String shortansweranswer;
    private Date addtime;

    public Integer getShortanswerid() {
        return shortanswerid;
    }

    public void setShortanswerid(Integer shortanswerid) {
        this.shortanswerid = shortanswerid;
    }

    public String getShortanswerbody() {
        return shortanswerbody;
    }

    public void setShortanswerbody(String shortanswerbody) {
        this.shortanswerbody = shortanswerbody;
    }

    public String getShortansweranswer() {
        return shortansweranswer;
    }

    public void setShortansweranswer(String shortansweranswer) {
        this.shortansweranswer = shortansweranswer;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}

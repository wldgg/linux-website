package com.cam.model;

/**
 * Created by rain on 2017/3/29.
 */
public class Page {

    private Integer pagenum;
    private Integer curpage;
    private Integer lastpagenum;

    public Integer getLastpagenum() {
        return lastpagenum;
    }

    public void setLastpagenum(Integer lastpagenum) {
        this.lastpagenum = lastpagenum;
    }

    public Integer getPagenum() {
        return pagenum;
    }

    public void setPagenum(Integer pagenum) {
        this.pagenum = pagenum;
    }

    public Integer getCurpage() {
        return curpage;
    }

    public void setCurpage(Integer curpage) {
        this.curpage = curpage;
    }
}

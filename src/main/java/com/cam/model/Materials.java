package com.cam.model;

import java.util.Date;

/**
 * Created by rain on 2017/3/29.
 */
public class Materials {

    private Integer materialsid;
    private String materialsname;
    private Date addtime;

    public Materials(){}

    public Materials(String name){
        this.materialsname=name;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    public Integer getMaterialsid() {
        return materialsid;
    }

    public void setMaterialsid(Integer materialsid) {
        this.materialsid = materialsid;
    }

    public String getMaterialsname() {
        return materialsname;
    }

    public void setMaterialsname(String materialsname) {
        this.materialsname = materialsname;
    }
}

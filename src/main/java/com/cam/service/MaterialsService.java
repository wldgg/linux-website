package com.cam.service;

import com.cam.model.Materials;

import java.util.List;

/**
 * Created by rain on 2017/3/29.
 */
public interface MaterialsService {

    List<Materials> getMaterialsByPage(int page);

    List<Materials> getMaterialsByName(String name);

    int getCounts();

    void addMaterials(Materials materials);

    void removeMaterials(String name);

}

package com.cam.service.impl;

import com.cam.contant.Contant;
import com.cam.dao.MaterialsDao;
import com.cam.model.Materials;
import com.cam.service.MaterialsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by rain on 2017/3/29.
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class MaterialsServiceImpl implements MaterialsService{

    @Resource
    private MaterialsDao materialsDao;

    public List<Materials> getMaterialsByPage(int page) {
        return materialsDao.selectMaterialsByPage((page-1)* Contant.pagesize);
    }

    public List<Materials> getMaterialsByName(String name) {
        return materialsDao.selectMaterialsByName(name);
    }

    public int getCounts() {
        return materialsDao.getCounts();
    }

    public void addMaterials(Materials materials) {
        materialsDao.addMaterials(materials);
    }

    public void removeMaterials(String name) {
        materialsDao.removeMaterials(name);
    }
}

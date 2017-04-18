package com.cam.dao;

import com.cam.model.Materials;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by rain on 2017/3/29.
 */
@Repository
public interface MaterialsDao {

    List<Materials> selectMaterialsByPage(int begin);

    List<Materials> selectMaterialsByName(String name);

    int getCounts();

    void addMaterials(@Param("materials") Materials materials);

    void removeMaterials(@Param("name") String name);

}

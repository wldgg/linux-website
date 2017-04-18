package com.cam.dao;

import com.cam.model.Experiment;
import com.cam.model.Materials;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by rain on 2017/3/29.
 */
@Repository
public interface ExperimentDao {

    List<Experiment> selectExperimentByPage(int begin);

    List<Experiment> selectExperimentByName(String name);
    Experiment selectOneExperimentByName(String name);

    int getCounts();

    void addExperiment(@Param("experiment") Experiment experiment);

    void updateExperiment(@Param("experiment") Experiment experiment);

    void removeExperiment(@Param("name") String name);

}

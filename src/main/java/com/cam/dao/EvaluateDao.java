package com.cam.dao;

import com.cam.model.Evaluate;
import com.cam.model.Experiment;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by rain on 2017/3/29.
 */
@Repository
public interface EvaluateDao {

    List<Evaluate> selectEvaluateByPage(int begin);

    List<Evaluate> selectEvaluateByName(String name);

    Evaluate selectOneEvaluateByName(String name);

    int getCounts();

    void addEvaluate(@Param("evaluate") Evaluate evaluate);


    void removeEvaluate(@Param("name") String name);

}

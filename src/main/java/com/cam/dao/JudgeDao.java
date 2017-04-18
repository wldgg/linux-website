package com.cam.dao;

import com.cam.model.Judge;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by rain on 2017/4/7.
 */
@Repository
public interface JudgeDao {

    void addJudge(@Param("judge") Judge judge);

    List<Judge> getInString(String[] instring);

    int getCounts();

}

package com.cam.dao;

import com.cam.model.Score;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by rain on 2017/4/7.
 */
@Repository
public interface ScoreDao {

    void addScore(@Param("score") Score score);

}

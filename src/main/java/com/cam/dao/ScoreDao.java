package com.cam.dao;

import com.cam.model.Score;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by rain on 2017/4/7.
 */
@Repository
public interface ScoreDao {

    void addScore(@Param("score") Score score);

    List<Score> selectScoreByEvaluateName(@Param("name") String name);

    List<Score> selectScoreByUserName(@Param("name") String name);

    List<Score> selectScoreByUserAndEvaluateName(@Param("username") String username,@Param("evaluatename") String evaluatename);

    void updateScoreByUserAndEvaluateName(@Param("username") String username,@Param("evaluatename") String evaluatename,@Param("score") Integer score);

    void deleteByEvaluatename(@Param("evaluatename") String evaluatename);

}

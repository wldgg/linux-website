package com.cam.service;

import com.cam.model.Score;

import java.util.List;

/**
 * Created by rain on 2017/4/7.
 */
public interface ScoreService {

    void addScore(Score score);

    List<Score> getScoreByEvaluateName(String name);

    List<Score> getScoreByUserName(String name);

    List<Score> getScoreByUserAndEvaluateName(String username, String evaluatename);


}

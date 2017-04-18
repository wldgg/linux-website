package com.cam.service;

import com.cam.model.Judge;

import java.util.List;

/**
 * Created by rain on 2017/4/8.
 */
public interface JudgeService {

    void addJudge(Judge judge);

    List<Judge> getInString(String[] instring);

    int getCounts();

}

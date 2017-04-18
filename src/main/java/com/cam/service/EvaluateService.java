package com.cam.service;

import com.cam.model.Evaluate;
import com.cam.model.Experiment;

import java.util.List;

/**
 * Created by rain on 2017/4/4.
 */
public interface EvaluateService {

    List<Evaluate> getEvaluateByPage(int page);

    List<Evaluate> getEvaluateByName(String name);

    Evaluate getOneEvaluateByName(String name);

    int getCounts();

    void addEvaluate(Evaluate evaluate);

    void removeEvaluate(String name);

}

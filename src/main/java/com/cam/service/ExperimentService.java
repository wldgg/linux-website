package com.cam.service;

import com.cam.model.Experiment;
import com.cam.model.Materials;

import java.util.List;

/**
 * Created by rain on 2017/4/4.
 */
public interface ExperimentService {

    List<Experiment> getExperimentByPage(int page);

    List<Experiment> getExperimentByName(String name);

    Experiment getOneExperimentByName(String name);

    int getCounts();

    void addExperiment(Experiment experiment);

    void updateExperiment(Experiment experiment);

    void removeExperiment(String name);

}

package com.cam.service.impl;

import com.cam.contant.Contant;
import com.cam.dao.ExperimentDao;
import com.cam.model.Experiment;
import com.cam.service.ExperimentService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by rain on 2017/4/4.
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class ExperimentServiceImpl implements ExperimentService{

    @Resource
    private ExperimentDao experimentDao;

    public List<Experiment> getExperimentByPage(int page) {
        return experimentDao.selectExperimentByPage((page-1)* Contant.pagesize);
    }

    public List<Experiment> getExperimentByName(String name) {
        return experimentDao.selectExperimentByName(name);
    }

    public Experiment getOneExperimentByName(String name) {
        return experimentDao.selectOneExperimentByName(name);
    }

    public int getCounts() {
        return experimentDao.getCounts();
    }

    public void addExperiment(Experiment experiment) {
        experimentDao.addExperiment(experiment);
    }

    public void updateExperiment(Experiment experiment) {
        experimentDao.updateExperiment(experiment);
    }

    public void removeExperiment(String name) {
        experimentDao.removeExperiment(name);
    }
}

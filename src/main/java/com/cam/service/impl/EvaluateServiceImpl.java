package com.cam.service.impl;

import com.cam.contant.Contant;
import com.cam.dao.EvaluateDao;
import com.cam.dao.ExperimentDao;
import com.cam.model.Evaluate;
import com.cam.model.Experiment;
import com.cam.service.EvaluateService;
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
public class EvaluateServiceImpl implements EvaluateService{

    @Resource
    private EvaluateDao evaluateDao;

    public List<Evaluate> getEvaluateByPage(int page) {
        return evaluateDao.selectEvaluateByPage((page-1)* Contant.pagesize);
    }

    public List<Evaluate> getEvaluateByName(String name) {
        return evaluateDao.selectEvaluateByName(name);
    }

    public Evaluate getOneEvaluateByName(String name) {
        return evaluateDao.selectOneEvaluateByName(name);
    }

    public int getCounts() {
        return evaluateDao.getCounts();
    }

    public void addEvaluate(Evaluate evaluate) {
        evaluateDao.addEvaluate(evaluate);
    }

    public void removeEvaluate(String name) {
        evaluateDao.removeEvaluate(name);
    }
}

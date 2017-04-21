package com.cam.service.impl;

import com.cam.dao.ExperReportDao;
import com.cam.model.ExperReport;
import com.cam.model.Score;
import com.cam.service.ExperReportService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by wangl on 2017/4/16.
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class ExperReportServiceImpl implements ExperReportService {

    @Resource
    private ExperReportDao experReportDao;

    public void addExperReport(ExperReport experReport) {
        experReportDao.addExperReport(experReport);
    }

    public List<ExperReport> getReportByExperimentName(String name) {
        return experReportDao.selectReportByExperimentName(name);
    }

    public List<ExperReport> getReportByUserName(String name) {
        return experReportDao.selectReportByUserName(name);
    }

    public List<ExperReport> getReportByUserAndExperimentName(String username, String experimentname) {
        return experReportDao.selectReportByUserAndExperimentName(username,experimentname);
    }

    public void updateReportByUserAndExperimentName(String username, String experimentname, String filename) {
        experReportDao.updateReportByUserAndExperimentName(username,experimentname,filename);
    }

    public void updateDownloadCntByUserAndExperimentName(String username, String experimentname, Integer cnt) {
        experReportDao.updateDownloadCntByUserAndExperimentName(username,experimentname,cnt);
    }

    public void deleteByExperimentName(String experimentname) {
        experReportDao.deleteByExperimentName(experimentname);
    }

}

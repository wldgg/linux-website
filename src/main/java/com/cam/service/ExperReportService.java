package com.cam.service;

import com.cam.model.ExperReport;
import com.cam.model.Score;

import java.util.List;

/**
 * Created by rain on 2017/4/7.
 */
public interface ExperReportService {

    void addExperReport(ExperReport experReport);

    List<ExperReport> getReportByExperimentName(String name);

    List<ExperReport> getReportByUserName(String name);

    List<ExperReport> getReportByUserAndExperimentName(String username, String experimentname);

    void updateReportByUserAndExperimentName(String username, String experimentname,String filename);

    void updateDownloadCntByUserAndExperimentName(String username, String experimentname,Integer cnt);

    void deleteByExperimentName(String experimentname);

}

package com.cam.dao;

import com.cam.model.ExperReport;
import com.cam.model.Score;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by rain on 2017/4/7.
 */
@Repository
public interface ExperReportDao {

    void addExperReport(@Param("experReport") ExperReport experReport);

    List<ExperReport> selectReportByExperimentName(@Param("name") String name);

    List<ExperReport> selectReportByUserName(@Param("name") String name);

    List<ExperReport> selectReportByUserAndExperimentName(@Param("username") String username, @Param("experimentname") String experimentname);

    void updateReportByUserAndExperimentName(@Param("username") String username, @Param("experimentname") String experimentname, @Param("filename") String filename);

    void updateDownloadCntByUserAndExperimentName(@Param("username") String username, @Param("experimentname") String experimentname, @Param("cnt") Integer cnt);

    void deleteByExperimentName(@Param("experimentname") String experimentname);

}

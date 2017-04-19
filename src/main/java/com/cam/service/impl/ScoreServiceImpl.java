package com.cam.service.impl;

import com.cam.dao.ScoreDao;
import com.cam.model.Score;
import com.cam.service.ScoreService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by wangl on 2017/4/16.
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class ScoreServiceImpl implements ScoreService {

    @Resource
    private ScoreDao scoreDao;

    public void addScore(Score score) {
        scoreDao.addScore(score);
    }

    public List<Score> getScoreByEvaluateName(String name) {
        return scoreDao.selectScoreByEvaluateName(name);
    }

    public List<Score> getScoreByUserName(String name) {
        return scoreDao.selectScoreByUserName(name);
    }

    public List<Score> getScoreByUserAndEvaluateName(String username, String evaluatename) {
        return scoreDao.selectScoreByUserAndEvaluateName(username,evaluatename);
    }
}

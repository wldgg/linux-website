package com.cam.service.impl;

import com.cam.dao.ScoreDao;
import com.cam.model.Score;
import com.cam.service.ScoreService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

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
}

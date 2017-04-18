package com.cam.service.impl;

import com.cam.dao.JudgeDao;
import com.cam.dao.ShortAnswerDao;
import com.cam.model.Judge;
import com.cam.model.ShortAnswer;
import com.cam.service.JudgeService;
import com.cam.service.ShortAnswerService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by rain on 2017/4/8.
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class JudgeServiceImpl implements JudgeService{

    @Resource
    private JudgeDao judgeDao;

    public void addJudge(Judge judge) {
        judgeDao.addJudge(judge);
    }

    public List<Judge> getInString(String[] instring) {
        return judgeDao.getInString(instring);
    }

    public int getCounts() {
        return judgeDao.getCounts();
    }
}

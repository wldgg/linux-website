package com.cam.service.impl;

import com.cam.dao.ShortAnswerDao;
import com.cam.dao.VacantDao;
import com.cam.model.ShortAnswer;
import com.cam.model.Vacant;
import com.cam.service.ShortAnswerService;
import com.cam.service.VacantService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by rain on 2017/4/8.
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class ShortAnswerServiceImpl implements ShortAnswerService{

    @Resource
    private ShortAnswerDao shortAnswerDao;

    public void addShortAnswer(ShortAnswer shortAnswer) {
        shortAnswerDao.addShortAnswer(shortAnswer);
    }

    public List<ShortAnswer> getInString(String[] instring) {
        return shortAnswerDao.getInString(instring);
    }

    public int getCounts() {
        return shortAnswerDao.getCounts();
    }
}

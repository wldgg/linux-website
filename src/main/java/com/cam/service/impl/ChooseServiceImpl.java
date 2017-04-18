package com.cam.service.impl;

import com.cam.dao.ChooseDao;
import com.cam.model.Choose;
import com.cam.service.ChooseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by rain on 2017/4/7.
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class ChooseServiceImpl implements ChooseService{

    @Resource
    private ChooseDao chooseDao;

    public void addChoose(Choose choose) {
        chooseDao.addChoose(choose);
    }

    public List<Choose> getInString(String[] instring) {
        return chooseDao.getInString(instring);
    }

    public int getCounts() {
        return chooseDao.getCounts();
    }
}

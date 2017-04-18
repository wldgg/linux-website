package com.cam.service.impl;

import com.cam.dao.VacantDao;
import com.cam.model.Vacant;
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
public class VacantServiceImpl implements VacantService{

    @Resource
    private VacantDao vacantDao;

    public void addVacant(Vacant vacant) {
        vacantDao.addVacant(vacant);
    }

    public List<Vacant> getInString(String[] instring) {
        return vacantDao.getInString(instring);
    }

    public int getCounts() {
        return vacantDao.getCounts();
    }
}

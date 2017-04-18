package com.cam.service;

import com.cam.model.Choose;

import java.util.List;

/**
 * Created by rain on 2017/4/7.
 */
public interface ChooseService {

    void addChoose(Choose choose);

    List<Choose> getInString(String[] instring);

    int getCounts();

}

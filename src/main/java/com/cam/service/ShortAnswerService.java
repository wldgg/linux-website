package com.cam.service;

import com.cam.model.ShortAnswer;

import java.util.List;

/**
 * Created by rain on 2017/4/8.
 */
public interface ShortAnswerService {

    void addShortAnswer(ShortAnswer shortAnswer);

    List<ShortAnswer> getInString(String[] instring);

    int getCounts();

}

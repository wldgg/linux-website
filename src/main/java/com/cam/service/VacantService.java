package com.cam.service;

import com.cam.model.Vacant;

import java.util.List;

/**
 * Created by rain on 2017/4/7.
 */
public interface VacantService {

    void addVacant(Vacant vacant);

    List<Vacant> getInString(String[] instring);

    int getCounts();

}

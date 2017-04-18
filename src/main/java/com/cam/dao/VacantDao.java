package com.cam.dao;

import com.cam.model.Vacant;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by rain on 2017/4/7.
 */
@Repository
public interface VacantDao {

    void addVacant(@Param("vacant") Vacant vacant);

    List<Vacant> getInString(String[] instring);

    int getCounts();

}

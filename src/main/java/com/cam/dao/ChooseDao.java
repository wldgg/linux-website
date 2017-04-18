package com.cam.dao;

import com.cam.model.Choose;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by rain on 2017/4/7.
 */
@Repository
public interface ChooseDao {

    void addChoose(@Param("choose") Choose choose);

    List<Choose> getInString(String[] instring);

    int getCounts();

}

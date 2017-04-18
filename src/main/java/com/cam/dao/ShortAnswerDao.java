package com.cam.dao;

import com.cam.model.ShortAnswer;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by rain on 2017/4/7.
 */
@Repository
public interface ShortAnswerDao {

    void addShortAnswer(@Param("shortanswer") ShortAnswer shortAnswer);

    List<ShortAnswer> getInString(String[] instring);

    int getCounts();

}

package com.cam.dao;

import com.cam.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Zhangxq on 2016/7/15.
 */

@Repository
public interface UserDao {

    User selectUserById(@Param("userId") Integer userId);

    User selectUserByEmail(@Param("email") String email);

    User selectUserByUsername(@Param("username") String username);

    boolean addUser(@Param("user") User user);

    User selectUserByUsernameAndUserPwd(@Param("username") String username, @Param("userPwd") String userPwd);

    List<User> selectAllUser();
}

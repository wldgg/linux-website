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

    List<User> selectUsersByPage(int begin);

    List<User> selectUsersByName(String name);

    List<User> selectUsersNotAdminByPage(int page);

    List<User> selectUsersNotAdminByName(String name);

    int getCounts();

    int getNotAdminCounts();

    User selectUserById(@Param("userId") Integer userId);

    User selectUserByEmail(@Param("email") String email);

    User selectUserByUsername(@Param("username") String username);

    boolean addUser(@Param("user") User user);

    void updateUserRole(@Param("username") String username, @Param("role") Integer role);

    User selectUserByUsernameAndUserPwd(@Param("username") String username, @Param("userPwd") String userPwd);

    List<User> selectAllUser();
}

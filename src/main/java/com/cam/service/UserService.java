package com.cam.service;

import com.cam.model.User;

import java.util.List;

/**
 * Created by Zhangxq on 2016/7/15.
 */
public interface UserService {

    List<User> getUsersByPage(int page);

    List<User> getUsersByName(String name);

    List<User> getUsersNotAdminByPage(int page);

    List<User> getUsersNotAdminByName(String name);

    int getCounts();

    int getNotAdminCounts();

    List<User> getAllUser();

    User getUserByEmail(String email);

    User getUserById(Integer userId);

    User getUserByUsername(String username);

    User checkUserAndPwd(String username, String userPwd);

    void updateUserRole(String username, Integer role);

    boolean addUser(User user);
}

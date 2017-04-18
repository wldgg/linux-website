package com.cam.service;

import com.cam.model.User;

import java.util.List;

/**
 * Created by Zhangxq on 2016/7/15.
 */
public interface UserService {

    List<User> getAllUser();

    User getUserByEmail(String email);

    User getUserById(Integer userId);

    User getUserByUsername(String username);

    boolean checkUserAndPwd(String username, String userPwd);

    boolean addUser(User user);
}

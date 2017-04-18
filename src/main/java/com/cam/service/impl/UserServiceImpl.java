package com.cam.service.impl;

import com.cam.dao.UserDao;
import com.cam.model.User;
import com.cam.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Zhangxq on 2016/7/15.
 */

@Service
@Transactional(rollbackFor = Exception.class)
public class UserServiceImpl implements UserService {
    
    @Resource
    private UserDao userDao;

    public User getUserById(Integer userId) {
        return userDao.selectUserById(userId);
    }

    public User getUserByUsername(String username) {
        return userDao.selectUserByUsername(username);
    }

    public boolean checkUserAndPwd(String username, String userPwd) {
        User user=userDao.selectUserByUsernameAndUserPwd(username,userPwd);
        if (user!=null){
            return true;
        }else {
            return false;
        }
    }

    public boolean addUser(User user) {
        boolean flag=userDao.addUser(user);
        if(flag){
            return true;
        }
        return false;
    }

    public User getUserByEmail(String email) {
        return userDao.selectUserByEmail(email);
    }
    
    public List<User> getAllUser() {
        return userDao.selectAllUser();
    }
}

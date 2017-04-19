package com.cam.service.impl;

import com.cam.contant.Contant;
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

    public User checkUserAndPwd(String username, String userPwd) {
        User user=userDao.selectUserByUsernameAndUserPwd(username,userPwd);
        return user;
    }

    public void updateUserRole(String username, Integer role) {
        userDao.updateUserRole(username,role);
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

    public List<User> getUsersByPage(int page) {
        return userDao.selectUsersByPage((page-1)* Contant.pagesize);
    }

    public List<User> getUsersByName(String name) {
        return userDao.selectUsersByName(name);
    }

    public List<User> getUsersNotAdminByPage(int page) {
        return userDao.selectUsersNotAdminByPage((page-1)* Contant.pagesize);
    }

    public List<User> getUsersNotAdminByName(String name) {
        return userDao.selectUsersNotAdminByName(name);
    }

    public int getCounts() {
        return userDao.getCounts();
    }

    public int getNotAdminCounts() {
        return userDao.getNotAdminCounts();
    }

    public List<User> getAllUser() {
        return userDao.selectAllUser();
    }
}

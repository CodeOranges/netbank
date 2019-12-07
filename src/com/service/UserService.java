package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.dao.UserDao;
import com.entity.User;

@Component
public class UserService {

	UserDao userDao;

	@Resource
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	public List login(User user){
		return userDao.login(user);
	}
	
	public int register(User user){
		return userDao.register(user);
	}
	
	public List selectOne(User user){
		return userDao.selectOne(user);
	}
	
	public int update(User user){
		return userDao.update(user);
	}

	public int offUpdate(User user){
		return userDao.offUpdate(user);
	}
	
	public int addUserno(User user){
		return userDao.addUserno(user);
	}
	public List allUserno(User user){
		return userDao.allUserno(user);
	}
}

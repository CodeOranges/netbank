package com.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.entity.User;
@Component
public class UserDao {

	JdbcTemplate jdbcTemplate;

	@Resource
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	//登录
	public List login(User user){
		String sql="select * from t_user where userno=? and password=?";
		return jdbcTemplate.queryForList(sql,user.getUserno(),user.getPassword());
	}
	
	//注册
	public int register(User user){
		String sql="insert into t_user(userno,username,password,password1,userflag,useryear,usermonth,userdate,sex,idcard,tel,city,useraddress) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql,user.getUserno(),user.getUsername(),user.getPassword(),user.getPassword1(),user.getUserflag(),user.getUseryear(),user.getUsermonth(),user.getUserdate(),user.getSex(),user.getIdcard(),user.getTel(),user.getCity(),user.getUseraddress());
	}
	
	//查看用户详细信息
	public List selectOne(User user){
		String sql="select * from t_user where id=?";
		return jdbcTemplate.queryForList(sql,user.getId());
	}
	
	//修改
	public int update(User user){
		String sql="update t_user set userno=?,username=?,password=?,useryear=?,usermonth=?,userdate=?,sex=?,idcard=?,tel=?,city=?,useraddress=? where id=?";
		return jdbcTemplate.update(sql,user.getUserno(),user.getUsername(),user.getPassword(),user.getUseryear(),user.getUsermonth(),user.getUserdate(),user.getSex(),user.getIdcard(),user.getTel(),user.getCity(),user.getUseraddress(),user.getId());
	}
	
	//注销
		public int offUpdate(User user){
			String sql="update t_user set userflag=? where id=? ";
			return jdbcTemplate.update(sql,user.getUserflag(),user.getId());
		}

	//一个用户注册新账户
		//1.查询当前用户的所有信息（ List selectOne(User user)）。
		//2.注册新账户时，将所有的用户个人信息保留，只注册账户和密码以及重复密码。
		//3.注册成功后，可以使用不同账户登录，个人信息显示统一用户信息。
		public int addUserno(User user){
			String sql="insert into t_user(userid,userno,username,password,password1,userflag,useryear,usermonth,userdate,sex,idcard,tel,city,useraddress) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			return jdbcTemplate.update(sql,user.getUserid(),user.getUserno(),user.getUsername(),user.getPassword(),user.getPassword1(),user.getUserflag(),user.getUseryear(),user.getUsermonth(),user.getUserdate(),user.getSex(),user.getIdcard(),user.getTel(),user.getCity(),user.getUseraddress());
		}
	
		//查看当前用户所有的账户
		public List allUserno(User user){
			String sql="select * from t_user where userid=?";
			return jdbcTemplate.queryForList(sql,user.getUserid());
		}
}

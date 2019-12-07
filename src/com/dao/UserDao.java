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
	
	//��¼
	public List login(User user){
		String sql="select * from t_user where userno=? and password=?";
		return jdbcTemplate.queryForList(sql,user.getUserno(),user.getPassword());
	}
	
	//ע��
	public int register(User user){
		String sql="insert into t_user(userno,username,password,password1,userflag,useryear,usermonth,userdate,sex,idcard,tel,city,useraddress) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql,user.getUserno(),user.getUsername(),user.getPassword(),user.getPassword1(),user.getUserflag(),user.getUseryear(),user.getUsermonth(),user.getUserdate(),user.getSex(),user.getIdcard(),user.getTel(),user.getCity(),user.getUseraddress());
	}
	
	//�鿴�û���ϸ��Ϣ
	public List selectOne(User user){
		String sql="select * from t_user where id=?";
		return jdbcTemplate.queryForList(sql,user.getId());
	}
	
	//�޸�
	public int update(User user){
		String sql="update t_user set userno=?,username=?,password=?,useryear=?,usermonth=?,userdate=?,sex=?,idcard=?,tel=?,city=?,useraddress=? where id=?";
		return jdbcTemplate.update(sql,user.getUserno(),user.getUsername(),user.getPassword(),user.getUseryear(),user.getUsermonth(),user.getUserdate(),user.getSex(),user.getIdcard(),user.getTel(),user.getCity(),user.getUseraddress(),user.getId());
	}
	
	//ע��
		public int offUpdate(User user){
			String sql="update t_user set userflag=? where id=? ";
			return jdbcTemplate.update(sql,user.getUserflag(),user.getId());
		}

	//һ���û�ע�����˻�
		//1.��ѯ��ǰ�û���������Ϣ�� List selectOne(User user)����
		//2.ע�����˻�ʱ�������е��û�������Ϣ������ֻע���˻��������Լ��ظ����롣
		//3.ע��ɹ��󣬿���ʹ�ò�ͬ�˻���¼��������Ϣ��ʾͳһ�û���Ϣ��
		public int addUserno(User user){
			String sql="insert into t_user(userid,userno,username,password,password1,userflag,useryear,usermonth,userdate,sex,idcard,tel,city,useraddress) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			return jdbcTemplate.update(sql,user.getUserid(),user.getUserno(),user.getUsername(),user.getPassword(),user.getPassword1(),user.getUserflag(),user.getUseryear(),user.getUsermonth(),user.getUserdate(),user.getSex(),user.getIdcard(),user.getTel(),user.getCity(),user.getUseraddress());
		}
	
		//�鿴��ǰ�û����е��˻�
		public List allUserno(User user){
			String sql="select * from t_user where userid=?";
			return jdbcTemplate.queryForList(sql,user.getUserid());
		}
}

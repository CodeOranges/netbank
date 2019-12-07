package com.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.entity.Trade;
import com.entity.User;
@Component
public class TradeDao {

	JdbcTemplate jdbcTemplate;

	@Resource
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	//�鿴�˻�������Ϣ
	public List selectLatest(Trade trade,User user){
		String sql="select * from t_trade where id=(select MAX(t_trade.id) from t_trade,t_user where t_trade.userid=t_user.id and t_user.id=? )";
		return jdbcTemplate.queryForList(sql,user.getId());
	}
	
	//���ҵ�ǰ�����û����˻���Ϣ
	public List selectAccount(Trade trade,User user){
		String sql="select * from t_trade,t_user where t_trade.userid=t_user.id and t_user.id=?";
		return jdbcTemplate.queryForList(sql,user.getId());
	}
	
	//���||ȡ��
	public int addAndTake(Trade trade){
		String sql="insert into t_trade(trade,balance,datatime,userno,money,userid) values(?,?,?,?,?,?)";
		return jdbcTemplate.update(sql,trade.getTrade(),trade.getBalance(),trade.getDatatime(),trade.getUserno(),trade.getMoney(),trade.getUserid());
	}
	

	
}

package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.dao.TradeDao;
import com.entity.Trade;
import com.entity.User;

@Component
public class TradeService {

	TradeDao tradeDao;

	@Resource
	public void setTradeDao(TradeDao tradeDao) {
		this.tradeDao = tradeDao;
	}
	
	public int add(Trade trade){
		return tradeDao.addAndTake(trade);
	}
	
	public List selectAccount(Trade trade,User user){
		return tradeDao.selectAccount(trade, user);
	}
	
	public List selectLatest(Trade trade,User user){
		return tradeDao.selectLatest(trade, user);
	}
	
//	public List usernoBalance(Trade trade,User user){
//		return tradeDao.usernoBalance(trade, user);
//	}
}

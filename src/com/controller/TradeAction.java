package com.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.Trade;
import com.entity.User;
import com.service.TradeService;

@Controller
public class TradeAction {

		TradeService tradeService;
	
		@Resource
		public void setTradeService(TradeService tradeService) {
			this.tradeService = tradeService;
		}
		
		@RequestMapping("add.do")
		public String add(Trade trade,HttpSession session){
			int balance=trade.getBalance()+trade.getMoney();
			trade.setBalance(balance);
			int n=tradeService.add(trade);
			if(n>0){
				return "success";
			}else{
				return "fail";
			}
		}
	
		@RequestMapping("takeAdd.do")
		public String takeAdd(Trade trade,HttpSession session){
			int balance=trade.getBalance()-trade.getMoney();
			trade.setBalance(balance);
			int n=tradeService.add(trade);
			if(n>0){
				return "success";
			}else{
				return "fail";
			}
		}
	
		//存款
		@RequestMapping("selectLatest.do")
		public String selectLatest(Trade trade,User user,HttpSession session){
			List listLatest=tradeService.selectLatest(trade, user);
			if(listLatest.size()>0){
				session.setAttribute("listLatest", listLatest);
				return "/trade/save";
			}else{
				return "/trade/save2";
			}
		}
	
		//取款
		@RequestMapping("selectLatest1.do")
		public String selectLatest1(Trade trade,User user,HttpSession session){
			List listLatest=tradeService.selectLatest(trade, user);
			if(listLatest.size()>0){
				session.setAttribute("listLatest", listLatest);
				return "/trade/take";
			}else{
				return "fail3";
			}
			
		}
		
		//查看交易信息
		@RequestMapping("selectAccount.do")
		public String selectAccount(Trade trade,User user,HttpSession session){
			List listInfo=tradeService.selectAccount(trade, user);
			if(listInfo.size()>0){
				session.setAttribute("listInfo", listInfo);
				return "/trade/info";
			}else{
				return "fail4";
			}	
		}		
		//注销查询余额是否为0
		@RequestMapping("logoff.do")
		public String logoff(Trade trade,User user,HttpSession session){
			List logoff=tradeService.selectLatest(trade, user);
			session.setAttribute("logoff", logoff);
			if(logoff.size()>0){
				return "/trade/logoff";
			}else{
				return "/trade/logoff2";
			}
			
		}	
}

package com.controller;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.entity.User;
import com.service.UserService;
import com.validator.LoginValidator;
import com.validator.RegisterValidator;
import com.validator.UsernoValidator;


@Controller
public class UserAction {

	UserService userService;
	LoginValidator loginValidator;
    RegisterValidator registerValidator;
    UsernoValidator usernoValidator;
    
    
    @Autowired
    public void setUsernoValidator(UsernoValidator usernoValidator) {
		this.usernoValidator = usernoValidator;
	}

	@Autowired
	public void setRegisterValidator(RegisterValidator registerValidator) {
		this.registerValidator = registerValidator;
	}

	@Autowired
	public void setLoginValidator(LoginValidator loginValidator) {
		this.loginValidator = loginValidator;
	}

	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@RequestMapping("login.do")
	public String login(@ModelAttribute("command")User user,BindingResult bindingResult,HttpSession session){
		loginValidator.validate(user, bindingResult);
		if(bindingResult.hasErrors()){
			return "user/login";
		}else{
			List listLogin=userService.login(user);
			if(listLogin.size()>0){
				session.setAttribute("listLogin", listLogin);
				return "menu";
			}else{
				return "failLogin";
			}
		}
	}
	
	@RequestMapping("register.do")
	public String register(@ModelAttribute("command")User user,BindingResult bindingResult,HttpSession session){
		registerValidator.validate(user, bindingResult);
		if(bindingResult.hasErrors()){
			return "/user/register";
		}else{
			int n=userService.register(user);
			if(n>0){
				return "/user/login";
			}else{
				return "fail";
			}
		}
		
	}
	
	//��ʾ������Ϣ
	@RequestMapping("selectOne.do")
	public String selectOne(User user,HttpSession session){
		List listOne=userService.selectOne(user);
		session.setAttribute("listOne", listOne);
		return "/user/showone";
	}
	
	//һ���û�ע�����˻�
		@RequestMapping("selectUserno.do")
		public String selectUserno(User user,HttpSession session){
			List listUserno=userService.selectOne(user);
			session.setAttribute("listUserno", listUserno);
			return "/user/newuserno";
		}
		//ע��ɹ���δע����
		@RequestMapping("addUserno.do")
		public String addUserno1(@ModelAttribute("command")User user,BindingResult bindingResult,HttpSession session){
			usernoValidator.validate(user, bindingResult);
			if(bindingResult.hasErrors()){
				return "/user/newuserno";
			}else{
				int n=userService.addUserno(user);
				if(n>0){
					return "success3";
				}else{
					return "fail5";
				}
			}
		}
		
		//ע��ɹ�����ע����
				@RequestMapping("addUserno2.do")
				public String addUserno2(@ModelAttribute("command")User user,BindingResult bindingResult,HttpSession session){
					usernoValidator.validate(user, bindingResult);
					if(bindingResult.hasErrors()){
						return "/user/newuserno";
					}else{
						int n=userService.addUserno(user);
						if(n>0){
							return "success4";
						}else{
							return "fail6";
						}
					}
				}
	
	
	//��ѯ���������޸���ʾ
	@RequestMapping("selectOneForUpdate.do")
	public String selectOneForUpdate(User user,HttpSession session){
		List listOne=userService.selectOne(user);
		session.setAttribute("listOne", listOne);
		return "/user/update";
	}
	
	@RequestMapping("update.do")
	public String update(User user,HttpSession session){
		int n=userService.update(user);
		if(n>0){
			return "success";
		}else{
			return "fail";
		}
	}
	
	//��ע�����û��޸�
	@RequestMapping("updateOff.do")
	public String updateOff(User user,HttpSession session){
		int n=userService.update(user);
		if(n>0){
			return "success2";
		}else{
			return "fail2";
		}
	}
	
		//ע��
			@RequestMapping("offUpdate.do")
			public String offUpdate(User user,HttpSession session){
				int n=userService.offUpdate(user);
				if(n>0){
					return "/user/login";
				}else{
					return "fail";
				}
			}
	
	//��ʾ�û��µ������˻�
			@RequestMapping("allUserno.do")
			public String allUserno(User user,HttpSession session){
				List allUserno=userService.allUserno(user);
				session.setAttribute("allUserno", allUserno);
				return "/user/allUserno";
			}
}

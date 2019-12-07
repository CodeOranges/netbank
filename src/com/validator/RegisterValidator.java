package com.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.entity.User;

@Component
public class RegisterValidator implements Validator {

	public boolean supports(Class clazz) {
		return User.class.isAssignableFrom(clazz);
	}

	public void validate(Object obj, Errors errors) {
		User user=(User) obj;
		ValidationUtils.rejectIfEmpty(errors, "username", "username.required","*用户名不能为空");
		ValidationUtils.rejectIfEmpty(errors, "password", "password.required","*密码不能为空");
		ValidationUtils.rejectIfEmpty(errors, "password1", "password.required","*重复密码不能为空");
		ValidationUtils.rejectIfEmpty(errors, "idcard", "password.required","*身份证号不能为空");
		ValidationUtils.rejectIfEmpty(errors, "tel", "password.required","*联系电话不能为空");
		ValidationUtils.rejectIfEmpty(errors, "city", "username.required","*居住城市不能为空");
		ValidationUtils.rejectIfEmpty(errors, "useraddress", "password.required","*详细地址不能为空");
		
		//判断重复密码与密码是否一致
		if(!user.getPassword().equals("")&&!user.getPassword1().equals("")&&!user.getPassword1().equals(user.getPassword())){
			errors.rejectValue("password1", "notsame", null, "*两次密码不一致");
		}
		//判断身份证号是否18位
		if(!user.getIdcard().equals("")&&user.getIdcard().length()!=18){
			errors.rejectValue("idcard", "not18", null, "*身份证位数有误");
		}
		//判断手机号是否11位
		if(!user.getTel().equals("")&&user.getTel().length()!=11){
			errors.rejectValue("tel", "not11", null, "*手机号码位数有误");
		}
	}

}

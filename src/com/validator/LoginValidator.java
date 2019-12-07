package com.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.entity.User;

@Component
public class LoginValidator implements Validator {

	public boolean supports(Class clazz) {
		return User.class.isAssignableFrom(clazz);
	}

	public void validate(Object obj, Errors errors) {
		User user=(User) obj;
		ValidationUtils.rejectIfEmpty(errors, "userno", "userno.required","*�˺Ų���Ϊ��");
		ValidationUtils.rejectIfEmpty(errors, "password", "password.required","*���벻��Ϊ��");
	}

}

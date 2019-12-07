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
		ValidationUtils.rejectIfEmpty(errors, "username", "username.required","*�û�������Ϊ��");
		ValidationUtils.rejectIfEmpty(errors, "password", "password.required","*���벻��Ϊ��");
		ValidationUtils.rejectIfEmpty(errors, "password1", "password.required","*�ظ����벻��Ϊ��");
		ValidationUtils.rejectIfEmpty(errors, "idcard", "password.required","*���֤�Ų���Ϊ��");
		ValidationUtils.rejectIfEmpty(errors, "tel", "password.required","*��ϵ�绰����Ϊ��");
		ValidationUtils.rejectIfEmpty(errors, "city", "username.required","*��ס���в���Ϊ��");
		ValidationUtils.rejectIfEmpty(errors, "useraddress", "password.required","*��ϸ��ַ����Ϊ��");
		
		//�ж��ظ������������Ƿ�һ��
		if(!user.getPassword().equals("")&&!user.getPassword1().equals("")&&!user.getPassword1().equals(user.getPassword())){
			errors.rejectValue("password1", "notsame", null, "*�������벻һ��");
		}
		//�ж����֤���Ƿ�18λ
		if(!user.getIdcard().equals("")&&user.getIdcard().length()!=18){
			errors.rejectValue("idcard", "not18", null, "*���֤λ������");
		}
		//�ж��ֻ����Ƿ�11λ
		if(!user.getTel().equals("")&&user.getTel().length()!=11){
			errors.rejectValue("tel", "not11", null, "*�ֻ�����λ������");
		}
	}

}

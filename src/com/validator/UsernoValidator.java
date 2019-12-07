package com.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.entity.User;

@Component
public class UsernoValidator implements Validator {

	public boolean supports(Class clazz) {
		return User.class.isAssignableFrom(clazz);
	}

	public void validate(Object obj, Errors errors) {
		User user=(User) obj;
		ValidationUtils.rejectIfEmpty(errors, "userno", "userno.required","*�����Ҳ��ȡ���˻�");
		ValidationUtils.rejectIfEmpty(errors, "password", "password.required","*���벻��Ϊ��");
		//�ж��ظ������������Ƿ�һ��
				if(!user.getPassword().equals("")&&!user.getPassword1().equals("")&&!user.getPassword1().equals(user.getPassword())){
					errors.rejectValue("password1", "notsame", null, "*�������벻һ��");
				}
	}

}

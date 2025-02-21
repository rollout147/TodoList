package com.oracle.todoList.service;

import com.oracle.todoList.model.User_Table;

public interface UserService {

	// 로그인
	User_Table 		login(String user_id, String user_pw);

	// 회원가입
	int 			join(User_Table user_table);

}

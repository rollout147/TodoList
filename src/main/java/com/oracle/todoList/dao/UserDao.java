package com.oracle.todoList.dao;

import com.oracle.todoList.model.User_Table;

public interface UserDao {

	// 로그인
	User_Table 	login(String user_id);

	// 회원가입
	int 		join(User_Table user_table);

}

package com.oracle.todoList.service;

import com.oracle.todoList.model.User_Table;

public interface UserService {

	User_Table 			login(String user_id, String user_pw);

}

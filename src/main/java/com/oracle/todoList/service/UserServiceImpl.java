package com.oracle.todoList.service;

import org.springframework.stereotype.Service;

import com.oracle.todoList.model.User_Table;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

	// 로그인
	@Override
	public User_Table login(String user_id, String user_pw) {
		// TODO Auto-generated method stub
		return null;
	}

}

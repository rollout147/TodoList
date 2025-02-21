package com.oracle.todoList.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.todoList.model.User_Table;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class UserDaoImpl implements UserDao {
	private final SqlSession session;
	

	// 로그인
	@Override
	public User_Table login(String user_id) {
		System.out.println("UserDaoImpl login Start...");
		
		User_Table user_table = new User_Table();
		
		try {
			user_table.setUser_id(user_id);
			
			user_table = session.selectOne("login", user_table);
			System.out.println("UserDaoImpl login user_table->"+user_table);
			
		} catch (Exception e) {
			System.out.println("UserDaoImpl login Exception->"+e.getMessage());
		}
		
		return user_table;
	}


	// 회원가입
	@Override
	public int join(User_Table user_table) {
		int result = 0;
		System.out.println("UserDaoImpl join Start...");

		try {
			result = session.insert("insertJoin", user_table);
			System.out.println("UserDaoImpl insertJoin user_table->"+user_table);
			System.out.println("UserDaoImpl insertJoin result->"+result);
			
		} catch (Exception e) {
			System.out.println("UserDaoImpl join Exception->"+e.getMessage());
		}
		
		
		return result;
	}

}

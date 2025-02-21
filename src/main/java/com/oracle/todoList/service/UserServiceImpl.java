package com.oracle.todoList.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.oracle.todoList.dao.UserDao;
import com.oracle.todoList.model.User_Table;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
	private final UserDao ud;
	// Spring Security에서 제공하는 비밀번호 암호화(해싱) 클래스
	private final BCryptPasswordEncoder passwordEncoder;

	// 로그인
	@Override
	public User_Table login(String user_id, String user_pw) {
		System.out.println("UserServiceImpl login Start...");
		
		User_Table user_table = ud.login(user_id);
		System.out.println("UserServiceImpl login user_table->"+user_table);
		
		// 일치하는 ID가 없으면 로그인 실패
		if (user_table == null) {
			System.out.println("일치하는 ID가 없습니다");
			return null;
		}
		
		// 입력한 PW와 DB에 저장된 해시화 PW 비교
		boolean passwordMatch = passwordEncoder.matches(user_pw, user_table.getUser_pw());
		System.out.println("UserServiceImpl login passwordMatch->"+passwordMatch);
		
		// 비밀번호가 일치하지 않을 때
		if (!passwordMatch) {
			System.out.println("비밀번호가 일치하지 않습니다");
			return null;
		}
				
		return user_table;
	}

	
	// 회원가입
	@Override
	public int join(User_Table user_table) {
		System.out.println("UserServiceImpl join Start...");
		
		String encodePassword = passwordEncoder.encode(user_table.getUser_pw());
		System.out.println("UserServiceImpl join encodePassword->"+encodePassword);
		
		user_table.setUser_pw(encodePassword);
		
		int joinUser = ud.join(user_table);
		System.out.println("UserServiceImpl join joinUser->"+joinUser);
		
		return joinUser;
	}

}

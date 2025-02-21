package com.oracle.todoList.controller;

import org.apache.catalina.manager.util.SessionUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.todoList.model.User_Table;
import com.oracle.todoList.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class UserController {
	private final UserService us;
	

	// 로그인화면
	@GetMapping(value = "login")
	public String loginForm() {
		System.out.println("UserController loginForm Start...");
		
		return "login";
	}
	
	// 로그인
	@PostMapping(value = "login")
	public String login(@RequestParam("user_id") String user_id,
						@RequestParam("user_pw") String user_pw,
						Model model,
						HttpSession session,
						HttpServletRequest request
						) {
		System.out.println("UserController login Start...");
		
		User_Table user_table = new User_Table();
		user_table = us.login(user_id, user_pw);
		System.out.println("UserController login user_table->"+user_table);
		
		// 로그인 실패
		if (user_table == null) {
			model.addAttribute("loginFailed", "아이디 또는 비밀번호가 틀렸습니다.");
			
			// 입력한 아이디 다시 전달
			model.addAttribute("user_id", user_id);
			
			System.out.println("loginFailed");
			return "login";
		}
		
		// 로그인 성공
		String user_id2 = user_table.getUser_id();
		System.out.println("UserController login user_id2->"+user_id2);
		System.out.println("로그인 성공");
		
		// 기존 세션 무효화
		session.invalidate();
		// 새로운 세션 ID 발급
		session = request.getSession(true);
		// 사용자 정보를 새로운 세션에 저장
		session.setAttribute("user", user_table);
		
		return "redirect:/";
	}
	
	// 로그아웃
	@GetMapping(value = "logout")
	public String logout(HttpSession session, Model model) {
		System.out.println("UserController logout Start...");
		
		session.invalidate();
		System.out.println("UserController logout Success");
		
		return "redirect:/";
	}
	
	// 회원가입
	@PostMapping(value = "join")
	public String join(@ModelAttribute User_Table user_table, Model model) {
		System.out.println("UserController join Start...");
		System.out.println("UserController join user_table->"+user_table);
		
		int joinUser = us.join(user_table);
		System.out.println("UserController join joinUser->"+joinUser);
		
		if (joinUser > 0) {
			System.out.println("UserController join Success");
			return "joinSuccess";
			
		} else {
			model.addAttribute("msg", "회원가입에 실패하였습니다.");
			System.out.println("UserController join Failed");
			return "redirect:/";
		}
		
			
	}
	
	
	// 아이디 찾기
	
	
	
	
	// 비번 찾기
}

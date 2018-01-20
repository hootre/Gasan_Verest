package com.verest.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.verest.board.model.UserInfo;
import com.verest.board.model.CommonException;
import com.verest.board.service.UserInfoService;

@Controller
public class UserWebController {
	@Autowired
	private UserInfoService userInfoService;

	@Autowired
	private PasswordEncoder encoder;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homePage(Model model) {

		String email = this.getPrincipal();
		
		if (email != null && !email.trim().isEmpty()) {
			UserInfo item = userInfoService.detail(email);
			model.addAttribute("userInfo", item);
		}
		
		return "/index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {

		return "login";
	}
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminPage(Model model) {
		model.addAttribute("userInfo", this.getPrincipal());
		return "admin";
	}
	
	// 사용자정보
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String myPage(Model model) {
		
		UserInfo userinfo = userInfoService.detail(this.getPrincipal());
		model.addAttribute("item", userinfo);
		
		return "mypage";
	}

	@RequestMapping(value = "/access-denied", method = RequestMethod.GET)
	public String accessDeniedPage(Model model) {
		model.addAttribute("email", this.getPrincipal());
		return "access-denied";
	}

	@RequestMapping(value = "/logout" , method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}

		return "redirect:/login?action=logout";
	}
	
		// 사용자 수정하기 화면
		@RequestMapping(value = "/modify", method = RequestMethod.GET)
		public String modify(Model model) throws CommonException {

			UserInfo item = null;

			String email = this.getPrincipal();
			item = userInfoService.detail(email);

			model.addAttribute("item", item);

			return "modify";
		}
		
		// 사용자 수정 후, 사용자 설정 화면으로 이동
		@RequestMapping(value = "/modify", method = RequestMethod.POST)
		public String modify(HttpServletRequest request,
				Integer id,
				String oldPassword,
				String newPassword,
				String name)
						throws CommonException,Exception {

			// 기존 비밀번호 검사 후 수정할지 결정
			boolean isMatched = userInfoService.isPasswordMatched(id, oldPassword);
			if (!isMatched) {
				return "redirect:/modify?action=error-password";
			}

			UserInfo user = new UserInfo();
			user.setV_id(id);
			user.setV_password(encoder.encode(newPassword));
			user.setV_name(name);
			
			userInfoService.modify(user);

			return "redirect:/mypage";
		}
	
		@RequestMapping(value = "/delete" , method = RequestMethod.GET)
		public String delete() {
			return "delete";
		}

		@RequestMapping(value = "/delete" , method = RequestMethod.POST)
		public String delete(HttpServletRequest request, HttpServletResponse response, String password) throws CommonException {
			String email = this.getPrincipal();
			UserInfo item = userInfoService.detail(email);
			// 기존 비밀번호 검사 후 수정할지 결정
			boolean isMatched = userInfoService.isPasswordMatched(item.getV_id(), password);
			if (!isMatched) {
				return "redirect:/delete?action=error-password";
			}
			userInfoService.delete(email, password);
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();

			if (auth != null) {
				new SecurityContextLogoutHandler().logout(request, response, auth);
			}
			return "redirect:/?type=delete";
		}
		
		
		@RequestMapping(value = "/join", method = RequestMethod.GET)
		public String joinPage() {
			return "join";
		}

		@RequestMapping(value = "/join", method = RequestMethod.POST)
		public String newUser(HttpServletRequest request,
				String email,
				String password,
				String name)
						throws CommonException, Exception {

			UserInfo user = new UserInfo();
			user.setV_email(email);
			user.setV_password(password);
			user.setV_name(name);

			userInfoService.newUser(user);

			return "redirect:login";
		}
	// 현재 접속한 사용자의 email 리턴
	private String getPrincipal() {
		String username = null;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();

		if (principal instanceof UserDetails) {
			username = ((UserDetails) principal).getUsername();
		} else {
			username = principal.toString();
		}

		return username;
	}
}

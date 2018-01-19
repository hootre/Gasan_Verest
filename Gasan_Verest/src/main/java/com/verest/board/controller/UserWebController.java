package com.verest.board.controller;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.verest.board.model.UserInfo;
import com.verest.board.model.CommonException;
import com.verest.board.model.Port;
import com.verest.board.service.FileService;
import com.verest.board.service.PortService;
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

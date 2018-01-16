package com.verest.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.verest.board.model.CommonException;
import com.verest.board.model.Port;
import com.verest.board.model.UserInfo;
import com.verest.board.service.FileService;
import com.verest.board.service.PortService;
import com.verest.board.service.UserInfoService;

@Controller
public class UserWebController {
	@Autowired
	private UserInfoService userInfoService;
	
	@Autowired
	private PortService portService;

	@Autowired
	private PasswordEncoder encoder;

	@Autowired
	private FileService fileService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homePage(Model model) {

		return "/index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {

		return "/login";
	}

	// 글 목록 화면
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) throws CommonException {
		List<Port> list = null;

		list = portService.list();
		model.addAttribute("list", list);

		return "list";
	}
	
	// 글 목록 화면
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public String  user(Model model) throws CommonException {
		UserInfo list = null;

		list = userInfoService.detail("hootre@naver.com");
		model.addAttribute("list", list);

		return "user";
	}
}

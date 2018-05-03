package com.verest.board.controller;


import java.io.UnsupportedEncodingException;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.verest.board.model.UserInfo;
import com.verest.board.model.CommonException;
import com.verest.board.model.Port;
import com.verest.board.model.Project;
import com.verest.board.model.Sale;
import com.verest.board.service.PortService;
import com.verest.board.service.ProjectService;
import com.verest.board.service.SaleService;
import com.verest.board.service.UserInfoService;

@Controller
public class UserWebController {
	
	@Autowired
	private ProjectService ProService;
	
	@Autowired
	private PortService PortService;
	
	@Autowired
	private SaleService SaleService;
	
	@Autowired
	private UserInfoService userInfoService;

	@Autowired
	private PasswordEncoder encoder;

	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public String error(Model model) {

		return "/error";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homePage(Model model) {

		String email = this.getPrincipal();
		UserInfo item = null;
		if (email != null && !email.trim().isEmpty()) {
			 item = userInfoService.detail(email);
			model.addAttribute("userInfo", item);
		}
		
		List<Port> port = PortService.list();
		

		model.addAttribute("port", port);
		
		port = null;
		item = null;
		return "/index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {

		return "user/login";
	}
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminPage(Model model) {
		
		UserInfo userinfo = userInfoService.detail(this.getPrincipal());
		
		model.addAttribute("name", userinfo.getV_name());
		userinfo = null;
		return "admin/admin";
	}
	// 사용자 목록 화면
		@RequestMapping(value = "/video/list", method = RequestMethod.GET)
		public String videolist(Model model) throws CommonException {
		   
			String email = this.getPrincipal();
			UserInfo item = null;
			if (email != null && !email.trim().isEmpty()) {
				item = userInfoService.detail(email);
				model.addAttribute("userInfo", item);
			}
			List<Project> pro = ProService.list();
			List<Port> port = PortService.list();
			List<Sale> sale = SaleService.list();
			
			model.addAttribute("pro", pro);
			model.addAttribute("port", port);
			model.addAttribute("sale", sale);
			item = null;
			return "admin/video_list";
		}
	
		// 사용자 목록 화면
		@RequestMapping(value = "/list", method = RequestMethod.GET)
		public String list(Model model) throws CommonException {
			List<UserInfo> list = null;
	    
			String email = this.getPrincipal();
			UserInfo item = null;
			if (email != null && !email.trim().isEmpty()) {
				item = userInfoService.detail(email);
				model.addAttribute("userInfo", item);
			}
			
			list = userInfoService.list();
			
			model.addAttribute("list", list);
			item = null;
			return "admin/list";
		}
	
	// 사용자정보
	@RequestMapping(value = "/user/mypage", method = RequestMethod.GET)
	public String myPage(Model model) {
		
		UserInfo userinfo = userInfoService.detail(this.getPrincipal());
		model.addAttribute("item", userinfo);
		userinfo  = null;
		return "user/mypage";
	}

	@RequestMapping(value = "/access-denied", method = RequestMethod.GET)
	public String accessDeniedPage(Model model) {
		model.addAttribute("email", this.getPrincipal());
		return "user/access-denied";
	}

	@RequestMapping(value = "/logout" , method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}

		return "redirect:/login?action=logout";
	}
		
		// 사용자 수정 후, 사용자 설정 화면으로 이동
		@RequestMapping(value = "/user/modify", method = RequestMethod.POST)
		public String modify(HttpServletRequest request,
				Integer id,
				String oldPassword,
				String newPassword,
				String okPassword)
						throws CommonException,Exception {

			if (!newPassword.equals(okPassword)) {
				return "redirect:/user/mypage?action=notok-password";
			}
			
			// 기존 비밀번호 검사 후 수정할지 결정
			boolean isMatched = userInfoService.isPasswordMatched(id, oldPassword);
			if (!isMatched) {
				return "redirect:/user/mypage?action=error-password";
			}

			UserInfo user = new UserInfo();
			user.setV_id(id);
			user.setV_password(encoder.encode(newPassword));
			
			userInfoService.modify(user);
			user  = null;
			return "redirect:/user/mypage?action=ok-modify";
		}

		// 글 삭제 확인 화면
		@RequestMapping(value = "/user/delete", method = RequestMethod.GET)
		public String removeConfirm(HttpServletRequest request,
				@RequestParam(value = "v_id", required = true) String v_id)
						throws CommonException, UnsupportedEncodingException  {
				String[] nos = v_id.split("-");

				if(nos != null && nos.length>0){
					for (String v_ids : nos) {
						System.out.println(v_ids.toString());
						userInfoService.delete(Integer.parseInt(v_ids.toString()));
					}
				}  
			
			return "redirect:/list";
		}
		
		@RequestMapping(value = "/user/delete" , method = RequestMethod.POST)
		public String delete(HttpServletRequest request, HttpServletResponse response, String password) throws CommonException {
			String email = this.getPrincipal();
			UserInfo item = userInfoService.detail(email);
			
			// 기존 비밀번호 검사 후 수정할지 결정
			boolean isMatched = userInfoService.isPasswordMatched(item.getV_id(), password);
			if (!isMatched) {
				return "redirect:/user/mypage?action=delete-password";
			}
			userInfoService.delete(email, password);
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();

			if (auth != null) {
				new SecurityContextLogoutHandler().logout(request, response, auth);
			}
			item  = null;
			return "redirect:/?type=delete";
		}
		
		
		@RequestMapping(value = "/join", method = RequestMethod.GET)
		public String joinPage() {
			return "user/join";
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
			user = null;
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

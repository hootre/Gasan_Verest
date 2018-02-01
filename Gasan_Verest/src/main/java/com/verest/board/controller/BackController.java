package com.verest.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.verest.board.model.UserInfo;
import com.verest.board.model.Backsight;
import com.verest.board.model.CommonException;
import com.verest.board.service.BacksightService;
import com.verest.board.service.UserInfoService;

@Controller
@RequestMapping("/back")
public class BackController {
	
	@Autowired
	private UserInfoService userInfoService;

	@Autowired
	private BacksightService BackService;


	// 글 작성 화면
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String newBoard(Model model) {
		
		String v_email = this.getPrincipal();
		UserInfo item = userInfoService.detail(v_email);
		
		model.addAttribute("writer", item.getV_id());
		model.addAttribute("email", item.getV_email());

		return "back/new";
	}
	
	// 글 작성 화면
	@RequestMapping(value = "/new", method = RequestMethod.POST)
	public String newBoard(HttpServletRequest request,
			String content,
			String title,
			Integer b_like
			) throws CommonException, Exception{
		Backsight back = new Backsight();
		UserInfo user = userInfoService.detail(this.getPrincipal());
		back.setContent(content);
		back.setTitle(title);
		back.setB_like(b_like);
		back.setWriter(user.getV_id());
		
		BackService.newBoard(back);
		
		return "redirect:/back/list";
	}
	
	// 글 목록 화면
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) throws CommonException {
		List<Backsight> list = null;
		
		list = BackService.list();
		
		model.addAttribute("list", list);

		return "back/list";
	}
	
	// 글 상세 화면
		@RequestMapping(value = "/detail", method = RequestMethod.GET)
		public String detail(Model model, 
				@RequestParam(value = "back_no", required=true) Integer back_no)
						throws CommonException, Exception {
			Backsight back = null;

			back = BackService.detail(back_no);
			
			model.addAttribute("item", back);

			return "back/detail";	// /WEB-INF/views/detail.jsp 페이지로 이동
		}
	
	// 글 삭제 확인 화면
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String removeConfirm(Model model,
		@RequestParam(value = "back_no", required = true) Integer back_no) {
			
		BackService.remove(back_no);
		
		return "redirect:/back/list";
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

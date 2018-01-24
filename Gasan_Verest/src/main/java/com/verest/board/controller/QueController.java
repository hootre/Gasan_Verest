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
import com.verest.board.model.CommonException;
import com.verest.board.model.Question;
import com.verest.board.service.QuestionService;
import com.verest.board.service.UserInfoService;

@Controller
@RequestMapping("/que")
public class QueController {
	
	@Autowired
	private UserInfoService userInfoService;

	@Autowired
	private QuestionService QueService;


	// 글 작성 화면
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String newBoard(Model model) {
		
		String v_email = this.getPrincipal();
		UserInfo item = userInfoService.detail(v_email);
		
		model.addAttribute("writer", item.getV_id());
		model.addAttribute("email", item.getV_email());

		return "que/new";
	}
	
	// 글 작성 화면
	@RequestMapping(value = "/new", method = RequestMethod.POST)
	public String newBoard(HttpServletRequest request,
			String content,
			String title
			) throws CommonException, Exception{
		Question que = new Question();
		UserInfo user = userInfoService.detail(this.getPrincipal());
		que.setContent(content);
		que.setTitle(title);
		que.setWriter(user.getV_id());
		
		QueService.newBoard(que);
		
		return "redirect:/que/list";
	}
	
	// 글 목록 화면
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) throws CommonException {
		List<Question> list = null;
		
		list = QueService.list();
		
		model.addAttribute("list", list);

		return "que/list";
	}
	
	// 글 상세 화면
		@RequestMapping(value = "/detail", method = RequestMethod.GET)
		public String detail(Model model, 
				@RequestParam(value = "qu_no", required=true) Integer qu_no)
						throws CommonException, Exception {
			Question que = null;

			que = QueService.detail(qu_no);
			
			model.addAttribute("item", que);

			return "que/detail";	// /WEB-INF/views/detail.jsp 페이지로 이동
		}
	
	// 글 삭제 확인 화면
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String removeConfirm(Model model,
		@RequestParam(value = "qu_no", required = true) Integer qu_no) {
			
		QueService.remove(qu_no);
		
		return "redirect:/que/list";
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
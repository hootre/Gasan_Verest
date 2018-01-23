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
import com.verest.board.model.Basket;
import com.verest.board.model.CommonException;
import com.verest.board.model.Sale;
import com.verest.board.service.BasketService;
import com.verest.board.service.SaleService;
import com.verest.board.service.UserInfoService;

@Controller
@RequestMapping("/bas")
public class BasController {
	@Autowired
	private UserInfoService userInfoService;

	@Autowired
	private BasketService BasService;


	// 글 작성 화면
	@RequestMapping(value = "/new", method = RequestMethod.POST)
	public String newBoard(HttpServletRequest request,
			Integer sale_no
			) throws CommonException, Exception{
		Basket bas = new Basket();
		UserInfo user = userInfoService.detail(this.getPrincipal());
		bas.setV_id(user.getV_id());
		bas.setSale_no(sale_no);
		BasService.newBoard(bas);
		
		return "redirect:/sale/detail?no="+ sale_no + "&action=newbas";
	}
	
	// 글 목록 화면
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) throws CommonException {
		List<Basket> list = null;
		UserInfo user = userInfoService.detail(this. getPrincipal());
		list = BasService.list(user.getV_id());
		
		model.addAttribute("list", list);

		return "bas/list";
	}
	
		// 글 삭제 확인 화면
		@RequestMapping(value = "/remove", method = RequestMethod.GET)
		public String removeConfirm(Model model,
				@RequestParam(value = "basket_no", required = true) Integer basket_no) {
				
			BasService.remove(basket_no);
			
			return "redirect:/bas/list";
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

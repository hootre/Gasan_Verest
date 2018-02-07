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
import com.verest.board.model.Order_list;
import com.verest.board.model.Sale;
import com.verest.board.service.BasketService;
import com.verest.board.service.Order_listService;
import com.verest.board.service.SaleService;
import com.verest.board.service.UserInfoService;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private UserInfoService userInfoService;

	@Autowired
	private Order_listService OrdService;
	
	@Autowired
	private SaleService SaleService;

	// 글 작성 화면
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String newBoard(Model model,
			@RequestParam(value = "sale_no", required = true) Integer sale_no) {

		Order_list ord = new Order_list();
		UserInfo user = userInfoService.detail(this.getPrincipal());
		ord.setV_id(user.getV_id());
		ord.setSale_no(sale_no);
		OrdService.newBoard(ord);
		
		Sale sale = SaleService.detail(sale_no);
		model.addAttribute("item", sale);

		return "order/Confirm";
	}
	
	// 글 작성 화면
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Model model,
			@RequestParam(value = "sale_no", required = true) Integer sale_no) {
		
		Sale sale = SaleService.detail(sale_no);
		model.addAttribute("item", sale);

		return "order/Confirm";
	}
	
	// 글 목록 화면
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) throws CommonException {
		List<Order_list> list = null;
		UserInfo user = userInfoService.detail(this. getPrincipal());
		list = OrdService.list(user.getV_id());
		model.addAttribute("list", list);

		return "order/list";
	}
	
		// 글 삭제 확인 화면
		@RequestMapping(value = "/remove", method = RequestMethod.GET)
		public String removeConfirm(Model model,
				@RequestParam(value = "or_no", required = true) Integer or_no) {
			OrdService.remove(or_no);
			
			return "redirect:/order/list";
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

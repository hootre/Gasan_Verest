package com.verest.board.controller;

import java.io.UnsupportedEncodingException;
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
import com.verest.board.model.Port;
import com.verest.board.model.Project;
import com.verest.board.model.Sale;
import com.verest.board.service.PortService;
import com.verest.board.service.ProjectService;
import com.verest.board.service.SaleService;
import com.verest.board.service.UserInfoService;

@Controller
@RequestMapping("/sale")
public class SaleController {
	@Autowired
	private UserInfoService userInfoService;

	@Autowired
	private SaleService SaleService;

	// 글 작성 화면
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String newBoard(Model model) {
		
		String v_email = this.getPrincipal();
		UserInfo item = userInfoService.detail(v_email);
		
		model.addAttribute("writer", item.getV_id());
		model.addAttribute("email", item.getV_email());

		return "sale/new";
	}
	
	// 글 작성 후, 글 목록 화면으로 이동
		@RequestMapping(value = "/new", method = RequestMethod.POST)
		public String newBoard(HttpServletRequest request,
				Integer writer,
				Integer price,
				String title,
				String content,
				String attachment)
						throws CommonException, Exception {

			Sale sale = new Sale();
			sale.setWriter(writer);
			sale.setPrice(price);
			sale.setTitle(title);
			sale.setContent(content);
			String s = attachment;
			String address = s.replace("watch?v=", "embed/");
			sale.setAttachment(address);
			
			SaleService.newBoard(sale);

			return "redirect:/sale/list";
		}
	
	// 글 목록 화면
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) throws CommonException {
		List<Sale> list = null;
    
		list = SaleService.list();
		
		model.addAttribute("list", list);

		return "sale/list";
	}
	
	// 글 상세 화면
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Model model, 
			@RequestParam(value = "no", required=true) Integer no)
					throws CommonException, Exception {
		Sale sale = null;

		sale = SaleService.detail(no);

		sale.setViews(sale.getViews()+1);
		SaleService.viewsup(sale);
		
		model.addAttribute("item", sale);

		return "sale/detail";	// /WEB-INF/views/detail.jsp 페이지로 이동
	}

	// 글 수정하기 화면
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify(Model model,
			@RequestParam(value = "no", required = true) Integer no)
					throws CommonException {

		Sale sale = null;

		sale = SaleService.detail(no);

		model.addAttribute("item", sale);

		return "sale/modify";
	}
	
	// 글 수정 후, 글 목록 화면으로 이동
		@RequestMapping(value = "/modify", method = RequestMethod.POST)
		public String modify(HttpServletRequest request,
				int no,
				String title,
				Integer price,
				String content,
				String attachment,
				String password)
						throws CommonException, Exception {
			
			// 비밀번호 비교해서 같지 않다면 오류메시지 출력
			boolean isMatched = userInfoService.isBoardMatched(no, password);
			if (!isMatched) {
				return "redirect:/sale/modify?no=" + no + "&action=error-password";
			}

			Sale sale = new Sale();
			sale.setPrice(price);
			sale.setTitle(title);
			sale.setContent(content);
			String s = attachment;
			String address = s.replace("watch?v=", "embed/");
			sale.setAttachment(address);
			
			SaleService.modify(sale);
			

			return "redirect:/sale/list";
		}
	
		// 글 삭제 확인 화면
		@RequestMapping(value = "/remove", method = RequestMethod.GET)
		public String removeConfirm(Model model,
				@RequestParam(value = "no", required = true) Integer no) {

			model.addAttribute("no", no);

			return "sale/remove-confirm";
		}

		// 글 삭제 후, 글 목록 화면으로 이동
		@RequestMapping(value = "/remove", method = RequestMethod.POST)
		public String remove(HttpServletRequest request,
				@RequestParam(value = "no", required = true) Integer no,
				String v_password)
						throws CommonException, UnsupportedEncodingException {
			
			boolean isMatched = userInfoService.isBoardMatched(no, v_password);
			if (!isMatched) {
				return "redirect:/sale/remove?no=" + no + "&action=error-password";
			}
			SaleService.remove(no);
			
			return "redirect:/sale/list";
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

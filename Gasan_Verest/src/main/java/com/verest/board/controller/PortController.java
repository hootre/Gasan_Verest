package com.verest.board.controller;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;

import com.verest.board.model.UserInfo;
import com.verest.board.model.CommonException;
import com.verest.board.model.Port;
import com.verest.board.service.FileService;
import com.verest.board.service.PortService;
import com.verest.board.service.UserInfoService;

@Controller
@RequestMapping("/port")
public class PortController {
	@Autowired
	private UserInfoService userInfoService;

	@Autowired
	private PortService portService;
	
	@Autowired
	private FileService fileService;
	
	private static final String UPLOAD_FOLDER = "/upload";

	// 글 작성 화면
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String newBoard(Model model) {
		
		String v_email = this.getPrincipal();
		UserInfo item = userInfoService.detail(v_email);
		System.out.println(item.getV_id());
		
		model.addAttribute("writer", item.getV_id());
		model.addAttribute("email", item.getV_email());

		return "port/new";
	}
	
	// 글 작성 후, 글 목록 화면으로 이동
		@RequestMapping(value = "/new", method = RequestMethod.POST)
		public String newBoard(HttpServletRequest request,
				Integer writer,
				String title,
				String content,
				@RequestParam("attachment") MultipartFile attachment)
						throws CommonException, Exception {

			Port port = new Port();
			port.setWriter(writer);
			port.setTitle(title);
			port.setContent(content);

			// 최상위 경로 밑에 upload 폴더의 경로를 가져온다.
			String path = request.getServletContext().getRealPath(UPLOAD_FOLDER);

			// MultipartFile 객체에서 파일명을 가져온다.
			String originalName = attachment.getOriginalFilename();

			// upload 폴더가 없다면, upload 폴더 생성
			File directory = new File(path);
			if (!directory.exists()) {
				directory.mkdir();
			}

			// attachment 객체를 이용하여, 파일을 서버에 전송
			if (attachment != null && !attachment.isEmpty()) {
				int idx = originalName.lastIndexOf(".");
				String name = originalName.substring(0, idx);
				String ext = originalName.substring(idx, originalName.length());
				String uploadFilename = name
						+ Long.toHexString(System.currentTimeMillis())
						+ ext;
				attachment.transferTo(new File(path, uploadFilename));
				uploadFilename = URLEncoder.encode(uploadFilename, "UTF-8");
				port.setAttachment(uploadFilename);
				System.out.println(uploadFilename);
			}

			System.out.println(writer);
			System.out.println(title);
			System.out.println(content);
			portService.newBoard(port);

			return "redirect:/port/list";
		}
	
	// 글 목록 화면
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) throws CommonException {
		List<Port> list = null;

		
		model.addAttribute("list", list);

		return "port/list";
	}
	
	// 글 상세 화면
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Model model, 
			@RequestParam(value = "no", required=true) String no)
					throws CommonException, Exception {
		Port port = null;
		String filename = null;

		port = portService.detail(no);
		filename = port.getAttachment();
		if (filename != null && !filename.trim().isEmpty()) {
			filename = URLDecoder.decode(filename, "UTF-8");
		}

		port.setViews(port.getViews()+1);
		portService.viewsup(port);
		
		model.addAttribute("item", port);
		model.addAttribute("filename", filename);

		return "port/detail";	// /WEB-INF/views/detail.jsp 페이지로 이동
	}

	// 글 수정하기 화면
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify(Model model,
			@RequestParam(value = "no", required = true) String no)
					throws CommonException {

		Port port = null;

		port = portService.detail(no);

		model.addAttribute("item", port);

		return "port/modify";
	}
	
	// 글 수정 후, 글 목록 화면으로 이동
		@RequestMapping(value = "/modify", method = RequestMethod.POST)
		public String modify(HttpServletRequest request,
				int no,
				String title,
				String content,
				@RequestParam("attachment") MultipartFile attachment,
				String password)
						throws CommonException, Exception {
			
			// 비밀번호 비교해서 같지 않다면 오류메시지 출력
			boolean isMatched = userInfoService.isBoardMatched(no, password);
			if (!isMatched) {
				return "redirect:/port/modify?no=" + no + "&action=error-password";
			}

			Port port = new Port();
			port.setNo(no);
			port.setTitle(title);
			port.setContent(content);

			String path = request.getServletContext().getRealPath(UPLOAD_FOLDER);
			String originalName = attachment.getOriginalFilename();

			// attachment 객체를 이용하여, 파일을 서버에 전송
			if (attachment != null && !attachment.isEmpty()) {
				int idx = originalName.lastIndexOf(".");
				String name = originalName.substring(0, idx);
				String ext = originalName.substring(idx, originalName.length());
				String uploadFilename = name
						+ Long.toHexString(System.currentTimeMillis())
						+ ext;
				attachment.transferTo(new File(path, uploadFilename));
				uploadFilename = URLEncoder.encode(uploadFilename, "UTF-8");
				port.setAttachment(uploadFilename);
			}

			String oldFilename = portService.modify(port);
			if (oldFilename != null && !oldFilename.trim().isEmpty()) {
				fileService.remove(request, UPLOAD_FOLDER, oldFilename);
			}

			return "redirect:/port/list";
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

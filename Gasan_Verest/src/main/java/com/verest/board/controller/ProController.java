package com.verest.board.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
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
import com.verest.board.model.Project;
import com.verest.board.service.FileService;
import com.verest.board.service.ProjectService;
import com.verest.board.service.UserInfoService;

@Controller
@RequestMapping("/pro")
public class ProController {

	private static final String UPLOAD_FOLDER = "/upload/pro";

	private Logger logger = LogManager.getLogger(this.getClass());

	@Autowired
	private UserInfoService userInfoService;

	@Autowired
	private FileService fileService;

	@Autowired
	private ProjectService proService;

	// 글 작성 화면
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String newBoard(Model model) {
		UserInfo user  = null;
		if (!(this.getPrincipal() == null)) {
			user = userInfoService.detail(this.getPrincipal());
			model.addAttribute("userInfo", user);
		}
		user = null;
		return "admin/adminproject";
	}
	// 글 작성 후, 글 목록 화면으로 이동
	@RequestMapping(value = "/new", method = RequestMethod.POST)
	public String newBoard(HttpServletRequest request,
			Integer writer,
			String title,
			String content,
			String attachment,
			@RequestParam("attachmentImg") MultipartFile attachmentImg)
					throws CommonException, Exception {

		Project pro = new Project();
		pro.setWriter(writer);
		pro.setTitle(title);
		content = content.replace("\r\n", "<br />");
		pro.setContent(content);
		attachment = attachment.replace("watch?v=", "embed/");
		attachment = attachment.replace("&", "?");
		pro.setAttachment(attachment);

		// 최상위 경로 밑에 upload 폴더의 경로를 가져온다.
		String path = request.getServletContext().getRealPath(UPLOAD_FOLDER);
		// MultipartFile 객체에서 파일명을 가져온다.
		String originalName = attachmentImg.getOriginalFilename();

		// upload 폴더가 없다면, upload 폴더 생성
		File directory = new File(path);
		if (!directory.exists()) {
			directory.mkdirs();
		}

		// attachment 객체를 이용하여, 파일을 서버에 전송
		if (attachmentImg != null && !attachmentImg.isEmpty()) {
			int idx = originalName.lastIndexOf(".");
			String name = originalName.substring(0, idx);
			String ext = originalName.substring(idx, originalName.length());
			String uploadFilename = name
					+ Long.toHexString(System.currentTimeMillis())
					+ ext;
			attachmentImg.transferTo(new File(path, uploadFilename));
			uploadFilename = URLEncoder.encode(uploadFilename, "UTF-8");
			pro.setAttachmentImg(uploadFilename);
		}



		proService.newBoard(pro);
		directory = null;
		pro = null;
		return "redirect:/pro/list";
	}

	// 글 목록 화면
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) throws CommonException {
		List<Project> list = proService.list();

		UserInfo user  = null;
		if (!(this.getPrincipal() == null)) {
			user = userInfoService.detail(this.getPrincipal());
			model.addAttribute("userInfo", user);
		}
		model.addAttribute("list", list);
		list = null;
		user = null;
		return "pro/list";
	}

	// 글 상세 화면
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Model model, 
			@RequestParam(value = "no", required=true) Integer no)
					throws CommonException, Exception {
		Project pro = proService.detail(no);

		UserInfo user  = null;
		if (!(this.getPrincipal() == null)) {
			user = userInfoService.detail(this.getPrincipal());
			model.addAttribute("userInfo", user);
		}
		
		String filename = pro.getAttachmentImg();
		if (filename != null && !filename.trim().isEmpty()) {
			filename = URLDecoder.decode(filename, "UTF-8");
			int i = filename.indexOf("."); 
			// 변수 email이 포함하고있는 @ 의 인덱스 값을 변수 i 에 대입.

			String  id = filename.substring(0, i);
			String rid = id.substring(id.length()-11, id.length());
			id = id.replaceAll(rid, "");
			// 변수 email의 0번째인덱스부터 i번째 인덱스까지 추출하여 변수 id 에 대입.
			String domain = filename.substring(i+1);
			// 변수 email의 i+1번째 인덱스부터 추출하여 변수 domain 에 대입.
			String rfilename = id + "." + domain;

			model.addAttribute("rfilename", rfilename);
		}
		pro.setViews(pro.getViews()+1);
		proService.viewsup(pro);

		List<Project> list = proService.list();
		model.addAttribute("list", list);
		model.addAttribute("item", pro);
		model.addAttribute("filename", filename);
		
		user = null;
		list = null;
		pro = null;
		return "pro/detail";	// /WEB-INF/views/detail.jsp 페이지로 이동
	}

	// 글 수정하기 화면
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify(Model model,
			@RequestParam(value = "no", required = true) Integer no)
					throws CommonException {

		Project pro =  proService.detail(no);
		UserInfo user  = null;
		if (!(this.getPrincipal() == null)) {
			user = userInfoService.detail(this.getPrincipal());
			model.addAttribute("userInfo", user);
		}
		model.addAttribute("item", pro);
		
		pro = null;
		return "pro/modify";
	}

	// 글 수정 후, 글 목록 화면으로 이동
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(HttpServletRequest request,
			Integer no,
			String title,
			String content,
			String attachment,
			@RequestParam("attachmentImg") MultipartFile attachmentImg)
					throws CommonException, Exception {	
		
		Project pro = new Project();
		pro.setNo(no);
		pro.setTitle(title);
		pro.setContent(content);
		attachment = attachment.replace("watch?v=", "embed/");
		attachment = attachment.replace("&", "?");
		pro.setAttachment(attachment);

		String path = request.getServletContext().getRealPath(UPLOAD_FOLDER);
		String originalName = attachmentImg.getOriginalFilename();

		// attachment 객체를 이용하여, 파일을 서버에 전송
		if (attachmentImg != null && !attachmentImg.isEmpty()) {
			int idx = originalName.lastIndexOf(".");
			String name = originalName.substring(0, idx);
			String ext = originalName.substring(idx, originalName.length());
			String uploadFilename = name
					+ Long.toHexString(System.currentTimeMillis())
					+ ext;
			attachmentImg.transferTo(new File(path, uploadFilename));
			uploadFilename = URLEncoder.encode(uploadFilename, "UTF-8");
			pro.setAttachmentImg(uploadFilename);
		}
		Project fileitem =  proService.detail(no);
		if (pro.getAttachmentImg() == null) {
			pro.setAttachmentImg(fileitem.getAttachmentImg());
		}else {
			String oldFilename = proService.detail(no).getAttachmentImg();
			if (oldFilename != null && !oldFilename.trim().isEmpty()) {
				fileService.remove(request, UPLOAD_FOLDER, oldFilename);
			}
		}
		
		proService.modify(pro);

		pro = null;
		return "redirect:/pro/list";
	}

	// 글 삭제 확인 화면
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String removeConfirm(HttpServletRequest request,
			@RequestParam(value = "no", required = true) String no) 
					throws CommonException, UnsupportedEncodingException {
		String filename =  proService.detail(Integer.parseInt(no)).getAttachmentImg();
		if (filename != null && !filename.trim().isEmpty()) {
			fileService.remove(request, UPLOAD_FOLDER, filename);
		}
		
		String[] nos = no.split("-");

		if(nos != null && nos.length>0){
			for (String bas_id : nos) {
				System.out.println(bas_id.toString());
				proService.remove(Integer.parseInt(bas_id.toString()));
			}
		}  

		
		return "redirect:/pro/list";
	}

/*	// 파일 내려받기
	@RequestMapping(value = "/download", method = RequestMethod.GET, params="filename")
	public void download(HttpServletRequest request, 
			HttpServletResponse response, String filename)
					throws CommonException {

		int length = 0;
		byte[] buff = new byte[1024];

		// 서버에 저장된 파일 경로 불러오기
		String directory = request.getServletContext().getRealPath(UPLOAD_FOLDER);

		// 요청한 파일명으로 실제 파일을 객체화 하기
		File file = new File(directory, filename);

		FileInputStream fis = null;
		BufferedOutputStream bos = null;
		try {
			fis = new FileInputStream(file);

			// 다운받을 때, 한글 깨짐현상 수정
			filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");

			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition", 
					"attachment; filename=" + filename + ";");
			response.setHeader("Content-Transfer-Encoding", "binary");
			response.setHeader("Content-Length", Integer.toString(fis.available()));
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Expires", "-1");

			
			 * Connection Stream: ServletOutputStream
			 * Chain Stream: BufferedOutputStream
			 
			bos = new BufferedOutputStream(response.getOutputStream());

			// 서버에 있는 파일을 읽어서 (fis), 클라이언트에게 파일을 전송(bos)
			while ( (length = fis.read(buff)) > 0) {
				bos.write(buff, 0, length);
			}

			// 변기 물내린다는 뜻, 버퍼에 남아있는 정보를 보내준다.
			bos.flush();

		} catch (Exception e) {
			throw new CommonException("E12: 파일 내려받기 실패");

		} finally {
			try {
				bos.close();
				fis.close();

			} catch (IOException e) {
				logger.debug(e.getMessage());
			}
		}
	}*/

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

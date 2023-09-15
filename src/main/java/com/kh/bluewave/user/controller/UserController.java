package com.kh.bluewave.user.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bluewave.user.domain.User;
import com.kh.bluewave.user.service.MailSendService;
import com.kh.bluewave.user.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService uService;
	
	@Autowired
	private MailSendService mailService;

	// 마이페이지 페이지
//	@RequestMapping(value="/user/myPage.do", method=RequestMethod.GET)
//	public ModelAndView showMyPage(ModelAndView mv) {
//
//		String userId = "testuser01";
//		try {			
//			List<Challenge> cList = cService.selectAllById(userId);
//			if(!cList.isEmpty()) {
//				mv.addObject("cList", cList);
//				mv.setViewName("user/myPage");
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//
//		return mv;
//	}
	
	@RequestMapping(value="/user/login.do", method=RequestMethod.GET)
	public ModelAndView showLoginForm(ModelAndView mv) {
		mv.setViewName("user/login");
		return mv;
	}
	
	@RequestMapping(value="/user/update.do", method=RequestMethod.GET)
	public ModelAndView showModifyForm(ModelAndView mv) {
		mv.setViewName("user/modify");
		return mv;
	}
	
	@RequestMapping(value="/user/register.do", method=RequestMethod.GET)
	public ModelAndView showRegisterForm(ModelAndView mv) {
		mv.setViewName("user/register");
		return mv;
	}
	
	//이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		return mailService.joinEmail(email);
	}

	@RequestMapping(value="/user/login.do", method=RequestMethod.POST)
	public ModelAndView userLoginCheck(
			@ModelAttribute User user
			, HttpSession session
			, ModelAndView mv) {
		try {
			User uOne = uService.checkUserLogin(user);
			if(uOne != null) {
				session.setAttribute("userId", uOne.getUserId());
				mv.setViewName("redirect:/index.jsp"); 
			}else {
				mv.addObject("msg", "로그인이 완료되지 않았습니다.");
				mv.addObject("error", "로그인 실패");
				mv.addObject("url", "/user/login.kh");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의해주세요.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/user/login.kh");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="/user/logout.do", method=RequestMethod.GET)
	public ModelAndView userLogout(
			HttpSession session
			, ModelAndView mv) {
		if(session != null) {
			session.invalidate();
			mv.setViewName("redirect:/index.jsp");
		}else {
			
		}
		return mv;
		
	}
	
	@RequestMapping(value="/user/delete.do", method=RequestMethod.GET)
	public ModelAndView deleteUser(
			@RequestParam("userId") String userId
			, ModelAndView mv
			) {
		try {
			int result = uService.deleteUser(userId);
			if(result > 0) {
				mv.setViewName("redirect:/index.jsp"); 
			}else {
				mv.addObject("msg", "회원탈퇴가 완료되지 않았습니다.");
				mv.addObject("error", "회원탈퇴 실패");
				mv.addObject("url", "index.jsp");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의해주세요.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "index.jsp");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="/user/update.do", method=RequestMethod.POST)
	public ModelAndView updateUser(
			@ModelAttribute User user
			, ModelAndView mv
			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, HttpServletRequest request
			, HttpSession session) {
		try {
			// 수정이라는 과정은 대체하는 것, 대체하는 방법은 삭제 후 등록
			if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
				String fileRename = user.getUserProfileRename();
				this.deleteFile(fileRename, request);
			}
			// 없으면 새로 업로드 하려는 파일 저장
			Map<String, Object> infoMap = this.saveFile(uploadFile, request);
			user.setUserProfileName((String)infoMap.get("fileName"));
			user.setUserProfileRename((String)infoMap.get("fileRename"));
			user.setUserProfilePath((String)infoMap.get("filePath"));
			user.setUserProfileLength((long)infoMap.get("fileLength"));
			
			int result = uService.updateMember(user);
			if(result > 0) {
				mv.setViewName("redirect:/index.jsp"); 
			}else {
				mv.addObject("msg", "회원정보 수정이 완료되지 않았습니다.");
				mv.addObject("error", "회원정보 수정 실패");
				mv.addObject("url", "index.jsp");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의해주세요.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "index.jsp");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	public Map<String, Object> saveFile(HttpServletRequest request, MultipartFile uploadFile) throws Exception, IOException{
		Map<String, Object> fileMap = new HashMap<String, Object>();
		// resource 경로 구하기
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 파일 저장경로 구하기
		String savePath = root + "\\UuploadFiles";
		// 파일 이름 구하기
		String fileName = uploadFile.getOriginalFilename();
		// 파일 확장자 구하기
		String extension = fileName.substring(fileName.lastIndexOf(".")+1);
		// 시간으로 파일 리네임하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileRename = sdf.format(new Date(System.currentTimeMillis()))+"."+extension;
		// 파일 저장 전 폴더 만들기
		File saveFolder = new File(savePath);
		if(!saveFolder.exists()) {
			saveFolder.mkdir();
		}
		// 파일 저장
		File saveFile = new File(savePath+"\\"+fileRename);
		uploadFile.transferTo(saveFile);
		long fileLength = uploadFile.getSize();
		// 파일 정보 리턴
		fileMap.put("fileName", fileName);
		fileMap.put("fileRename", fileRename);
		fileMap.put("filePath", "../resources/UuploadFiles/"+fileRename);
		fileMap.put("fileLength", fileLength);
		
		return fileMap;
	}
	
	public Map<String, Object> saveFile(MultipartFile uploadFile, HttpServletRequest request) throws Exception, IOException {
		// 넘겨야 하는 값이 여러개일 때 사용하는 방법
		// 1. VO 클래스를 만드는 방법
		// 2. HashMap을 사용하는 방법
		Map<String, Object> infoMap = new HashMap<String, Object>();
		
		// ========== 파일 이름 ==========
		String fileName = uploadFile.getOriginalFilename();
		// (내가 저장한 후 그 경로를 DB에 저장하도록 준비하는 것)
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 폴더가 없을 경우 자동 생성(내가 업로드할 파일을 저장할 폴더)
		String saveFolder = root + "\\UuploadFiles";
		File folder = new File(saveFolder);
		if(!folder.exists()) {
			folder.mkdir();
		}
		// ========== 파일 경로 ==========
		// 랜덤 리네임
//		Random rand = new Random();
//		String strResult = "N";
//		for(int i = 0; i < 7; i++) {
//			int result = rand.nextInt(20)+1;
//			strResult += result+"";
//		}
		
		// 날짜 리네임
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");	// 나중에 SS랑 비교
		String strResult = sdf.format(new Date(System.currentTimeMillis()));
		
		String ext = fileName.substring(fileName.lastIndexOf(".")+1); // 확장자명 자르기 // .을 포함하지 않고 자름 (+1)
		String fileRename = "N"+strResult+"."+ext;
		String savePath = saveFolder + "\\" + fileRename;
		File file = new File(savePath);
		// ********** 파일 저장 **********
		uploadFile.transferTo(file); 
		
		// ========== 파일 크기 ==========
		long fileLength = uploadFile.getSize();
		// 파일이름, 경로, 크기를 넘겨주기 위해 Map에 정보를 저장한 후 return함
		// 왜 return하는가? DB에 저장하기 위해서 필요한 정보니까!!
		infoMap.put("fileName", fileName);
		infoMap.put("fileRename", fileRename);
		infoMap.put("filePath", savePath);
		infoMap.put("fileLength", fileLength);
		return infoMap;
		}
	
	private void deleteFile(String fileName, HttpServletRequest request) {
		// D:\\springworksapce\\BaeSpringMVC\\src\\main\\webapp\\resources 대체
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delFilePath = root+"\\UuploadFiles\\"+fileName;
		File file = new File(delFilePath);
		if(file.exists()) {
			file.delete();
		}
	}
}
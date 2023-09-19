package com.kh.bluewave.challenge.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.bluewave.challenge.domain.Challenge;
import com.kh.bluewave.challenge.service.ChallengeService;

@Controller
public class ChallengeController {
	
	@Autowired
	private ChallengeService cService;
	
	// 챌린지 생성 페이지
	@RequestMapping(value="/challenge/create.do", method=RequestMethod.GET)
	public ModelAndView showCreateChalForm(ModelAndView mv) {
		
		// 시작일 최소 날짜 제한
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String sysdate = now.toLocalDate().format(formatter);
		
        mv.addObject("sysdate", sysdate); // 오늘
		mv.setViewName("/challenge/createChal");
		return mv;
	}
	
	// 챌린지 생성 기능
	@RequestMapping(value="/challenge/create.do", method=RequestMethod.POST)
	public ModelAndView createChal(@ModelAttribute Challenge challenge
								   , @RequestParam(value="endDate", required=false) String endDate
								   , @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
								   , HttpServletRequest request
								   , ModelAndView mv) {
		try {
			java.sql.Date chalStartDate = new java.sql.Date(challenge.getChalStartDate().getTime());
			java.sql.Date chalEndDate = null;
			if(!"".equals(endDate)) {
				chalEndDate = new java.sql.Date(Date.valueOf(endDate).getTime());
			}
			
			// 로그인 여부 확인
			if(challenge.getChalUserId() != null) {
				// 챌린지 명 중복 여부 확인
				Challenge cOne = cService.selectOneByTitle(challenge.getChalTitle());
				if(cOne == null) {
					// 파일 첨부
					if(!uploadFile.getOriginalFilename().equals("")) {
						Map<String , Object> cMap = this.saveFile(request, uploadFile);
						String fileName = (String)cMap.get("fileName"); 
						String fileRename = (String)cMap.get("fileRename");
						String savePath = (String)cMap.get("filePath");
						long fileLength = (long)cMap.get("fileLength");
						
						challenge.setChalFileName(fileName);
						challenge.setChalFileRename(fileRename);
						challenge.setChalFilePath(savePath);
						challenge.setChalFileLength(fileLength);
					} else {
						mv.addObject("msg", "파일 등록 실패").addObject("url", "/challenge/page.do");
						mv.setViewName("common/serviceFailed");
					}
					challenge.setChalStartDate(chalStartDate);
					challenge.setChalEndDate(chalEndDate);
					
					int result = cService.insertChal(challenge);
					if(result > 0) {
						mv.setViewName("/challenge/page.do");				
					} else {
						mv.addObject("msg", "챌린지 생성 오류").addObject("url", "/challenge/page.do");
						mv.setViewName("common/serviceFailed");
					}
				} else {
					mv.addObject("msg", "챌린지 명 중복").addObject("url", "/challenge/page.do");
					mv.setViewName("common/serviceFailed");
				}
			} else {
				mv.addObject("msg", "로그인 필요").addObject("url", "/user/login.do");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "챌린지 생성 실패").addObject("url", "/challenge/page.do");
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}
	
	// 챌린지 중복 체크
	@RequestMapping(value = "/challenge/checkDuplicate.do", method = RequestMethod.POST)
	@ResponseBody
	public String checkDuplicateChalName(@RequestParam("chalTitle") String chalTitle) {
	    Challenge cOne = cService.selectOneByTitle(chalTitle);
	    return (cOne != null) ? "true" : "false";
	}	
	
	// 챌린지 수정 페이지
	@RequestMapping(value="/challenge/update.do", method=RequestMethod.GET)
	public ModelAndView showUpdateChalForm(int chalNo
										 , String chalUserId
										 , String userId
										 , ModelAndView mv) {
		try {
			Challenge cOne = cService.selectOneByNo(chalNo);
			if(cOne != null) {
				mv.addObject("chal", cOne);
				mv.setViewName("/challenge/updateChal");
			} else {
				mv.addObject("msg", "수정할 챌린지 데이터 불러오기").addObject("url", "/user/myPage.do?userId=" + userId);
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "수정 페이지 로딩 실패").addObject("url", "/challenge/info.do?chalNo=" + chalNo);
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}
	
	// 챌린지 수정 기능
	@RequestMapping(value="/challenge/update.do", method=RequestMethod.POST)
	public ModelAndView updateChal(@ModelAttribute Challenge challenge
								   , String userId
								   , @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
								   , HttpServletRequest request
								   , RedirectAttributes redirect
								   , ModelAndView mv) {
		try {
			// 로그인 여부 및 본인 일치 여부 확인
			if(userId != null) {
				if(challenge.getChalUserId() == userId) {
					if(!uploadFile.getOriginalFilename().equals("")) {
						String fileRename = challenge.getChalFileRename();
						if(fileRename != null) {
							this.deleteFile(request, fileRename);
						}
						
						Map<String , Object> cMap = this.saveFile(request, uploadFile);
						String chalFileName = (String)cMap.get("fileName"); 
						String chalFileRename = (String)cMap.get("fileRename");
						String chalFilePath = (String)cMap.get("filePath");
						long chalFileLength = (long)cMap.get("fileLength");
						
						challenge.setChalFileName(chalFileName);
						challenge.setChalFileRename(chalFileRename);
						challenge.setChalFilePath(chalFilePath);
						challenge.setChalFileLength(chalFileLength);
					} else {
						mv.addObject("msg", "파일 수정 실패").addObject("url", "/user/myPage.do?userId=" + userId);
						mv.setViewName("common/serviceFailed");
					}
					
					int result = cService.updateChal(challenge);
					
					if(result > 0) {
						mv.setViewName("/user/myPage");		
					} else {
						mv.addObject("msg", "챌린지 수정 실패").addObject("url", "/user/myPage.do?userId=" + userId);
						mv.setViewName("common/serviceFailed");
					}
				} else {
					mv.addObject("msg", "작성자만 챌린지 수정 가능").addObject("url", "/user/login.do");
					mv.setViewName("common/serviceFailed");
				}
			} else {
				mv.addObject("msg", "로그인 필요").addObject("url", "/user/login.do");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "수정 페이지 로딩 실패").addObject("url", "/user/myPage.do?userId=" + userId);
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}
	
	// 챌린지 삭제 기능
	@RequestMapping(value="/challenge/delete.do", method=RequestMethod.GET)
	public ModelAndView deleteChal(int chalNo
								, String chalUserId
								, String userId
								, HttpServletRequest request
								, ModelAndView mv) {
		try {
			// 로그인 여부 및 본인 일치 여부 확인
			if(userId != null) {
				if(chalUserId == userId) {
					Challenge challenge = cService.selectOneByNo(chalNo);
					int result = cService.deleteChal(chalNo);
					if(result > 0) {
						this.deleteFile(request, challenge.getChalFileRename());
						mv.setViewName("/user/myPage");
					} else {
						mv.addObject("msg", "챌린지 삭제 실패").addObject("url", "/user/myPage.do?userId=" + userId);
						mv.setViewName("common/serviceFailed");
					}
				} else {
					mv.addObject("msg", "작성자만 챌린지 삭제 가능").addObject("url", "/user/login.do");
					mv.setViewName("common/serviceFailed");
				}
			} else {
				mv.addObject("msg", "로그인 필요").addObject("url", "/user/login.do");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "챌린지 삭제 실패").addObject("url", "/user/myPage.do?userId=" + userId);
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}
	
	// 파일 처리 메소드
	public Map<String, Object> saveFile(HttpServletRequest request, MultipartFile uploadFile) throws Exception, IOException {
		Map<String, Object> fileMap = new HashMap<String, Object>();
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\chaluploadFiles";
		String fileName =  uploadFile.getOriginalFilename();
		String extension = fileName.substring(uploadFile.getOriginalFilename().lastIndexOf(".")+1);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileRename = sdf.format(new Date(System.currentTimeMillis())) + "." + extension;
		
		File saveFolder = new File(savePath);
		if(!saveFolder.exists()) {
			saveFolder.mkdir();
		}
		
		File saveFile = new File(savePath + "\\" + fileRename);
		uploadFile.transferTo(saveFile);
		long fileLength = uploadFile.getSize();
		
		fileMap.put("fileName", fileName);
		fileMap.put("fileRename", fileRename);
		fileMap.put("filePath", "../resources/chaluploadFiles/" + fileRename);
		fileMap.put("fileLength", fileLength);
		
		return fileMap;
	}
	
	private void deleteFile(HttpServletRequest request, String fileName) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delFilepath = root + "\\chaluploadFiles\\" + fileName;
		File file = new File(delFilepath);
		if(file.exists()) {
			file.delete();
		}
	}
	
	
	// 챌린지 페이지
	@RequestMapping(value="/challenge/page.do", method=RequestMethod.GET)
	public ModelAndView showChallengePage(
			ModelAndView mv
			, HttpSession session
			) {
		try {
			// 로그인 유효성 체크
//			String userId = (String)session.getAttribute("userId");
			String userId = "testuser01";
			if(userId != null) {
				// 성공
				System.out.println("성공");
				
				// 챌린지 테이블에서 select
				List<Challenge> cList = cService.selectListByChal();
				if(cList.size() > 0 || !cList.isEmpty()) {
					// 성공
					mv.addObject("cList", cList);
					mv.setViewName("challenge/challengPage");
				} else {
					// 실패
					mv.addObject("msg", "리스트를 조회하는데 실패하였습니다.");
					mv.addObject("url", "redirect:/index.jsp");
					mv.setViewName("common/serviceFailed");
				}
				
			} 
//			else {
//				// 실패
//				System.out.println("실패");
//				mv.addObject("msg", "로그인 되어있지 않습니다. 로그인 해주세요");
//				mv.addObject("url", "redirect:/user/login.do");
//				mv.setViewName("common/serviceFailed");
//			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/serviceFailed");
		}
		mv.setViewName("challenge/challengePage");
		return mv;
	}
}

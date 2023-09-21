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

import com.kh.bluewave.challenge.domain.CBoard;
import com.kh.bluewave.challenge.domain.CLike;
import com.kh.bluewave.challenge.domain.Challenge;
import com.kh.bluewave.challenge.service.CBoardService;
import com.kh.bluewave.challenge.service.CLikeService;
import com.kh.bluewave.challenge.service.ChallengeService;

@Controller
public class ChallengeController {
	
	@Autowired
	private ChallengeService cService;
	
	@Autowired
	private CBoardService cbService;
	
	@Autowired
	private CLikeService cLikeService;
	
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
								   , HttpSession session
								   , ModelAndView mv) {
		try {
			java.sql.Date chalStartDate = new java.sql.Date(challenge.getChalStartDate().getTime());
			java.sql.Date chalEndDate = null;
			if(!"".equals(endDate)) {
				chalEndDate = new java.sql.Date(Date.valueOf(endDate).getTime());
			}
			
			String userId = (String) session.getAttribute("userId");
			// 로그인 여부 확인
			if(!userId.equals("")) {
				// 챌린지 명 중복 여부 확인
				challenge.setChalUserId(userId);
				Challenge cOne = cService.selectOneByTitle(challenge);
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
						// 이미지가 선택되지 않았을 때 기본 이미지 정보 설정
						challenge.setChalFileName("admin-img.png");
						challenge.setChalFileRename("admin-img.png");
						challenge.setChalFilePath("../resources/chaluploadFiles/admin-img.png");
						challenge.setChalFileLength(0L);
					}
					challenge.setChalStartDate(chalStartDate);
					challenge.setChalEndDate(chalEndDate);
					
					int result = cService.insertChal(challenge);
					if(result > 0) {
						int chalNo = cService.findInsertChalNo(challenge);
						mv.setViewName("redirect:/challenge/info.do?chalNo=" + chalNo);				
					} else {
						mv.addObject("msg", "챌린지 생성 오류").addObject("url", "/challenge/page.do");
						mv.setViewName("common/serviceFailed");
					}
				} else {
					mv.addObject("msg", "챌린지 명 중복").addObject("url", "/challenge/page.do");
					mv.setViewName("common/serviceFailed");
				}
			} else {
				mv.addObject("msg", "로그인이 필요합니다.").addObject("url", "/user/login.do");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "챌린지 생성 오류").addObject("url", "/challenge/page.do");
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}
	
	// 챌린지 가져가기 페이지
	@RequestMapping(value="/challenge/pullChal.do", method=RequestMethod.GET)
	public ModelAndView showPullChalForm(int chalNo
										 , String userId
										 , ModelAndView mv) {
		try {
			Challenge cOne = cService.selectOneByNo(chalNo);
			if(cOne != null) {
				mv.addObject("chal", cOne);
				mv.setViewName("/challenge/pullChal");
			} else {
				mv.addObject("msg", "가져갈 챌린지 데이터 불러오기 실패").addObject("url", "/challenge/page.do");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "가져갈 챌린지 데이터 로딩 오류").addObject("url", "/challenge/page.do");
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}
	
	// 챌린지 중복 체크
	@RequestMapping(value = "/challenge/checkDuplicate.do", method = RequestMethod.POST)
	@ResponseBody
	public String checkDuplicateChalName(@ModelAttribute Challenge challenge
										, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		challenge.setChalUserId(userId);
	    Challenge cOne = cService.selectOneByTitle(challenge);
	    return (cOne != null) ? "true" : "false";
	}	
	
	// 챌린지 수정 페이지
	@RequestMapping(value="/challenge/update.do", method=RequestMethod.GET)
	public ModelAndView showUpdateChalForm(int chalNo
										 , String userId
										 , ModelAndView mv) {
		try {
			Challenge cOne = cService.selectOneByNo(chalNo);
			if(cOne != null) {
				mv.addObject("chal", cOne);
				mv.setViewName("/challenge/updateChal");
			} else {
				mv.addObject("msg", "수정할 챌린지 데이터 불러오기 실패").addObject("url", "/user/myPage.do?userId=" + userId);
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "수정 페이지 로딩 오류").addObject("url", "/user/myPage.do?userId=" + userId);
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
			String chalUserId = challenge.getChalUserId();
			if(!userId.equals("")) {
				if(chalUserId.equals(userId) || userId.equals("admin")) {
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
					} 
					
					int result = cService.updateChal(challenge);
					
					if(result > 0) {
						mv.setViewName("redirect:/challenge/info.do?chalNo=" + challenge.getChalNo());			
					} else {
						mv.addObject("msg", "챌린지 수정 실패").addObject("url", "/user/myPage.do?userId=" + userId);
						mv.setViewName("common/serviceFailed");
					}
				} else {
					mv.addObject("msg", "작성자만 챌린지 수정이 가능합니다.").addObject("url", "/user/login.do");
					mv.setViewName("common/serviceFailed");
				}
			} else {
				mv.addObject("msg", "로그인이 필요합니다.").addObject("url", "/user/login.do");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "챌린지 수정 오류").addObject("url", "/user/myPage.do?userId=" + userId);
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
			if(!userId.equals("")) {
				if(chalUserId.equals(userId) || chalUserId.equals("admin")) {
					Challenge challenge = cService.selectOneByNo(chalNo);
					int result = cService.deleteChal(chalNo);
					if(result > 0) {
						this.deleteFile(request, challenge.getChalFileRename());
						mv.setViewName("redirect:/user/myPage.do?userId=" + userId);
					} else {
						mv.addObject("msg", "챌린지 삭제 실패").addObject("url", "/user/myPage.do?userId=" + userId);
						mv.setViewName("common/serviceFailed");
					}
				} else {
					mv.addObject("msg", "작성자만 챌린지 삭제가 가능합니다.").addObject("url", "/user/login.do");
					mv.setViewName("common/serviceFailed");
				}
			} else {
				mv.addObject("msg", "로그인이 필요합니다.").addObject("url", "/user/login.do");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "챌린지 삭제 오류").addObject("url", "/user/myPage.do?userId=" + userId);
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

		if (file.exists() && (!fileName.equals("admin-img.png"))) {
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
			String userId = (String)session.getAttribute("userId");
			if(userId != null) {
				// 성공
				// 챌린지 테이블에서 select
				List<Challenge> cList = cService.selectListByChal();
				
				// 해당 챌린지 명에 대한 총 좋아요 수
				List<Challenge> cLikeList = cService.selectAllLikeCnt();
				
				// 해당 챌린지 명에 대한 총 게시물 갯수
				List<CBoard> cBoardCNT = cbService.selectBoardCountList();
				

				
				if(cList.size() > 0 || !cList.isEmpty()) {
					// 성공
					mv.addObject("cList", cList);
					mv.addObject("cLikeList", cLikeList);
					mv.addObject("cBoardCNT", cBoardCNT);
					mv.setViewName("challenge/challengePage");
				} else {
					// 실패
					mv.addObject("msg", "리스트를 조회하는데 실패하였습니다.");
					mv.addObject("url", "redirect:/index.jsp");
					mv.setViewName("common/serviceFailed");
				}
			} else {
				// 실패
				mv.addObject("msg", "로그인 되어있지 않습니다. 로그인 해주세요");
				mv.addObject("url", "/user/login.do");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}
}

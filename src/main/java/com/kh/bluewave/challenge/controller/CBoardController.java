package com.kh.bluewave.challenge.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bluewave.challenge.domain.CBoard;
import com.kh.bluewave.challenge.domain.Challenge;
import com.kh.bluewave.challenge.service.CBoardService;
import com.kh.bluewave.challenge.service.ChallengeService;
import com.kh.bluewave.user.domain.User;
import com.kh.bluewave.user.service.UserService;

@Controller
public class CBoardController {
	
	@Autowired
	private CBoardService cService;
	
	@Autowired
	private ChallengeService chalService;
	
	@Autowired
	private UserService uService;
	
	
	@RequestMapping(value="/challenge/info.do", method=RequestMethod.GET)
	public ModelAndView showChallengeInfo(
			ModelAndView mv
			, HttpSession session
			, @RequestParam("chalNo") Integer chalNo
			) {
		try {
			
			// 챌린지 명 안에 세부정보 select
//			int chalNo = 20;
			
			// chalNo에 해당하는 챌린지의 세부정보
			Challenge cOne = chalService.selectOneByNo(chalNo);
			
			// chalNo에 해당하는 작성자 Id
			String chalWriter = cOne.getChalUserId();
			
			// 위에서 찾은 작성자 Id로 User 테이블에 같은 userId 찾기
			User uOne = uService.selectOneByChalNo(chalWriter);
			
			// chalNo에 해당하는 게시물 전부 select
			List<CBoard> cList = cService.findCBoardByNo(chalNo);
			
			// chalNo에 해당하는 게시물의 갯수 select
//			int chalLikeCount = cService.
			
			mv.addObject("cList", cList);
			mv.addObject("cOne", cOne);
			mv.addObject("uOne", uOne);
			mv.setViewName("challenge/challengeInfo");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/serviceFailed");
		}
		mv.setViewName("challenge/challengeInfo");
		return mv;
	}
	
	@RequestMapping(value="/challenge/board.do", method=RequestMethod.GET)
	public ModelAndView showChallengeBoard(ModelAndView mv) {
		mv.setViewName("challenge/challengeBoard");
		return mv;
	}
	
	@RequestMapping(value="/challenge/search.do", method=RequestMethod.GET)
	public ModelAndView showChallengelSearch(
			@RequestParam("searchCondition") String searchCondition
			, @RequestParam("searchKeyword") String searchKeyword
			, ModelAndView mv
			) {
		try {
			Map<String, String> searchMap = new HashMap<String, String>();
			searchMap.put("searchCondition", searchCondition);
			searchMap.put("searchKeyword", searchKeyword);
			
			List<Challenge> searchChalList = chalService.searchChalByKeyword(searchMap);
			if(!searchChalList.isEmpty()) {
				mv.addObject("searchCondition", searchCondition);
				mv.addObject("searchKeyword", searchKeyword);
				mv.addObject("sList", searchChalList);
				mv.setViewName("challenge/challengeSearch");
			} else {
				mv.addObject("searchCondition", searchCondition);
				mv.addObject("searchKeyword", searchKeyword);
				mv.addObject("sList", searchChalList);
				mv.setViewName("challenge/challengeSearch");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "검색에 실패하였습니다. (관리자에게 문의 바람)");
			mv.addObject("url", "/challenge/page.do");
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}
	
	@RequestMapping(value="/challenge/write.do", method=RequestMethod.GET)
	public ModelAndView showChallengeWrite(
			ModelAndView mv
			, @RequestParam("chalNo") Integer chalNo
			, HttpSession session
			) {
		try {
			String cBoradWriter = (String)session.getAttribute("userId");
			User uOne = uService.selectOneByChalNo(cBoradWriter);
			Challenge cOne = chalService.selectOneByNo(chalNo);
			if(uOne != null) {
				mv.addObject("uOne", uOne);
				mv.addObject("cOne", cOne);
				mv.setViewName("challenge/challengeWrite");			
			} else {
				mv.addObject("msg", "로그인 되어있지 않거나 유효하지 않은 회원 정보 입니다.");
				mv.addObject("url", "/home.do");
				mv.setViewName("common/serviceFailed");
			}			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "페이지 조회 실패 (관리자 문의 요망)");
			mv.addObject("url", "/home.do");
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}
	
	@RequestMapping(value="/challenge/cbUpdate.do", method=RequestMethod.GET)
	public ModelAndView showCBoardModify(
			ModelAndView mv
			, @RequestParam("cBoardNo") Integer cBoardNo
			, HttpSession session
			) {
			try {
				String cBoradWriter = (String)session.getAttribute("userId");
				User uOne = uService.selectOneByChalNo(cBoradWriter);
				CBoard cBOne = cService.selectOneByCBoardNo(cBoardNo);
				if(uOne != null) {
					mv.addObject("uOne", uOne);
					mv.addObject("cBOne", cBOne);
					mv.setViewName("challenge/challengeModify");			
				} else {
					mv.addObject("msg", "로그인 되어있지 않거나 유효하지 않은 회원 정보 입니다.");
					mv.addObject("url", "/home.do");
					mv.setViewName("common/serviceFailed");
				}	
			} catch (Exception e) {
				e.printStackTrace();
			}
		return mv;
	}
	
	// 챌린지 게시물 작성
		@RequestMapping(value="/challenge/write.do", method=RequestMethod.POST)
		public ModelAndView writeCBoard(
				ModelAndView mv
				, @ModelAttribute CBoard cBoard
				, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
				, HttpSession session
				, HttpServletRequest request
				) {
			try {
				String cBoradWriter = (String)session.getAttribute("userId");
				if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
					Map<String, Object> cBMap = this.saveFile(request, uploadFile);
					cBoard.setcBoardWriter(cBoradWriter);
					cBoard.setcBoardFileName((String)cBMap.get("fileName"));
					cBoard.setcBoardFileRename((String)cBMap.get("fileRename"));
					cBoard.setcBoardFilePath((String)cBMap.get("filePath"));
					cBoard.setcBoardFileLength((long)cBMap.get("fileLength"));
				}
	//			cBoard.setChalNo(chalNo);
				int result = cService.writeCBoard(cBoard);
				if(result > 0) {
					// 성공
					mv.setViewName("redirect:/challenge/info.do?chalNo="+cBoard.getChalNo());
				} else {
					// 실패
					mv.addObject("msg", "게시물 작성에 실패하였습니다.");
					mv.addObject("url", "/challenge/page.do");
					mv.setViewName("common/errorPage");
				}
			} catch (Exception e) {
				e.printStackTrace();
				mv.addObject("msg", "관리자에게 문의 바랍니다.");
				mv.addObject("url", "/challenge/page.do");
				mv.setViewName("common/errorPage");
			}
			return mv;
		}

	@RequestMapping(value="/challenge/cbUpdate.do", method=RequestMethod.POST)
	public ModelAndView ModifyCBoard(
			ModelAndView mv
			, @ModelAttribute CBoard cBoard
			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, HttpSession session
			, HttpServletRequest request
			) {
		try {
			if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
				String fileRename = cBoard.getcBoardFileRename();
				if(fileRename != null) {
					this.cBoardDeleteFile(fileRename, request);
				}
				// 파일정보(이름, 리네임, 경로, 크기) 및 파일저장
				Map<String, Object> cBMap = this.saveFile(request, uploadFile);
				cBoard.setcBoardFileName((String)cBMap.get("fileName"));
				cBoard.setcBoardFileRename((String)cBMap.get("fileRename"));
				cBoard.setcBoardFilePath((String)cBMap.get("filePath"));
				cBoard.setcBoardFileLength((long)cBMap.get("fileLength"));
			}
			int result = cService.modifyCBoard(cBoard);
			CBoard cOne = cService.selectOneByCBoardNo(cBoard.getcBoardNo());
			if(result > 0) {
				mv.setViewName("redirect:/challenge/info.do?chalNo=" + cOne.getChalNo());
			} else {
				mv.addObject("msg", "챌린지 게시물 수정 실패");
				mv.addObject("url", "/challenge/info.do?chalNo=" + cOne.getChalNo());
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "챌린지 게시물 수정 오류 (관리자 문의 요망)");
			mv.addObject("url", "/challenge/page.do");
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}
	
	@RequestMapping(value="/challenge/cbDelete.do", method=RequestMethod.GET)
	public ModelAndView removeCBoard(
			ModelAndView mv
			, @RequestParam("cBoardNo") Integer cBoardNo
			) {
		try {
			int result = cService.removeCBoard(cBoardNo);
			if(result > 0) {
				mv.setViewName("redirect:/challenge/page.do");
			} else {
				mv.addObject("msg", "챌린지 게시물 삭제 실패");
				mv.addObject("url", "/challenge/page.do");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "챌린지 게시물 삭제 오류 (관리자 문의 요망)");
			mv.addObject("url", "/challenge/page.do");
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}
	
	// (마이페이지 연동) 회원이 작성한 게시물만 표시하기
	@RequestMapping(value="/challenge/userChalInfo.do", method=RequestMethod.GET)
	public ModelAndView showUserChallengeInfo(ModelAndView mv
											, HttpSession session
											, @RequestParam("chalNo") Integer chalNo
											, @RequestParam("userId") String userId) {
		try {			
			Challenge cOne = chalService.selectOneByNo(chalNo);
			User uOne = uService.selectOneByChalNo(userId);
			CBoard cBoard = new CBoard(userId, chalNo);
			List<CBoard> cList = cService.findCBoardByWriterAndNo(cBoard);
			
			mv.addObject("cOne", cOne);
			mv.addObject("uOne", uOne);
			mv.addObject("cList", cList);
			mv.setViewName("challenge/challengeInfo");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "챌린지 명 페이지 이동 오류").addObject("url", "/user/myPage.do?userId=" + userId);
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}
	
	
	// 파일 업로드 관련 컨트롤러
	public Map<String, Object> saveFile(HttpServletRequest request, MultipartFile uploadFile) throws IllegalStateException, IOException{
		Map<String, Object> fileMap = new HashMap<String, Object>();
		// resources 경로 구하기
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		// 파일 저장 경로 구하기
		String savePath = root + "\\cuploadFiles";
		
		// 파일 이름 구하기
		String fileName = uploadFile.getOriginalFilename();
		
		// 파일 확장자 구하기
		String extension = fileName.substring(uploadFile.getOriginalFilename().lastIndexOf(".")+1);
		
		// 시간으로 파일 리네임 하기
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
		fileMap.put("filePath", savePath);
		fileMap.put("fileLength", fileLength);
		return fileMap;
		
	}
	
	// 게시물 수정 시 파일 삭제 관련 컨트롤러
	private void cBoardDeleteFile(String fileRename, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delPath = root + "\\gtuploadFiles\\" + fileRename;
		File delFile = new File(delPath);
		if(delFile.exists()) {
			delFile.delete();
		}
	}
}

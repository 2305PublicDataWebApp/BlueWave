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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bluewave.challenge.domain.CBoard;
import com.kh.bluewave.challenge.service.CBoardService;

@Controller
public class CBoardController {
	
	@Autowired
	private CBoardService cService;
	
	@RequestMapping(value="/challenge/page.do", method=RequestMethod.GET)
	public ModelAndView showChallengePage(
			ModelAndView mv
			, HttpSession session
			
			) {
		try {
			// 로그인 유효성 체크
			// String cBoradWriter = (String)session.getAttribute("userId");
			String userId = "testuser01";
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("challenge/challengePage");
		return mv;
	}
	
	@RequestMapping(value="/challenge/info.do", method=RequestMethod.GET)
	public ModelAndView showChallengeInfo(
			ModelAndView mv
			, HttpSession session
//			, @RequestParam("chalNo") Integer chalNo
			) {
		try {
			
			// 챌린지 명 안에 세부정보 select
			int chalNo = 20;
			List<CBoard> cList = cService.findCBoardByNo(chalNo);
			if(cList.size() > 0 || !cList.isEmpty()) {
				// 성공
				mv.addObject("cList", cList);
				mv.setViewName("challenge/challengeInfo");
			} else {
				// 실패
				System.out.println("실패");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			e.printStackTrace();
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
	public ModelAndView showChallengelSearch(ModelAndView mv) {
		mv.setViewName("challenge/challengeSearch");
		return mv;
	}
	
	@RequestMapping(value="/challenge/write.do", method=RequestMethod.GET)
	public ModelAndView showChallengeWrite(ModelAndView mv) {
		mv.setViewName("challenge/challengeWrite");
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
//		String cBoradWriter = (String)session.getAttribute("userId");
		String cBoradWriter = "testuser01";
		try {
			if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
				Map<String, Object> cBMap = this.saveFile(request, uploadFile);
				cBoard.setcBoardWriter(cBoradWriter);
				cBoard.setcBoardFileName((String)cBMap.get("fileName"));
				cBoard.setcBoardFileRename((String)cBMap.get("fileRename"));
				cBoard.setcBoardFilePath((String)cBMap.get("filePath"));
				cBoard.setcBoardFileLength((long)cBMap.get("fileLength"));
			}
			int result = cService.writeCBoard(cBoard);
			if(result > 0) {
				// 성공
				mv.setViewName("redirect:/challenge/info.do");
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
}

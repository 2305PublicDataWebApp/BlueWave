package com.kh.bluewave.challenge.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
			
			// 로그인 여부 확인 (추후 수정)
			challenge.setChalUserId("testuser01"); // 임시 사용자 아이디
			
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
				}
				challenge.setChalStartDate(chalStartDate);
				challenge.setChalEndDate(chalEndDate);
				
				int result = cService.insertChal(challenge);
				if(result > 0) {
					mv.setViewName("/user/myPage");				
				} else {
					mv.addObject("msg", "챌린지 생성 오류");
					mv.setViewName("common/errorMessage");
				}
			} else {
				mv.addObject("msg", "챌린지 명 중복");
				mv.setViewName("common/errorMessage");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorMessage");
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
	public ModelAndView showUpdateChalForm(int chalNo, ModelAndView mv) {
		try {
			Challenge cOne = cService.selectOneByNo(chalNo);
			if(cOne != null) {
				mv.addObject("chal", cOne);
				mv.setViewName("/challenge/updateChal");
			} else {
				mv.addObject("msg", "수정할 챌린지 데이터 불러오기");
				mv.setViewName("common/errorMessage");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorMessage");
		}
		return mv;
	}
	
	// 챌린지 수정 기능
	@RequestMapping(value="/challenge/update.do", method=RequestMethod.POST)
	public ModelAndView updateChal(@ModelAttribute Challenge challenge
								   , @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
								   , HttpServletRequest request
								   , RedirectAttributes redirect
								   , ModelAndView mv) {
		try {
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
				mv.setViewName("/user/myPage");		
			} else {
				mv.addObject("msg", "챌린지 수정");
				mv.setViewName("common/errorMessage");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorMessage");
		}
		return mv;
	}
	
	// 챌린지 삭제 기능
	@RequestMapping(value="/challenge/delete.do", method=RequestMethod.GET)
	public ModelAndView deleteChal(int chalNo
								, HttpServletRequest request
								, ModelAndView mv) {
		try {
			Challenge challenge = cService.selectOneByNo(chalNo);
			int result = cService.deleteChal(chalNo);
			if(result > 0) {
				this.deleteFile(request, challenge.getChalFileRename());
				mv.setViewName("/user/myPage");
			} else {
				mv.addObject("msg", "챌린지 삭제");
				mv.setViewName("common/errorMessage");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorMessage");
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
	
}

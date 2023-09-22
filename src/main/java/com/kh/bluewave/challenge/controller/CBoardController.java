package com.kh.bluewave.challenge.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
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
import com.kh.bluewave.challenge.domain.CLike;
import com.kh.bluewave.challenge.domain.Challenge;
import com.kh.bluewave.challenge.service.CBoardService;
import com.kh.bluewave.challenge.service.CLikeService;
import com.kh.bluewave.challenge.service.ChallengeService;
import com.kh.bluewave.point.domain.Point;
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
	
	@Autowired
	private CLikeService clService;
	
	
	@RequestMapping(value="/challenge/info.do", method=RequestMethod.GET)
	public ModelAndView showChallengeInfo(
			ModelAndView mv
			, HttpSession session
			, @RequestParam("chalNo") Integer chalNo
			) {
		try {
			// 로그인 유효성 체크
			String userId = (String)session.getAttribute("userId");
			
			if(userId != null) {
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
				
				List<User> user = uService.selectUserList();
				
				// 해당 챌린지 게시물 번호에 좋아요 수
				List<CBoard> cBoardLikeCNT = cService.selectBoardLikeCountList();
				
				// 좋아요 하트
				List<CLike> isLiked = clService.checkIsLiked(userId);
				
				
				mv.addObject("isLiked", isLiked);
				mv.addObject("cList", cList);
				mv.addObject("cOne", cOne);
				mv.addObject("uOne", uOne);
				mv.addObject("user", user);
				mv.addObject("cBoardLikeCNT", cBoardLikeCNT);
				mv.setViewName("challenge/challengeInfo");
			} else {
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
			
			// 해당 챌린지 명에 대한 총 좋아요 수
			List<Challenge> cLikeList = chalService.selectAllLikeCnt();
			
			// 해당 챌린지 명에 대한 총 게시물 갯수
			List<CBoard> cBoardCNT = cService.selectBoardCountList();
			if(!searchChalList.isEmpty()) {
				mv.addObject("searchCondition", searchCondition);
				mv.addObject("searchKeyword", searchKeyword);
				mv.addObject("sList", searchChalList);
				mv.addObject("cLikeList", cLikeList);
				mv.addObject("cBoardCNT", cBoardCNT);
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
				String userId = (String)session.getAttribute("userId");
				if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
					Map<String, Object> cBMap = this.saveFile(request, uploadFile);
					cBoard.setcBoardWriter(userId);
					cBoard.setcBoardFileName((String)cBMap.get("fileName"));
					cBoard.setcBoardFileRename((String)cBMap.get("fileRename"));
					cBoard.setcBoardFilePath((String)cBMap.get("filePath"));
					cBoard.setcBoardFileLength((long)cBMap.get("fileLength"));
				}
//				CBoard pastCBoard = cService.selectOneByCDate(userId);
				int result = cService.writeCBoard(cBoard);
		        
		        // SimpleDateFormat을 사용하여 원하는 형식으로 포맷팅
		        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		        
		        
				if(result > 0) {
					// 성공
					CBoard newCBoard = cService.selectOneByCDate(userId);
					
					// Timestamp로 선언한 변수에 담기
//					Timestamp pastCBoardTimestamp = null;
//					Timestamp newCBoardTimestamp = null;
//					pastCBoardTimestamp = pastCBoard.getcBoardDate();
//					newCBoardTimestamp = newCBoard.getcBoardDate();
					
//					 담은 날짜를 Date 형식으로 변경
//					Date pastDate = new Date(pastCBoardTimestamp.getTime());
//					Date newDate = new Date(newCBoardTimestamp.getTime());
					
					// SimpleDateFormat로 포맷팅한 형식으로 바꾼 후 String 변수에 저장
//					String formattedPastDate = sdf.format(pastDate);
//					String formattedNewDate = sdf.format(newDate);
					 
					Point pOne = cService.selectOneByLastHistory(userId);
					
					int isReward = cService.selectCountPointIsReward(userId);
					if(isReward == 0) {

						Point point = new Point();
						point.setUserId(userId);
						point.setUserTotalPoint(pOne.getUserTotalPoint() + 100);
						point.setcBoardNo(newCBoard.getcBoardNo());
						int rewardResult = cService.rewardPointByCBoard(point);
						if(rewardResult > 0) {
							mv.setViewName("redirect:/challenge/info.do?chalNo="+cBoard.getChalNo());
						} else {
							mv.addObject("msg", "포인트 적립 실패 (관리자에게 문의 바랍니다.)");
							mv.addObject("url", "/challenge/info.do?chalNo="+cBoard.getChalNo());
							mv.setViewName("common/errorPage");
						}
					} else {
						mv.setViewName("redirect:/challenge/info.do?chalNo="+cBoard.getChalNo());
					}
				} else {
					// 실패
					mv.addObject("msg", "게시물 작성에 실패하였습니다.");
					mv.addObject("url", "/challenge/page.do");
					mv.setViewName("common/serviceFailed");
				}
			} catch (Exception e) {
				e.printStackTrace();
				mv.addObject("msg", "관리자에게 문의 바랍니다.");
				mv.addObject("url", "/challenge/page.do");
				mv.setViewName("common/serviceFailed");
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
			List<CBoard> cBoardLikeCNT = cService.selectBoardLikeCountList();
			List<CLike> isLiked = clService.checkIsLiked(userId);
			
			mv.addObject("cOne", cOne);
			mv.addObject("uOne", uOne);
			mv.addObject("cList", cList);
			mv.addObject("cBoardLikeCNT", cBoardLikeCNT);
			mv.addObject("isLiked", isLiked);
			mv.setViewName("challenge/challengeInfo");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "챌린지 명 페이지 이동 오류").addObject("url", "/user/myPage.do?userId=" + userId);
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}
	
	
	@RequestMapping(value="/challenge/like.do", method=RequestMethod.GET)
	public ModelAndView userLikeController(
			ModelAndView mv
			, String userId
			, int cBoardNo
			, int chalNo
			) {
		try {
			CLike cLOne = new CLike(userId, cBoardNo);
			CBoard cBoard = cService.selectOneByCBoardNo(cBoardNo);
			String cBoardWriter = cBoard.getcBoardWriter();
			if(!userId.equals(cBoardWriter)) {
				List<CLike> checkCLike = clService.selectListByUserIdCBoardNo(cLOne);
				if(checkCLike.isEmpty()) {
					int insertResult = clService.insertCLike(cLOne);
				} else {
					int deleteResult = clService.deleteCLike(cLOne);
				}
			} else {
				mv.addObject("msg", "본인 게시물엔 좋아요를 누를 수 없습니다.");
			}

			mv.setViewName("redirect:/challenge/info.do?chalNo=" + chalNo);
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "좋아요 오류 발생 (관리자에게 문의 요망)");
			mv.addObject("url", "/home.do");
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}
	
	@RequestMapping(value="/challenge/myLike.do", method=RequestMethod.GET)
	public ModelAndView userMyLikeController(ModelAndView mv
											, String userId
											, int cBoardNo
											, int chalNo
											, HttpSession session) {
		String sessionId = (String)session.getAttribute("userId");
		try {
			CLike cLOne = new CLike(sessionId, cBoardNo);
			List<CLike> checkCLike = clService.selectListByUserIdCBoardNo(cLOne);
			if(checkCLike.isEmpty()) {
				int insertResult = clService.insertCLike(cLOne);
			} else {
				int deleteResult = clService.deleteCLike(cLOne);
			}
			mv.setViewName("redirect:/user/myPage.do?userId=" + userId);
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "좋아요 오류 발생 (관리자에게 문의 요망)");
			mv.addObject("url", "redirect:/user/myPage.do?userId=" + userId);
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
		fileMap.put("filePath", "../resources/cuploadFiles/" + fileRename);
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

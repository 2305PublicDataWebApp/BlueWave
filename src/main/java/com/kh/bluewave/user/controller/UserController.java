package com.kh.bluewave.user.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import com.kh.bluewave.challenge.domain.CBoard;
import com.kh.bluewave.challenge.domain.CLike;
import com.kh.bluewave.challenge.domain.Challenge;
import com.kh.bluewave.challenge.service.CBoardService;
import com.kh.bluewave.challenge.service.CLikeService;
import com.kh.bluewave.challenge.service.ChallengeService;
import com.kh.bluewave.goods.domain.Goods;
import com.kh.bluewave.user.domain.Sub;
import com.kh.bluewave.user.domain.User;
import com.kh.bluewave.user.service.SubService;
import com.kh.bluewave.user.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService uService;
	@Autowired
	private SubService sService;
	@Autowired
	private ChallengeService cService;
	@Autowired
	private CBoardService cBService;
	@Autowired
	private CLikeService cLService;

	@RequestMapping(value="/user/findId1.do", method=RequestMethod.GET)
	public ModelAndView showFindId1Form(ModelAndView mv) {
		mv.setViewName("user/findId1");
		return mv;
	}
	
	@RequestMapping(value="/user/findId2.do", method=RequestMethod.GET)
	public ModelAndView showFindId2Form(ModelAndView mv) {
		mv.setViewName("user/findId2");
		return mv;
	}
	
	@RequestMapping(value="/user/findPw1.do", method=RequestMethod.GET)
	public ModelAndView showFindPw1Form(ModelAndView mv) {
		mv.setViewName("user/findPw1");
		return mv;
	}
	
	@RequestMapping(value="/user/findPw2.do", method=RequestMethod.GET)
	public ModelAndView showFindPw2Form(ModelAndView mv) {
		mv.setViewName("user/findPw2");
		return mv;
	}

	@RequestMapping(value="/user/login.do", method=RequestMethod.GET)
	public ModelAndView showLoginForm(ModelAndView mv) {
		mv.setViewName("user/login");
		return mv;
	}
	
	@RequestMapping(value="/user/modify.do", method=RequestMethod.GET)
	public ModelAndView showModifyForm(ModelAndView mv
			, @ModelAttribute User user) {
		User uOne = uService.selectOneById(user);
		mv.addObject("user", uOne);
		mv.setViewName("user/modify");
		return mv;
	}
	
	@RequestMapping(value="/user/register.do", method=RequestMethod.GET)
	public ModelAndView showRegisterForm(ModelAndView mv) {
		mv.setViewName("user/register");
		return mv;
	}
	
	@RequestMapping(value="/user/follow.do", method=RequestMethod.GET)
	public ModelAndView followUser(ModelAndView mv
			, @RequestParam("userId") String userId) {
//		int result = uService.followUser(userId);
		return mv;
	}
	
	@RequestMapping(value="/user/myPage.do", method=RequestMethod.GET)
		public ModelAndView showMyPage(
				@ModelAttribute User user,
				ModelAndView mv
				) {
			try {
				User uOne = uService.selectOneById(user);
				if(uOne != null) {
					// 상단
					int postCount = uService.getPostCountByUserId(user.getUserId());
					List<Goods> goodsList = uService.getGoodsListByUserId(user.getUserId());
					int totalPoint = uService.getTotalPointByUserId(user.getUserId());
					int totalBlueChalCount = uService.getTotalBlueChalCount(user.getUserId());
					int finishTotalBlueChalCount = uService.getFinishTotalBlueChalCount(user.getUserId());
					int totalPersonalChalCount = uService.getTotalPersonalChalCount(user.getUserId());
					int finishTotalPersonalChalCount = uService.getFinishTotalPersonalChalCount(user.getUserId());
					List<Challenge> todayCList = uService.getTodayCList(user.getUserId());
					List<CBoard> calDateList = uService.getCalDateList(user.getUserId());
					
					mv.addObject("todayCList", todayCList);
					mv.addObject("totalPoint", totalPoint);
		            mv.addObject("postCount", postCount);
		            mv.addObject("totalBlueChalCount", totalBlueChalCount);
		            mv.addObject("finishTotalBlueChalCount", finishTotalBlueChalCount);
		            mv.addObject("totalPersonalChalCount", totalPersonalChalCount);
		            mv.addObject("finishTotalPersonalChalCount", finishTotalPersonalChalCount);
		            mv.addObject("goodsList", goodsList);
					mv.addObject("user", uOne);
					mv.addObject("calDateList", calDateList);
					
					
					// 하단
					// 완료 여부 체크
					String userId = user.getUserId();
					int result = cService.updateFinish(); 
					if(result > 0) {
						// 관리자 챌린지 중 회원이 참여한 챌린지
						List<Challenge> cWaveList = cService.selectAllUserWave(userId);
						List<Challenge> cWLikeList = cService.selectLikeByAllUserWave(userId); // 총 좋아요 수
						List<Challenge> cWPplList = cService.selectPeopleByAllUserWave(userId); // 참여 인원 수
						
						 // 회원이 생성한 챌린지
						List<Challenge> cPersonalList = cService.selectAllById(userId);
						List<Challenge> cPLikeList = cService.selectLikeById(userId); // 총 좋아요 수
						
						// 자신의 챌린지 별 인증 게시물 수
						List<Challenge> cPostCntList = cService.selectPostsById(userId);
						
						// 회원이 좋아요를 한 게시물 리스트
						List<CBoard> cBLikePostList = cBService.selectAllLikePostsById(userId);
						List<CLike> cBLikeCntList = cLService.selectAllLikeCnt();// 총 좋아요 수
						
						// 구독
						int followingCnt = sService.selectFollowingCntById(userId); 	// 팔로잉 수
						int followersCnt = sService.selectFollowersCntById(userId); 	// 팔로워 수
						List<Sub> followingList = uService.selectAllFollowingListById(userId); // 팔로잉 목록 
						List<Sub> followersList = uService.selectAllFollowersListById(userId); // 팔로워 목록 
						
						mv.addObject("cWaveList", cWaveList).addObject("cWLikeList", cWLikeList).addObject("cWPplList", cWPplList)
						  .addObject("cPersonalList", cPersonalList).addObject("cPLikeList", cPLikeList)
						  .addObject("cPostCntList", cPostCntList).addObject("cBLikePostList", cBLikePostList).addObject("cBLikeCntList", cBLikeCntList)
						  .addObject("followingCnt", followingCnt).addObject("followersCnt", followersCnt).addObject("followingList", followingList).addObject("followersList", followersList)
						  .setViewName("user/myPage");
					} else {
						mv.addObject("msg", "완료 여부 체크");
						mv.setViewName("common/errorMessage");
					}
				}else {
					mv.addObject("msg", "데이터 조회에 실패했습니다.");
					mv.addObject("error", "데이터 조회 실패");
					mv.addObject("url", "index.jsp");
					mv.setViewName("common/errorPage");
				}
			} catch (Exception e) {
				e.printStackTrace();
				mv.addObject("msg", "관리자에게 문의해주세요.");
				mv.addObject("error", e.getMessage());
				mv.addObject("url", "index.jsp");
				mv.setViewName("common/errorPage");
			}
			return mv;
		}

	@RequestMapping(value="/user/findId1.do", method=RequestMethod.POST)
	public ModelAndView userFindId(ModelAndView mv
			, @RequestParam(value="confirmType") String confirmType
			, @ModelAttribute User user) {
		try {
			String name = user.getUserName();
			String foundUserId = null;
			
			if ("emailType".equals(confirmType)) {
				// 이메일 폼이 제출되었습니다. 이에 맞는 처리를 수행하십시오.
	            String email = user.getUserEmail();
	            User uOne = uService.findUserByEmail(email);
	            if (uOne != null) {
	            	if(name.equals(uOne.getUserName())) {
	                // 사용자가 존재하고, 입력한 이름과 일치하는 경우
	                foundUserId = uOne.getUserId(); // 사용자 아이디를 가져옴
	    			mv.addObject("foundUserId", foundUserId);
	    			mv.setViewName("user/findId2");
	            	}
	            }else {
	            	mv.addObject("msg", "아이디 조회가 완료되지 않았습니다.");
					mv.addObject("error", "아이디 조회 실패");
					mv.addObject("url", "/index.jsp");
					mv.setViewName("common/errorPage");
	            }
			} else if ("phoneType".equals(confirmType)) {
				// 전화번호 폼이 제출되었습니다. 이에 맞는 처리를 수행하십시오.
				String phone = user.getUserPhone();
				User uOne = uService.findUserByPhone(phone);
				if (uOne != null && name.equals(uOne.getUserName())) {
	                // 사용자가 존재하고, 입력한 이름과 일치하는 경우
	                foundUserId = uOne.getUserId(); // 사용자 아이디를 가져옴
	    			mv.addObject("foundUserId", foundUserId);
	    			mv.setViewName("user/findId2");
	            }else {
	            	mv.addObject("msg", "아이디 조회가 완료되지 않았습니다.");
					mv.addObject("error", "아이디 조회 실패");
					mv.addObject("url", "/index.jsp");
					mv.setViewName("common/errorPage");
	            }
			}

		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "관리자에게 문의해주세요.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/index.jsp");
			mv.setViewName("common/errorPage");
		}
	    return mv;
	}
	
	@RequestMapping(value="/user/findPw1.do", method=RequestMethod.POST)
	public ModelAndView userFindPwById(ModelAndView mv, @ModelAttribute User user) {
		try {
			User uOne = uService.selectOneById(user);
			if(uOne != null) {
				mv.setViewName("user/findPw2");
			}else {
				mv.addObject("msg", "아이디 조회가 완료되지 않았습니다.");
				mv.addObject("error", "아이디 조회 실패");
				mv.addObject("url", "/index.jsp");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의해주세요.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/index.jsp");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="/user/login.do", method=RequestMethod.POST)
	public ModelAndView userLoginCheck(ModelAndView mv, @ModelAttribute User user, HttpSession session) {
		try {
			User uOne = uService.checkUserLogin(user);
			if(uOne != null) {
				session.setAttribute("userId", uOne.getUserId());
				mv.setViewName("redirect:/index.jsp");
			}else {
				mv.addObject("msg", "로그인이 완료되지 않았습니다.");
				mv.addObject("error", "로그인 실패");
				mv.addObject("url", "/index.jsp");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의해주세요.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/index.jsp");
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
	
	@RequestMapping(value="/user/modify.do", method=RequestMethod.POST)
	public ModelAndView updateUser(
			@ModelAttribute User user
			, ModelAndView mv
			, @RequestParam(value="userAd", required=false) String userAd
			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, HttpServletRequest request
			, HttpSession session) {
		try {
			userAd  = userAd != null ? "Y" : "N";
			user.setUserAd(userAd);
			if(uploadFile != null && !uploadFile.isEmpty()) {
				// 수정
				// 1. 대체, 2. 삭제 후 등록
				// 기존 업로드 된 파일 존재 여부 체크 후
				String fileName = user.getUserProfileRename();
				if(fileName != null) {
					// 있으면 기존 파일 삭제
					this.deleteFile(fileName, request);
				}
				// 없으면 새로 업로드 하려는 파일 저장
				Map<String, Object> infoMap = this.saveFile(request, uploadFile);
				// 변수 차이
				user.setUserProfileName((String) infoMap.get("userProfileName"));
				user.setUserProfileRename((String) infoMap.get("userProfileRename"));
				user.setUserProfilePath((String) infoMap.get("userProfilePath"));
				user.setUserProfileLength((long) infoMap.get("userProfileLength"));
			}
			
//			// 수정이라는 과정은 대체하는 것, 대체하는 방법은 삭제 후 등록
//			if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
//				String fileRename = user.getUserProfileRename();
//				this.deleteFile(fileRename, request);
//			}
//			// 없으면 새로 업로드 하려는 파일 저장
//			Map<String, Object> infoMap = this.saveFile(request, uploadFile);
//			user.setUserProfileName((String) infoMap.get("userProfileName"));
//			user.setUserProfileRename((String) infoMap.get("userProfileRename"));
//			user.setUserProfilePath((String) infoMap.get("userProfilePath"));
//			user.setUserProfileLength((long) infoMap.get("userProfileLength"));
			
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
	
	@RequestMapping(value="/user/register.do", method=RequestMethod.POST)
	public ModelAndView registerUser(@ModelAttribute User user, ModelAndView mv
			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, @RequestParam(value="userAd", required=false) String userAd
			, HttpServletRequest request ) { // 파일경로 부르기 위해 사용 
			
		try {
			userAd  = userAd != null ? "Y" : "N";
			user.setUserAd(userAd);
			 if (uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
					// 파일 정보(이름, 리네임, 경로, 크기) 및 파일 저장
					 Map<String, Object> UMap = this.saveFile(request, uploadFile);
					 user.setUserProfileName((String) UMap.get("userProfileName"));
					 user.setUserProfileRename((String) UMap.get("userProfileRename"));
					 user.setUserProfilePath((String) UMap.get("userProfilePath"));
					 user.setUserProfileLength((long) UMap.get("userProfileLength"));
			}
			int result = uService.insertUser(user);
			if(result > 0) {
				mv.setViewName("user/login");
			}else {
				mv.addObject("msg", "회원가입이 완료되지 않았습니다.");
				mv.addObject("error", "회원가입 실패");
				mv.addObject("url", "/user/register.do");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의해주세요.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/user/login.do");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "/user/emailCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public String checkEmail(@RequestParam("userEmail") String userEmail) {
	    int result = uService.emailCheck(userEmail);
	    if (result > 0) {
	        return "alreadyTaken";
	    } else {
	        return "available";
	    }
	}
	
	@RequestMapping(value = "/user/nickNameCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public String checkNickName(@RequestParam("userNickName") String userNickName) {
	    int result = uService.nickNameCheck(userNickName);
	    if (result > 0) {
	        return "alreadyTaken";
	    } else {
	        return "available";
	    }
	}
	
	@RequestMapping(value = "/user/idCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public String checkId(@RequestParam("userId") String userId) {
	    int result = uService.idCheck(userId);
	    if (result > 0) {
	        return "alreadyTaken";
	    } else {
	        return "available";
	    }
	}
	
	public Map<String, Object> saveFile(HttpServletRequest request, MultipartFile uploadFile) throws Exception, IOException {
	    Map<String, Object> fileMap = new HashMap<String, Object>();
	    // resource 경로 구하기
	    String root = request.getSession().getServletContext().getRealPath("resources");
	    // 파일 저장경로 구하기
	    String savePath = root + "\\PuploadFiles";
	    // 파일 이름 구하기
	    String fileName = uploadFile.getOriginalFilename();
	    // 파일 확장자 구하기
	    String extension = fileName.substring(fileName.lastIndexOf(".") + 1);
	    // 시간으로 파일 리네임하기
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	    String fileRename = sdf.format(new Date(System.currentTimeMillis())) + "." + extension;
	    // 파일 저장 전 폴더 만들기
	    File saveFolder = new File(savePath);
	    if (!saveFolder.exists()) {
	        saveFolder.mkdir();
	    }
	    // 파일 저장
	    File saveFile = new File(savePath + "\\" + fileRename);
	    uploadFile.transferTo(saveFile);
	    long fileLength = uploadFile.getSize();
	    // 파일 정보 리턴
	    fileMap.put("userProfileName", fileName);
	    fileMap.put("userProfileRename", fileRename);
	    fileMap.put("userProfilePath", "../resources/PuploadFiles/" + fileRename);
	    fileMap.put("userProfileLength", fileLength);

	    return fileMap;
	}
	
	private void deleteFile(String fileName, HttpServletRequest request) {
		// D:\\springworksapce\\BaeSpringMVC\\src\\main\\webapp\\resources 대체
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delFilePath = root+"\\PuploadFiles\\"+fileName;
		File file = new File(delFilePath);
		if(file.exists()) {
			file.delete();
		}
	}
	
	
	
	
	// 마이페이지 블루웨이브 챌린지 select option 전환
	@RequestMapping(value="/user/uWaveChalInfoCheck.do", method=RequestMethod.GET)
	public ModelAndView uWaveChalInfoCheck(@RequestParam("wavefinishOption") String wavefinishOption
//									  , @RequestParam(value="userId", defaultValue = "testuser01") char userId
									  , ModelAndView mv) {
		try {			
			List<Challenge> cList = cService.selectOptionsByFinish(wavefinishOption);
			mv.addObject("cList", cList);
			mv.addObject("wavefinishOption", wavefinishOption);
			mv.setViewName("user/myPage");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorMessage");
		}
		return mv;
	}
	
	
	
//	
//	// 마이페이지 개인 챌린지 select option 전환
//	@RequestMapping(value="/user/uPerChalInfoCheck.do", method=RequestMethod.GET)
//	public ModelAndView uPerChalInfoCheck(@RequestParam("perfinishOption") String perfinishOption
////									   , @RequestParam(value="userId", defaultValue = "testuser01") char userId
//									   , ModelAndView mv) {
//		try {			
//			List<Challenge> cList = cService.selectOptionsByFinish(perfinishOption);
//			mv.addObject("cList", cList);
//			mv.addObject("perfinishOption", perfinishOption);
//			mv.setViewName("user/myPage");
//		} catch (Exception e) {
//			e.printStackTrace();
//			mv.addObject("msg", e.getMessage());
//			mv.setViewName("common/errorMessage");
//		}
//		return mv;
//	}
}
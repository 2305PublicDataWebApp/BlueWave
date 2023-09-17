package com.kh.bluewave.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bluewave.challenge.domain.Challenge;
import com.kh.bluewave.challenge.service.ChallengeService;
import com.kh.bluewave.user.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService uService;
	@Autowired
	private ChallengeService cService;
	
	// 마이페이지 페이지
	@RequestMapping(value="/user/myPage.do", method=RequestMethod.GET)
	public ModelAndView showMyPage(ModelAndView mv) {
		
		String userId = "testuser01";
		try {			
			// 완료 여부 체크
			int result = cService.updateFinish(); 
			System.out.println(result);
			if(result > 0) {
				// 관리자 챌린지 중 회원이 참여한 챌린지
				List<Challenge> cWaveList = cService.selectAllUserWave(userId);
				List<Challenge> cWLikeList = cService.selectLikeByAllUserWave(userId); // 총 좋아요 수
				List<Challenge> cWPplList = cService.selectPeopleByAllUserWave(userId); // 참여 인원 수
				
				 // 회원이 생성한 챌린지
				List<Challenge> cPersonalList = cService.selectAllById(userId);
				List<Challenge> cPLikeList = cService.selectLikeById(userId); // 총 좋아요 수
				
				
				mv.addObject("cWaveList", cWaveList).addObject("cWLikeList", cWLikeList).addObject("cWPplList", cWPplList);
				mv.addObject("cPersonalList", cPersonalList).addObject("cPLikeList", cPLikeList);
				mv.setViewName("user/myPage");
			} else {
				mv.addObject("msg", "완료 여부 체크");
				mv.setViewName("common/errorMessage");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorMessage");
		}
		
		return mv;
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

package com.kh.bluewave.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
			List<Challenge> cList = cService.selectAllById(userId);
			if(!cList.isEmpty()) {
				mv.addObject("cList", cList);
				mv.setViewName("user/myPage");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return mv;
	}
}

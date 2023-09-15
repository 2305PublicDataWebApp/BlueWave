package com.kh.bluewave.challenge.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChallengeController {
	
	@RequestMapping(value="/challenge/page.do", method=RequestMethod.GET)
	public ModelAndView showChallengePage(ModelAndView mv) {
		mv.setViewName("challenge/challengePage");
		return mv;
	}
	
	@RequestMapping(value="/challenge/info.do", method=RequestMethod.GET)
	public ModelAndView showChallengeInfo(ModelAndView mv) {
		mv.setViewName("challenge/challengeInfo");
		return mv;
	}
	
	@RequestMapping(value="/challenge/board.do", method=RequestMethod.GET)
	public ModelAndView showChallengeBoard(ModelAndView mv) {
		mv.setViewName("challenge/challengeBoard");
		return mv;
	}
}

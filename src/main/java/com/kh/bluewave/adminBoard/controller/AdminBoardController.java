package com.kh.bluewave.adminBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminBoardController {

	@RequestMapping(value="/adminBoard.do", method=RequestMethod.GET)
	public ModelAndView goAdminBoard(ModelAndView mv) {
		
		mv.setViewName("adminBoard/adminBoard");
		return mv;
	}
}

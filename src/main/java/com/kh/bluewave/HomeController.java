package com.kh.bluewave;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bluewave.goods.domain.Goods;
import com.kh.bluewave.goods.service.GoodsService;

@Controller
public class HomeController {
	
	@Autowired
	private GoodsService gService;
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv) {
		List<Goods> gList = gService.selectGoodsList();
		mv.addObject("gList", gList);
		return mv;
	}
	
}

package com.kh.bluewave.goods.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GoodsController {

	@RequestMapping(value="/goods/list.do", method = RequestMethod.GET)
	public ModelAndView showGoodsList(ModelAndView mv) {
		mv.setViewName("goods/goodsList");
		return mv;
	}
	
	@RequestMapping(value="/goods/detail.do", method = RequestMethod.GET)
	public ModelAndView showGoodsDetail(ModelAndView mv) {
		mv.setViewName("goods/goodsDetail");
		return mv;
	}
}

package com.kh.bluewave.adminBoard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bluewave.challenge.domain.Challenge;
import com.kh.bluewave.challenge.service.ChallengeService;
import com.kh.bluewave.goods.domain.Goods;
import com.kh.bluewave.goods.service.GoodsService;
import com.kh.bluewave.noticeBoard.domain.NoticeBoard;
import com.kh.bluewave.noticeBoard.domain.PageInfo;
import com.kh.bluewave.noticeBoard.service.NoticeBoardService;
import com.kh.bluewave.tipBoard.domain.TipBoard;
import com.kh.bluewave.tipBoard.service.TipBoardService;
import com.kh.bluewave.user.domain.User;
import com.kh.bluewave.user.service.UserService;

@Controller
public class AdminBoardController {
	
	@Autowired
	private NoticeBoardService nService;
	@Autowired
	private UserService uService;
	@Autowired
	private ChallengeService cService;
	@Autowired
	private TipBoardService tService;
	@Autowired
	private GoodsService gService;

	@RequestMapping(value="/admin/main.do", method=RequestMethod.GET)
	public ModelAndView goAdminBoard(ModelAndView mv) {

		mv.setViewName("adminBoard/adminMain");
		return mv;
	}
	
	@RequestMapping(value="/admin/board.do", method=RequestMethod.GET)
	public ModelAndView sendDataAdminBoard(ModelAndView mv
		, @RequestParam("selectedValue") String selectedValue
		, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage) {
		try {
			int totalCount = 0;
			PageInfo pInfo = null;

			if(selectedValue.equals("notice")) {
				// 공지 리스트
				totalCount = nService.getListCount();
				pInfo = this.getPageInfo(currentPage, totalCount);
				List<NoticeBoard> nList = nService.selectNoticeBoard(pInfo);
				mv.addObject("pInfo", pInfo);
				mv.addObject("nList", nList);
			}else if(selectedValue.equals("user")) {
				//회원 리스트
				totalCount = uService.getListCount();
				pInfo = this.getPageInfo(currentPage, totalCount);
				List<User> uList = uService.selectUserList(pInfo);
				mv.addObject("pInfo", pInfo);
				mv.addObject("uList", uList);
			}else if(selectedValue.equals("chall")) {
				//챌린지명 리스트
				totalCount = cService.getListCount();
				pInfo = this.getPageInfo(currentPage, totalCount);
				List<Challenge> cList = cService.selectChallList(pInfo);
				mv.addObject("pInfo", pInfo);
				mv.addObject("cList", cList);
			}else if(selectedValue.equals("tip")) {
				//팁공유 리스트
				totalCount = tService.getListCount();
				pInfo = this.getPageInfo(currentPage, totalCount);
				List<TipBoard> tList = tService.selectTipBoard(pInfo);
				mv.addObject("pInfo", pInfo);
				mv.addObject("tList", tList);
			}else if(selectedValue.equals("goods")) {
				//굿즈 리스트
				totalCount = gService.getListCount();
				pInfo = this.getPageInfo(currentPage, totalCount);
				List<Goods> gList = gService.selectGoodsList(pInfo);
				mv.addObject("pInfo", pInfo);
				mv.addObject("gList", gList);
			}
		} catch (Exception e) {
			e.getMessage();
		}
		mv.addObject("optVal", selectedValue);
		mv.setViewName("adminBoard/adminBoard");
		
		return mv;
	}
	
	public PageInfo getPageInfo(int currentPage, int totalCount) {
		PageInfo pi = null;
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		int naviTotalCount;
		int startNavi;
		int endNavi;
		
		// double : 자동형변환, int : 강제형변환
		naviTotalCount = (int)((double)totalCount/recordCountPerPage+0.9);
		// Math.ceil((double)totalCount/recordCountPerPage+0.9)
		// currentPage값이 1~5일때 startNavi가 1로 고정되도록 구해주는 식
		startNavi = ((int)((double)currentPage/naviCountPerPage+0.9)-1)*naviCountPerPage + 1;
		endNavi = startNavi + naviCountPerPage - 1;
		// endNavi는 startNavi에 무조건 naviCountPerPage값을 더하므로
		// 실제 최대값보다 커질 수 있음
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		pi = new PageInfo(currentPage, recordCountPerPage, naviCountPerPage, startNavi, endNavi, totalCount, naviTotalCount);
		return pi;
	}		
}

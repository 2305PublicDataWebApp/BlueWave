package com.kh.bluewave.adminBoard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bluewave.noticeBoard.domain.NoticeBoard;
import com.kh.bluewave.noticeBoard.domain.PageInfo;
import com.kh.bluewave.noticeBoard.service.NoticeBoardService;

@Controller
public class AdminBoardController {
	
	@Autowired
	private NoticeBoardService nService;

	@RequestMapping(value="/admin/board.do", method=RequestMethod.GET)
	public ModelAndView goAdminBoard(ModelAndView mv
			, @RequestParam("optVal") String optVal
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage) {
		try {
			int totalCount = nService.getListCount();
			PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
			if(optVal.equals("notice")) {
				// 공지 리스트
				List<NoticeBoard> nList = nService.selectNoticeBoard(pInfo);
				mv.addObject("pInfo", pInfo);
				mv.addObject("nList", nList);
				mv.setViewName("adminBoard/adminBoard");
			}else if(optVal.equals("user")) {
				// 회원 리스트
//				List<User> uList = uService.selectUserList(pInfo);
//				mv.
			}
		} catch (Exception e) {
			e.getMessage();
		}
		
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

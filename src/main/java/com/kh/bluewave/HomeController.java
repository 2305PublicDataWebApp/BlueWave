package com.kh.bluewave;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bluewave.challenge.domain.CBoard;
import com.kh.bluewave.challenge.domain.Challenge;
import com.kh.bluewave.challenge.service.CBoardService;
import com.kh.bluewave.challenge.service.ChallengeService;
import com.kh.bluewave.noticeBoard.domain.NoticeBoard;
import com.kh.bluewave.noticeBoard.domain.PageInfo;
import com.kh.bluewave.noticeBoard.service.NoticeBoardService;

@Controller
public class HomeController {
	
	@Autowired
	private ChallengeService cService;
	@Autowired
	private NoticeBoardService nService;
	@Autowired
	private CBoardService cbService;
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage) {
		List<Challenge> cList = cService.selectListByChal();
		List<Challenge> acList = cService.selectAllListByAdmin();
		int totalCount = nService.getListCount();
		PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
		List<NoticeBoard> nList = nService.selectNoticeBoard(pInfo);
		
		// 해당 챌린지 명에 대한 총 좋아요 수
		List<Challenge> cLikeList = cService.selectAllLikeCnt();
		
		// 해당 챌린지 명에 대한 총 게시물 갯수
		List<CBoard> cBoardCNT = cbService.selectBoardCountList();
		
		mv.addObject("nList", nList);
		mv.addObject("pInfo", pInfo);
		mv.addObject("cList", cList);
		mv.addObject("acList", acList);
		mv.addObject("cLikeList", cLikeList);
		mv.addObject("cBoardCNT", cBoardCNT);
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

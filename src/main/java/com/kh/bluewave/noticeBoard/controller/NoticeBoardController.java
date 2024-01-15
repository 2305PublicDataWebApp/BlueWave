package com.kh.bluewave.noticeBoard.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.kh.bluewave.noticeBoard.domain.NoticeBoard;
import com.kh.bluewave.noticeBoard.domain.PageInfo;
import com.kh.bluewave.noticeBoard.service.NoticeBoardService;

@Controller
public class NoticeBoardController {
	
	@Autowired
	private NoticeBoardService nService;
	@Autowired
    private MappingJackson2JsonView jsonView;

	@RequestMapping(value="/notice/board.do", method=RequestMethod.GET)
	public ModelAndView showNoticeBoard(ModelAndView mv
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage) {
		try {		
			int totalCount = nService.getListCount();
			PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
			List<NoticeBoard> nList = nService.selectNoticeBoard(pInfo);
			if(nList.size() > 0) {				
				mv.addObject("nList", nList);
				mv.addObject("pInfo", pInfo);
				mv.setViewName("notice/noticeBoard");
			}else {
				mv.addObject("msg", "리스트 조회 실패");
				mv.addObject("url","/home.do");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.addObject("url","/home.do");
			mv.setViewName("common/serviceFailed");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/notice/write.do", method=RequestMethod.GET)
	public ModelAndView goNoticeWrite(ModelAndView mv) {
		
		mv.setViewName("notice/noticeWrite");
		return mv;
	}

	@RequestMapping(value="/notice/write.do", method=RequestMethod.POST)
	public ModelAndView registerNoticeBoard(ModelAndView mv
			, @ModelAttribute NoticeBoard noticeBoard
			, @RequestParam("noticeTitle") String noticeTitle
			, @RequestParam("noticeContent") String noticeContent ){
		try {			
			noticeBoard.setNoticeTitle(noticeTitle);
			noticeBoard.setNoticeContent(noticeContent);
			int result = nService.insertNoticeBoard(noticeBoard);
			if(result > 0) {
				mv.setViewName("redirect:/notice/board.do");
			}else {
				mv.addObject("msg", "공지글 등록 실패");
				mv.addObject("url","/notice/board.do");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.addObject("url","/notice/board.do");
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}
	
	@RequestMapping(value="/notice/update.do", method=RequestMethod.GET)
	public ModelAndView showModifyNotice(ModelAndView mv
			, @RequestParam int noticeNo) {
		try {			
			NoticeBoard nOne = nService.selectOneNoticeNo(noticeNo);
			mv.addObject("notice", nOne);
			mv.setViewName("notice/noticeModify");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.addObject("url","/notice/detail.do?noticeNo="+ noticeNo);
			mv.setViewName("common/serviceFailed");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/notice/update.do", method=RequestMethod.POST)
	public ModelAndView updateNotice(ModelAndView mv
			, @RequestParam int noticeNo
			, @RequestParam String noticeTitle
			, @RequestParam String noticeContent
			, @ModelAttribute NoticeBoard noticeBoard) {
		try {			
			noticeBoard.setNoticeNo(noticeNo);
			noticeBoard.setNoticeTitle(noticeTitle);
			noticeBoard.setNoticeContent(noticeContent);
			int result = nService.updateNotice(noticeBoard);
			if(result > 0) {
				mv.setViewName("redirect:/notice/detail.do?noticeNo="+noticeNo);
			}else {
				mv.addObject("msg", "공지글 수정 실패");
				mv.addObject("url","/notice/detail.do?noticeNo="+ noticeNo);
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.addObject("url","/notice/detail.do?noticeNo="+ noticeNo);
			mv.setViewName("common/serviceFailed");
		}
		
		
		return mv;
	}

	@RequestMapping(value="/notice/detail.do", method=RequestMethod.GET)
	public ModelAndView goNoticeDetail(ModelAndView mv
			, @RequestParam int noticeNo) {
		try {			
			NoticeBoard nOne = nService.selectOneNoticeNo(noticeNo);
			int result = nService.updateViewCount(nOne);
			if(result > 0) {				
				mv.addObject("notice", nOne);
				mv.setViewName("notice/noticeDetail");
			}else {
				mv.addObject("msg", "공지 상세페이지 이동 실패");
				mv.addObject("url","/notice/board.do");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.addObject("url","/notice/board.do");
			mv.setViewName("common/serviceFailed");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/notice/delete.do", method=RequestMethod.GET)
	public ModelAndView deleteNotice(ModelAndView mv
			, @RequestParam int noticeNo) {
		try {
			int result = nService.deleteNotice(noticeNo);
			if(result > 0) {
				mv.setViewName("redirect:/notice/board.do");
			}else {
				mv.addObject("msg", "공지 게시글 삭제 실패");
				mv.addObject("url","/notice/board.do");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.addObject("url","/notice/board.do");
			mv.setViewName("common/serviceFailed");
		}
		
		return mv;
	}

	// CkEditor 이미지
	@RequestMapping(value="/notice/image.do")
	public ModelAndView image(MultipartHttpServletRequest request) throws Exception{
		// ckeditor는 이미지 업로드 후 이미지 표시하기 위해 uploaded 와 url을 json 형식으로 받아야 함
		// modelandview를 사용하여 json 형식으로 보내기위해 모델앤뷰 생성자 매개변수로 jsonView 라고 써줌
		// jsonView 라고 쓴다고 무조건 json 형식으로 가는건 아니고 @Configuration 어노테이션을 단 
		// WebConfig 파일에 MappingJackson2JsonView 객체를 리턴하는 jsonView 매서드를 만들어서 bean으로 등록해야 함 
		ModelAndView mv = new ModelAndView(jsonView);
		
		try {			
			// ckeditor 에서 파일을 보낼 때 upload : [파일] 형식으로 해서 넘어오기 때문에 upload라는 키의 밸류를 받아서 uploadFile에 저장함
			MultipartFile uploadFile = request.getFile("upload");
			
			// 파일의 오리지널 네임
			String noticeFileName = uploadFile.getOriginalFilename();
			
			// 파일의 확장자
			String ext = noticeFileName.substring(noticeFileName.indexOf("."));
			
			// 서버에 저장될 때 중복된 파일 이름인 경우를 방지하기 위해 UUID에 확장자를 붙여 새로운 파일 이름을 생성
			String noticeFileRename = UUID.randomUUID() + ext;
			
			// 이미지를 현재 경로와 연관된 파일에 저장하기 위해 현재 경로를 알아냄
			String realPath = request.getSession().getServletContext().getRealPath("resources");
			String saveFolder = realPath + "\\nUploadFiles";
			File folder = new File (saveFolder);
			if(!folder.exists()) {
				folder.mkdir();
			}
			//절대 경로
			String savePath = saveFolder + "\\" + noticeFileRename;
			
			// 브라우저에서 이미지 불러올 때 절대 경로로 불러오면 보안의 위험 있어 상대경로를 쓰거나 이미지 불러오는 jsp 또는 클래스 파일을 만들어 가져오는 식으로 우회해야 함
			// 때문에 savePath와 별개로 상대 경로인 uploadPath 만들어줌
			String noticeFilePath = "../resources/nUploadFiles/" + noticeFileRename; 
			
			// 저장 경로로 파일 객체 생성
			File file = new File(savePath);
			
			// 파일 업로드
			uploadFile.transferTo(file);
			
			
			mv.addObject("uploaded", true); // 업로드 완료
			mv.addObject("url", noticeFilePath); // 업로드 파일의 경로
			
		} catch (Exception e) {
			e.getMessage();
		}
		
	    return mv;
	}
	
	// 페이징 처리
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

package com.kh.bluewave.tipBoard.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

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

import com.kh.bluewave.tipBoard.domain.PageInfo;
import com.kh.bluewave.tipBoard.domain.TipBoard;
import com.kh.bluewave.tipBoard.service.TipBoardService;


@Controller
public class TipBoardController {
	
	@Autowired
	private TipBoardService tService;
	@Autowired
    private MappingJackson2JsonView jsonView;

	/**
	 * 팁공유 리스트 조회
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="/tip/board.do", method=RequestMethod.GET)
	public ModelAndView showTipBoard(ModelAndView mv
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage) {
		try {		
			int totalCount = tService.getListCount();
			PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
			List<TipBoard> tList = tService.selectTipBoard(pInfo);
			if(tList.size() > 0) {				
				mv.addObject("tList", tList);
				mv.addObject("pInfo", pInfo);
				mv.setViewName("tip/tipBoard");
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
	
	/**
	 * 팁공유글 작성페이지로 이동
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="/tip/write.do", method=RequestMethod.GET)
	public ModelAndView goTipWrite(ModelAndView mv) {
		
		mv.setViewName("tip/tipWrite");
		return mv;
	}
	/**
	 * 팁공유 게시글 등록
	 * @param mv
	 * @param tipBoard
	 * @param request 
	 * @param request 
	 * @return 
	 */
	@RequestMapping(value="/tip/insert.do", method=RequestMethod.POST)
	public ModelAndView registerTipBoard(ModelAndView mv
			, @ModelAttribute TipBoard tipBoard
			, @RequestParam("tipWriter") String tipWriter
			, @RequestParam("tipTitle") String tipTitle
			, @RequestParam("tipContent") String tipContent ){
		try {			
			tipBoard.setTipWriter(tipWriter);
			tipBoard.setTipTitle(tipTitle);
			tipBoard.setTipContent(tipContent);
			int result = tService.insertTipBoard(tipBoard);
			if(result > 0) {
				mv.setViewName("redirect:/tip/board.do");
			}else {
				mv.addObject("msg", "팁공유글 등록 실패");
				mv.addObject("url","/tip/board.do");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.addObject("url","/tip/board.do");
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}
	
	/**
	 * 팁공유글 수정페이지로 이동
	 * @param mv
	 * @param TipNo
	 * @return
	 */
	@RequestMapping(value="/tip/modify.do", method=RequestMethod.GET)
	public ModelAndView showModifyTip(ModelAndView mv
			, @RequestParam int tipNo) {
		try {			
			TipBoard tOne = tService.selectOneTipNo(tipNo);
			mv.addObject("tip", tOne);
			mv.setViewName("tip/tipModify");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.addObject("url","/tip/detail.do?tipNo="+ tipNo);
			mv.setViewName("common/serviceFailed");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/tip/update.do", method=RequestMethod.POST)
	public ModelAndView updateTip(ModelAndView mv
			, @RequestParam int tipNo
			, @RequestParam String tipTitle
			, @RequestParam String tipContent
			, @ModelAttribute TipBoard tipBoard) {
		try {			
			tipBoard.setTipNo(tipNo);
			tipBoard.setTipTitle(tipTitle);
			tipBoard.setTipContent(tipContent);
			int result = tService.updateTip(tipBoard);
			if(result > 0) {
				mv.setViewName("redirect:/tip/detail.do?tipNo="+tipNo);
			}else {
				mv.addObject("msg", "팁공유글 수정 실패");
				mv.addObject("url","/tip/detail.do?tipNo="+ tipNo);
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.addObject("url","/tip/detail.do?tipNo="+ tipNo);
			mv.setViewName("common/serviceFailed");
		}
		
		
		return mv;
	}
	
	/**
	 * 팁공유글 상세페이지로 이동
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="/tip/detail.do", method=RequestMethod.GET)
	public ModelAndView goTipDetail(ModelAndView mv
			, @RequestParam int tipNo) {
		try {			
			TipBoard tOne = tService.selectOneTipNo(tipNo);
			int result = tService.updateViewCount(tOne);
			if(result > 0) {				
				mv.addObject("tip", tOne);
				mv.setViewName("tip/tipDetail");
			}else {
				mv.addObject("msg", "팁공유 상세페이지 이동 실패");
				mv.addObject("url","/tip/board.do");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.addObject("url","/tip/board.do");
			mv.setViewName("common/serviceFailed");
		}
		
		return mv;
	}
	@RequestMapping(value="/tip/delete.do", method=RequestMethod.GET)
	public ModelAndView deleteTip(ModelAndView mv
			, @RequestParam int tipNo) {
		try {
			int result = tService.deleteTip(tipNo);
			if(result > 0) {
				mv.setViewName("redirect:/tip/board.do");
			}else {
				mv.addObject("msg", "팁공유 게시글 삭제 실패");
				mv.addObject("url","/tip/board.do");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.addObject("url","/tip/board.do");
			mv.setViewName("common/serviceFailed");
		}
		
		return mv;
	}

	/**
	 * ckEditor 이미지
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/tip/image.do")
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
			String tipFileName = uploadFile.getOriginalFilename();
			
			// 파일의 확장자
			String ext = tipFileName.substring(tipFileName.indexOf("."));
			
			// 서버에 저장될 때 중복된 파일 이름인 경우를 방지하기 위해 UUID에 확장자를 붙여 새로운 파일 이름을 생성
			String tipFileRename = UUID.randomUUID() + ext;
			
			// 이미지를 현재 경로와 연관된 파일에 저장하기 위해 현재 경로를 알아냄
			String realPath = request.getSession().getServletContext().getRealPath("resources");
			String saveFolder = realPath + "\\tUploadFiles";
			File folder = new File (saveFolder);
			if(!folder.exists()) {
				folder.mkdir();
			}
			//절대 경로
			String savePath = saveFolder + "\\" + tipFileRename;
			
			// 브라우저에서 이미지 불러올 때 절대 경로로 불러오면 보안의 위험 있어 상대경로를 쓰거나 이미지 불러오는 jsp 또는 클래스 파일을 만들어 가져오는 식으로 우회해야 함
			// 때문에 savePath와 별개로 상대 경로인 uploadPath 만들어줌
			String tipFilePath = "../resources/tUploadFiles/" + tipFileRename; 
			
			// 저장 경로로 파일 객체 생성
			File file = new File(savePath);
			
			// 파일 업로드
			uploadFile.transferTo(file);
			
			
			mv.addObject("uploaded", true); // 업로드 완료
			mv.addObject("url", tipFilePath); // 업로드 파일의 경로
			
		} catch (Exception e) {
			e.getMessage();
		}
		
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

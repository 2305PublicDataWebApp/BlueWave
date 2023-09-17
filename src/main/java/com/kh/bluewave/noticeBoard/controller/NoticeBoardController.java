package com.kh.bluewave.noticeBoard.controller;

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

import com.kh.bluewave.noticeBoard.domain.NoticeBoard;
import com.kh.bluewave.noticeBoard.service.NoticeBoardService;

@Controller
public class NoticeBoardController {
	
	@Autowired
	private NoticeBoardService nService;
	@Autowired
    private MappingJackson2JsonView jsonView;

	/**
	 * 공지 리스트 조회
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="/noticeBoard.do", method=RequestMethod.GET)
	public ModelAndView showNoticeBoard(ModelAndView mv) {
		try {			
			List<NoticeBoard> nList = nService.selectNoticeBoard();
			if(nList.size() > 0) {				
				mv.addObject("nList", nList);
				mv.setViewName("notice/noticeBoard");
			}else {
				mv.addObject("error", "리스트 조회 실패");
			}
		} catch (Exception e) {
			e.getMessage();
		}
		
		return mv;
	}
	
	@RequestMapping(value="/noticeWrite.do", method=RequestMethod.GET)
	public ModelAndView goNoticeWrite(ModelAndView mv) {
		mv.setViewName("notice/noticeWrite");
		
		return mv;
	}
	/**
	 * 공지 게시글 등록
	 * @param mv
	 * @param noticeBoard
	 * @param request 
	 * @param request 
	 * @return 
	 */
	@RequestMapping(value="/insertNotice.do", method=RequestMethod.POST)
	public ModelAndView registerNoticeBoard(ModelAndView mv
			, @ModelAttribute NoticeBoard noticeBoard
			, @RequestParam("noticeTitle") String noticeTitle
			, @RequestParam("noticeContent") String noticeContent ){
		noticeBoard.setNoticeTitle(noticeTitle);
		noticeBoard.setNoticeContent(noticeContent);
		int result = nService.insertNoticeBoard(noticeBoard);
		if(result > 0) {
			mv.setViewName("redirect:notice/noticeBoard");
		}else {
			mv.addObject("error", "등록 실패");
			mv.setViewName("notice/noticeBoard");
		}
		return mv;
	}
	
	@RequestMapping(value="/noticeDetail.do", method=RequestMethod.GET)
	public ModelAndView goNoticeDetail(ModelAndView mv) {
		mv.setViewName("notice/noticeDetail");
		
		return mv;
	}

	//json 어떤식으로 사용되는지
	@RequestMapping(value="/ajax/image.do")
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
			String saveFolder = realPath + "\\images\\nUpload";
			File folder = new File (saveFolder);
			if(!folder.exists()) {
				folder.mkdir();
			}
			String savePath = saveFolder + "\\" + noticeFileRename;
			
			// 브라우저에서 이미지 불러올 때 절대 경로로 불러오면 보안의 위험 있어 상대경로를 쓰거나 이미지 불러오는 jsp 또는 클래스 파일을 만들어 가져오는 식으로 우회해야 함
			// 때문에 savePath와 별개로 상대 경로인 uploadPath 만들어줌
			String noticeFilePath = "../resources/images/nUpload/" + noticeFileRename; 
			
			// 저장 경로로 파일 객체 생성
			File file = new File(savePath);
			
			// 파일 업로드
			uploadFile.transferTo(file);
			
//			long noticeFileLength = uploadFile.getSize();
			
			mv.addObject("uploaded", true); // 업로드 완료
			mv.addObject("url", noticeFilePath); // 업로드 파일의 경로
//			mv.addObject("noticeFileName", noticeFileName);
//			mv.addObject("noticeFileRename", noticeFileRename);
//			mv.addObject("noticeFileLength", noticeFileLength);
			
		} catch (Exception e) {
			e.getMessage();
		}
		
	    return mv;
	}
}

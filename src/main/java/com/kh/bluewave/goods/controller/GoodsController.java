package com.kh.bluewave.goods.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bluewave.goods.domain.Goods;
import com.kh.bluewave.goods.domain.PageInfo;
import com.kh.bluewave.goods.service.GoodsService;

@Controller
public class GoodsController {
	
	@Autowired
	private GoodsService gService;

	@RequestMapping(value="/goods/detail.do", method = RequestMethod.GET)
	public ModelAndView showGoodsDetail(ModelAndView mv
			, @RequestParam("productNo") int productNo) {
		Goods goodsOne = gService.selectGoodsByNo(productNo);
		mv.addObject("goods", goodsOne);
		mv.setViewName("goods/goodsDetail");
		return mv;
	}

	@RequestMapping(value="/goods/list.do", method = RequestMethod.GET)
	public ModelAndView showGoodsList(
			ModelAndView mv) {
		List<Goods> gList = gService.selectGoodsList();
		mv.addObject("gList", gList).setViewName("goods/goodsList");
		return mv;
	}
	
	public Map<String, Object> saveFile(HttpServletRequest request, MultipartFile uploadFile) throws Exception {
		Map<String, Object> fileMap = new HashMap<String, Object>();
		// resources 경로 구하기
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 파일 저장경로 구하기
		String savePath = root + "\\guploadFiles";
		// 파일 이름 구하기
		String fileName = uploadFile.getOriginalFilename();
		// 파일 확장자 구하기
		String extension = fileName.substring(fileName.lastIndexOf(".")+1);
		// 시간으로 파일 리네임하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMDDHHmmss");
		String fileRename = sdf.format(new Date(System.currentTimeMillis())) + "." + extension;
		// 파일 저장 전 폴더 만들기
		File saveFolder = new File(savePath);
		if(!saveFolder.exists()) {
			saveFolder.mkdir();
		}
		// 파일 저장
		File saveFile = new File(savePath + "\\" + fileRename);
		uploadFile.transferTo(saveFile);
		long fileLength = uploadFile.getSize();
		// 파일 정보 리턴
		fileMap.put("fileName", fileName);
		fileMap.put("fileRename", fileRename);
		fileMap.put("filePath", "../resources/buploadFiles" + fileRename);
		fileMap.put("fileLength", fileLength);
		return fileMap;
	}
}

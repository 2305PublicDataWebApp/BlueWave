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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bluewave.goods.domain.Goods;
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
	
	// 굿즈 등록페이지
	@RequestMapping(value="/goods/write.do", method=RequestMethod.GET)
	public ModelAndView showWriteForm(ModelAndView mv) {
		mv.setViewName("goods/goodsWrite");
		
		return mv;
	}
	
	// 굿즈 등록
	@RequestMapping(value="/goods/insert.do", method=RequestMethod.POST)
	public ModelAndView insertGoods(
			ModelAndView mv
			, @ModelAttribute Goods goods
			, @RequestParam(value="pThumbnail", required = false) MultipartFile productThumbnail
			, @RequestParam(value="pImage", required = false) MultipartFile productImage
			, HttpServletRequest request){
		try {
			if(productThumbnail != null && !productThumbnail.getOriginalFilename().equals("")) {
				// 파일정보(이름, 리네임, 경로, 크기) 및 파일저장
				Map<String, Object> gtMap = this.ThumbSaveFile(request, productThumbnail);
				goods.setProductThumbnail((String)gtMap.get("productThumbnail"));
				goods.setProductThumbnailRename((String)gtMap.get("productThumbnailRename"));
				goods.setProductThumbnailPath((String)gtMap.get("productThumbnailPath"));
				goods.setProductThumbnailLength((long)gtMap.get("productThumbnailLength"));
			}
			if(productImage != null && !productImage.getOriginalFilename().equals("")) {
				// 파일정보(이름, 리네임, 경로, 크기) 및 파일저장
				Map<String, Object> giMap = this.ImageSaveFile(request, productImage);
				goods.setProductImage((String)giMap.get("productImage"));
				goods.setProductImageRename((String)giMap.get("productImageRename"));
				goods.setProductImagePath((String)giMap.get("productImagePath"));
				goods.setProductImageLength((long)giMap.get("productImageLength"));
			}
			System.out.println(goods.toString());
			int result = gService.insertGoods(goods);
			if(result > 0) {
				mv.setViewName("redirect:/admin/board.do");
			}else {
				System.out.println("실패");
				mv.addObject("msg", "작성 실패");
				mv.addObject("url", "common/errorMessage");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}
	
	public Map<String, Object> ThumbSaveFile(HttpServletRequest request, MultipartFile productThumbnail) throws Exception {
		Map<String, Object> fileMap = new HashMap<String, Object>();
		// resources 경로 구하기
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 파일 저장경로 구하기
		String savePath = root + "\\gtuploadFiles";
		// 파일 이름 구하기
		String fileName = productThumbnail.getOriginalFilename();
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
		productThumbnail.transferTo(saveFile);
		long fileLength = productThumbnail.getSize();
		// 파일 정보 리턴
		fileMap.put("productThumbnail", fileName);
		fileMap.put("productThumbnailRename", fileRename);
		fileMap.put("productThumbnailPath", "../resources/gtuploadFiles/" + fileRename);
		fileMap.put("productThumbnailLength", fileLength);
		return fileMap;
	}
	
	public Map<String, Object> ImageSaveFile(HttpServletRequest request, MultipartFile productImage) throws Exception {
		Map<String, Object> fileMap = new HashMap<String, Object>();
		// resources 경로 구하기
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 파일 저장경로 구하기
		String savePath = root + "\\giuploadFiles";
		// 파일 이름 구하기
		String fileName = productImage.getOriginalFilename();
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
		productImage.transferTo(saveFile);
		long fileLength = productImage.getSize();
		// 파일 정보 리턴
		fileMap.put("productImage", fileName);
		fileMap.put("productImageRename", fileRename);
		fileMap.put("productImagePath", "../resources/giuploadFiles/" + fileRename);
		fileMap.put("productImageLength", fileLength);
		return fileMap;
	}
}

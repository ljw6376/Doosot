package faq.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import faq.bean.FAQDTO;

@Controller
public class FAQController {

	@Autowired
	private FAQService faqService;
	
	// Command 객체 : @RequestMapping이 붙은 함수의 매개변수를 관리하는 객체
	@RequestMapping(value = "*/FAQList.do")	
	public ModelAndView FAQList(HttpServletRequest request) {
		// 1. 데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		int totalA = faqService.getTotalA();	// 총 글수
		int totalP = (totalA + 4) / 5;			// 총 페이지 수 1
		
		if (pg > totalP) {
			pg = totalP;
		}
		// 페이징 : 3블럭 페이지 표시
		int startPage = (pg - 1) / 3 * 3 + 1;
		int endPage = startPage + 2;//3
		if (endPage > totalP)
			endPage = totalP;
		
		// 목록 : 5개씩
		int endNum = pg * 5;
		int startNum = endNum - 4;
		List<FAQDTO> list = faqService.faqList(startNum, endNum);
		
		// 2. 데이터 공유 + 파일명
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("totalP", totalP);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("list", list);
		modelAndView.addObject("pg", pg);
		modelAndView.setViewName("../faq/FAQList.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value = "*/FAQView.do")
	public ModelAndView FAQView(HttpServletRequest request) {
		// 데이터
		int faq_seq = Integer.parseInt(request.getParameter("faq_seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		FAQDTO dto = faqService.FAQView(faq_seq);		
		
		// 데이터 공유 + 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("faq_seq", faq_seq);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("dto", dto);
		modelAndView.setViewName("../faq/FAQView.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value = "*/FAQWriteForm.do") 	// FAQWriteForm => FAQWrite의미
	public ModelAndView FAQWriteForm(HttpServletRequest request, MultipartFile faq_img) {
		String filePath = request.getSession().getServletContext().getRealPath("/fileupload");
		String fileName = faq_img.getOriginalFilename();
		
		File file = new File(filePath, fileName);
		
		try {
			FileCopyUtils.copy(faq_img.getInputStream(), new FileOutputStream(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();		
		}
		
		int pg = 1;
		
		// 데이터
		String faq_subject = request.getParameter("faq_subject");
		String faq_content = request.getParameter("faq_content");
		String faq_id = request.getParameter("faq_id");
		
		FAQDTO dto = new FAQDTO();
		dto.setFaq_subject(faq_subject);
		dto.setFaq_content(faq_content);
		dto.setFaq_img(fileName);
		dto.setFaq_id(faq_id);
		
		int result = faqService.FAQWrite(dto);
		// 2. 데이터 공유 + 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("result", result);
		modelAndView.setViewName("../faq/FAQWrite.jsp");
		return modelAndView;	
	}

	@RequestMapping(value = "*/FAQModifyForm.do")
	public ModelAndView FAQModifyForm(HttpServletRequest request) {
		
		// 1. 데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
		int faq_seq = Integer.parseInt(request.getParameter("faq_seq"));
		
		FAQDTO dto = faqService.FAQView(faq_seq);
			
		// 2. 데이터 공유 + 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("dto", dto);
		modelAndView.setViewName("../faq/FAQModifyForm.jsp");
		return modelAndView;			
	}
	
	@RequestMapping(value = "*/FAQModify.do")
	public ModelAndView FAQModify(HttpServletRequest request, MultipartFile faq_img) {
		String filePath = request.getSession().getServletContext().getRealPath("/fileupload");
		String fileName = faq_img.getOriginalFilename();
		
		File file = new File(filePath, fileName);
		
		try {
			FileCopyUtils.copy(faq_img.getInputStream(), new FileOutputStream(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		int pg = Integer.parseInt(request.getParameter("pg"));
		int faq_seq = Integer.parseInt(request.getParameter("faq_seq"));
		
		FAQDTO dto = faqService.FAQView(faq_seq);
		
		dto.setFaq_subject(request.getParameter("faq_subject"));
		dto.setFaq_content(request.getParameter("faq_content"));
		dto.setFaq_img(fileName);
		dto.setFaq_id(request.getParameter("faq_id"));
		
		int result = faqService.FAQModify(dto);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("result", result);
		modelAndView.setViewName("../faq/FAQModify.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="*/FAQDelete.do")
	public ModelAndView FAQDelete(HttpServletRequest request) {
		int pg = Integer.parseInt(request.getParameter("pg"));
		int faq_seq = Integer.parseInt(request.getParameter("faq_seq"));
		
		int result = faqService.FAQDelete(faq_seq);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("result", result);
		modelAndView.setViewName("../faq/FAQDelete.jsp");
		return modelAndView;
		
	}
}

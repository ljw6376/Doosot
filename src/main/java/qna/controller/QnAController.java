package qna.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import qna.bean.QnADTO;
import re.bean.ReDTO;
import re.dao.ReDAO;

@Controller
public class QnAController {
	
	@Autowired
	private QnAService qnaService;
	
	@RequestMapping(value = "*/QnAList.do")
	public ModelAndView QnAList(HttpServletRequest request) {
		// 데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		int totalA = qnaService.getTotalA();
		int totalP = (totalA + 4) / 5;
		
		if (pg > totalP) {
			pg = totalP;
		}
		// 페이징 : 3블럭 페이지 표시
		int startPage = (pg - 1) / 3 * 3 + 1;
		int endPage = startPage + 2;
		if (endPage < totalP)
			endPage = totalP;
		
		// 목록 : 5개씩
		int endNum = pg * 5;
		int startNum = endNum - 4;
		List<QnADTO> list = qnaService.qnaList(startNum, endNum);
		
		// 데이터 공유 + 파일명
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("totalP", totalP);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("list", list);
		modelAndView.addObject("pg", pg);
		modelAndView.setViewName("../qna/qna_List.jsp");
		return modelAndView;	
	}
	
	@RequestMapping(value = "*/QnAView.do")
	public ModelAndView QnAView(HttpServletRequest request) {
		// 데이터
		int qna_seq = Integer.parseInt(request.getParameter("qna_seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		QnADTO dto = qnaService.QnAView(qna_seq);
		ReDTO redto = qnaService.QnAReply(qna_seq);
		// 데이터 공유 + 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("qna_seq", qna_seq);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("dto", dto);
		modelAndView.addObject("redto", redto);
		modelAndView.setViewName("../qna/qna_View.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value = "*/QnAWriteForm.do")
	public ModelAndView QnAWriteForm(HttpServletRequest request) {	
		// 데이터 
		int pg = 1;
		
		String qna_subject = request.getParameter("qna_subject");
		String qna_content = request.getParameter("qna_content");
		String qna_id = request.getParameter("qna_id");
		
		QnADTO dto = new QnADTO();
		dto.setQna_subject(qna_subject);
		dto.setQna_content(qna_content);
		dto.setQna_id(qna_id);
		
		int result = qnaService.QnAWrite(dto);
		// 데이터 공유 + 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("result", result);
		modelAndView.setViewName("../qna/qna_Write.jsp");
		return modelAndView;

	}
	@RequestMapping(value = "*/QnAReplyForm.do")
	public ModelAndView QnAReplyForm(HttpServletRequest request) {
		
		// 데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
		int qna_seq = Integer.parseInt(request.getParameter("qna_seq"));
		
		QnADTO dto = qnaService.QnAView(qna_seq);
		
		// 데이터 공유 + 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("dto", dto);
		modelAndView.addObject("qna_seq", qna_seq);
		modelAndView.setViewName("../qna/qna_ReplyForm.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value = "*/QnAReply.do")
	public ModelAndView QnAReply(HttpServletRequest request) {
		int pg = Integer.parseInt(request.getParameter("pg"));
		int qna_seq = Integer.parseInt(request.getParameter("qna_seq"));
		System.out.println(qna_seq);
		ReDTO dto = new ReDTO();
		dto.setQna_seq(qna_seq);
		dto.setQna_reCont(request.getParameter("qna_reCont"));
		dto.setQna_reId(request.getParameter("qna_reId"));
		
		int result = qnaService.QnAReplyForm(dto);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("result", result);
		modelAndView.addObject("qna_seq", qna_seq);
		modelAndView.setViewName("../qna/qna_Reply.jsp");
		return modelAndView;
	}
	
}

package faq.controller;

import java.util.List;

import faq.bean.FAQDTO;

public interface FAQService {
		// 목록 (5개씩)
		public List<FAQDTO> faqList(int startNum, int endNum);
		// 총 데이터수
		public int getTotalA();
		// 글쓰기
		public int FAQWrite(FAQDTO faqdto);
		// 수정하기
		public int FAQModify(FAQDTO faqdto);
		// 상세보기
		public FAQDTO FAQView(int faq_seq);
		// 삭제하기
		public int FAQDelete(int faq_Seq);
}

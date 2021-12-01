package faq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import faq.bean.FAQDTO;
import faq.dao.FAQDAO;

@Service
public class FAQServiceImpl implements FAQService{
	
	@Autowired
	private FAQDAO faqDAO;
	
	@Override
	public List<FAQDTO> faqList(int startNum, int endNum) {
		return faqDAO.faqList(startNum, endNum);
	}
	@Override
	public int getTotalA() {
		return faqDAO.getTotalA();
	}

	@Override
	public int FAQWrite(FAQDTO faqdto) {
		return faqDAO.FAQWrite(faqdto);
	}

	@Override
	public int FAQModify(FAQDTO faqdto) {
		return faqDAO.FAQModify(faqdto);
	}

	@Override
	public FAQDTO FAQView(int faq_seq) {
		return faqDAO.FAQView(faq_seq);
	}
	
	@Override
	public int FAQDelete(int faq_seq) {
		return faqDAO.FAQDelete(faq_seq);
	}
}

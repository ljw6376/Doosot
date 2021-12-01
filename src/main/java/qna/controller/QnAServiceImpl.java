package qna.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import qna.bean.QnADTO;
import qna.dao.QnADAO;
import re.bean.ReDTO;
import re.dao.ReDAO;

@Service
public class QnAServiceImpl implements QnAService{

	@Autowired
	private QnADAO qnaDAO;
	
	@Autowired
	private ReDAO reDAO;
	
	@Override
	public List<QnADTO> qnaList(int startNnum, int endNum) {
		return qnaDAO.qnaList(startNnum, endNum);
	}

	@Override
	public int getTotalA() {
		return qnaDAO.getTotalA();
	}

	@Override
	public int QnAWrite(QnADTO qnadto) {
		return qnaDAO.QnAWrite(qnadto);
	}
	@Override
	public QnADTO QnAView(int qna_seq) {
		return qnaDAO.QnAView(qna_seq);
	}
	@Override
	public ReDTO QnAReply(int qna_seq) {
		return reDAO.QnAReply(qna_seq);
	}
	@Override
	public int QnAReplyForm(ReDTO dto) {
		return reDAO.QnAReplyForm(dto);
	}
	
	

	

	
}

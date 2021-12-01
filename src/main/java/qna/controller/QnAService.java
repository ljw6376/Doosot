package qna.controller;

import java.util.List;

import qna.bean.QnADTO;
import re.bean.ReDTO;

public interface QnAService {
	// 목록
	public List<QnADTO> qnaList(int startNnum, int endNum);
	// 총 데이터 수
	public int getTotalA();
	// 글쓰기
	public int QnAWrite(QnADTO qnadto);
	// 상세보기
	public QnADTO QnAView(int qna_seq);
	// 답변달기
	public ReDTO QnAReply(int qna_seq);
	
	public int QnAReplyForm(ReDTO dto);
	
	
}

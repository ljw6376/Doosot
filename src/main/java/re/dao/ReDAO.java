package re.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import re.bean.ReDTO;

@Repository
public class ReDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 답변 달기
	public ReDTO QnAReply(int qna_seq) {
		return sqlSession.selectOne("mybatis.qnaMapper.QnAReply", qna_seq);
	}
	
	public int QnAReplyForm(ReDTO dto) {
		return sqlSession.insert("mybatis.qnaMapper.QnAReplyForm", dto);
	}
}

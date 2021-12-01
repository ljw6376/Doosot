package qna.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import qna.bean.QnADTO;

@Repository
public class QnADAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 목록 
	public List<QnADTO> qnaList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.qnaMapper.QnAList", map);	
	}
	// 총 데이터 수
	public int getTotalA() {
		return sqlSession.selectOne("mybatis.qnaMapper.getTotalA");
	}
	// 상세보기
	public QnADTO QnAView(int qna_seq) {
		return sqlSession.selectOne("mybatis.qnaMapper.QnAView", qna_seq);
	}
	// 글쓰기
	public int QnAWrite(QnADTO qnadto) {
		return sqlSession.insert("mybatis.qnaMapper.QnAWrite", qnadto);
	}
	
}

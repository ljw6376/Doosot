package faq.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import faq.bean.FAQDTO;

@Repository
public class FAQDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 목록 (5개씩)
	public List<FAQDTO> faqList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.faqMapper.FAQList", map);	
	}
	// 총 데이터 수
	public int getTotalA() {
		return sqlSession.selectOne("mybatis.faqMapper.getTotalA");
	}
	// 글쓰기
	public int FAQWrite(FAQDTO faqdto) {
		return sqlSession.insert("mybatis.faqMapper.FAQWrite", faqdto);
	}
	// 수정하기
	public int FAQModify(FAQDTO faqdto) {
		return sqlSession.insert("mybatis.faqMapper.FAQModify", faqdto);
	}
	// 상세보기
	public FAQDTO FAQView(int faq_seq) {		
		return sqlSession.selectOne("mybatis.faqMapper.FAQView", faq_seq);
	}
	// 삭제하기
	public int FAQDelete(int faq_seq) {
		return sqlSession.delete("mybatis.faqMapper.FAQDelete", faq_seq);
	}
}

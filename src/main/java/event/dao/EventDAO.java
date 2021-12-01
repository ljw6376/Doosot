package event.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import event.bean.EventDTO;

@Repository
public class EventDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 목록 (3개씩)
	public List<EventDTO> eventList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.EventMapper.event_List", map);
	}
	
	// 글 작성
	public int eventWrite(EventDTO eventDto) {
		return sqlSession.insert("mybatis.EventMapper.event_Write", eventDto);
	}
	
	// 총 데이터 수
	public int getTotalA() {
		return sqlSession.selectOne("mybatis.EventMapper.event_Total");
	}
	
	// 상세 보기
	public EventDTO eventView(int eve_num) {
		return sqlSession.selectOne("mybatis.EventMapper.event_View", eve_num);
	}
	
	// 삭제 하기
	public int delete(int eve_num) {
		return sqlSession.delete("mybatis.EventMapper.event_Delete", eve_num);
	}
	
	// 수정하기
	public int eventCorr(EventDTO eventDto) {
		return sqlSession.insert("mybatis.EventMapper.event_Corr", eventDto);
	}
	
}

package loca.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import event.bean.EventDTO;
import loca.bean.LocaDTO;

@Repository
public class LocaDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 목록 10개씩 보기 -> 대외적 목록
	public List<LocaDTO> locaList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		return sqlSession.selectList("mybatis.LocaMapper.loca_List", map);
	}
	
	// 주소 검색 -> 주소에 00시, 00구 있을경우 찾기 - 대외용
	public List<LocaDTO> locaListSearch(int startNum, int endNum, String sido, String gugun){
		Map<String, Object> map1 = new HashMap<String, Object>();
		
		map1.put("startNum", startNum);
		map1.put("endNum", endNum);
		String juso = sido + gugun;
		map1.put("juso", juso);
		
		return sqlSession.selectList("mybatis.LocaMapper.loca_SearchList", map1);
	}
	
	// 총 데이터 수  - 대외용
	public int getTotalA() {
		return sqlSession.selectOne("mybatis.LocaMapper.loca_Total");
	}
	
	// 검색 데이터 수 - 대외용
	public int getTotalS(String sido, String gugun) {
		String juso = sido + gugun;
		
		return sqlSession.selectOne("mybatis.LocaMapper.loca_TotalS", juso);
	}	
	
	// 목록 10개씩 보기 -> 관리자 목록
	public List<LocaDTO> locaAdList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		return sqlSession.selectList("mybatis.LocaMapper.loca_AdList", map);
	}
	
	// 주소 검색 -> 주소에 00시, 00구 있을경우 찾기 - 관리자
	public List<LocaDTO> locaAdListSearch(int startNum, int endNum, String sido, String gugun){
		Map<String, Object> map1 = new HashMap<String, Object>();
		
		map1.put("startNum", startNum);
		map1.put("endNum", endNum);
		String juso = sido + gugun;
		map1.put("juso", juso);
		
		return sqlSession.selectList("mybatis.LocaMapper.loca_AdSearchList", map1);
	}	

	// 총 데이터 수  - 대외용
	public int getAdTotalA() {
		return sqlSession.selectOne("mybatis.LocaMapper.loca_AdTotal");
	}
	
	// 검색 데이터 수 - 관리자용
	public int getAdTotalS(String sido, String gugun) {
		String juso = sido + gugun;
		
		return sqlSession.selectOne("mybatis.LocaMapper.loca_AdTotalS", juso);
	}	
	
	// 글 작성
	public int locaWrite(LocaDTO locaDto) {
		return sqlSession.insert("mybatis.LocaMapper.loca_Write", locaDto);
	}
	
	// 매장 이름 중복검사
	public boolean isExistName(String loca_name) {
		LocaDTO locaDTO = sqlSession.selectOne("mybatis.LocaMapper.isExist_loca_Name", loca_name);
		boolean exist = false;
		if(locaDTO != null) exist = true;
		return exist;
	}
	
	// 상세 보기
	public LocaDTO locaView(int loca_num) {
		return sqlSession.selectOne("mybatis.LocaMapper.loca_View", loca_num);
	}
	
	// 삭제 하기
	public int locaDelete(int loca_num) {
		return sqlSession.delete("mybatis.LocaMapper.loca_Delete", loca_num);
	}
	
	// 수정하기
	public int locaCorr(LocaDTO locaDto) {
		return sqlSession.insert("mybatis.LocaMapper.loca_Corr", locaDto);
	}
	
	
	
}


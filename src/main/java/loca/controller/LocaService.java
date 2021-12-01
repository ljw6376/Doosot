package loca.controller;

import java.util.List;

import event.bean.EventDTO;
import loca.bean.LocaDTO;

public interface LocaService {
	
	// 목록 10개씩 보기 - 대외적
	public List<LocaDTO> locaList(int startNum, int endNum) ;
	
	// 주소 검색 -> 주소에 00시, 00구 있을경우 찾기 - 대외적
	public List<LocaDTO> locaListSearch(int startNum, int endNum, String sido, String gugun);
	
	//검색 데이터 수 - 대외적
	public int getTotalS(String sido, String gugun);
	
	// 총 데이터 수 - 대외적
	public int getTotalA() ;
	
	// 목록 10개씩 보기 - 관리자
	public List<LocaDTO> locaAdList(int startNum, int endNum);
	
	// 주소 검색 -> 주소에 00시, 00구 있을경우 찾기 - 관리자
	public List<LocaDTO> locaAdListSearch(int startNum, int endNum, String sido, String gugun);
	
	// 검색 데이터 수 - 관리자
	public int getAdTotalA();
	
	//검색 데이터 수 - 관리자
	public int getAdTotalS(String sido, String gugun);
	
	// 매장이름 중복검사
	public boolean isExistName(String loca_name);
	
	// 글 작성
	public int locaWrite(LocaDTO locaDto) ;

	
	// 상세 보기
	public LocaDTO locaView(int loca_num) ;
	
	// 삭제 하기
	public int locaDelete(int loca_num) ;
	
	// 수정하기
	public int locaCorr(LocaDTO locaDto) ;
	
	
}

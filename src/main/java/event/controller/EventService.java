package event.controller;

import java.util.List;

import event.bean.EventDTO;

public interface EventService {
	//목록 (3개씩)
	public List<EventDTO> eventList(int startNum, int endNum);
	//총 데이터 수
	public int getTotalA();
	//글쓰기
	public int eventWrite(EventDTO eventDto);
	//상세보기
	public EventDTO eventView(int eve_num);
	// 삭제하기
	public int eventDelete(int eve_num);
	// 수정하기
	public int eventCorr(EventDTO eventDto);
}

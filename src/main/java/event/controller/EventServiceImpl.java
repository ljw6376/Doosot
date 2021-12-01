package event.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import event.bean.EventDTO;
import event.dao.EventDAO;

@Service
public class EventServiceImpl implements EventService{
	@Autowired
	private EventDAO eventDAO;
	
	@Override
	public List<EventDTO> eventList(int startNum, int endNum) {
		return eventDAO.eventList(startNum, endNum);
	}

	@Override
	public int getTotalA() {
		return eventDAO.getTotalA();
	}

	@Override
	public int eventWrite(EventDTO eventDto) {
		return eventDAO.eventWrite(eventDto);
	}

	@Override
	public EventDTO eventView(int eve_num) {
		return eventDAO.eventView(eve_num);
	}

	@Override
	public int eventDelete(int eve_num) {
		return eventDAO.delete(eve_num);
	}

	@Override
	public int eventCorr(EventDTO eventDto) {
		return eventDAO.eventCorr(eventDto);
	}

	
	
}

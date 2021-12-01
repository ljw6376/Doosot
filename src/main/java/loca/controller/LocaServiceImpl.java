package loca.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import event.bean.EventDTO;
import loca.bean.LocaDTO;
import loca.dao.LocaDAO;

@Service
public class LocaServiceImpl implements LocaService{
	@Autowired
	private LocaDAO locaDAO;
	
	@Override
	public List<LocaDTO> locaList(int startNum, int endNum) {
		return locaDAO.locaList(startNum, endNum);
	}

	@Override
	public int locaWrite(LocaDTO locaDto) {
		return locaDAO.locaWrite(locaDto);
	}

	@Override
	public int getTotalA() {
		return locaDAO.getTotalA();
	}

	@Override
	public LocaDTO locaView(int loca_num) {
		return locaDAO.locaView(loca_num);
	}

	@Override
	public int locaDelete(int loca_num) {
		return locaDAO.locaDelete(loca_num);
	}

	@Override
	public int locaCorr(LocaDTO locaDto) {
		return locaDAO.locaCorr(locaDto);
	}

	@Override
	public List<LocaDTO> locaListSearch(int startNum, int endNum, String sido, String gugun) {
		return locaDAO.locaListSearch(startNum, endNum, sido, gugun);
	}

	@Override
	public int getTotalS(String sido, String gugun) {
		return locaDAO.getTotalS(sido, gugun);
	}

	@Override
	public List<LocaDTO> locaAdList(int startNum, int endNum) {
		return locaDAO.locaAdList(startNum, endNum);
	}

	@Override
	public List<LocaDTO> locaAdListSearch(int startNum, int endNum, String sido, String gugun) {
		return locaDAO.locaAdListSearch(startNum, endNum, sido, gugun);
	}

	@Override
	public int getAdTotalS(String sido, String gugun) {
		return locaDAO.getAdTotalS(sido, gugun);
	}

	@Override
	public int getAdTotalA() {
		return locaDAO.getAdTotalA();
	}

	@Override
	public boolean isExistName(String loca_name) {
		return locaDAO.isExistName(loca_name);
	}

}

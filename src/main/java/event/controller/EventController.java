package event.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import event.bean.EventDTO;

@Controller
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	@RequestMapping(value = "*/event_list.do")
	public ModelAndView eventList(HttpServletRequest request) {
		// 1. 데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
		// DB
		int totalA = eventService.getTotalA();
		int totalP = (totalA + 2) / 3;
		
		if (pg > totalP) {
			pg = totalP;
		}
		// 페이징 : 3블럭 페이지 표시
		int startPage = (pg - 1) / 3 * 3 + 1;
		int endPage = startPage + 2;
		if (endPage > totalP)
			endPage = totalP;		
		// 목록 : 3개씩
		int endNum = pg*3;
		int startNum = endNum - 2;
		
		List<EventDTO> list = eventService.eventList(startNum, endNum);
		// 2. 데이터 공유 + 파일명
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("totalP", totalP);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("list", list);
		modelAndView.addObject("pg", pg);
		modelAndView.setViewName("../event/event_list.jsp");
		return modelAndView;
	}
	
	
	@RequestMapping(value = "*/event_view.do")
	public ModelAndView eventView(HttpServletRequest request) {
		// 데이터
		int eve_num = Integer.parseInt(request.getParameter("eve_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));

		// DB
		//BoardDAO dao = new BoardDAO();

		EventDTO dto = eventService.eventView(eve_num);

		// 2. 데이터 공유 + 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("eve_num", eve_num);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("dto", dto);
		modelAndView.setViewName("../event/event_view.jsp");
		return modelAndView;
	}	
	
	@RequestMapping("*/eventWrite.do")
	ModelAndView eventWrite(HttpServletRequest request, MultipartFile eve_img) {
		String filePath = request.getSession().getServletContext().getRealPath("/event_img"); // 파일 업로드 위치
		String fileName = eve_img.getOriginalFilename(); // 사진 이름
		
		File file = new File(filePath, fileName); // 위치와 이름 저장된 객체
		try {
			FileCopyUtils.copy(eve_img.getInputStream(), new FileOutputStream(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		EventDTO dto = new EventDTO();
		dto.setEve_name(request.getParameter("eve_name"));
		dto.setEve_start(request.getParameter("eve_start").toString());
		dto.setEve_end(request.getParameter("eve_end").toString());
		dto.setEve_img(fileName);
		
		int result = eventService.eventWrite(dto);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.addObject("dto", dto);
		modelAndView.setViewName("../event/event_write.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value = "*/eventCorr.do")
	public ModelAndView eventCorr(HttpServletRequest request, MultipartFile eve_img) {
		String filePath = request.getSession().getServletContext().getRealPath("/event_img");
		String fileName = eve_img.getOriginalFilename();
		System.out.println(filePath+" / " +fileName);
		
		File file = new File(filePath, fileName);	
		
		try {
			FileCopyUtils.copy(eve_img.getInputStream(), new FileOutputStream(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 1. 데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
		int eve_num = Integer.parseInt(request.getParameter("eve_num"));
		
		EventDTO dto = new EventDTO();
		dto.setEve_num(eve_num);
		dto.setEve_name(request.getParameter("eve_name"));
		dto.setEve_start(request.getParameter("eve_start").toString());
		dto.setEve_end(request.getParameter("eve_end").toString());
		dto.setEve_img(fileName);		
		
		int result = eventService.eventCorr(dto);

		// 2. 데이터 공유 + 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("eve_num", eve_num);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("result", result);
		modelAndView.setViewName("../event/event_corr.jsp");
		return modelAndView;		
		
	}
	
	@RequestMapping(value = "*/eventCorrForm.do")
	public ModelAndView eventCorrForm(HttpServletRequest request) {
		// 데이터
		int eve_num = Integer.parseInt(request.getParameter("eve_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));

		// DB
		EventDTO dto = eventService.eventView(eve_num);

		// 2. 데이터 공유 + 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("eve_num", eve_num);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("dto", dto);
		modelAndView.setViewName("../event/event_corrForm.jsp");
		return modelAndView;
	}		
	
	@RequestMapping(value = "*/eventDelete.do")
	public ModelAndView eventDelete(HttpServletRequest request) {
		// 데이터
		int eve_num = Integer.parseInt(request.getParameter("eve_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		int result = eventService.eventDelete(eve_num);
		
		// 2. 데이터 공유 + 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.addObject("pg", pg);
		modelAndView.setViewName("../event/event_delete.jsp");
		return modelAndView;
		
	}

	
	@RequestMapping(value = "*/eventListJson.do")
	public ModelAndView eventListJson(HttpServletRequest request) {
		// 1. 데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
		System.out.println("pg :" + pg);
		
		//목록 : 3개
		int endNum = pg*3;
		int startNum = endNum - 2;
		System.out.println(endNum +" " +endNum);
		
		List<EventDTO> list = eventService.eventList(startNum, endNum);
		
		// Json 으로 결과값 반환
		String rt = null;
		int total = list.size();
		
		if(total> 0) {
			rt = "Ok";
		} else {
			rt = "Fail";
		}
		// json객체 생성
		JSONObject json = new JSONObject();
		json.put("rt", rt);
		json.put("total", total);
		
		if(total > 0) {
			JSONArray items = new JSONArray();
			
			for(int i=0; i<list.size(); i++) {
				EventDTO dto = list.get(i);
				
				// json객체 생성
				JSONObject temp = new JSONObject();
				temp.put("eve_num", dto.getEve_num());
				temp.put("eve_name", dto.getEve_name());
				temp.put("eve_img", dto.getEve_img());
				temp.put("eve_start", dto.getEve_start());
				temp.put("eve_end", dto.getEve_end());
				temp.put("eve_date", dto.getEve_date());
				
				// json 배열에 추가
				items.put(i, temp);
			}
			// 제일 상위의 json 객체에 배열 추가
			json.put("items", items);
		}
		// json 확인
		System.out.println("json : " + json);
		
		// json 객체를 리턴
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("json", json);
		modelAndView.setViewName("eventListJson.jsp");
		return modelAndView;
	}	
	
}

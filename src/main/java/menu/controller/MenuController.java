package menu.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import menu.dao.MenuDAO;
import menu.dto.MenuDTO;

@Controller
public class MenuController {
	@Autowired
	MenuDAO dao;
	
	@RequestMapping("*/menuWriteForm.do")
	ModelAndView menuWriteForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("../menu/menuWriteForm.jsp");
		return modelAndView;
	}
	
	@RequestMapping("*/menuWrite.do")
	ModelAndView menuWrite(HttpServletRequest request, MultipartFile menu_img) {
		String filePath, fileName = null;
		if(menu_img != null) {
			filePath = request.getSession().getServletContext().getRealPath("/menu_image");
			fileName = menu_img.getOriginalFilename();
			
			File file = new File(filePath, fileName);
			try {
				FileCopyUtils.copy(menu_img.getInputStream(), new FileOutputStream(file));
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String[] menu_ingres = request.getParameterValues("menu_ingre");
		
		String menu_ingre = "";
		for(String ingre : menu_ingres) {
			menu_ingre += ingre.toString() + " ";
		}
		menu_ingre = menu_ingre.trim();
		
		MenuDTO dto = new MenuDTO();
		dto.setMenu_num(Integer.parseInt(request.getParameter("menu_num")));
		dto.setMenu_name(request.getParameter("menu_name"));
		dto.setMenu_img(fileName);
		dto.setMenu_price(Integer.parseInt(request.getParameter("menu_price")));
		dto.setMenu_content(request.getParameter("menu_content"));
		dto.setMenu_ingre(menu_ingre);
		dto.setMenu_kcal(Integer.parseInt(request.getParameter("menu_kcal")));
		dto.setMenu_category(request.getParameter("menu_category"));
		
		int result = dao.menuWrite(dto);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("../menu/menuWrite.jsp");
		
		return modelAndView;
	}

	@RequestMapping("*/menuList.do")
	ModelAndView menuList(HttpServletRequest request) {
		String menu_category = null;
	    List<MenuDTO> list;
	    if(request.getParameter("menu_category") != null) {
	    	menu_category = request.getParameter("menu_category");
	        	if(menu_category.equals("total")) {
	        		list = dao.menuList();
	        	}else {
	        		list = dao.menuList(menu_category);
	        	}
	    }else {
	      	list = dao.menuList();
	    }
	      
	    List<MenuDTO> disableList = dao.menuListDisabled();
	      
	    ModelAndView modelAndView = new ModelAndView();
	    modelAndView.addObject("list", list);
	    modelAndView.addObject("disableList", disableList);
	    modelAndView.addObject("category", menu_category);
	    modelAndView.setViewName("../menu/menuList.jsp");
	    return modelAndView;
	}
	
	@RequestMapping("*/menuDetail.do")
	ModelAndView menuDetail(HttpServletRequest request) {
		
		int menu_num = Integer.parseInt(request.getParameter("menu_num"));
		String category = request.getParameter("category");
		
		MenuDTO dto = dao.menuDetail(menu_num);
		
		String[] ingre_list = new String[] {"난류(계란)", "우유", "메밀", 
				"땅콩", "대두", "밀", "고등어", "게", "돼지고기", "복숭아", "토마토",  
				"새우", "아황산류", "호두", "닭고기", "쇠고기", "오징어", "조개류"};
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("dto", dto);
		modelAndView.addObject("category", category);
		modelAndView.addObject("ingre_list", ingre_list);
		modelAndView.setViewName("../menu/menuDetail.jsp");
		return modelAndView;
	}
	
	@RequestMapping("*/menuModifyForm.do")
	ModelAndView menuModifyForm(HttpServletRequest request) {
		int menu_num = Integer.parseInt(request.getParameter("menu_num"));
		String category = request.getParameter("menu_category");
		
		MenuDTO dto = dao.menuDetail(menu_num);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("category", category);
		modelAndView.addObject("dto", dto);
		modelAndView.setViewName("../menu/menuModifyForm.jsp");
		return modelAndView;
	}
	
	@RequestMapping("*/menuModify.do")
	ModelAndView menuModify(HttpServletRequest request, MultipartFile menu_img) {
		String filePath, fileName = null;
		if(menu_img != null) {
			filePath = request.getSession().getServletContext().getRealPath("/menu_image");
			fileName = menu_img.getOriginalFilename();
			
			File file = new File(filePath, fileName);
			try {
				FileCopyUtils.copy(menu_img.getInputStream(), new FileOutputStream(file));
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String[] menu_ingres = request.getParameterValues("menu_ingre");
		
		String menu_ingre = "";
		for(String ingre : menu_ingres) {
			menu_ingre += ingre.toString() + " ";
		}
		menu_ingre = menu_ingre.trim();
		
		MenuDTO dto = new MenuDTO();
		dto.setMenu_num(Integer.parseInt(request.getParameter("menu_num")));
		dto.setMenu_name(request.getParameter("menu_name"));
		dto.setMenu_img(fileName);
		dto.setMenu_price(Integer.parseInt(request.getParameter("menu_price")));
		dto.setMenu_content(request.getParameter("menu_content"));
		dto.setMenu_ingre(menu_ingre);
		dto.setMenu_kcal(Integer.parseInt(request.getParameter("menu_kcal")));
		dto.setMenu_category(request.getParameter("menu_category"));
		
		int result = dao.menuModify(dto);
		
		String category = request.getParameter("category");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.addObject("menu_num", dto.getMenu_num());
		modelAndView.addObject("category", category);
		modelAndView.setViewName("../menu/menuModify.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping("*/menuDisable.do")
	ModelAndView menuDisable(HttpServletRequest request) {
		int menu_num = Integer.parseInt(request.getParameter("menu_num"));
		String category = request.getParameter("menu_category");
		
		int result = dao.menuDisable(menu_num);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.addObject("category", category);
		modelAndView.setViewName("../menu/menuDisable.jsp");
		
		return modelAndView;
	}
	@RequestMapping("*/menuAble.do")
	   ModelAndView menuAble(HttpServletRequest request) {
	      int menu_num = Integer.parseInt(request.getParameter("menu_num"));
	      String category = request.getParameter("menu_category");
	      
	      int result = dao.menuAble(menu_num);
	      
	      ModelAndView modelAndView = new ModelAndView();
	      modelAndView.addObject("result", result);
	      modelAndView.addObject("category", category);
	      modelAndView.setViewName("../menu/menuAble.jsp");
	      
	      return modelAndView;
	   }
}

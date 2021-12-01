package cart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cart.dao.CartDAO;
import cart.dto.CartDTO;
import cartList.dao.CartListDAO;
import cartList.dto.CartListDTO;

@Controller
public class CartController {
	@Autowired
	CartDAO cart_dao;
	@Autowired
	CartListDAO cartList_dao;
	
	@RequestMapping("*/cartList.do")
	ModelAndView cartList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String mem_id = session.getAttribute("login_id").toString();
		int cart_num;
		int cart = cart_dao.check_cart(mem_id);
		if(cart == 0) {
			cart_num = cart_dao.create_cart();
		}else {
			cart_num = cart_dao.get_cart(mem_id);
		}
		
		List<CartListDTO> list = cartList_dao.cartList(cart_num);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", list);
		modelAndView.addObject("cart_num", cart_num);
		modelAndView.setViewName("../cart/cartList.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping("*/add_cart.do")
	ModelAndView add_cart(HttpServletRequest request) {
		int cart_qty = Integer.parseInt(request.getParameter("cart_qty"));
		String mem_id = request.getParameter("mem_id");
		int menu_num = Integer.parseInt(request.getParameter("menu_num"));
		
		int content = cart_dao.check_menu(mem_id, menu_num);
		int result;
		int cart_num;
		if(content == 0) {
			int cart = cart_dao.check_cart(mem_id);
			CartDTO dto = new CartDTO();
			if(cart == 0) {
				cart_num = cart_dao.create_cart();
			}else {
				cart_num = cart_dao.get_cart(mem_id);
			}
			dto.setCart_num(cart_num);
			dto.setCart_qty(cart_qty);
			dto.setMem_id(mem_id);
			dto.setMenu_num(menu_num);
			
			result = cart_dao.add_cart(dto);
		}else {
			int cart = cart_dao.check_cart(mem_id);
			if(cart == 0) {
				cart_num = cart_dao.create_cart();
			}else {
				cart_num = cart_dao.get_cart(mem_id);
			}
			result = cart_dao.plus_qty(mem_id, menu_num, cart_qty);
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.addObject("cart_num", cart_num);
		modelAndView.setViewName("../menu/menuDetail.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping("*/update_qty.do")
	ModelAndView update_qty(HttpServletRequest request) {
		String mem_id = request.getSession().getAttribute("login_id").toString();
		String menu_n = request.getParameter("menu_name");
		menu_n = menu_n.trim();
		String cart_q = request.getParameter("cart_qty");
		cart_q = cart_q.trim();
		
		String[] menu_name = menu_n.split(" ");
		if(menu_name.length > 1) {
			List<Integer> cart_qty = new ArrayList<Integer>();
			String[] temp = cart_q.split(" ");
			for(int i = 0; i < temp.length; i++) {
				cart_qty.add(Integer.parseInt(temp[i]));
			}
			for(int i = 0; i < menu_name.length; i++) {
				cartList_dao.update_qty(mem_id, menu_name[i], cart_qty.get(i));
			}
		}else if(menu_name.length == 1){
			cartList_dao.update_qty(mem_id, menu_n, Integer.parseInt(cart_q));
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("order.do");
		return modelAndView;
	}
	
	@RequestMapping("*/delete_cart.do")
	ModelAndView delete_cart(HttpServletRequest request) {
		String mem_id = request.getSession().getAttribute("login_id").toString();
		String menu_name = request.getParameter("menu_name");
		int menu_num = cart_dao.name_to_num(menu_name);
		int cart_num = cart_dao.get_cart(mem_id);
		
		CartDTO dto = new CartDTO();
		dto.setMem_id(mem_id);
		dto.setMenu_num(menu_num);
		dto.setCart_num(cart_num);
		
		int result = cart_dao.delete_cart(dto);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("../cart/cartList.do");
		
		return modelAndView;
	}
	
}

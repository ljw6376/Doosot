package order.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cart.dao.CartDAO;
import cartList.dao.CartListDAO;
import cartList.dto.CartListDTO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;
import order.dao.OrderDAO;
import order.dto.OrderDTO;

@Controller
public class OrderController {
	@Autowired
	OrderDAO order_dao;
	@Autowired
	CartDAO cart_dao;
	@Autowired
	CartListDAO cartList_dao;
	@Autowired
	MemberDAO mem_dao;
	
	@RequestMapping("*/order.do")
	ModelAndView order(HttpServletRequest request) {
		int cart_num = 0;
		if(request.getParameter("cart_num") != null) {
			cart_num = Integer.parseInt(request.getParameter("cart_num"));
		}else {
			String mem_id = request.getSession().getAttribute("login_id").toString();
			cart_num = cart_dao.get_cart(mem_id);
		}
		
		List<CartListDTO> list = new ArrayList<CartListDTO>();
		if(cart_num > 0)
			list = cartList_dao.cartList(cart_num);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("cart_num", cart_num);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("../order/order.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping("*/orderProgress.do")
	ModelAndView orderProgress(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int order_price = Integer.parseInt(request.getParameter("deli_price"));
		String order_addr = request.getParameter("deli_addr");
		String order_comment = request.getParameter("deli_comm");
		int cart_num = Integer.parseInt(request.getParameter("cart_num"));
		String mem_id = request.getSession().getAttribute("login_id").toString();
		//int loca_name = Integer.parseInt(request.getParameter("deli_store_name"));
		
		int loca_num = 1;
		
		OrderDTO dto = new OrderDTO();
		dto.setOrder_price(order_price);
		dto.setOrder_addr(order_addr);
		dto.setOrder_comment(order_comment);
		dto.setCart_num(cart_num);
		dto.setMem_id(mem_id);
		dto.setLoca_num(loca_num);
		
		int result = order_dao.orderInsert(dto);
		
		if(result > 0) {
			order_dao.ProgressDone(cart_num, mem_id);
			
			MemberDTO mem_dto = new MemberDTO();
			mem_dto.setMem_id(mem_id);
			mem_dto.setMem_deposit(order_price * -1);
			int result2 = mem_dao.reloading(mem_dto);
			
			if(result2 > 0) {
				HttpSession session = request.getSession();
				int deposit = Integer.parseInt(request.getSession().getAttribute("mem_deposit").toString());
				session.setAttribute("mem_deposit", deposit - order_price);
			}
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("../order/orderDone.jsp");
		return modelAndView;
	}
}

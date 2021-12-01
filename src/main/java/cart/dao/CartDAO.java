package cart.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cart.dto.CartDTO;

@Repository
public class CartDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int check_menu(String mem_id, int menu_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("menu_num", menu_num);
		return sqlSession.selectOne("mybatis.DooSotMapper.check_menu", map);
	}
	
	public int check_cart(String mem_id) {
		return sqlSession.selectOne("mybatis.DooSotMapper.check_cart", mem_id);
	}
	
	public int create_cart() {
		return sqlSession.selectOne("mybatis.DooSotMapper.create_cart");
	}
	
	public int get_cart(String mem_id) {
		List<CartDTO> list = sqlSession.selectList("mybatis.DooSotMapper.get_cart", mem_id);
		if(list.size() > 0)
			return list.get(0).getCart_num();
		else
			return 0;
	}
	
	public String num_to_name(int menu_num) {
		return sqlSession.selectOne("mybatis.DooSotMapper.num_to_name", menu_num);
	}
	
	public int name_to_num(String menu_name) {
		return sqlSession.selectOne("mybatis.DooSotMapper.name_to_num", menu_name);
	}
	
	public int add_cart(CartDTO dto) {
		return sqlSession.insert("mybatis.DooSotMapper.add_cart", dto);
	}
	
	public int plus_qty(String mem_id, int menu_num, int cart_qty) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("menu_num", menu_num);
		map.put("cart_qty", cart_qty);
		return sqlSession.update("mybatis.DooSotMapper.plus_qty", map);
	}
	
	public int delete_cart(CartDTO dto) {
		return sqlSession.delete("mybatis.DooSotMapper.delete_cart", dto);
	}
}

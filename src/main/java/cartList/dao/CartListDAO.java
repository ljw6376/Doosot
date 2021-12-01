package cartList.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cartList.dto.CartListDTO;

@Repository
public class CartListDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<CartListDTO> cartList(int cart_num) {
		return sqlSession.selectList("mybatis.DooSotMapper.cartList", cart_num);
	}
	
	public int update_qty(String mem_id, String menu_name, int cart_qty) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("menu_name", menu_name);
		map.put("cart_qty", cart_qty);
		return sqlSession.update("mybatis.DooSotMapper.update_qty", map);
	}
}

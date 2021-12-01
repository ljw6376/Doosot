package order.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import order.dto.OrderDTO;

@Repository
public class OrderDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int orderInsert(OrderDTO dto) {
		return sqlSession.insert("mybatis.DooSotMapper.orderInsert", dto);
	}
	
	public int ProgressDone(int cart_num, String mem_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cart_num", cart_num);
		map.put("mem_id", mem_id);
		return sqlSession.update("mybatis.DooSotMapper.ProgressDone", map);
	}
}

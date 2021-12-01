package menu.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;	
import org.springframework.stereotype.Repository;

import menu.dto.MenuDTO;

@Repository
public class MenuDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int menuWrite(MenuDTO dto) {
		return sqlSession.insert("mybatis.DooSotMapper.menuWrite", dto);
	}
	
	public List<MenuDTO> menuList(){
		return sqlSession.selectList("mybatis.DooSotMapper.menuListAll");
	}
	
	public List<MenuDTO> menuList(String menu_category){
		return sqlSession.selectList("mybatis.DooSotMapper.menuList", menu_category);
	}
	
	public List<MenuDTO> menuListDisabled(){
	    return sqlSession.selectList("mybatis.DooSotMapper.menuListDisabled");
	}
	
	public MenuDTO menuDetail(int menu_num) {
		return sqlSession.selectOne("mybatis.DooSotMapper.menuDetail", menu_num);
	}
	
	public int menuModify(MenuDTO dto) {
		return sqlSession.update("mybatis.DooSotMapper.menuModify", dto);
	}
	
	public int menuDisable(int menu_num) {
		return sqlSession.delete("mybatis.DooSotMapper.menuDisable", menu_num);
	}
	public int menuAble(int menu_num) {
	    return sqlSession.update("mybatis.DooSotMapper.menuAble", menu_num);
	}
}

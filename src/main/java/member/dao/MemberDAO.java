package member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.bean.MemberDTO;
import member.bean.MemberQnADTO;
import orderList.dto.GetOrderListDTO;
import orderList.dto.OrderListDTO;
import qna.bean.QnADTO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int member_join(MemberDTO dto) {
		return sqlSession.insert("mybatis.memberMapper.member_join", dto);
	}
	public MemberDTO member_login(MemberDTO dto) {
		return sqlSession.selectOne("mybatis.memberMapper.member_login",dto);
	}
	public int reloading(MemberDTO dto) {
		return sqlSession.update("mybatis.memberMapper.reloading",dto);
	}
	public int get_deposit(String login_id) {
		return sqlSession.selectOne("mybatis.memberMapper.get_deposit",login_id);
	}
	public int modify_pw(String login_id, String new_pw) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("login_id", login_id);
		map.put("new_pw", new_pw);
		return sqlSession.update("mybatis.memberMapper.modify_pw",map);
	}
	public int total_mem() {
		return sqlSession.selectOne("mybatis.memberMapper.total_mem");
	}
	public List<MemberDTO> memberList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.memberMapper.memberList",map);
	}
	public int delete_cart(String login_id) {
		return sqlSession.delete("mybatis.memberMapper.delete_cart",login_id);
	}
	public int delete_order(String login_id) {
		return sqlSession.delete("mybatis.memberMapper.delete_order",login_id);
	}
	public List<QnADTO> get_qnaseqList(String login_id) {
		return sqlSession.selectList("mybatis.memberMapper.get_qnaseqList",login_id);
	}
	public int delete_re(int qna_seq) {
		return sqlSession.delete("mybatis.memberMapper.delete_re",qna_seq);
	}
	public int delete_qna(int qna_seq) {
		return sqlSession.delete("mybatis.memberMapper.delete_qna",qna_seq);
	}
	public int member_out(String login_id) {
		return sqlSession.delete("mybatis.memberMapper.member_out",login_id);
	}
	public MemberDTO get_memInfo(String login_id) {
		return sqlSession.selectOne("mybatis.memberMapper.get_memInfo",login_id);
	}
	public int total_order(String login_id) {
		return sqlSession.selectOne("mybatis.memberMapper.total_order",login_id);
	}
	public List<Integer> order_seq(String login_id, String startNum,String endNum) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("login_id", login_id);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.memberMapper.order_seq",map);
	}
	public List<OrderListDTO> orderList(int seq_num) {
		return sqlSession.selectList("mybatis.memberMapper.orderList",seq_num);
	}
	public List<GetOrderListDTO> get_order(int seq) {
		return sqlSession.selectList("mybatis.memberMapper.get_order",seq);
	}
	public int total_qna(String login_id) {
		return sqlSession.selectOne("mybatis.memberMapper.total_qna",login_id);
	}
	public List<MemberQnADTO> member_qnaList(String login_id,String startNum, String endNum) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("login_id", login_id);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.memberMapper.member_qnaList",map);
	}
	public MemberQnADTO member_qnaView(String login_id, String qna_seq) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("login_id", login_id);
		map.put("qna_seq", qna_seq);
		return sqlSession.selectOne("mybatis.memberMapper.member_qnaView",map);
	}
	public String member_findId(MemberDTO dto) {
		return sqlSession.selectOne("mybatis.memberMapper.member_findId", dto);
	}
}

package member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import member.bean.MemberQnADTO;
import member.dao.MemberDAO;
import orderList.dto.GetOrderListDTO;
import orderList.dto.OrderListDTO;
import qna.bean.QnADTO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public int member_join(MemberDTO dto) {
		return memberDAO.member_join(dto);
	}
	@Override
	public MemberDTO member_login(MemberDTO dto) {
		return memberDAO.member_login(dto);
	}
	@Override
	public int reloading(MemberDTO dto) {
		return memberDAO.reloading(dto);
	}
	@Override
	public int get_deposit(String login_id) {
		return memberDAO.get_deposit(login_id);
	}
	@Override
	public int modify_pw(String login_id, String new_pw) {
		return memberDAO.modify_pw(login_id, new_pw);
	}
	@Override
	public int total_mem() {
		return memberDAO.total_mem();
	}
	@Override
	public List<MemberDTO> memberList(int startNum, int endNum) {
		return memberDAO.memberList(startNum, endNum);
	}
	@Override
	public int delete_cart(String login_id) {
		return memberDAO.delete_cart(login_id);
	}
	@Override
	public int delete_order(String login_id) {
		return memberDAO.delete_order(login_id);
	}
	@Override
	public List<QnADTO> get_qnaseqList(String login_id) {
		return memberDAO.get_qnaseqList(login_id);
	}
	@Override
	public int delete_re(int qna_seq) {
		return memberDAO.delete_re(qna_seq);
	}
	@Override
	public int delete_qna(int qna_seq) {
		return  memberDAO.delete_qna(qna_seq);
	}
	@Override
	public int member_out(String login_id) {
		return memberDAO.member_out(login_id);
	}
	@Override
	public MemberDTO get_memInfo(String login_id) {
		return memberDAO.get_memInfo(login_id);
	}
	@Override
	public int total_order(String login_id) {
		return memberDAO.total_order(login_id);
	}
	@Override
	public List<OrderListDTO> orderList(int seq_num) {
		return memberDAO.orderList(seq_num);
	}
	@Override
	public List<Integer> order_seq(String login_id, String startNum, String endNum) {
		return memberDAO.order_seq(login_id, startNum, endNum);
	}
	@Override
	public List<GetOrderListDTO> get_order(int seq) {
		return memberDAO.get_order(seq);
	}
	@Override
	public int total_qna(String login_id) {
		return memberDAO.total_qna(login_id);
	}
	@Override
	public List<MemberQnADTO> member_qnaList(String login_id,String startNum, String endNum) {
		return memberDAO.member_qnaList(login_id,startNum,endNum);
	}
	@Override
	public MemberQnADTO member_qnaView(String login_id, String qna_seq) {
		return memberDAO.member_qnaView(login_id, qna_seq);
	}
	@Override
	public String member_findId(MemberDTO dto) {
		return memberDAO.member_findId(dto);
	}

}

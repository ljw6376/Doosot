package member.controller;

import java.util.List;

import member.bean.MemberDTO;
import member.bean.MemberQnADTO;
import orderList.dto.GetOrderListDTO;
import orderList.dto.OrderListDTO;
import qna.bean.QnADTO;

public interface MemberService {
	// 회원가입
	public int member_join(MemberDTO dto);
	// 로그인
	public MemberDTO member_login(MemberDTO dto);
	// 예치금충전하기
	public int reloading(MemberDTO dto);
	// 충전된 예치금 가져오기
	public int get_deposit(String login_id);
	// 비밀번호 수정
	public int modify_pw(String login_id, String new_pw);
	// 회원 총인원수 가져오기
	public int total_mem();
	// 회원 리스트 가져오기
	public List<MemberDTO> memberList(int startNum, int endNum);
	// 탈퇴 전 cart 삭제
	public int delete_cart(String login_id);
	// 탈퇴 전 order 삭제
	public int delete_order(String login_id);
	// 해당 아이디가 질문한 qna 번호들 가져오기
	public List<QnADTO> get_qnaseqList(String login_id);
	// 탈퇴 전 qna답글 삭제
	public int delete_re(int qna_seq);
	// 탈퇴 전 qna 삭제
	public int delete_qna(int qna_seq);
	// 회원 탈퇴
	public int member_out(String login_id);
	// 회원정보 가져오기
	public MemberDTO get_memInfo(String login_id);
	// 회원 주문내역 총 갯수 가져오기
	public int total_order(String login_id);
	// 주문 번호 기준 5개씩 리스트 가져오기
	public List<Integer> order_seq(String login_id, String startNum, String endNum);
	// 주문번호로 주문내용 가져오기
	public List<OrderListDTO> orderList(int seq_num);
	// 주문 상세내역 가져오기
	public List<GetOrderListDTO> get_order(int seq);
	// 문의 내역 갯수 가져오기
	public int total_qna(String login_id);
	// 문의 내역 가져오기
	public List<MemberQnADTO> member_qnaList(String login_id,String startNum, String endNum);
	// 문의 내역 상세보기
	public MemberQnADTO member_qnaView(String login_id, String qna_seq);
	// 아이디 찾기
	public String member_findId(MemberDTO dto);
}

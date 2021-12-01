package qna.bean;

public class QnADTO {
	private int qna_seq;		// -- QnA_글번호
	private String qna_subject;	// -- QnA_글제목
	private String qna_id;		// -- 회원ID 
	private String qna_content;	// -- QnA_글내용
	private String qna_date;	// -- QnA_등록일
	
	public int getQna_seq() {
		return qna_seq;
	}
	public void setQna_seq(int qna_seq) {
		this.qna_seq = qna_seq;
	}
	public String getQna_subject() {
		return qna_subject;
	}
	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}
	public String getQna_id() {
		return qna_id;
	}
	public void setQna_id(String qna_id) {
		this.qna_id = qna_id;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_date() {
		return qna_date;
	}
	public void setQna_date(String qna_date) {
		this.qna_date = qna_date;
	}
	/*
	public String getQna_reCont() {
		return qna_reCont;
	}
	public void setQna_reCont(String qna_reCont) {
		this.qna_reCont = qna_reCont;
	}
	public String getQna_reDate() {
		return qna_reDate;
	}
	public void setQna_reDate(String qna_reDate) {
		this.qna_reDate = qna_reDate;
	}
	*/
}


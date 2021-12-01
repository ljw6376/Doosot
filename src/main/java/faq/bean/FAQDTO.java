package faq.bean;

public class FAQDTO {
	private int faq_seq;		// FAQ_글번호
	private String faq_subject;	// FAQ_글제목
	private String faq_id;		// 회원ID
	private String faq_content;	// FAQ_글내용
	private String faq_img;		// FAQ_이미지
	private String faq_date;	// FAQ_등록일
	
	public int getFaq_seq() {
		return faq_seq;
	}
	public void setFaq_seq(int faq_seq) {
		this.faq_seq = faq_seq;
	}
	public String getFaq_subject() {
		return faq_subject;
	}
	public void setFaq_subject(String faq_subject) {
		this.faq_subject = faq_subject;
	}
	public String getFaq_id() {
		return faq_id;
	}
	public void setFaq_id(String faq_id) {
		this.faq_id = faq_id;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public String getFaq_img() {
		return faq_img;
	}
	public void setFaq_img(String faq_img) {
		this.faq_img = faq_img;
	}
	public String getFaq_date() {
		return faq_date;
	}
	public void setFaq_date(String faq_date) {
		this.faq_date = faq_date;
	}
}

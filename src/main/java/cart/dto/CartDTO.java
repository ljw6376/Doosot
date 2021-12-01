package cart.dto;

public class CartDTO {
	private int cart_num;
	private int cart_qty;
	private String mem_id;
	private int menu_num;
	private String cart_progress;
	
	public int getCart_num() {
		return cart_num;
	}
	public void setCart_num(int order_seq) {
		this.cart_num = order_seq;
	}
	public int getCart_qty() {
		return cart_qty;
	}
	public void setCart_qty(int cart_qty) {
		this.cart_qty = cart_qty;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getMenu_num() {
		return menu_num;
	}
	public void setMenu_num(int menu_num) {
		this.menu_num = menu_num;
	}
	public String getCart_progress() {
		return cart_progress;
	}
	public void setCart_progress(String cart_progress) {
		this.cart_progress = cart_progress;
	}
	
}

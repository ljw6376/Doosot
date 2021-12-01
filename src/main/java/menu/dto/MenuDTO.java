package menu.dto;

public class MenuDTO {
	private int menu_num = 0;
	private String menu_name = "";
	private String menu_img = "";
	private int menu_price = 0;
	private String menu_content;
	private String menu_date = "";
	private String menu_ingre = "";
	private int menu_kcal = 0;
	private String menu_category = "";
	private int menu_enable = 1;

	public String getMenu_category() {
		return menu_category;
	}

	public void setMenu_category(String menu_category) {
		this.menu_category = menu_category;
	}

	public int getMenu_num() {
		return menu_num;
	}

	public void setMenu_num(int menu_num) {
		this.menu_num = menu_num;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public String getMenu_img() {
		return menu_img;
	}

	public void setMenu_img(String menu_img) {
		this.menu_img = menu_img;
	}

	public int getMenu_price() {
		return menu_price;
	}

	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}

	public String getMenu_content() {
		return menu_content;
	}

	public void setMenu_content(String menu_content) {
		this.menu_content = menu_content;
	}

	public String getMenu_date() {
		return menu_date;
	}

	public void setMenu_date(String menu_date) {
		this.menu_date = menu_date;
	}

	public String getMenu_ingre() {
		return menu_ingre;
	}

	public void setMenu_ingre(String menu_ingre) {
		this.menu_ingre = menu_ingre;
	}

	public int getMenu_kcal() {
		return menu_kcal;
	}

	public void setMenu_kcal(int menu_kcal) {
		this.menu_kcal = menu_kcal;
	}

	public int getMenu_enable() {
		return menu_enable;
	}

	public void setMenu_enable(int menu_enable) {
		this.menu_enable = menu_enable;
	}

}

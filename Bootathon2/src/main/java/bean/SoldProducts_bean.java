package bean;

public class SoldProducts_bean {

	private String Product_id;
	private String Product_name;
	private String user_Email;
	private String seller_Email;
	private String bid_price;
	
	public String getProduct_id() {
		return Product_id;
	}
	public void setProduct_id(String product_id) {
		Product_id = product_id;
	}
	public String getProduct_name() {
		return Product_name;
	}
	public void setProduct_name(String product_name) {
		Product_name = product_name;
	}
	public String getUser_Email() {
		return user_Email;
	}
	public void setUser_Email(String user_Email) {
		this.user_Email = user_Email;
	}
	public String getSeller_Email() {
		return seller_Email;
	}
	public void setSeller_Email(String seller_Email) {
		this.seller_Email = seller_Email;
	}
	public String getBid_price() {
		return bid_price;
	}
	public void setBid_price(String bid_price) {
		this.bid_price = bid_price;
	}
	
}

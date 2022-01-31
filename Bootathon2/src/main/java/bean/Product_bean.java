package bean;

public class Product_bean {
	private String Product_id;
	private String Seller_id;
	private String Product_name;
	private String Product_description;
	private String Base_price;
	private String Genre;
	private String End_date;
	private byte[] image1;
	private byte[] image2;
	private byte[] image3;
	private byte[] image4;
	 
	
	public String getProduct_id() {
		return Product_id;
	}
	public void setProduct_id(String product_id) {
		Product_id = product_id;
	}
	public String getSeller_id() {
		return Seller_id;
	}
	public void setSeller_id(String seller_id) {
		Seller_id = seller_id;
	}
	public String getProduct_name() {
		return Product_name;
	}
	public void setProduct_name(String product_name) {
		Product_name = product_name;
	}
	public String getProduct_description() {
		return Product_description;
	}
	public void setProduct_description(String product_description) {
		Product_description = product_description;
	}
	public String getBase_price() {
		return Base_price;
	}
	public void setBase_price(String base_price) {
		Base_price = base_price;
	}
	public String getGenre() {
		return Genre;
	}
	public void setGenre(String genre) {
		Genre = genre;
	}
	public String getEnd_date() {
		return End_date;
	}
	public void setEnd_date(String end_date) {
		End_date = end_date;
	}
	
	public byte[] getImage1() {
		return image1;
	}
	public void setImage1(byte[] image1) {
		this.image1 = image1;
	}
	public byte[] getImage2() {
		return image2;
	}
	public void setImage2(byte[] image2) {
		this.image2 = image2;
	}
	public byte[] getImage3() {
		return image3;
	}
	public void setImage3(byte[] image3) {
		this.image3 = image3;
	}
	public byte[] getImage4() {
		return image4;
	}
	public void setImage4(byte[] image4) {
		this.image4 = image4;
	}
	
}

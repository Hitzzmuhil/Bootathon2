package database;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Product_bean;
import bean.SellerBean;
import bean.SoldProducts_bean;
import bean.UserBean;
import jakarta.servlet.http.Part;

public class SqlDao {
	private String url="jdbc:mysql://localhost:3306/bootathon2";   
	private String uname="root";
	private String pass="Muhil@123";
	
	
	public ArrayList<Product_bean> getAllProducts(UserBean user,String filter) throws Exception{
		
		ArrayList<Product_bean> product=new ArrayList<>();
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,uname,this.pass);
		Statement st= con.createStatement();
		ResultSet r=null;
		if(filter!=null && filter.equals("All")) {
			r = st.executeQuery("select * from products where End_date>=CURDATE()");
		}
		else if(filter!=null)
			r = st.executeQuery("select * from products where Genre='"+filter+" Products' && End_date>=CURDATE()");
		
		while(r!=null && r.next()) {
			Product_bean obj=new Product_bean();
			obj.setProduct_id(r.getInt(1)+"");
			obj.setSeller_id(r.getInt(2)+"");
			obj.setProduct_name(r.getString(3));
			obj.setProduct_description(r.getString(4));
			obj.setBase_price(r.getString(5));
			obj.setGenre(r.getString(6));
			obj.setEnd_date(r.getString(7));
			
			 Blob blob1 = r.getBlob(8);
	         byte byteArray[] = blob1.getBytes(1, (int) blob1.length());
	         obj.setImage1(byteArray);
	         
	         Blob blob2=r.getBlob(9);
	         byteArray = blob2.getBytes(1, (int) blob2.length());
	         obj.setImage2(byteArray);
	         
	         Blob blob3=r.getBlob(10);
	         byteArray = blob3.getBytes(1, (int) blob3.length());
	         obj.setImage3(byteArray);
	         
	         Blob blob4=r.getBlob(11);
	         byteArray = blob4.getBytes(1, (int) blob4.length());
	         obj.setImage4(byteArray);
	        
	         product.add(obj);
		}
		
		return product;
	}
	
	
	public ArrayList<Product_bean> getProductBeans(SellerBean seller) throws Exception{
		
		ArrayList<Product_bean> product=new ArrayList<>();
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,uname,this.pass);
		Statement st= con.createStatement();
		ResultSet r = st.executeQuery("select * from products where Seller_id='"+Integer.parseInt(seller.getUser_id())+"'");
		//ResultSet r = st.executeQuery("select * from products where Seller_id='"+1+"'");
		
		while(r.next()) {
			Product_bean obj=new Product_bean();
			obj.setProduct_id(r.getInt(1)+"");
			obj.setSeller_id(r.getInt(2)+"");
			obj.setProduct_name(r.getString(3));
			obj.setProduct_description(r.getString(4));
			obj.setBase_price(r.getString(5));
			obj.setGenre(r.getString(6));
			obj.setEnd_date(r.getString(7));
			
			 Blob blob1 = r.getBlob(8);
	         byte byteArray[] = blob1.getBytes(1, (int) blob1.length());
	         obj.setImage1(byteArray);
	         
	         Blob blob2=r.getBlob(9);
	         byteArray = blob2.getBytes(1, (int) blob2.length());
	         obj.setImage2(byteArray);
	         
	         Blob blob3=r.getBlob(10);
	         byteArray = blob3.getBytes(1, (int) blob3.length());
	         obj.setImage3(byteArray);
	         
	         Blob blob4=r.getBlob(11);
	         byteArray = blob4.getBytes(1, (int) blob4.length());
	         obj.setImage4(byteArray);
	        
	         product.add(obj);
		}
		
		return product;
	}
	
	public boolean add_products(Product_bean obj,Part part1,Part part2,Part part3,Part part4) throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,uname,this.pass);
		String query="insert into products (Seller_id,Product_name,Product_description,Base_price,Genre,End_date,Image1,Image2,Image3,Image4) values (?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement st=con.prepareStatement(query);
		
		st.setInt(1, Integer.parseInt(obj.getSeller_id()));
		st.setString(2,obj.getProduct_name());
		st.setString(3, obj.getProduct_description());
		st.setString(5, obj.getGenre());
		st.setString(4, obj.getBase_price());
		st.setString(6, obj.getEnd_date());
		
		InputStream is=part1.getInputStream();
		st.setBlob(7, is);

		InputStream is1=part2.getInputStream();
		st.setBlob(8, is1);
		
		InputStream is2=part3.getInputStream();
		st.setBlob(9, is2);
		
		InputStream is3=part4.getInputStream();
		st.setBlob(10, is3);
		int count=st.executeUpdate();
		return true;
	}
	
	public SellerBean sellerlogin(String email,String pass) throws Exception{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,uname,this.pass);
			Statement st= con.createStatement();
			ResultSet r = st.executeQuery("select * from seller_details where Email='"+email+"' and Password='"+pass+"'");
			
			SellerBean obj=new SellerBean();
			
			while(r.next()) {
			
				obj.setUser_id(r.getInt(1)+"");
				obj.setFirst_name(r.getString(2));
				obj.setLast_name(r.getString(3));
				obj.setEmail(r.getString(4));
				obj.setDistrict(r.getString(5));
				obj.setState(r.getString(6));
				obj.setCountry(r.getString(7));
				obj.setPin(r.getString(8));
				obj.setPhone_number(r.getString(9));
				obj.setPassword(r.getString(10));
			}
			
			return obj;
	}
	
	public UserBean userlogin(String email,String pass) throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,uname,this.pass);
		Statement st= con.createStatement();
		ResultSet r = st.executeQuery("select * from user_details where Email='"+email+"' and Password='"+pass+"'");
		
		UserBean obj=new UserBean();
		
		while(r.next()) {
		
			obj.setUser_id(r.getInt(1)+"");
			obj.setFirst_name(r.getString(2));
			obj.setLast_name(r.getString(3));
			obj.setEmail(r.getString(4));
			obj.setDistrict(r.getString(5));
			obj.setState(r.getString(6));
			obj.setCountry(r.getString(7));
			obj.setPin(r.getString(8));
			obj.setPhone_number(r.getString(9));
			obj.setPassword(r.getString(10));
		}
		
		return obj;
}
	
	public boolean sellersignup(SellerBean user) throws Exception{
		if(sellercheckemail(user.getEmail(),user.getPhone_number())) {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,uname,pass);
			String query="insert into seller_details (First_Name, Last_Name, Email, District , State, Country, Pin, Phone_number, Password) values (?,?,?,?,?,?,?,?,?)";
			PreparedStatement st=con.prepareStatement(query);
			st.setString(1, user.getFirst_name());
			st.setString(2, user.getLast_name());
			st.setString(3, user.getEmail());
			st.setString(4, user.getDistrict());
			st.setString(5, user.getState());
			st.setString(6, user.getCountry());
			st.setString(7, user.getPin());
			st.setString(8, user.getPhone_number());
			st.setString(9, user.getPassword());
			st.executeUpdate();
			return true;
		}
		return false;
	}
	
	public boolean sellercheckemail(String email,String phone) throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,uname,pass);
	    Statement st= con.createStatement();
	    ResultSet r = st.executeQuery("select * from seller_details where Email='"+email+"' or Phone_number='"+phone+"'");
	    int count=0;
	    while(r.next())count++;
	    if(count==0)return true;
		
		return false;
	}
	
	public boolean signup(UserBean user) throws Exception {
		if(checkemail(user.getEmail(),user.getPhone_number())) {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,uname,pass);
			String query="insert into user_details (First_Name, Last_Name, Email, District , State, Country, Pin, Phone_number, Password) values (?,?,?,?,?,?,?,?,?)";
			PreparedStatement st=con.prepareStatement(query);
			st.setString(1, user.getFirst_name());
			st.setString(2, user.getLast_name());
			st.setString(3, user.getEmail());
			st.setString(4, user.getDistrict());
			st.setString(5, user.getState());
			st.setString(6, user.getCountry());
			st.setString(7, user.getPin());
			st.setString(8, user.getPhone_number());
			st.setString(9, user.getPassword());
			st.executeUpdate();
			return true;
		}
		return false;
	}
	
	public boolean checkemail(String email,String phone) throws Exception{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,uname,pass);
		Statement st= con.createStatement();
	    ResultSet r = st.executeQuery("select * from user_details where Email='"+email+"' or Phone_number='"+phone+"'");
	    int count=0;
	    while(r.next())count++;
	    if(count==0)return true;
		
		return false;
	}
	
	public Product_bean getProduct(String pro_id)throws Exception{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,uname,pass);
		Statement st= con.createStatement();
		ResultSet r = st.executeQuery("select * from products where Product_id="+Integer.parseInt(pro_id));
		
		Product_bean obj=new Product_bean();
		
		if(r.next()) {
			obj.setProduct_id(r.getInt(1)+"");
			obj.setSeller_id(r.getInt(2)+"");
			obj.setProduct_name(r.getString(3));
			obj.setProduct_description(r.getString(4));
			obj.setBase_price(r.getString(5));
			obj.setGenre(r.getString(6));
			obj.setEnd_date(r.getString(7));
			
			Blob blob1 = r.getBlob(8);
	         byte byteArray[] = blob1.getBytes(1, (int) blob1.length());
	         obj.setImage1(byteArray);
	         
	         Blob blob2=r.getBlob(9);
	         byteArray = blob2.getBytes(1, (int) blob2.length());
	         obj.setImage2(byteArray);
	         
	         Blob blob3=r.getBlob(10);
	         byteArray = blob3.getBytes(1, (int) blob3.length());
	         obj.setImage3(byteArray);
	         
	         Blob blob4=r.getBlob(11);
	         byteArray = blob4.getBytes(1, (int) blob4.length());
	         obj.setImage4(byteArray);
			
		}
		
		return obj;
		
	}
	
	public int get_highest_bid(String pro_id)throws Exception{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,uname,pass);
		Statement st= con.createStatement();
		ResultSet r = st.executeQuery("select bid_price from product_history where Product_id="+Integer.parseInt(pro_id));
		
		if(r.next()) {
			return r.getInt(1);
		}
		
		return 0;
	}
	
	public void add_product_history(Product_bean product,UserBean user,String bid_price)throws Exception{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,uname,pass);
		String query="insert into product_history (Product_id,Seller_id,user_id,bid_price) values (?,?,?,?)";
		PreparedStatement st=con.prepareStatement(query);
		st.setString(1, product.getProduct_id());
		st.setString(2, product.getSeller_id());
		st.setString(3, user.getUser_id());
		st.setString(4, bid_price);
		
		try {
			st.executeUpdate();
		}catch(Exception e) {
			System.out.println("catch= "+e);
			update_product_history(product,user,bid_price);
		}
		
	}
	
	
	public void update_product_history(Product_bean product,UserBean user,String bid_price)throws Exception{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,uname,pass);
		String query="update product_history set bid_price=?,user_id=? where Product_id=? and Seller_id=?";
		PreparedStatement st=con.prepareStatement(query);
		
		st.setString(1, bid_price);
		st.setString(2, user.getUser_id());
		st.setString(3, product.getProduct_id());
		st.setString(4, product.getSeller_id());
		
		System.out.println("coming...");
		st.executeUpdate();
		
	}
	
	public void add_user_history(Product_bean product,UserBean user,String bid_price)throws Exception{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,uname,pass);
		String query="insert into user_history (Product_id,Seller_id,user_id,bid_price) values (?,?,?,?)";
		PreparedStatement st=con.prepareStatement(query);
		st.setString(1, product.getProduct_id());
		st.setString(2, product.getSeller_id());
		st.setString(3, user.getUser_id());
		st.setString(4, bid_price);
		
		try {
			st.executeUpdate();
		}catch(Exception e) {
			System.out.println("user catch= "+e);
			update_product_history(product,user,bid_price);
		}
		
	}
	
	public void update_user_history(Product_bean product,UserBean user,String bid_price)throws Exception{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,uname,pass);
		String query="update user_history set bid_price=? where Product_id=? and user_id=?";
		PreparedStatement st=con.prepareStatement(query);
		
		st.setString(1, bid_price);
		st.setString(2, product.getProduct_id());
		st.setString(3, user.getUser_id());
		
		System.out.println("user coming...");
		st.executeUpdate();
		
	}
	
	public ArrayList<Product_bean> get_user_recent_bid(UserBean user)throws Exception{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,uname,pass);
		Statement st= con.createStatement();
		ResultSet r = st.executeQuery("select product_id from user_history where user_id="+Integer.parseInt(user.getUser_id()));
		
		ArrayList<Product_bean> products=new ArrayList<>();
		
		while(r.next()) {		
	         
	         products.add(get_user_recent_bid_getProduct(r.getString(1)));
			
		}
		
		return products;
	}
	
	public Product_bean get_user_recent_bid_getProduct(String pro_id)throws Exception{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,uname,pass);
		Statement st= con.createStatement();
		ResultSet r = st.executeQuery("select * from products where Product_id="+Integer.parseInt(pro_id)+" && End_date>=CURDATE()");
		
		Product_bean obj=new Product_bean();
		
		if(r.next()) {
			obj.setProduct_id(r.getInt(1)+"");
			obj.setSeller_id(r.getInt(2)+"");
			obj.setProduct_name(r.getString(3));
			obj.setProduct_description(r.getString(4));
			obj.setBase_price(r.getString(5));
			obj.setGenre(r.getString(6));
			obj.setEnd_date(r.getString(7));
			
			Blob blob1 = r.getBlob(8);
	         byte byteArray[] = blob1.getBytes(1, (int) blob1.length());
	         obj.setImage1(byteArray);
	         
	         Blob blob2=r.getBlob(9);
	         byteArray = blob2.getBytes(1, (int) blob2.length());
	         obj.setImage2(byteArray);
	         
	         Blob blob3=r.getBlob(10);
	         byteArray = blob3.getBytes(1, (int) blob3.length());
	         obj.setImage3(byteArray);
	         
	         Blob blob4=r.getBlob(11);
	         byteArray = blob4.getBytes(1, (int) blob4.length());
	         obj.setImage4(byteArray);
			
		}
		
		return obj;
		
	}

	public ArrayList<Product_bean> out_of_date_products()throws Exception{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,uname,pass);
		Statement st= con.createStatement();
		ResultSet r = st.executeQuery("select * from products where End_date<CURDATE()");
		
		ArrayList<Product_bean> products=new ArrayList<>();
		
		if(r.next()) {
			
			Product_bean obj=new Product_bean();
			
			obj.setProduct_id(r.getInt(1)+"");
			obj.setSeller_id(r.getInt(2)+"");
			obj.setProduct_name(r.getString(3));
			obj.setProduct_description(r.getString(4));
			obj.setBase_price(r.getString(5));
			obj.setGenre(r.getString(6));
			obj.setEnd_date(r.getString(7));
			
			Blob blob1 = r.getBlob(8);
	         byte byteArray[] = blob1.getBytes(1, (int) blob1.length());
	         obj.setImage1(byteArray);
	         
	         Blob blob2=r.getBlob(9);
	         byteArray = blob2.getBytes(1, (int) blob2.length());
	         obj.setImage2(byteArray);
	         
	         Blob blob3=r.getBlob(10);
	         byteArray = blob3.getBytes(1, (int) blob3.length());
	         obj.setImage3(byteArray);
	         
	         Blob blob4=r.getBlob(11);
	         byteArray = blob4.getBytes(1, (int) blob4.length());
	         obj.setImage4(byteArray);
			
	         products.add(obj);
	         
		}
		
		return products;
		
	}
	
	public ArrayList<String> get_highest_bidder_details(Product_bean product)throws Exception{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,uname,pass);
		Statement st= con.createStatement();
		ResultSet r = st.executeQuery("select user_id,bid_price from product_history where product_id="+Integer.parseInt(product.getProduct_id()));
		
		ArrayList<String> details=new ArrayList<>();
		
		if(r.next()) {
			details.add(r.getInt(1)+"");
			details.add(r.getString(2));
		}
		
		return details;
	}
	
	public String get_seller_mailId(Product_bean product)throws Exception{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,uname,pass);
		Statement st= con.createStatement();
		ResultSet r = st.executeQuery("select Email from seller_details where user_id="+Integer.parseInt(product.getSeller_id()));
		
		if(r.next()) {
			return r.getString(1);
		}
		
		return null;
		
	}
	
	public String get_user_mailId(String userId)throws Exception{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,uname,pass);
		Statement st= con.createStatement();
		ResultSet r = st.executeQuery("select Email from user_details where user_id="+Integer.parseInt(userId));
		
		if(r.next()) {
			return r.getString(1);
		}
		
		return null;
		
	}
	
	public void delete_products(Product_bean product)throws Exception{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,uname,pass);
		Statement st= con.createStatement();
		int r = st.executeUpdate("delete from products where product_id="+Integer.parseInt(product.getProduct_id()));
		int r1 = st.executeUpdate("delete from user_history where product_id="+Integer.parseInt(product.getProduct_id()));
		int r2 = st.executeUpdate("delete from product_history where product_id="+Integer.parseInt(product.getProduct_id()));
		
		
	}
	
	public void add_sold_products(Product_bean product,String user_email,String seller_email,int bid_price)throws Exception{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,uname,pass);
		String query="insert into sold_products (Product_id,product_name,user_Email,seller_Email,bid_price) values (?,?,?,?,?)";
		PreparedStatement st=con.prepareStatement(query);
		st.setString(1, product.getProduct_id());
		st.setString(2, product.getProduct_name());
		st.setString(3, user_email);
		st.setString(4, seller_email);
		st.setInt(5, bid_price);
		
		st.executeUpdate();
		
	}
	
	public ArrayList<SoldProducts_bean> get_user_Bought_Products(String user_email)throws Exception{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,uname,pass);
		Statement st= con.createStatement();
		ResultSet r = st.executeQuery("select * from sold_products where user_Email='"+user_email+"'");
		
		ArrayList<SoldProducts_bean> products=new ArrayList<>();
		
		while(r.next()) {		
	         
			SoldProducts_bean obj=new SoldProducts_bean();
			
			obj.setProduct_id(r.getString(1));
			obj.setProduct_name(r.getString(2));
			obj.setUser_Email(r.getString(3));
			obj.setSeller_Email(r.getString(4));
			obj.setBid_price(""+r.getInt(5));
			
	        products.add(obj);
			
		}
		
		return products;
	}
	
	public ArrayList<SoldProducts_bean> get_user_Sold_Products(String seller_email)throws Exception{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,uname,pass);
		Statement st= con.createStatement();
		ResultSet r = st.executeQuery("select * from sold_products where seller_Email='"+seller_email+"'");
		
		ArrayList<SoldProducts_bean> products=new ArrayList<>();
		
		while(r.next()) {		
	         
			SoldProducts_bean obj=new SoldProducts_bean();
			
			obj.setProduct_id(r.getString(1));
			obj.setProduct_name(r.getString(2));
			obj.setUser_Email(r.getString(3));
			obj.setSeller_Email(r.getString(4));
			obj.setBid_price(""+r.getInt(5));
			
	        products.add(obj);
			
		}
		
		return products;
	}
	
}

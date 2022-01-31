package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import bean.Product_bean;
import database.SqlDao;

@WebServlet("/ValidChecker")
public class ValidChecker extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Product_bean> products=null;
		
		try {
			products=new SqlDao().out_of_date_products();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		for(Product_bean pro:products) {
			
			ArrayList<String> details=null;
			
			try {
				details=new SqlDao().get_highest_bidder_details(pro);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			if(details.size()>0) {
				
				String bidPrice=details.get(1),user_mailId="",seller_mailId="";
				
				try {
					user_mailId=new SqlDao().get_user_mailId(details.get(0));
					seller_mailId=new SqlDao().get_seller_mailId(pro);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				try {
					new SqlDao().add_sold_products(pro,user_mailId,seller_mailId,Integer.parseInt(bidPrice));
				} catch (NumberFormatException e) {
					e.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			else{
				
				String seller_mailId="";
				
				try {
					seller_mailId=new SqlDao().get_seller_mailId(pro);
				} catch (Exception e) {
					e.printStackTrace();
				}

				try {
					new SqlDao().add_sold_products(pro,null,seller_mailId,0);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			
			try {
				new SqlDao().delete_products(pro);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
	}

}




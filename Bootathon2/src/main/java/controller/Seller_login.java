package controller;

import java.io.IOException;

import bean.SellerBean;
import database.SqlDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Seller_login")
public class Seller_login extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		
		SqlDao obj=new SqlDao();
		SellerBean seller=null;
		try {
			seller=obj.sellerlogin(email,pass);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		if(seller.getUser_id()==null)response.getWriter().write("false");
		else {
			HttpSession session=request.getSession();
			session.setAttribute("seller", seller);
			response.getWriter().write("true");
		}
	}

}

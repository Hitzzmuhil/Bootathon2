package controller;

import java.io.IOException;

import bean.SellerBean;
import bean.UserBean;
import database.SqlDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Seller_signup")
public class Seller_signup extends HttpServlet {

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SellerBean obj=new SellerBean();
		obj.setFirst_name(request.getParameter("first"));
		obj.setLast_name(request.getParameter("last"));
		obj.setCountry(request.getParameter("country"));
		obj.setDistrict(request.getParameter("district"));
		obj.setEmail(request.getParameter("email"));
		obj.setPassword(request.getParameter("pass"));
		obj.setPhone_number(request.getParameter("no"));
		obj.setPin(request.getParameter("pin"));
		obj.setState(request.getParameter("state"));
		
		SqlDao db=new SqlDao();
		boolean flag=false;
		try {
			flag=db.sellersignup(obj);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		response.getWriter().write(flag+"");
	}

}

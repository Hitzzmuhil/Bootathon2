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

@WebServlet("/Buyer_login")
public class Buyer_login extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		
		
		SqlDao obj=new SqlDao();
		UserBean user=null;
		try {
			user=obj.userlogin(email,pass);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		if(user.getUser_id()==null)response.getWriter().write("false");
		else {
			HttpSession session=request.getSession();
			session.setAttribute("user", user);
			session.setAttribute("filter", "All");
			response.getWriter().write("true");
		}
	}

}

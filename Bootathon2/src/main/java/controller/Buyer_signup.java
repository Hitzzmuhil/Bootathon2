package controller;

import java.io.IOException;

import bean.UserBean;
import database.SqlDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Buyer_signup")
public class Buyer_signup extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserBean obj=new UserBean();
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
			flag=db.signup(obj);
		} catch (Exception e) {
			System.out.println(e);
		}
		response.getWriter().write(flag+"");
	}

}

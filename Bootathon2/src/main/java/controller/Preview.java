package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import bean.Product_bean;
import database.SqlDao;

@WebServlet("/Preview")
public class Preview extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pro_id=request.getParameter("pro_id");
		
		Product_bean product=null;
		
		try {
			product=new SqlDao().getProduct(pro_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String referrer = request.getHeader("referer");
		
		HttpSession session=request.getSession();
		session.setAttribute("product_preview",product);
		if(!referrer.equals("http://localhost:8081/Bootathon2/seller_home.jsp"))response.sendRedirect("preview.jsp");
		else response.sendRedirect("preview_seller.jsp");
		
	}

}

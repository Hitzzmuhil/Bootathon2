package controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import bean.Product_bean;
import bean.SellerBean;
import bean.UserBean;
import database.SqlDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/Seller_home")
@MultipartConfig(maxFileSize=16177216)

public class Seller_home extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		Part part1=request.getPart("image1");
		Part part2=request.getPart("image2");
		Part part3=request.getPart("image3");
		Part part4=request.getPart("image4");
		
		Product_bean obj=new Product_bean();
		HttpSession session=request.getSession();
		SellerBean obj2=(SellerBean) session.getAttribute("seller");
		
		obj.setSeller_id(obj2.getUser_id());
		obj.setProduct_name(request.getParameter("name"));
		obj.setProduct_description(request.getParameter("descp"));
		obj.setBase_price(request.getParameter("basep"));
		obj.setGenre(request.getParameter("phcode"));
		obj.setEnd_date(request.getParameter("timeD"));
		
		try {
			if(new SqlDao().add_products(obj, part1, part2, part3, part4)){
				response.sendRedirect("seller_home.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}

package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import bean.Product_bean;
import bean.UserBean;
import database.SqlDao;

@WebServlet("/PlaceBid")
public class PlaceBid extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String base=request.getParameter("base");
		String high=request.getParameter("high");
		String curr=request.getParameter("curr");

		if(Integer.parseInt(base)<Integer.parseInt(curr) && Integer.parseInt(high)<Integer.parseInt(curr)) {
			HttpSession session=request.getSession();
			
			try {
				new SqlDao().add_product_history((Product_bean)session.getAttribute("product_preview"),(UserBean)session.getAttribute("user"),curr);
				new SqlDao().add_user_history((Product_bean)session.getAttribute("product_preview"),(UserBean)session.getAttribute("user"),curr);
			}
			catch(Exception e) {
				System.out.println("in placebid servlet "+e);
			}
			response.getWriter().write("true");
		}
		else {
			response.getWriter().write("false");
		}
		
	}

}

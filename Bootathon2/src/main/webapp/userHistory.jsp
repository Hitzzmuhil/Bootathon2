<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="bean.*" %>
    <%@ page import="database.*" %>
    <%@ page import="java.util.*" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QFARE</title>


	<style><%@include file="/WEB-INF/style/userHistory.css"%></style>
 	<style><%@include file="/WEB-INF/style/index.css"%></style>
     <style><%@include file="/WEB-INF/style/buyer_home.css"%></style>
	 <style><%@include file="/WEB-INF/style/previev.css"%></style>


    <!-- Latest compiled and minified CSS -->
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">



    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"><!--Font Awsome-->
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet"> 
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans+Condensed:ital,wght@1,300&display=swap" rel="stylesheet"> 
</head>
<body>

	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		UserBean user=(UserBean)session.getAttribute("user");
		ArrayList<SoldProducts_bean> array=null;
		
		try{
			array=new SqlDao().get_user_Bought_Products(user.getEmail());
		}
		catch(Exception e){
			response.sendRedirect("index.jsp");
		}
		
	%>

    <div class="s1 container-fluid">
        <img class="xd img-fluid" data-scroll draggable="false" src="images/Screenshot_3.png">
    </div>
    <!--Navbar-->
    <nav class="navbar navbar-expand-lg navbar-light bg-light" id="hnav">
        <div class="container-fluid">
          <a class="navbar-brand" id="nb" href="./index.jsp">Home</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarScroll">
            <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
              
              
              

              <li class="nav-item">
                <a class="nav-link"  href="Support.jsp" tabindex="-1" aria-disabled="true">Support</a>
              </li>
              
              <li class="nav-item">
                <form action="Logout" method="post">
                <button class="nav-link" type="submit">Log Out</button>
                </form>
              </li>
            </ul>
           
          </div>
        </div>
    </nav>

        <div class="container-fluid my-5">
            <div class="card">
                <div class="table-responsive ">
                    <table class="table">
                        <thead class="table-dark">
                            <tr>
                                <th class="sa" scope="col">S.NO</th>
                                <th class="sa" scope="col">Name</th>
                                <th class="sa" scope="col">Seller Email</th>
                                <th class="sa" scope="col">Bid Price</th>
                              </tr>
                        </thead>
                        <tbody>
                        
                        	<%
                        	if(array!=null){
                        		int i=0;
                        		for(SoldProducts_bean pro:array){
                        	
                        	%>
                        
                           	 <tr>
                                <th class="sa"><%=i %></th>
                                <td class="sa"><%=pro.getProduct_name() %></td>
                                <td class="sa"><%=pro.getSeller_Email() %></td>
                                <td class="sa"><%=pro.getBid_price() %></td>
                              </tr>
                              
                              <%
                              i++;
                        		}
                        	}
                              %>

                        </tbody>
                    </table>
                  </div>
            </div>
        </div>



    </body>
    </html>
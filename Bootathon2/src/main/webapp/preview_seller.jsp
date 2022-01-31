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

     <style><%@include file="/WEB-INF/style/index.css"%></style>
     <style><%@include file="/WEB-INF/style/buyer_home.css"%></style>
	 <style><%@include file="/WEB-INF/style/preview_seller.css"%></style>
 
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

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
		Product_bean product=(Product_bean)session.getAttribute("product_preview");
		if(product==null){
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
    
    	<%
    		if(product!=null){
    	%>
    
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-5"> 
                    <div class="card my-4 cr">
                        <h2 class="xs mm mx-2" >Product details</h2>
                        <h3 class="xp my-4 mx-4 " id="xe"><%=product.getProduct_name().toUpperCase() %></h3>
                        
                        <p class="xp1 mx-4">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=product.getProduct_description() %>
                           </p>
                        <span class="mx-4 ap tp"><small class="xp">Bid Ends By: </small><b class="mx-2"><%=product.getEnd_date()%></b> </span>
                        <span class="mx-4 my-3"><small class="xp">Base Price </small><b class="mx-2" id="base" ><%=product.getBase_price()%></b><span>$</span> </span>
                        <label></label>
                        <%
                        	int highest_price=0;
                        try{
                        	highest_price=new SqlDao().get_highest_bid(product.getProduct_id());
                        }catch(Exception e){
                        	System.out.println(e);
                        }
                        
                        %>
                        <span class="mx-4 "><small class="xp" >Current Highest Bid </small><b class="mx-2" id="high"><%=highest_price%></b> <span>$</span></span>
                        
                    </div>
                   
                
                </div>
    
                <div class="col-md-7">
                    <div class="card my-5">
                        <div class="card-body cb">
                            <div id="carouselExampleIndicators" class="carousel slide mx-3" data-bs-ride="carousel">
                                <div class="carousel-indicators">
                                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
                                </div>
                                <div class="carousel-inner">
                                  <div class="carousel-item active">
                                  	<%String base64Image1 = Base64.getEncoder().encodeToString(product.getImage1()); %>
                                    <img src="data:image/jpg;base64,<%=base64Image1%>" class="d-block w-100" alt="...">
                                  </div>
                                  <div class="carousel-item">
                                  <%String base64Image2 = Base64.getEncoder().encodeToString(product.getImage2()); %>
                                    <img src="data:image/jpg;base64,<%=base64Image2 %>" class="d-block w-100" alt="...">
                                  </div>
                                  <div class="carousel-item">
                                  <%String base64Image3 = Base64.getEncoder().encodeToString(product.getImage3()); %>
                                    <img src="data:image/jpg;base64,<%=base64Image3 %>" class="d-block w-100" alt="...">
                                  </div>
                                  <div class="carousel-item">
                                    <%String base64Image4 = Base64.getEncoder().encodeToString(product.getImage4()); %>
                                    <img src="data:image/jpg;base64,<%=base64Image4 %>" class="d-block w-100" alt="...">
                                  </div>
                                </div>
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                  <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                  <span class="visually-hidden">Next</span>
                                </button>
                              </div>
                        </div>
                    </div>
    
                </div>
                
               <% } %>
            </div>
        </div>
        
 

    </body>
</html>
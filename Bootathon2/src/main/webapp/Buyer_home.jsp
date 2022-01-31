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
     <style><%@include file="/WEB-INF/style/seller_home.css"%></style>
     <style><%@include file="/WEB-INF/style/buyer_home.css"%></style>
 


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
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans+Condensed:wght@300&display=swap" rel="stylesheet"> 
</head>
<body>

	<%
	
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	
		UserBean user=(UserBean)session.getAttribute("user");
		ArrayList<Product_bean> array=null;
		
		try{
			
			array=new SqlDao().getAllProducts(user,(String)session.getAttribute("filter"));
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
              <form action="BuyerHistory" method="post">
                <Button class="nav-link" type="submit"> Recent Bid  </a>
                </form>
              </li>
              
			<li class="nav-item">
              <form action="BoughtProducts" method="post">
                <Button class="nav-link" type="submit"> Bought Products  </a>
                </form>
              </li>
              
              <%
              if(user!=null){
            	 
              %>
              
            </ul>
            <form class="d-flex" action="Buyer_home" method="post">
                
                <select class="form-select my-2 me-2 rtm" id="genre" name="Genre" aria-label="Default select example">
                
                	<option value=<%=(String)session.getAttribute("filter")%>><%=(String)session.getAttribute("filter")%> Products</option>
                
                	<%
	                	String[] filters={"All","Convenience Products","Commercial Products","Specialty Products","Unsought Products"};
	                	Set<String> set=new HashSet<>();
	                	set.add((String)session.getAttribute("filter"));
	                	
	                	for(String s:filters){
	                		if(!set.contains(s)){
	                			
                	%>
                	<option value=<%=s%>><%=s%></option>
                	
                	<%
                			set.add(s);
	                		}
	                	}
                	%>
                	</select>
              <button class="btn btn-light" id="lp_fil" type="submit">Filter</button>

              
            </form>
            
            <form class="nav-item" action="Logout" method="post">
            
                <button class="nav-link" type="submit">LogOut</button>
            
            </form>
          </div>
        </div>
    </nav>

    <div class="container-fluid">
        <form action="Preview" method="post">
        <div class="row my-5">

					<%
	                	for(int i=0;i<array.size();i++){
	                		Product_bean obj=array.get(i);
	                		String base64Image = Base64.getEncoder().encodeToString(obj.getImage1());
	                	%>
            <div class="  col-md-3">
                <div class="card my-3">
                    <div class="card-body  ">
                        <h2 class="txt" name="pro_name"><%=obj.getProduct_name() %></h2>
                        <img src="data:image/jpg;base64,<%=base64Image %>" class="img-fluid hcard">
                        <div class="row">

                            <div class="col-md-6 my-3">
                                <h5 class="h5s">Base Price:</h5>
                            </div>
                            <div class="col-md-6">
                                <input disabled class="form-control my-2 dis" id="Password" type="search" value="<%=obj.getBase_price() %>">
                            </div>
                            
                            
                        </div>
                        
                        <button class="btn btn-dark" name="pro_id" id="lp" value="<%=obj.getProduct_id()%>" type="submit">Product Details</button>
                    </div>
                </div>
	

            </div>
					<% 
	                	}
              }
              else{
            	  response.sendRedirect("index.jsp");
              }
                	%>	
           
        </div>
        </form>
    </div>

		


    </body>
    </html>
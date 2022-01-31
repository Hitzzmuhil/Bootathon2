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
 


   <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">



    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"><!--Font Awsome-->
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet"> 
</head>
<body>

<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	SellerBean seller=(SellerBean)session.getAttribute("seller");
	ArrayList<Product_bean> array=null;
	try{
		array=new SqlDao().getProductBeans(seller);
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
              <form action="SoldProducts" method="post">
                <Button class="nav-link" type="submit"> Sold Products  </a>
                </form>
              </li>

              <li class="nav-item">
                <a class="nav-link" href="Support.jsp" tabindex="-1" aria-disabled="true">Support</a>
              </li>
              <li class="nav-item">
                <form action="Logout" method="post">
                <button class="nav-link" type="submit">Log Out</button>
                </form>
              </li>
            </ul>
            <form class="d-flex" action="#">
              
              <button type="button" class=" btn1 btn btn-dark my-2" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                Add Products
            </button>
            </form>
          </div>
        </div>
    </nav>

    <!--Part One-->
    <!--Image Script-->
    <script>
        window.addEventListener('load', function(e) {
        document.getElementById('file1').addEventListener('change', function(e) {
            if (e.target.files && e.target.files[0]) {
                var img = document.getElementById('img1');
                img.onload = () => {
                    URL.revokeObjectURL(img.src);  // no longer needed, free memory
                }

                img.src = URL.createObjectURL(e.target.files[0]); // set src to blob url

                
                
            }
        });
        });
    </script>
    <script>
        window.addEventListener('load', function(e) {
        document.getElementById('file2').addEventListener('change', function(e) {
            if (e.target.files && e.target.files[0]) {
                var img = document.getElementById('img2');
                img.onload = () => {
                    URL.revokeObjectURL(img.src);  // no longer needed, free memory
                }

                img.src = URL.createObjectURL(e.target.files[0]); // set src to blob url

                
                
            }
        });
        });
    </script>
    <script>
        window.addEventListener('load', function(e) {
        document.getElementById('file3').addEventListener('change', function(e) {
            if (e.target.files && e.target.files[0]) {
                var img = document.getElementById('img3');
                img.onload = () => {
                    URL.revokeObjectURL(img.src);  // no longer needed, free memory
                }

                img.src = URL.createObjectURL(e.target.files[0]); // set src to blob url

                
                
            }
        });
        });
    </script>
    
    
    
    <script>
        window.addEventListener('load', function(e) {
        document.getElementById('file4').addEventListener('change', function(e) {
            if (e.target.files && e.target.files[0]) {
                var img = document.getElementById('img4');
                img.onload = () => {
                    URL.revokeObjectURL(img.src);  // no longer needed, free memory
                }

                img.src = URL.createObjectURL(e.target.files[0]); // set src to blob url

                
                
            }
        });
        });
    </script>


     <div class="container-fluid">
        
        <div class="row my-5">
            	
            	
                	<%
	                	for(int i=0;array!=null&&i<array.size();i++){
	                		Product_bean obj=array.get(i);
	                		String base64Image = Base64.getEncoder().encodeToString(obj.getImage1());
	                	%>
	                	
                    <div class="  col-md-3">
                <div class="card my-3">
                    <div class="card-body  ">
                 
                        <img class="img-fluid xs" src="data:image/jpg;base64,<%=base64Image %>" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                        <small>Base Price</small>
                                <input disabled class="form-control me-2 my-2" id="Password" type="search" value=<%=obj.getBase_price() %>>
                                <form action="Preview" method="post">
                                <button class="btn btn-dark" name="pro_id" id="lp" value="<%=obj.getProduct_id()%>" type="submit">Product Details</button>
                                </form>
                    </div>
                </div>
	

            </div>
	                <% 
	                	}
                	%>		
            	</div>
         </div>
            <div class="col-md-4" id="divimain">
                                                             <!-- Button trigger modal -->
            
  
                <!-- Modal -->
                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                    <div class="modal-content">
                        <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel"> <h2 id="lp1">Description</h2></h5>
                        <button type="button" class="btn-close btnx" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        
                        <div class="modal-body">
                            <div class="card">
                                <div class="card-body">
                                   <form action="Seller_home" method="post" enctype="multipart/form-data">
                                   
                                    <input class="form-control me-2" id="name" name="name" requierd placeholder="Product Name">
                                    <input class="form-control my-2 me-2 " id="basep" name="basep" required placeholder="Base Selling Price">
                                    <select class="form-select my-2 me-2" name="phcode" aria-label="Default select example">
                                        <option value="Convenience Products">Convenience Products</option>
                                        <option value="Commercial Products">Commercial Products</option>
                                        <option value="Specialty Products">Specialty Products</option>
                                        <option value="Unsought Products">Unsought Products</option>
                                    </select>
                                    <input class="form-control my-2 me-2 " type="date" id="timeD" name="timeD" required placeholder="Time Duration">
                                    <textarea class="form-control my-2 me-2 "  id="descp" name="descp" required placeholder="Description"></textarea>
                                    <label class="my-2" for="file1">
                                    	<h6>
                                    		Upload All the 4 Images<br>
                                    		Image size must be below 2 MB<br><br>
                                    	</h6>
                                        <small id="lp1">Required Image (1)</small>
                                        <img class="img-fluid" id="img1" src="images/dummy.png">
                                    </label>
                                    <input type="file"accept="images/*" required name="image1" hidden  id="file1" multiple>

                                    <label class="my-2" for="file2">
                                        <small id="lp1">Required Image (2)</small>
                                        <img class="img-fluid" id="img2" src="images/dummy.png">
                                    </label>
                                    <input type="file"accept="images/*" required name="image2"  hidden  id="file2" multiple>

                                    <label class="my-2" for="file3">
                                        <small id="lp1">Required Image (3)</small>
                                        <img class="img-fluid" id="img3" src="images/dummy.png">
                                    </label>
                                    <input type="file"accept="images/*" required name="image3"  hidden  id="file3" multiple>

                                    <label class="my-2" for="file4">
                                        <small id="lp1">Required Image (4)</small>
                                        <img class="img-fluid" id="img4" src="images/dummy.png">
                                    </label>
                                    <input type="file"accept="images/*" required name="image4" hidden  id="file4" multiple>

                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                        <button type="button" class="btn btn-light" id="lp22" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-dark" id="lp1">Post</button>
                        </form> 
                        </div>
                       
                    </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
   
  

</body>
</html>
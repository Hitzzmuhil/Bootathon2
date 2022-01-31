<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QFARE</title>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js">  
 	</script>  
     <style><%@include file="/WEB-INF/style/index.css"%></style>
     <style><%@include file="/WEB-INF/style/signup1.css"%></style>
     <style><%@include file="/WEB-INF/style/seller_login.css"%></style>
    
    
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

    <div class="s1 container-fluid">
        <img class="xd img-fluid" data-scroll draggable="false" src="images/Screenshot_3-removebg-preview.png">
    </div>
    <!--Navbar-->
    <nav class="navbar navbar-expand-lg navbar-light bg-light" id="sn1111">
        <div class="container-fluid">
          <a class="navbar-brand" id="nb" href="./index.html">Home</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarScroll">
            <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
              
             
              <li class="nav-item">
                <a class="nav-link" href="./signup.jsp">Signup</a>
              </li>

              <li class="nav-item">
                <a class="nav-link" href="Support.jsp" tabindex="-1" aria-disabled="true">Support</a>
              </li>
            </ul>
            
          </div>
        </div>
    </nav>
    <!--Part 1-->

    <div class="container-fluid">
        <div class="row">
            
            
            <div class="col-md-5">
                <div class="ch1 card">
                    <div class="card-body">
                        <img class="img-fluid my-2" id="photo"src="images/bussi.png">
                       
                    </div>
                </div>

            </div>
            <div class="col-md-1"></div>
            <div class="col-md-5">
                <div class="form-inline">
                    <h2  class="tt1">Bussiness Login</h2>
                    <div class="row">
                        <div class="col-md-8">
                            <input class="i11 form-control" id="pp" type="email" name="email" placeholder="Email">
                        </div>
                        
                    </div>
                    <div class="row">
                        <div class="col-md-8">
                            <input  class="i11 form-control my-3" id="pp1" type="password" name="pass" placeholder="Password">
                        </div>
                    </div>

                   
                    <button id="lf1" class="dark btn btn-dark">Login</button>
                   
                </div>
                <a href="signup2.jsp" id="xpa">Dont have an Bussiness Account?</a>
            </div>
        </div>
    </div>


    <div class="container-fluid">           
        <nav class="navbar navbar-expand-lg navbar-light bg-light"id="socl">
            <li class="nav-item" style="list-style-type: none;"  ><a id="ic1" href="#"class="nav-link fa fa-facebook fa-lg" > <h3 id="hid"> Facebook Page</h3>  </a></li>
            <li class="nav-item" style="list-style-type: none;"  ><a id="ic1" href="#"class="nav-link fa fa-reddit fa-lg">    <h3 id="hid"> Reddit   </h3> </a></li>          <!-- social Icons-->
            <li class="nav-item" style="list-style-type: none;"  ><a id="ic1" href="#"class="nav-link fa fa-twitter fa-lg">   <h3 id="hid"> Twitter  </h3> </a></li>
            <li class="nav-item" style="list-style-type: none;"  ><a id="ic1" href="#"class="nav-link fa fa-linkedin fa-lg">  <h3 id="hid"> LinkedIn </h3> </a></li>
        </nav>
    </div>
  
  
    <div class="container-fluid" id="face5">
      <a id="copytags" href="#">Privacy Notice</a>&nbsp;&nbsp;&nbsp;
      <a id="copytags" href="#">Terms Of Service</a>&nbsp;&nbsp;&nbsp;                <!-- CopyRights-->
      <a id="copytags" href="#">Company Information</a>&nbsp;&nbsp;&nbsp;
      <a id="copytags" href="#">Cookie Preferences</a>
  </div>
  
  <div class="container-fluid" id="face9">
      <p align="center" id="copyright">&nbsp;&nbsp;© Qfare, Inc.  Any associated logos are<br> trademarks, service marks, and/or registered trademarks of respective owners Inc.</p>
  </div> 
  
  <script>  

  $(document).ready(function() {
	  $('#lf1').on('click',function(){
    	  var email =$(pp).val();
          var pass = $(pp1).val();
         
	          $.ajax({
	              type: "post",
	              url: "Seller_login", //this is my servlet
	              data:{email:email,pass:pass},
	              success: function(msg){
	            	  msg=msg.trim();
	                    //  $('#output').append(msg);
	                    if(msg==="true"){
	                    	window.location.href="seller_home.jsp";
	                    }
	                    else{
	                    	alert("EMAIL AND PASSWORD DOESN'T MATCH");
	                    }
	              }
	          });  
      });

  });
  
</script>  

    </body>
    </html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QFARE</title>
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

     <style><%@include file="/WEB-INF/style/index.css"%></style>

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
          <img class="xd img-fluid" data-scroll draggable="false" src="images/Screenshot_3.png">
      </div>
      <!--Navbar-->
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid">
            <a class="navbar-brand" id="nb" href="./index.jsp">Home</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarScroll">
              <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                
                <li class="nav-item">
                  <a class="nav-link" data-bs-toggle="modal" data-bs-target="#exampleModal">Log In</a>


                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Login</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                            
                            <input class="form-control me-2" id="email" placeholder="Email">
                            <input class="form-control my-2 me-2 " type="password" id="pass" placeholder="Password">
                          
                          </div>
                          <div class="modal-footer">
                            
                            <button type="button" id="login" class="btn btn-dark">Login</button>
                          </div>
                        </div>
                      </div>
                    </div>






                </li>
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
  
  
  
      <!--Part.1-->
  
      <div class="container-fluid">
        <div class="r1 row">
          <div class="col-md-6"> 
            <h1 class="hh1">Deal with comfort!</h1>
            <p class="pp1"> Make things come to you within with your comfort. Accept Deals ,Sell your Goods ,Bargain... with safety! 24x7 Customer Service Life is pain, highness. Anyone who tells you differently is selling something.
              . Place bids Save your money!</p>
              <button class="dark btn btn-dark">About Us</button>
           
              <h2 class="hxp">Start Your First Bussiness <a class="xpa" href="signup1.jsp">Here!</a></h2>
             
          </div>
          <div class="col-md-6">  <img draggable="false" class="onei img-fluid" src="images/1.jpg">  </div>
        </div>
      </div>
  
  
     
  
      <!--Part.2-->
      <div class="sec2 container-fluid">
        <div class="row">
                  <h1 data-scroll class="ss3" align="center">Top Notes</h1>
          <div class="col-md-4">
            <div class="ss2 card">
              <div class="card-header"><img class="s2 img-fluid" src="images/Screenshot_4.png"></div>
              <div class="card-body">
               <p class="onp">Live Life Better...</p>
              
              </div>
            </div>
          </div>
  
          <div class="ss2 col-md-4">
            <div class="card">
              <div class="card-header"><img class="s2 img-fluid" src="images/Screenshot_5.png"></div>
              <div class="card-body">
                <p class="onp">Deal with Comfort!</p>
                
               </div>
            </div>
             
          </div>
  
          <div class="ss2 col-md-4">
            <div class="card">
              <div class="card-header"><img class="s2 img-fluid" src="images/Screenshot_6.png"></div>
              <div class="card-body">
                <p class="onp">Refined Suggestions...</p>
               </div>
            </div>
          </div>
  
  
        </div>
      </div>
  
  
  
      <!--Part.3-->
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-8">
            <h2 data-scroll class="ss3"> Are u around the Globe?</h2>
            <p class="pp4">Don't worry , We have a expert team to transfer your goods in check...,It is literally true that we can<br> succeed best and quickest by helping others. Customer service in every nation! All under your doorstep..<br>Jump in Lets Celebrate!.Read more about our Global Policy!.Buyer's Protection and much more...</p>
            <button class="dark btn btn-dark">Read More</button>
          </div>
          <div class="col-md-4"> <img class="glob img-fluid" src="glob.png"></div>
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
  
  <div class="container-fluid" id="face3">
      <p align="center" id="copyright">&nbsp;&nbsp;© Qfare, Inc.  Any associated logos are<br> trademarks, service marks, and/or registered trademarks of respective owners Inc.</p>
  </div> 
  
  
  
  
  
      <script src="https://cdnjs.cloudflare.com/ajax/libs/rellax/1.12.1/rellax.min.js" integrity="sha512-f5HTYZYTDZelxS7LEQYv8ppMHTZ6JJWglzeQmr0CVTS70vJgaJiIO15ALqI7bhsracojbXkezUIL+35UXwwGrQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
      <script>var rellax = new Rellax('.rellax');</script>
  
      <script src="https://unpkg.com/scroll-out/dist/scroll-out.min.js"></script>
      <script>
          ScrollOut({
             once:true
             
          });
      </script>    
  
  <script>  
    $(document).ready(function() {
      $('#login').on('click',function(){
          var email =document.getElementById("email").value;
            var pass = document.getElementById("pass").value;
              console.log(pass);
              
              $.ajax({
	              type: "post",
	              url: "Buyer_login", //this is my servlet
	              data:{email:email,pass:pass},
	              success: function(msg){
	            	  msg=msg.trim();
	                    //  $('#output').append(msg);
	                    if(msg==="true"){
	                    	window.location.href="Buyer_home.jsp";
	                    }
	                    else{
	                    	alert("EMAIL AND PASSWORD DOESN'T MATCH");
	                    }
	              }
	          });  
        });
  
    });
    
  </script>  
  
  <script type="text/javascript">
  
  $(document).ready(function() {
	  $.ajax({
          type: "post",
          url: "ValidChecker",
          data:{},
          success: function(msg){
          }
      });
	  
  });
  
  </script>
  
  </body>
  </html>
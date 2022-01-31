<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QFARE</title>


    <style><%@include file="/WEB-INF/style/index.css"%></style>
     <style><%@include file="/WEB-INF/style/signup.css"%></style>
    
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
    <nav class="navbar navbar-expand-lg navbar-light bg-light" id="sn1">
        <div class="container-fluid">
          <a class="navbar-brand" id="nb" href="./index.jsp">Home</a>
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
            <form class="d-flex">
              
            </form>
          </div>
        </div>
    </nav>
    <!--Part 1-->

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="ch1 card-body">
                        <img class="img-fluid" src="images/seller1.png">
                        <button onclick="window.location.href='./signup2.jsp'" class="btn1 btn btn-dark">Start your Journey</button>
                    </div>
                </div>

            </div>
            <div class="col-md-8">
              <h1 class="a1"> Start your Bussiness Account Today!</h1> 
                <ul class="ul1">
                    <li class="xt1">Join over 27 million merchants worldwide that trust QFare.Learn from other business owners and experts.</li>
                    <li class="xt1">Discover international opportunities in 12 key markets around the globe and understand the cultural and seasonal nuances that will help you connect with buyers in these markets effectively.</li>
                    <li class="xt1">Trusted by Millions of Customers, Chosen by Leading Marketplaces</li>
                </ul>
                <figure class="text-end">
                    <blockquote class="blockquote">
                      <p class="xt2">Grow your Bussiness with Us!</p>
                    </blockquote>
                    <figcaption class="blockquote-footer">
                      QfAre <cite title="Source Title"></cite>
                    </figcaption>
                  </figure>
            </div>
            
    
    
        </div>
    </div>





    <div class="xps container-fluid">
        <div class="row">
            <div class="col-md-8">
                <h1 class="a1">Buy Genuine Products!</h1> 
                  <ul class="ul1">
                      <li class="xt1">Join over 27 customers worldwide that trust QFare.100% Buyer Protetion Gauranteed!</li>
                      <li class="xt1">One Stop for major Online Portals .Product Checks and Much More !</li>
                      <li class="xt1">Trusted by Millions of Customers, Chosen with Care!</li>
                  </ul>
                  <figure class="text-end">
                      <blockquote class="blockquote">
                        <p class="xt2">Start Your Journey!</p>
                      </blockquote>
                      <figcaption class="blockquote-footer">
                        QfAre <cite title="Source Title"></cite>
                      </figcaption>
                    </figure>
              </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="ch1 card-body">
                        <img class="img-fluid" src="images/buyer.png">
                        <button onclick="window.location.href='./signup1.jsp'" class="btn1 btn btn-dark">Start your Journey1</button>
                    </div>
                </div>

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
  
  <div class="container-fluid" id="face8">
      <p align="center" id="copyright">&nbsp;&nbsp;© Qfare, Inc.  Any associated logos are<br> trademarks, service marks, and/or registered trademarks of respective owners Inc.</p>
  </div> 
  
</body>
</html>
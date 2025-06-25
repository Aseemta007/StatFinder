<%-- 
    Document   : Homepage
    Created on : Jan 18, 2024, 11:10:11 AM
    Author     : ANANTHU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>Services</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Home page</title>
      <link rel="stylesheet" href="../Assets/Templates/Main/css/footstyle2.css">
      <!-- bootstrap css -->
      <link rel="stylesheet" type="text/css" href="../Assets/Templates/Main/css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" type="text/css" href="../Assets/Templates/Main/css/homepage.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="../Assets/Templates/Main/css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="images/fevicon.png" type="image/gif" />
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
      <!-- fonts -->
      <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;500;600;800&family=Sen:wght@400;700;800&display=swap" rel="stylesheet">
   </head>
   <%@include file="Head.jsp" %>
   <body>
      <!-- services section start -->
      <div class="services_section layout_padding">
         <div class="container-fluid">
            <div class="row">
               <div class="col-sm-12">
                  <h1 class="services_taital">Hello <%=session.getAttribute("adname")%></h1>
                  <p class="services_text_1"></p>
               </div>
            </div>
            <div class="services_section_2">
               <div class="row">
                  <div class="col-lg-3 col-sm-6">
                     <div class="box_main">
                         <a href="ChangePassword.jsp">
                        <div class="service_img"><img src="../Assets/Templates/Main/img/chpassword.png"></div>
                        <h4 class="development_text">Change Password</h4>
                        <p class="services_text"></p>
                        </a>
                     </div>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                     <div class="box_main">
                         <a href="district.jsp">
                        <div class="service_img"><img src="../Assets/Templates/Main/img/district.png"></div>
                        <h4 class="development_text">District</h4>
                        <p class="services_text"></p>
                        </a>
                     </div>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                     <div class="box_main">
                         <a href="place.jsp">
                        <div class="service_img"><img src="../Assets/Templates/Main/img/place.png"></div>
                        <h4 class="development_text">Place</h4>
                        <p class="services_text"></p>
                        </a>
                     </div>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                     <div class="box_main">
                         <a href="location.jsp">
                        <div class="service_img"><img src="../Assets/Templates/Main/img/location.png"></div>
                        <h4 class="development_text">Location</h4>
                        <p class="services_text"></p>
                        </a>
                     </div>
                  </div>
               </div>
                
                <div class="row" >
                  <div class="col-lg-3 col-sm-6">             
                     <div class="box_main">
                         <a href="category.jsp">
                        <div class="service_img"><img src="../Assets/Templates/Main/img/category.png"></div>
                        <h4 class="development_text">Category</h4>
                        <p class="services_text"></p>
                         </a>
                     </div>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                     <div class="box_main">
                         <a href="subcategory.jsp">
                        <div class="service_img"><img src="../Assets/Templates/Main/img/subcategory.png"></div>
                        <h4 class="development_text">Subcategory</h4>
                        <p class="services_text"></p>
                        </a>
                     </div>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                     <div class="box_main">
                         <a href="UserVerification.jsp">
                        <div class="service_img"><img src="../Assets/Templates/Main/img/userverification.png"></div>
                        <h4 class="development_text">User Verification</h4>
                        <p class="services_text"></p>
                         </a>
                     </div>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                     <div class="box_main">
                         <a href="ShopVerification.jsp">
                        <div class="service_img"><img src="../Assets/Templates/Main/img/shopverification.png"></div>
                        <h4 class="development_text">Shop Verification</h4>
                        <p class="services_text"></p>
                         </a>
                     </div>
                  </div>
               </div>
                
                <div class="row" >
                  
                  <div class="col-lg-3 col-sm-6">
                     <div class="box_main">
                         <a href="Complaintaction.jsp">
                        <div class="service_img"><img src="../Assets/Templates/Main/img/complaintreply.png"></div>
                        <h4 class="development_text">Complaint Reply</h4>
                        <p class="services_text"></p>
                         </a>
                     </div>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                     <div class="box_main">
                         <a href="Feedbackdisplay.jsp">
                        <div class="service_img"><img src="../Assets/Templates/Main/img/feedback.png"></div>
                        <h4 class="development_text">Feedback Display</h4>
                        <p class="services_text"></p>
                         </a>
                     </div>
                  </div>
                    <div class="col-lg-3 col-sm-6">
                     <div class="box_main">
                         <a href="../Guest/Login.jsp">
                        <div class="service_img"><img src="../Assets/Templates/Main/img/Logout.png"></div>
                        <h4 class="development_text">Logout</h4>
                        <p class="services_text"></p>
                         </a>
                     </div>
                  </div>
               </div>
               
            </div>
         </div>
      </div>
   </body>
   <%@include file="../Guest/Foot.jsp" %>
</html>


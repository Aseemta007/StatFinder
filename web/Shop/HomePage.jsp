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
   <%@include file="Shophead.jsp" %>
   <body>
      <!-- services section start -->
      <div class="services_section layout_padding">
         <div class="container-fluid">
            <div class="row">
               <div class="col-sm-12">
                  <h1 class="services_taital">Hello <%=session.getAttribute("shname")%></h1>
                  <p class="services_text_1"></p>
               </div>
            </div>
            <div class="services_section_2">
               <div class="row">
                  <div class="col-lg-3 col-sm-6">
                     <div class="box_main">
                         <a href="MyProfile.jsp">
                        <div class="service_img"><img src="../Assets/Templates/Main/img/profile.png"></div>
                        <h4 class="development_text">My Profile</h4>
                        <p class="services_text">View your profile details</p>
                        </a>
                     </div>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                     <div class="box_main">
                         <a href="EditProfile.jsp">
                        <div class="service_img"><img src="../Assets/Templates/Main/img/edit.png"></div>
                        <h4 class="development_text">Edit Profile</h4>
                        <p class="services_text">Edit your Profile Details</p>
                        </a>
                     </div>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                     <div class="box_main">
                         <a href="ChangePassword.jsp">
                        <div class="service_img"><img src="../Assets/Templates/Main/img/chpassword.png"></div>
                        <h4 class="development_text">Change Password</h4>
                        <p class="services_text"></p><br>
                        </a>
                     </div>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                     <div class="box_main">
                         <a href="ProductRegistration.jsp">
                        <div class="service_img"><img src="../Assets/Templates/Main/img/regprod.png"></div>
                        <h4 class="development_text">Product Registration</h4>
                        <p class="services_text">Register New Products or Edit Existing Products</p>
                        </a>
                     </div>
                  </div>
               </div>
                
                <div class="row" >
                  <div class="col-lg-3 col-sm-6">             
                     <div class="box_main">
                         <a href="productdisplay.jsp">
                        <div class="service_img"><img src="../Assets/Templates/Main/img/Disprod.png"></div>
                        <h4 class="development_text">Product Display</h4>
                        <p class="services_text">Display all registered Products</p>
                         </a>
                     </div>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                     <div class="box_main">
                         <a href="ReviewDisplay.jsp">
                        <div class="service_img"><img src="../Assets/Templates/Main/img/Revdis.png"></div>
                        <h4 class="development_text">Review Display</h4>
                        <p class="services_text">View all existing Reviews and reply to those reviews</p>
                        </a>
                     </div>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                     <div class="box_main">
                         <a href="Complaintdisplay.jsp">
                        <div class="service_img"><img src="../Assets/Templates/Main/img/Comdis.png"></div>
                        <h4 class="development_text">Complaint Display</h4>
                        <p class="services_text">View all Complaints Received and Reply</p>
                         </a>
                     </div>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                     <div class="box_main">
                         <a href="../Guest/Login.jsp">
                        <div class="service_img"><img src="../Assets/Templates/Main/img/Logout.png"></div>
                        <h4 class="development_text">Logout</h4>
                        <p class="services_text"></p><br>
                         </a>
                     </div>
                  </div>
               </div>
               
            </div>
         </div>
      </div>
   </body>
   <%@include file="Foot.jsp" %>
</html>

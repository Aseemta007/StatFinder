<%-- 
    Document   : ShopDescription
    Created on : 20 May, 2024, 3:32:08 PM
    Author     : aseem
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Details</title>
        <link rel="stylesheet" href="../Assets/Templates/Main/css/footstyle2.css">
        <link rel="stylesheet" href="../Assets/Templates/Main/css/shopdet.css">
    </head>
    <%@include file="Userhead.jsp" %>
    <body>
        <%
          String sel = "select*from tbl_shop  s inner join tbl_location l on l.location_id=s.location_id  inner join tbl_place p on p.place_id=l.place_id inner join tbl_district d on d.district_id=p.district_id where shop_id='"+request.getParameter("yid")+"'";
          ResultSet rsag = con.selectCommand(sel);
          if(rsag.next())
          {
        %>
        <form method="post">
            <div class="shop-details">
  <img src="../Assets/Files/ShopLogo/<%=rsag.getString("shop_logo")%>" alt="<%=rsag.getString("shop_name")%>" class="shop-logo">
  <table>
    <thead>
      <tr>
        <th>Name</th>
        <th>Value</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Name</td>
        <td><%=rsag.getString("shop_name")%></td>
      </tr>
      <tr>
        <td>Contact</td>
        <td><%=rsag.getString("shop_contact")%></td>
      </tr>
      <tr>
        <td>District</td>
        <td><%=rsag.getString("district_name")%></td>
      </tr>
      <tr>
        <td>Place</td>
        <td><%=rsag.getString("place_name")%></td>
      </tr>
      <tr>
        <td>Location</td>
        <td><%=rsag.getString("location_name")%></td>
      </tr>
      <tr>
        <td>Email</td>
        <td><%=rsag.getString("shop_email")%></td>
      </tr>
      <tr>
        <td>Address</td>
        <td><%=rsag.getString("shop_address")%></td>
      </tr>
    </tbody>
  </table>
</div>
                </form>
        <%
          }
        %>        
           
        
    <div class="container my-4">
        <div class="text-center mb-4">
            <h1 id="h2e">Products</h1>
        </div>
        <div class="row" id="dataT">
        
         <%
                    String selqr = "select*from tbl_product p inner join tbl_shop s on p.shop_id=s.shop_id where p.shop_id='"+request.getParameter("yid")+"'";
                    ResultSet rs = con.selectCommand(selqr);
                    while (rs.next()) 
                    {
                %>
        
<div class="col-md-4 mb-4">
    <div class="card h-100">
        <img src="../Assets/Files/ProductImage/<%=rs.getString("product_image")%>" class="card-img-top" alt="<%=rs.getString("product_name")%>">
        <div class="card-body">
            <h5 class="card-title"><%=rs.getString("product_name")%></h5>
            <p class="card-text"><%=rs.getString("product_details")%></p>
            <p class="card-text"><strong>Price: </strong>$<%=rs.getString("product_price")%></p>
        </div>
        <div class="card-footer">
            <a href="ProductDetails.jsp?product_id=<%=rs.getString("product_id")%>" class="btn btn-primary">View Details</a>
        </div>
    </div>
</div>
        <%
                }
              %>
</div>
    </div>
    </body>

</html>
<%@include file="../Guest/Foot.jsp" %>

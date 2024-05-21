
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
        <title>Product Details</title>
        <link rel="stylesheet" href="../Assets/Templates/Main/css/footstyle2.css">
        <link rel="stylesheet" href="../Assets/Templates/Main/css/shopdet.css">
    </head>
    <%@include file="Userhead.jsp" %>
    <body>
        <%
         String sel1 = "select*from tbl_product p inner join tbl_shop s on s.shop_id=p.shop_id  where product_id='"+request.getParameter("product_id")+"'";  
          ResultSet rsu = con.selectCommand(sel1);
          if(rsu.next())
          {
        %>
        <form method="post">
            <div class="shop-details">
  <img src="../Assets/Files/ProductImage/<%=rsu.getString("Product_image")%>" alt="<%=rsu.getString("product_name")%>" class="shop-logo">
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
        <td><%=rsu.getString("product_name")%></td>
      </tr>
      <tr>
        <td>Details</td>
        <td><%=rsu.getString("product_details")%></td>
      </tr>
      <tr>
        <td>Product Images</td>
        <td><a href="productimages.jsp?sid=<%=rsu.getString("product_id")%>">View Images</a></td>
      </tr>
      <tr>
        <td>Shop Name</td>
        <td><a href="ShopDescription.jsp?yid=<%=rsu.getString("shop_id")%>"><%=rsu.getString("shop_name")%></a></td>
      </tr>
      <tr>
        <td>Product Price</td>
        <td><%=rsu.getString("product_price")%></td>
      </tr>
    </tbody>
  </table>
</div>
                </form>
        <%
          }
        %>        
           
    </body>

</html>
<%@include file="../Guest/Foot.jsp" %>

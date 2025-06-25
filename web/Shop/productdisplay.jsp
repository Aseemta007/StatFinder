<%-- 
    Document   : WorkPostDisplay
    Created on : 19 Jan, 2024, 11:12:24 AM
    Author     : ananthu
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Display</title>
        <link rel="stylesheet" href="../Assets/Templates/Main/css/footstyle2.css">
        <link rel="stylesheet" href="../Assets/Templates/Main/css/proddisp.css">
   
    </head>
    <%@include file="Shophead.jsp" %>
    <body>
        <%
        if(request.getParameter("did")!=null)
          {
              String delqry="delete from tbl_product where product_id='"+request.getParameter("did")+"'";
              con.executeCommand(delqry);
              response.sendRedirect("productdisplay.jsp");
          }
        %>
        <div align="center" id="h2e">
        <h2>Uploaded products</h2>
        <div class="content-wrapper"> 
        <form method="post">
        <table border="3" align="center">
               
                <tr>
                    <th>Sl.no</th>
                    <th>Product image</th>
                    <th>Product name</th>
                    <th>Product Description</th>
                    <th>Product Price</th>
                    <th>Action</th>
                    <th>Add More Images</th>
                    <th>Image Gallery</th>
                </tr>
        <%
                 String selqry = "select*from tbl_product where shop_id='"+session.getAttribute("shid")+"'";  
                 ResultSet rs = con.selectCommand(selqry);
                 int i=0;
                 while(rs.next())
                 {
                     i++;
                     %>
                     <tr>
                         <td><%=i%></td>
                         <td><img src="../Assets/Files/ProductImage/<%=rs.getString("product_image")%>" height="70" width="70"</td></td>
                         <td><%=rs.getString("product_name")%></td>
                         <td><%=rs.getString("product_details")%></td>
                         <td><%=rs.getString("product_price")%></td>
                         <td><a href="productdisplay.jsp?did=<%=rs.getString("product_id")%>">Delete</a></td>
                         <td><a href="productgallery.jsp?pid=<%=rs.getString("product_id")%>">AddMoreImages</a></td>
                         <td><a href="productgallerydisplay.jsp?gid=<%=rs.getString("product_id")%>">ViewGallery</a></td>
                     </tr>
                     <%
                 }
                     %>      
             </table>
        </form>
             </div>  
        </div>
         
    </body>
    <%@include file="../Guest/Foot.jsp" %>
</html>
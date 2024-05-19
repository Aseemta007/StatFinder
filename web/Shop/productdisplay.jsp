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
        <title>ProdctDisplay</title>
        <link rel="stylesheet" href="../Assets/Templates/Main/css/footstyle2.css">
        <style>
            body {
    font-family: 'Inter', sans-serif;
    background: url("../Assets/Templates/Main/img/proddisp.jpg");
    background-size: 100% 100%;
    background-size: cover;
  background-position: center center;
            }

            h2 {
                 border-collapse: collapse;
  margin: 0 auto;
  overflow: hidden;
  color: #333;
  max-width: 400px;
  margin-bottom: 30px;
  background-color: rgba(255, 255, 255, 0.7);
  padding: 10px;
  border-radius: 10px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
}

            table {
              border-collapse: collapse;
              margin: 0 auto;
              overflow: hidden;
              background-color: rgba(255, 255, 255, 0.7);
              border-radius: 10px;
              box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            }

            th,
            td {
              padding: 15px;
              border: 1px solid #ddd;
            }

            th {
              background-color: #4CAF50;
              color: white;
              font-weight: normal;
            }

            td img {
              height: 155px; /* increased height by 50% */
              width: 155px; /* increased width by 50% */
              object-fit: cover;
              border-radius: 50%;
            }

            a {
              color: #4CAF50;
              text-decoration: none;
              font-size: 14px;
              margin-right: 10px;
            }

            a:hover {
              text-decoration: underline;
            }

            form {
              margin-top: 30px;
            }
        </style>
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
        <div align="center">
        <h2>Uploaded products</h2>
         
        <form method="post">
        <table border="3" align="center">
               
                <tr>
                    <th>Sl.no</th>
                    <th>Product name</th>
                    <th>Product Description</th>
                    <th>Product Price</th>
                    <th>Product image</th>
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
         
    </body>
    <%@include file="Foot.jsp" %>
</html>
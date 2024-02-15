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
    </head>
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
</html>
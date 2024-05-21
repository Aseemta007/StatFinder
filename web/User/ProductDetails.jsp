<%-- 
    Document   : Product_details
    Created on : 20 May, 2024, 2:28:36 PM
    Author     : aseem
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile</title>
    </head>
    <body>
        <%
          String sel1 = "select*from tbl_product p inner join tbl_shop s on s.shop_id=p.shop_id  where product_id='"+request.getParameter("product_id")+"'";  
          ResultSet rsu = con.selectCommand(sel1);
          if(rsu.next())
          {
        %>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td colspan="2" align="right"><img src="../Assets/Files/ProductImage/<%=rsu.getString("product_image")%>" height="120" width="120"></td>
                </tr>
                <tr>
                    <td>Product Name</td>
                    <td><%=rsu.getString("product_name")%></td>
                </tr>
                <tr>
                    <td>Product Details</td>
                    <td><%=rsu.getString("product_details")%></td>
                </tr>
                <tr>
                    <td>Shop Name</td>
                    <td><a href="ShopDescription.jsp?yid=<%=rsu.getString("shop_id")%>"><%=rsu.getString("shop_name")%></a></td>
                </tr>
                
                <tr>
                    <td>Product Price</td>
                    <td><%=rsu.getString("product_price")%></td>
                </tr>
        <%
          }
        %>        
            </table>
        </form>
    </body>
</html>

<%-- 
    Document   : MyProfile
    Created on : Jan 18, 2024, 2:05:27 PM
    Author     : ANANTHU
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>My Profile</title>
        <link rel="stylesheet" href="../Assets/Templates/Main/css/footstyle2.css">
        <link rel="stylesheet" href="../Assets/Templates/Main/css/myprof.css">
    </head>
    <%@include file="Shophead.jsp" %>
    <body>
        <%
          String sel1 = "select*from tbl_shop where shop_id='"+session.getAttribute("shid")+"'";  
          ResultSet rsag = con.selectCommand(sel1);
          if(rsag.next())
          {
        %>
        <form method="post">
            <table align="center">
                <tr>
                    <td colspan="2" align="right"><img src="../Assets/Files/ShopLogo/<%=rsag.getString("shop_logo")%>" alt="Shop Logo"></td>
                </tr>
                <tr>
                    <td>Proof</td>
                    <td><a href="../Assets/Files/ShopProof/<%=rsag.getString("shop_proof")%>" download>Download</a></td>
                </tr>                
                <tr>
                    <td>Name</td>
                    <td><%=rsag.getString("shop_name")%></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><%=rsag.getString("shop_contact")%></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%=rsag.getString("shop_email")%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><%=rsag.getString("shop_address")%></td>
                </tr>
        <%
          }
        %>        
            </table>
        </form>
    </body>
    <%@include file="Foot.jsp" %>
</html>
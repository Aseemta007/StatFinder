<%-- 
    Document   : ShopDescription
    Created on : 20 May, 2024, 3:32:08 PM
    Author     : aseem
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Userhead.jsp" %>
<style>
    tr, td {
        padding: 10px;
        border: 1px solid !important;
    }
</style>
    <body>
        <%
          String sel = "select*from tbl_shop  s inner join tbl_location l on l.location_id=s.location_id  inner join tbl_place p on p.place_id=l.place_id inner join tbl_district d on d.district_id=p.district_id where shop_id='"+request.getParameter("yid")+"'";
          ResultSet rsag = con.selectCommand(sel);
          if(rsag.next())
          {
        %>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td colspan="2" align="right"><img src="../Assets/Files/ShopLogo/<%=rsag.getString("shop_logo")%>" height="120" width="120"></td>
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
        <%
          }
        %>        
           </table>
        </form>
    </body>
    <%@include file="Foot.jsp" %>
</html>

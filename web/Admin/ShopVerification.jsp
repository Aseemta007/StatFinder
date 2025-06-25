<%-- 
    Document   : Userverification
    Created on : 11 Jan, 2024, 2:07:56 PM
    Author     : thoma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
    <jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <link rel="stylesheet" href="../Assets/Templates/Main/css/footstyle2.css">
        <link rel="stylesheet" href="../Assets/Templates/Main/css/proddisp.css">
   
    </head>
    <%@include file="Head.jsp" %>
    <body>
         <%
            if (request.getParameter("aid") != null) {
               String up= "update tbl_shop set shop_vstate='1' where shop_id ='"+request.getParameter("aid")+"'"  ;
               con.executeCommand(up);
            }
            
         %>
          <%
            if (request.getParameter("rid") != null) {
               String up1= "update tbl_shop set shop_vstate='2' where shop_id ='"+request.getParameter("rid")+"'"  ;
               con.executeCommand(up1);
            }
            
         %>
         <div class="content-wrapper">
         <table  border="2" align="center">
                <tr>
                    <th>Sl no</th>
                    <th>Name</th>
                    <th>Contact</th>
                    <th>Logo</th>
                    <th>Proof</th>
                    <th>Action</th>
                    <th>Verification</th>
                     <%
                    String insqry = "select*from tbl_shop";
                    ResultSet rs = con.selectCommand(insqry);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("shop_name")%></td>
                    <td><%=rs.getString("shop_contact")%></td>
                    <td><%=rs.getString("shop_logo")%></td>
                    <td><%=rs.getString("shop_proof")%></td>
                    <td><a href="ShopVerification.jsp?aid=<%=rs.getString("shop_id")%>">Accept</a>|<a href="ShopVerification.jsp?rid=<%=rs.getString("shop_id")%>">reject</a></td>
                    <td>
            <%
             if (rs.getInt("shop_vstate")==0)//property table ill illa
                 {
                   out.println("Shop profile is pending");
                 }
            else if (rs.getInt("shop_vstate")==1)
                 {
                   out.println("Shop profile is accepted");
                 }
            else if (rs.getInt("shop_vstate")==2)
                 {
                   out.println("Shop profile is rejected");
                 }
            
            %>
                </td>
                </tr>
              <%
                }
              %>
            </table>
            </div>
    </body>
</html>
<%@include file="../Guest/Foot.jsp" %>
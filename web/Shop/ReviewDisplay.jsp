<%--
    Document   : ReviewDisplay
    Created on : 22 Feb, 2024, 11:23:50 AM
    Author     : aseem
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Review Display</title>
    <link rel="stylesheet" href="../Assets/Templates/Main/css/footstyle2.css">
    <link rel="stylesheet" href="../Assets/Templates/Main/css/revdisp.css">
     
        </style>
    </head>
    <%@include file="Shophead.jsp" %>
    <body>
        <div align="center" id="h2e">
        <h2>Reviews</h2>
        <table border="1" align="center">
                <tr>
                    <th>Sl.No</th>
                    <th>Review Date</th>
                    <th>User Name</th>
                    <th>Review</th>


                </tr>
                 <%
                    String insqry = "select*from tbl_review  w inner join tbl_user l on l.user_id=w.user_id where shop_id='"+session.getAttribute("shid")+"'";
                    ResultSet rs = con.selectCommand(insqry);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>
                 <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("review_datetime")%></td>
                    <td><%=rs.getString("user_name")%></td>
                    <td><%=rs.getString("user_review")%></td>

                </tr>
                <%
                }
              %>
            </table>
                
    </body>
    <%@include file="../Guest/Foot.jsp" %>
</html>

<%-- 
    Document   : Userverification
    Created on : 11 Jan, 2024, 2:07:56 PM
    Author     : aseem
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
    <jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback Display</title>
    <link rel="stylesheet" href="../Assets/Templates/Main/css/footstyle2.css">
        <link rel="stylesheet" href="../Assets/Templates/Main/css/proddisp.css">
   
    </head>
    <%@include file="../Guest/Head.jsp" %>
    <body>    
         <table  border="2" align="center">
                <tr>
                    <th>Sl no</th>
                    <th>Username</th>
                    <th>Feedback Date</th>
                    <th>Feedback Content</th>
                     <%
                    String insqry = "select*from tbl_feedback  w inner join tbl_user l on l.user_id=w.user_id";
                    ResultSet rs = con.selectCommand(insqry);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("user_name")%></td>
                    <td><%=rs.getString("feedback_date")%></td>
                    <td><%=rs.getString("feedback_content")%></td>
                </tr>
              <%
                }
              %>
            </table>
    </body>
</html>
<%@include file="../Guest/Foot.jsp" %>
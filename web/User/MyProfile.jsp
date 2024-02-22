<%-- 
    Document   : MyProfile
    Created on : Jan 18, 2024, 12:08:02 PM
    Author     : ANANTHU
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
          String sel1 = "select*from tbl_user where user_id='"+session.getAttribute("uid")+"'";  
          ResultSet rsu = con.selectCommand(sel1);
          if(rsu.next())
          {
        %>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td colspan="2" align="right"><img src="../Assets/Files/UserPhoto/<%=rsu.getString("user_photo")%>" height="120" width="120"></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><%=rsu.getString("user_name")%></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><%=rsu.getString("user_contact")%></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%=rsu.getString("user_email")%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><%=rsu.getString("user_address")%></td>
                </tr>
        <%
          }
        %>        
            </table>
        </form>
    </body>
</html>
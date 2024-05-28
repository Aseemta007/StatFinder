<%-- 
    Document   : Userverification
    Created on : 11 Jan, 2024, 2:07:56 PM
    Author     : ananthu
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
    <%@include file="../Guest/Head.jsp" %>
    <body>
         <%
            if (request.getParameter("aid") != null) {
               String up= "update tbl_user set user_vstate='1' where user_id ='"+request.getParameter("aid")+"'"  ;
               con.executeCommand(up);
            }
            
         %>
          <%
            if (request.getParameter("rid") != null) {
               String up1= "update tbl_user set user_vstate='2' where user_id ='"+request.getParameter("rid")+"'"  ;
               con.executeCommand(up1);
            }
            
         %>
         
         <table  border="2" align="center">
                <tr>
                    <th>Sl no</th>
                    <th>Name</th>
                    <th>Contact</th>
                    <th>Photo</th>
                    <th>Email</th>
                    <th>DOB</th>
                    <th>Action</th>
                    <th>Verification</th>
                     <%
                    String insqry = "select*from tbl_user";
                    ResultSet rs = con.selectCommand(insqry);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("user_name")%></td>
                    <td><%=rs.getString("user_contact")%></td>
                    <td><%=rs.getString("user_photo")%></td>
                    <td><%=rs.getString("user_email")%></td>
                    <td><%=rs.getString("user_dob")%></td>
                    <td><a href="UserVerification.jsp?aid=<%=rs.getString("user_id")%>">Accept</a>|<a href="UserVerification.jsp?rid=<%=rs.getString("user_id")%>">reject</a></td>
                    <td>
            <%
             if (rs.getInt("user_vstate")==0)//property table ill illa
                 {
                   out.println("User profile is pending");
                 }
            else if (rs.getInt("user_vstate")==1)
                 {
                   out.println("User profile is accepted");
                 }
            else if (rs.getInt("user_vstate")==2)
                 {
                   out.println("User profile is rejected");
                 }
            
            %>
                </td>
                </tr>
              <%
                }
              %>
            </table>
    </body>
</html>
<%@include file="../Guest/Foot.jsp" %>
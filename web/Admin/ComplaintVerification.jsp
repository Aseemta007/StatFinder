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
        <title>Review Verification</title>
    <link rel="stylesheet" href="../Assets/Templates/Main/css/footstyle2.css">
        <link rel="stylesheet" href="../Assets/Templates/Main/css/proddisp.css">
   
    </head>
    <%@include file="../Guest/Head.jsp" %>
    <body>
         <%
            if (request.getParameter("aid") != null) {
               String up= "update tbl_complaint set complaint_status='2' where complaint_id ='"+request.getParameter("aid")+"'"  ;
               con.executeCommand(up);
            }
            
         %>
          <%
            if (request.getParameter("rid") != null) {
               String up1= "update tbl_complaint set complaint_status='3' where complaint_id ='"+request.getParameter("rid")+"'"  ;
               con.executeCommand(up1);
            }
            
         %>
          
         
         <table  border="2" align="center">
                <tr>
                    <th>Sl no</th>
                    <th>Complaint Title</th>
                    <th>Complaint content</th>
                    <th>Date&time</th>
                    <th>User Name</th>
                    <th>Shop Name</th>
                    <th>Complaint Reply</th>
                    <th>Action</th>
                    <th>Verification</th>
                     <%
                    String insqry = "select*from tbl_complaint  w inner join tbl_user l on l.user_id=w.user_id  inner join tbl_shop d on w.shop_id=d.shop_id ";
                    ResultSet rs = con.selectCommand(insqry);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("complaint_title")%></td>
                    <td><%=rs.getString("complaint_content")%></td>
                    <td><%=rs.getString("complaint_date")%></td>
                    <td><%=rs.getString("user_name")%></td>
                    <td><%=rs.getString("shop_name")%></td>
                    <td><%=rs.getString("complaint_reply")%></td>

                    <td><a href="ComplaintVerification.jsp?aid=<%=rs.getString("complaint_id")%>">Accept</a>|<a href="ComplaintVerification.jsp?rid=<%=rs.getString("complaint_id")%>">reject</a></td>
                    <td>
            <%
             if (rs.getInt("complaint_status")==0)//property table ill illa
                 {
                   out.println("pending");
                 }
            else if (rs.getInt("complaint_status")==2)
                 {
                   out.println("Complaint is accepted");
                 }
            else if (rs.getInt("complaint_status")==3)
                 {
                   out.println("Complaint is rejected");
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
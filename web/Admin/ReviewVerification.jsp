<%-- 
    Document   : Userverification
    Created on : 11 Jan, 2024, 2:07:56 PM
    Author     : ananth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
    <jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Review Verification</title>
    </head>
    <body>
         <%
            if (request.getParameter("aid") != null) {
               String up= "update tbl_review set review_vstate='2' where review_id ='"+request.getParameter("aid")+"'"  ;
               con.executeCommand(up);
            }
            
         %>
          <%
            if (request.getParameter("rid") != null) {
               String up1= "update tbl_review set review_vstate='3' where review_id ='"+request.getParameter("rid")+"'"  ;
               con.executeCommand(up1);
            }
            
         %>
         
         <table  border="2" align="center">
                <tr>
                    <th>Sl no</th>
                    <th>Review</th>
                    <th>Rating</th>
                    <th>Date&time</th>
                    <th>User Name</th>
                    <th>Shop Name</th>
                    <th>Action</th>
                    <th>Verification</th>
                     <%
                    String insqry = "select*from tbl_review  w inner join tbl_user l on l.user_id=w.user_id  inner join tbl_shop d on w.shop_id=d.shop_id ";
                    ResultSet rs = con.selectCommand(insqry);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("user_review")%></td>
                    <td><%=rs.getString("user_rating")%></td>
                    <td><%=rs.getString("review_datetime")%></td>
                    <td><%=rs.getString("user_name")%></td>
                    <td><%=rs.getString("shop_name")%></td>
                    <td><a href="ReviewVerification.jsp?aid=<%=rs.getString("review_id")%>">Accept</a>|<a href="ReviewVerification.jsp?rid=<%=rs.getString("review_id")%>">reject</a></td>
                    <td>
            <%
             if (rs.getInt("review_vstate")==0)//property table ill illa
                 {
                   out.println("pending");
                 }
            else if (rs.getInt("review_vstate")==2)
                 {
                   out.println("Review is accepted");
                 }
            else if (rs.getInt("review_vstate")==3)
                 {
                   out.println("Review is rejected");
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
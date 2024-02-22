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
    </head>
    <body>
        <table border="1" align="center">
                <tr>
                    <th>Sl.No</th>
                    <th>Review Date</th>
                    <th>Name</th>
                    <th>User Review</th>
                    <th>Action</th>

                </tr>
                 <%
                    String insqry = "select*from tbl_review  w inner join tbl_user l on l.user_id=w.user_id";
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
                    <td><a href="ReviewReply.jsp?pid=<%=rs.getString("review_id")%>">Reply</a></td>

                </tr>
                <%
                }
              %>
            </table>
                
    </body>
</html>

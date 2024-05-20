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
        <title>Complaint Action</title>
    </head>
    <body>
        <table border="1" align="center">
            <tr>
                <th>Sl.No</th>
                <th>complaint Date</th>
                <th>User Name</th>
                <th>Shop Name</th>
                <th>Complaint Title</th>
                <th>Complaint Content</th>
                <th>Shop Reply</th>
                <th>Action</th>

            </tr>
            <%        if (request.getParameter("btn_save") != null) {

            String upQry = "update tbl_complaint set complaint_reply='" + request.getParameter("txt_reply") + "', complaint_reply_date=curdate(),complaint_status='1' where complaint_id='" + request.getParameter("hid") + "'";
            System.out.println(upQry);
            con.executeCommand(upQry);
            response.sendRedirect("Complaintaction.jsp");
        }


    %>
            <%
                String insqry = "select*from tbl_complaint  w inner join tbl_user l on l.user_id=w.user_id inner join tbl_shop s on s.shop_id=w.shop_id";
                ResultSet rs = con.selectCommand(insqry);
                int i = 0;
                while (rs.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("complaint_date")%></td>
                <td><%=rs.getString("user_name")%></td>
                <td><%=rs.getString("shop_name")%></td>               
                <td><%=rs.getString("complaint_title")%></td>
                <td><%=rs.getString("complaint_content")%></td>
                <td></td>

                <td><a href="Complaintreply.jsp?pid=<%=rs.getString("complaint_id")%>">Reply</a></td>

            </tr>
            <%
                }
            %>
        </table>

    </body>
</html>

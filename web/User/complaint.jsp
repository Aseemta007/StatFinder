<%-- 
    Document   : complaint
    Created on : 4 Jan, 2024, 11:00:43 AM
    Author     : aseem
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint</title>
    </head>
    <body>
    <%
            if(request.getParameter("btn_submit")!=null)
            {
                    String uq = "insert into tbl_complaint set complaint_title = '"+request.getParameter("complaint_title")+"'"
                            + ",complaint_content = '"+request.getParameter("complaint_content")+"',complaint_date =curdate(),"
                            + "user_id = '"+session.getAttribute("uid")+"',shop_id = '"+request.getParameter("shopid")+"'";
                    if(con.executeCommand(uq)){
            %>
            <script>
        alert('Inserted');
        window.location = "complaint.jsp";
    </script>
    <%
    } else {
    %>
    <script>
        alert('Failed');
        window.location = "complaint.jsp";
    </script>
    <%
            }
        }

        if (request.getParameter("del") != null) {
            String id = request.getParameter("del");
            String delQry = "delete from tbl_complaint where complaint_id ='" + id + "'";
            if (con.executeCommand(delQry)) {
    %>
    <script>
        alert('Deleted');
        window.location = "complaint.jsp";
    </script>
    <%
    } else {
    %>
    <script>
        alert('Failed');
        window.location = "complaint.jsp";
    </script>
    <%
            }
        }
    %>
        <form method="post" >
            <table border="1" align="center">
                <tr>
                    <td>Shop</td>
                    <td><select name="shopid">
                            <option value="">----select----</option>
                            <% 
                String selQry = "select * from tbl_shop";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {
            %>
            <option value="<%=rs.getString("shop_id")%>"><%=rs.getString("shop_name")%></option>
            <%
                }
            %>
                        </select>          
                    </td>
                </tr>
                <tr>
                    <td>Complaint Title</td>
                    <td><input type="text" name="complaint_title"</td>
                </tr>
                <tr>
                    <td>Complaint content</td>
                    <td>
                        <textarea name="complaint_content" rows="6" cols="20"></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_submit" value="Register">&nbsp&nbsp<input type="reset" name="btn_reset" value="Reset"</td>
                </tr>
            </table>
        </form>
                        <table border="1" align="center">
            <tr>
                <td>Sl.No</td>
                <td>Date/time</td>
                <td>Complaint title</td>
                <td>Shop Name</td>
                <td>complaint content </td>
                <td>Complaint status</td>
                <td>Complaint reply</td>
                <td>Action </td>
            </tr>
            <% int i = 0;
                String seleQry = "select * from tbl_complaint pc inner join tbl_shop dc on dc.shop_id=pc.shop_id";
                ResultSet res = con.selectCommand(seleQry);
                while (res.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=res.getString("complaint_date")%></td>
                <td><%=res.getString("complaint_title")%></td>
                <td><%=res.getString("shop_name")%></td>
                <td><%=res.getString("complaint_content")%></td>
                <td><%=res.getString("complaint_status")%></td>
                <td><%=res.getString("complaint_reply")%></td>
                <td><a href="complaint.jsp?del=<%=res.getString("complaint_id")%>">Delete</a></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
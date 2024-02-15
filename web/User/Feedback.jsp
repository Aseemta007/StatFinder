<%-- 
    Document   : Feedback
    Created on : 4 Jan, 2024, 11:07:07 AM
    Author     : aseem
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback</title>
    </head>
    <body>
            <%
            if(request.getParameter("btn_submit")!=null)
            {
                    String uq = "insert into tbl_feedback set feedback_content = '"+request.getParameter("feedback_content")+"'"
                            + ",feedback_date =curdate() ,user_id = '"+session.getAttribute("uid")+"'";
                    con.executeCommand(uq);
            }
        if (request.getParameter("del") != null) {
            String id = request.getParameter("del");
            String delQry = "delete from tbl_feedback where feedback_id ='" + id + "'";
            con.executeCommand(delQry);
        }
    %>
      <form method="post" >
            <table border="1" align="center">
                
                <tr>
                    <td>Feedback</td>
                    <td>
                        <textarea name="feedback_content" rows="6" cols="20"></textarea>
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
                <td>Feedback </td>
                <td>Action </td>
            </tr>
            <% int i = 0;
                String seleQry = "select * from tbl_feedback";
                ResultSet res = con.selectCommand(seleQry);
                while (res.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=res.getString("feedback_date")%></td>
                <td><%=res.getString("feedback_content")%></td>
                <td><a href="Feedback.jsp?del=<%=res.getString("feedback_id")%>">Delete</a></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>

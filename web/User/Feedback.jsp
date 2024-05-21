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
    <link rel="stylesheet" href="../Assets/Templates/Main/css/footstyle2.css">
    <link rel="stylesheet" href="../Assets/Templates/Main/css/review.css">
    </head>
    <%@include file="Userhead.jsp" %>
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
      <div class="formbold-main-wrapper">
  <div class="formbold-form-wrapper">
    <form method="post" >
      <div class="formbold-form-title">
        <h2 class="">Feedback</h2>
      </div>
        <div class="formbold-mb-3">
        <div>
          <label for="feedback_content" class="formbold-form-label">
            Feedback
          </label>
          <textarea 
            name="feedback_content" 
            title="Feedback Content Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" 
            pattern="^[A-Z]+[a-zA-Z ]*$"  
            rows="6" cols="20"
            type="text"
            class="formbold-form-input"
            required
          ></textarea>
        </div>
      </div>
<input type="submit" class="formbold-btn" name="btn_submit" value="Submit">&nbsp&nbsp<input type="reset" class="formbold-btn" name="btn_reset" value="Reset">
    </form>
  </div>
</div>
       <table border="1" align="center">
            <tr>
                <td>Sl.No</td>
                <td>Date/time</td>
                <td>Feedback </td>
                <td>Action </td>
            </tr>
            <% int i = 0;
                String seleQry = "select * from tbl_feedback where user_id='"+session.getAttribute("uid")+"'";
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
<%@include file="../Guest/Foot.jsp" %>

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
        <link rel="stylesheet" href="../Assets/Templates/Main/css/footstyle2.css">
    <link rel="stylesheet" href="../Assets/Templates/Main/css/review.css">
    </head>
    <%@include file="Userhead.jsp" %>
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
      <div class="formbold-main-wrapper">
  <div class="formbold-form-wrapper">
    <form method="post" >
      <div class="formbold-form-title">
        <h2 class="">Complaint</h2>
      </div>
            <div class="formbold-input-flex">
            <div>
        <label for="shop" class="formbold-form-label">
            Shop
            </label>
  <select name="shopid" class="formbold-form-input" >
   <option>--select--</option>
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
            </div>
            </div>
                        
        <div class="formbold-mb-3">
        <div>
          <label for="complaint_title" class="formbold-form-label">
            Complaint Title
          </label>
          <input  
            name="complaint_title"
            title="Complaint Title Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" 
            pattern="^[A-Z]+[a-zA-Z ]*$"  
            type="text"
            class="formbold-form-input"
            required
          />
        </div>
      </div>
      
       <div class="formbold-mb-3">
        <div>
          <label for="complaint_content" class="formbold-form-label">
            Shop review
          </label>
          <textarea 
            name="complaint_content" 
            title="Complaint Content Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" 
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
                        <div class="content-wrapper">
                        <table border="1" align="center">
            <tr>
                <td>Sl.No</td>
                <td>Date/time</td>
                <td>Complaint title</td>
                <td>Shop Name</td>
                <td>complaint content </td>
                <td>Complaint reply</td>
                <td>Admin's Reply</td>
                <td>Action </td>
            </tr>
            <% int i = 0;
                String seleQry = "select * from tbl_complaint pc inner join tbl_shop dc on dc.shop_id=pc.shop_id where user_id='"+session.getAttribute("uid")+"'";
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
                <td><%=res.getString("complaint_reply") != null ? res.getString("complaint_reply") : "&nbsp;" %></td>
                <td><%=res.getString("complaint_reply_admin") != null ? res.getString("complaint_reply_admin") : "&nbsp;" %></td>  
                <td><a href="complaint.jsp?del=<%=res.getString("complaint_id")%>">Delete</a></td>
            </tr>
            <%
                }
            %>
        </table>
                        </div>
    </body>
</html>
<%@include file="../Guest/Foot.jsp" %>
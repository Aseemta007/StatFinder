<%-- 
    Document   : review
    Created on : Jan 23, 2024, 11:23:03 AM
    Author     : ANANTHU
--%>
<%-- 
    Document   : Review
    Created on : 4 Jan, 2024, 11:03:32 AM
    Author     : aseem
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Review</title>
    </head>
    <body>
    <%
            if(request.getParameter("btn_submit")!=null)
            {
                    String uq = "insert into tbl_review set user_review = '"+request.getParameter("shop_review")+"'"
                            + ",user_rating = '"+request.getParameter("rating")+"',review_datetime =curdate() ,user_id = '"+session.getAttribute("uid")+"',shop_id = '"+request.getParameter("shopid")+"'";
                    con.executeCommand(uq);
            }
        if (request.getParameter("del") != null) {
            String id = request.getParameter("del");
            String delQry = "delete from tbl_review where review_id ='" + id + "'";
            con.executeCommand(delQry);
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
                    <td>Shop review</td>
                    <td>
                        <textarea name="shop_review" rows="6" cols="20"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>Shop rating</td>
                    <td>
  <label for="rating-1">
    <input id="rating-1" type="radio" name="rating" value="1">
    ★
  </label>
  <label for="rating-2">
    <input id="rating-2" type="radio" name="rating" value="2">
    ★
  </label>
  <label for="rating-3">
    <input id="rating-3" type="radio" name="rating" value="3">
    ★
  </label>
  <label for="rating-4">
    <input id="rating-4" type="radio" name="rating" value="4">
    ★
  </label>
  <label for="rating-5">
    <input id="rating-5" type="radio" name="rating" value="5">
    ★
  </label>
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
                <td>Shop Name</td>
                <td>User rating </td>
                <td>User Review </td>
                <td>Action </td>
            </tr>
            <% int i = 0;
                String seleQry = "select * from tbl_review pc inner join tbl_shop dc on dc.shop_id=pc.shop_id";
                ResultSet res = con.selectCommand(seleQry);
                while (res.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=res.getString("review_datetime")%></td>
                <td><%=res.getString("shop_name")%></td>
                <td><%=res.getString("user_rating")%></td>
                <td><%=res.getString("user_review")%></td>
                <td><a href="review.jsp?del=<%=res.getString("review_id")%>">Delete</a></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>

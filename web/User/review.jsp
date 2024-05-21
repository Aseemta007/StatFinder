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
    <link rel="stylesheet" href="../Assets/Templates/Main/css/footstyle2.css">
    <link rel="stylesheet" href="../Assets/Templates/Main/css/review.css">
    </head>
    <%@include file="Userhead.jsp" %>
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
      <div class="formbold-main-wrapper">
  <div class="formbold-form-wrapper">
    <form method="post" >
      <div class="formbold-form-title">
        <h2 class="">Review</h2>
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
          <label for="shop_review" class="formbold-form-label">
            Shop review
          </label>
          <textarea 
            name="shop_review" 
            title="Review Details Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" 
            pattern="^[A-Z]+[a-zA-Z ]*$"  
            rows="6" cols="20"
            type="text"
            class="formbold-form-input"
            required
          ></textarea>
        </div>
      </div>
                        
    
                 <label for="rating" class="formbold-form-label">
            Shop Rating
          </label>
<div class="rating">
  <input type="radio" id="star1" name="rating" value="1" />
  <label for="star1" title="1 star">★</label>
  <input type="radio" id="star2" name="rating" value="2" />
  <label for="star2" title="2 stars">★</label>
  <input type="radio" id="star3" name="rating" value="3" />
  <label for="star3" title="3 stars">★</label>
  <input type="radio" id="star4" name="rating" value="4" />
  <label for="star4" title="4 stars">★</label>
  <input type="radio" id="star5" name="rating" value="5" />
  <label for="star5" title="5 stars">★</label>
</div>
                    <input type="submit" class="formbold-btn" name="btn_submit" value="Submit">&nbsp&nbsp<input type="reset" class="formbold-btn" name="btn_reset" value="Reset">
    </form>
  </div>
</div>
                        <h3 align="center">Replied Complaints</h3><br>
                        
                                    <!-- table-responsive -->
                                    <table>
                                        <thead>
                                            <tr >
                                                <td align="center" scope="col">Sl.No</td>
                                                <td align="center" scope="col">Shop Name</td>
                                                <td align="center" scope="col">Your Rating</td>
                                                <td align="center" scope="col">Review</td>
                                       
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                                                int j = 0;
                                                String selQry1 = "select * from tbl_review c inner join tbl_shop co on co.shop_id=c.shop_id where user_id='"+session.getAttribute("uid")+"'";
                                                ResultSet rs1 = con.selectCommand(selQry1);
                                                while (rs1.next()) {

                                                    j++;

                                            %>
                                            <tr>
                                                <td align="center"><%=j%></td>
                                                <td align="center"><%=rs1.getString("shop_name")%></td>
                                                <td align="center"><%=rs1.getString("user_rating")%></td>
                                                <td align="center"><%=rs1.getString("user_review")%></td>
                                                <td><a href="review.jsp?del=<%=rs1.getString("review_id")%>">Delete</a></td>
                                            </tr>
                                            <%                      }


                                            %>

                                        </tbody>
                                    </table>
    </body>
</html>
<%@include file="../Guest/Foot.jsp" %>
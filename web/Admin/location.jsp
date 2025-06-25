`<%-- 
    Document   : location
    Created on : 4 Jan, 2024, 10:02:52 AM
    Author     : aseem
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Location</title>
    <link rel="stylesheet" href="../Assets/Templates/Main/css/footstyle2.css">
            <link rel="stylesheet" href="../Assets/Templates/Main/css/review.css">
        </head>
        <%@include file="Head.jsp" %>
    <%
            if(request.getParameter("btn_save")!=null)
            {
                if(request.getParameter("txtid")=="")
                {
                
                String insqry="insert into tbl_location(place_id,location_name)values('"+request.getParameter("place")+"','"+request.getParameter("location")+"')";
                con.executeCommand(insqry);
                }
                else
                {
                    String upqry="update tbl_location set place_id='"+request.getParameter("place")+"',location_name='"+request.getParameter("location")+"' where location_id='"+request.getParameter("txtid")+"'";
                    con.executeCommand(upqry);
                    response.sendRedirect("location.jsp");
                }
                
                
            }
             if(request.getParameter("did")!=null)
            {
                String delqry="delete from tbl_location where location_id='"+request.getParameter("did")+"'";
                con.executeCommand(delqry);
                response.sendRedirect("location.jsp");
            }
             String editid="";
             String editloc="";
             if(request.getParameter("eid")!=null)
             {
                 String selqry1="select * from tbl_location where location_id ='"+request.getParameter("eid")+"'";
                 ResultSet rs1=con.selectCommand(selqry1);
                 rs1.next();
                 editid=rs1.getString("location_id");
                 editloc=rs1.getString("location_name");
                     
             }
             
        %>
<div class="formbold-main-wrapper">
  <div class="formbold-form-wrapper">
    <form method="post" >
      <div class="formbold-form-title">
        <h2 class="">Location</h2>
      </div>
         <div class="formbold-input-flex">
            <div>
        <label for="place" class="formbold-form-label">
            Place
            </label>
  <select name="place" class="formbold-form-input" >
   <option>--select--</option>
                            <%
                                String selQry = "select * from tbl_place";
                                ResultSet rs = con.selectCommand(selQry);
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("place_id")%>"><%=rs.getString("place_name")%></option>
                            <%
                                }
                            %>
                        </select> 
            </div>
            </div>
            
        <div class="formbold-mb-3">
        <div>
          <label for="location" class="formbold-form-label">
            Location
          </label>
          <input 
            name="location" 
            placeholder="Enter Location name" 
            title="Location name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" 
            pattern="^[A-Z]+[a-zA-Z ]*$" 
            type="text"
            value="<%=editloc%>"
            class="formbold-form-input"
            required
          /><input type="hidden" name="txtid" value="<%=editid%>">
        </div>
      </div>
                    <input type="submit" class="formbold-btn" name="btn_save" value="Save">&nbsp&nbsp<input type="reset" class="formbold-btn" name="Cancel" value="Cancel">
    </form>
  </div>
</div>
                        <h3 align="center">Locations</h3><br>
                        <div class="content-wrapper">
                                    <!-- table-responsive -->
                                    <table>
                                        <thead>
                                            <tr >
                                                <td align="center" scope="col">Sl.No</td>
                                                <td align="center" scope="col">Place</td>
                                                <td align="center" scope="col">Location</td>
                                                <td align="center" scope="col">Action</td>
                                       
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% int i = 0;
                String seleQry = "select * from tbl_location pc inner join tbl_place dc on dc.place_id=pc.place_id";
                ResultSet res = con.selectCommand(seleQry);
                while (res.next()) {
                    i++;
            %>
                                            <tr>
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=res.getString("location_name")%></td>
                                                <td align="center"><%=res.getString("place_name")%></td>
                                                <td align="center"><a href="location.jsp?did=<%=res.getString("location_id")%>">delete</a>|<a href="location.jsp?eid=<%=res.getString("location_id")%>">Edit</a></td>
                                            </tr>
                                            <%                      }


                                            %>

                                        </tbody>
                                    </table>
                        </div>
    </body>
</html>
<%@include file="../Guest/Foot.jsp" %>



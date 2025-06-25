<%-- 
    Document   : Place
    Created on : 7 Dec, 2023, 2:42:25 PM
    Author     : aseem
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Place</title>
    <link rel="stylesheet" href="../Assets/Templates/Main/css/footstyle2.css">
            <link rel="stylesheet" href="../Assets/Templates/Main/css/review.css">
        </head>
        <%@include file="Head.jsp" %>
    <%
            if(request.getParameter("btn_save")!=null)
            {
                if(request.getParameter("txtid")=="")
                {
                
                String insqry="insert into tbl_place(district_id,place_name)values('"+request.getParameter("district")+"','"+request.getParameter("place")+"')";
                con.executeCommand(insqry);
                }
                else
                {
                    String upqry="update tbl_place set district_id='"+request.getParameter("district")+"',place_name='"+request.getParameter("place")+"' where place_id='"+request.getParameter("txtid")+"'";
                    con.executeCommand(upqry);
                    response.sendRedirect("place.jsp");
                }
                
                
            }
             if(request.getParameter("did")!=null)
            {
                String delqry="delete from tbl_place where place_id='"+request.getParameter("did")+"'";
                con.executeCommand(delqry);
                response.sendRedirect("place.jsp");
            }
             String editid="";
             String editpla="";
             if(request.getParameter("eid")!=null)
             {
                 String selqry1="select * from tbl_place where place_id ='"+request.getParameter("eid")+"'";
                 ResultSet rs1=con.selectCommand(selqry1);
                 rs1.next();
                 editid=rs1.getString("place_id");
                 editpla=rs1.getString("place_name");
                     
             }
             
        %>
    
<div class="formbold-main-wrapper">
  <div class="formbold-form-wrapper">
    <form method="post" >
      <div class="formbold-form-title">
        <h2 class="">Place</h2>
      </div>
         <div class="formbold-input-flex">
            <div>
        <label for="district" class="formbold-form-label">
            District
            </label>
  <select name="district" class="formbold-form-input" >
   <option>--select--</option>
                            <% 
                String selQry = "select * from tbl_district";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {
            %>
            <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
            <%
                }
            %>
                        </select> 
            </div>
            </div>
            
        <div class="formbold-mb-3">
        <div>
          <label for="place" class="formbold-form-label">
            Place
          </label>
          <input 
            name="place" 
            placeholder="Enter Place name" 
            title="Place name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" 
            pattern="^[A-Z]+[a-zA-Z ]*$" 
            type="text"
            value="<%=editpla%>"
            class="formbold-form-input"
            required
          /><input type="hidden" name="txtid" value="<%=editid%>">
        </div>
      </div>
                    <input type="submit" class="formbold-btn" name="btn_save" value="Save">&nbsp&nbsp<input type="reset" class="formbold-btn" name="Cancel" value="Cancel">
    </form>
  </div>
</div>
                        <h3 align="center">Places</h3><br>
                        <div class="content-wrapper">
                                    <!-- table-responsive -->
                                    <table>
                                        <thead>
                                            <tr >
                                                <td align="center" scope="col">Sl.No</td>
                                                <td align="center" scope="col">District</td>
                                                <td align="center" scope="col">Place</td>
                                                <td align="center" scope="col">Action</td>
                                       
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% int i = 0;
                String seleQry = "select * from tbl_place pc inner join tbl_district dc on dc.district_id=pc.district_id";
                ResultSet res = con.selectCommand(seleQry);
                while (res.next()) {
                    i++;
            %>
                                            <tr>
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=res.getString("place_name")%></td>
                                                <td align="center"><%=res.getString("district_name")%></td>
                                                <td align="center"><a href="place.jsp?did=<%=res.getString("place_id")%>">delete</a>|<a href="place.jsp?eid=<%=res.getString("place_id")%>">Edit</a></td>
                                            </tr>
                                            <%                      }


                                            %>

                                        </tbody>
                                    </table>
                        </div>
    </body>
</html>
<%@include file="../Guest/Foot.jsp" %>


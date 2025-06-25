<%-- 
    Document   : district2
    Created on : 12 Jan, 2024, 3:12:14 PM
    Author     : aseem
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
   <%@page import="java.sql.ResultSet" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>District</title>
    <link rel="stylesheet" href="../Assets/Templates/Main/css/footstyle2.css">
            <link rel="stylesheet" href="../Assets/Templates/Main/css/review.css">
        </head>
        <%@include file="Head.jsp" %>
    <body>
        <%
            if(request.getParameter("Save")!=null)
            {
                if(request.getParameter("txtid")=="")
                {
                
                String insqry="insert into tbl_district(district_name)values('"+request.getParameter("txtloc")+"')";
                con.executeCommand(insqry);
                }
                else
                {
                    String upqry="update tbl_district set district_name='"+request.getParameter("txtloc")+"' where district_id='"+request.getParameter("txtid")+"'";
                    con.executeCommand(upqry);
                    response.sendRedirect("district.jsp");
                }
                
                
            }
             if(request.getParameter("did")!=null)
            {
                String delqry="delete from tbl_district where district_id='"+request.getParameter("did")+"'";
                con.executeCommand(delqry);
                response.sendRedirect("district.jsp");
            }
             String editid="";
             String editname="";
             if(request.getParameter("eid")!=null)
             {
                 String selqry1="select * from tbl_district where district_id ='"+request.getParameter("eid")+"'";
                 ResultSet rs1=con.selectCommand(selqry1);
                 rs1.next();
                 editid=rs1.getString("district_id");
                 editname=rs1.getString("district_name");
                     
             }
             
        %>
<div class="formbold-main-wrapper">
  <div class="formbold-form-wrapper">
    <form method="post" >
      <div class="formbold-form-title">
        <h2 class="">District</h2>
      </div>
            
        <div class="formbold-mb-3">
        <div>
          <label for="txtloc" class="formbold-form-label">
            District
          </label>
          <input 
            name="txtloc" 
            placeholder="Enter district name" 
            title="District name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" 
            pattern="^[A-Z]+[a-zA-Z ]*$" 
            type="text"
            value="<%=editname%>"
            class="formbold-form-input"
            required
          /><input type="hidden" name="txtid" value="<%=editid%>">
        </div>
      </div>
                    <input type="submit" class="formbold-btn" name="Save" value="Save">&nbsp&nbsp<input type="reset" class="formbold-btn" name="Cancel" value="Cancel">
    </form>
  </div>
</div>
                        <h3 align="center">Districts</h3><br>
                        <div class="content-wrapper">
                                    <!-- table-responsive -->
                                    <table>
                                        <thead>
                                            <tr >
                                                <td align="center" scope="col">Sl.No</td>
                                                <td align="center" scope="col">District</td>
                                                <td align="center" scope="col">Action</td>
                                       
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
            String selqry="select * from tbl_district";
            ResultSet rs=con.selectCommand(selqry);
            int i=0;
            while(rs.next())
            {
                i++;
                %>
                                            <tr>
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=rs.getString("district_name")%></td>
                                                <td align="center"><a href="district.jsp?did=<%=rs.getString("district_id")%>">delete</a>|<a href="district.jsp?eid=<%=rs.getString("district_id")%>">Edit</a></td>
                                            </tr>
                                            <%                      }


                                            %>

                                        </tbody>
                                    </table>
                        </div>
    </body>
</html>
<%@include file="../Guest/Foot.jsp" %>
<%-- 
    Document   : categoryjsp
    Created on : 7 Dec, 2023, 2:35:29 PM
    Author     : aseem
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category</title>
    <link rel="stylesheet" href="../Assets/Templates/Main/css/footstyle2.css">
            <link rel="stylesheet" href="../Assets/Templates/Main/css/review.css">
        </head>
        <%@include file="Head.jsp" %>
     <%
            if(request.getParameter("btn_save")!=null)
            {
                if(request.getParameter("txtid")=="")
                {
                
                String insqry="insert into tbl_category(category_name)values('"+request.getParameter("category")+"')";
                con.executeCommand(insqry);
                }
                else
                {
                    String upqry="update tbl_category set category_name='"+request.getParameter("category")+"' where category_id='"+request.getParameter("txtid")+"'";
                    con.executeCommand(upqry);
                    response.sendRedirect("category.jsp");
                }
                
                
            }
             if(request.getParameter("did")!=null)
            {
                String delqry="delete from tbl_category where category_id='"+request.getParameter("did")+"'";
                con.executeCommand(delqry);
                response.sendRedirect("category.jsp");
            }
             String editid="";
             String editcat="";
             if(request.getParameter("eid")!=null)
             {
                 String selqry1="select * from tbl_category where category_id ='"+request.getParameter("eid")+"'";
                 ResultSet rs1=con.selectCommand(selqry1);
                 rs1.next();
                 editid=rs1.getString("category_id");
                 editcat=rs1.getString("category_name");
                     
             }
             
        %>
<div class="formbold-main-wrapper">
  <div class="formbold-form-wrapper">
    <form method="post" >
      <div class="formbold-form-title">
        <h2 class="">Category</h2>
      </div>
            
        <div class="formbold-mb-3">
        <div>
          <label for="category" class="formbold-form-label">
            Category
          </label>
          <input 
            name="category" 
            placeholder="Enter Category name" 
            title="Category name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" 
            pattern="^[A-Z]+[a-zA-Z ]*$" 
            type="text"
            value="<%=editcat%>"
            class="formbold-form-input"
            required
          /><input type="hidden" name="txtid" value="<%=editid%>">
        </div>
      </div>
                    <input type="submit" class="formbold-btn" name="btn_save" value="Save">&nbsp&nbsp<input type="reset" class="formbold-btn" name="Cancel" value="Cancel">
    </form>
  </div>
</div>
                        <h3 align="center">Categories</h3><br>
                        <div class="content-wrapper">
                                    <!-- table-responsive -->
                                    <table>
                                        <thead>
                                            <tr >
                                                <td align="center" scope="col">Sl.No</td>
                                                <td align="center" scope="col">Category</td>
                                                <td align="center" scope="col">Action</td>
                                       
                                            </tr>
                                        </thead>
                                        <tbody>
                                           <% int i = 0;
                String selQry = "select * from tbl_category";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {
                    i++;
            %>
                                            <tr>
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=rs.getString("category_name")%></td>
                                                <td align="center"><a href="category.jsp?did=<%=rs.getString("category_id")%>">delete</a>|<a href="category.jsp?eid=<%=rs.getString("category_id")%>">Edit</a></td>
                                            </tr>
                                            <%                      }


                                            %>

                                        </tbody>
                                    </table>
                        </div>
    </body>
</html>
<%@include file="../Guest/Foot.jsp" %>

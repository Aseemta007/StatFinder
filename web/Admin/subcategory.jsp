<%-- 
    Document   : subcategoryjsp
    Created on : 10 Dec, 2023, 11:09:50 AM
    Author     : aseem
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SUB CATEGORY</title>
    <link rel="stylesheet" href="../Assets/Templates/Main/css/footstyle2.css">
            <link rel="stylesheet" href="../Assets/Templates/Main/css/review.css">
        </head>
        <%@include file="../Guest/Head.jsp" %>
    <%
            if(request.getParameter("btn_save")!=null)
            {
                if(request.getParameter("txtid")=="")
                {
                
                String insqry="insert into tbl_subcategory(category_id,subcategory_name)values('"+request.getParameter("category")+"','"+request.getParameter("subcategory")+"')";
                con.executeCommand(insqry);
                }
                else
                {
                    String upqry="update tbl_subcategory set category_id='"+request.getParameter("category")+"',subcategory_name='"+request.getParameter("subcategory")+"' where subcategory_id='"+request.getParameter("txtid")+"'";
                    con.executeCommand(upqry);
                    response.sendRedirect("subcategory.jsp");
                }
                
                
            }
             if(request.getParameter("did")!=null)
            {
                String delqry="delete from tbl_subcategory where subcategory_id='"+request.getParameter("did")+"'";
                con.executeCommand(delqry);
                response.sendRedirect("subcategory.jsp");
            }
             String editid="";
             String editsub="";
             if(request.getParameter("eid")!=null)
             {
                 String selqry1="select * from tbl_subcategory where subcategory_id ='"+request.getParameter("eid")+"'";
                 ResultSet rs1=con.selectCommand(selqry1);
                 rs1.next();
                 editid=rs1.getString("subcategory_id");
                 editsub=rs1.getString("subcategory_name");
                     
             }
             
        %>
<div class="formbold-main-wrapper">
  <div class="formbold-form-wrapper">
    <form method="post" >
      <div class="formbold-form-title">
        <h2 class="">Sub-category</h2>
      </div>
         <div class="formbold-input-flex">
            <div>
        <label for="category" class="formbold-form-label">
            Category
            </label>
  <select name="category" class="formbold-form-input" >
   <option>--select--</option>
                           <% 
                String selQry = "select * from tbl_category";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {
            %>
            <option value="<%=rs.getString("category_id")%>"><%=rs.getString("category_name")%></option>
            <%
                }
            %>
                        </select> 
            </div>
            </div>
            
        <div class="formbold-mb-3">
        <div>
          <label for="subcategory" class="formbold-form-label">
            Sub-category
          </label>
          <input 
            name="subcategory" 
            placeholder="Enter Sub-category name" 
            title="Sub-category name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" 
            pattern="^[A-Z]+[a-zA-Z ]*$" 
            type="text"
            value="<%=editsub%>"
            class="formbold-form-input"
            required
          /><input type="hidden" name="txtid" value="<%=editid%>">
        </div>
      </div>
                    <input type="submit" class="formbold-btn" name="btn_save" value="Save">&nbsp&nbsp<input type="reset" class="formbold-btn" name="Cancel" value="Cancel">
    </form>
  </div>
</div>
                        <h3 align="center">Sub-categories</h3><br>
                        
                                    <!-- table-responsive -->
                                    <table>
                                        <thead>
                                            <tr >
                                                <td align="center" scope="col">Sl.No</td>
                                                <td align="center" scope="col">Sub-category</td>
                                                <td align="center" scope="col">Category</td>
                                                <td align="center" scope="col">Action</td>
                                       
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% int i = 0;
                String seleQry = "select * from tbl_subcategory sc inner join tbl_category c on c.category_id=sc.category_id";
                ResultSet res = con.selectCommand(seleQry);
                while (res.next()) {
                    i++;
            %>
                                            <tr>
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=res.getString("subcategory_name")%></td>
                                                <td align="center"><%=res.getString("category_name")%></td>
                                                <td align="center"><a href="subcategory.jsp?did=<%=res.getString("subcategory_id")%>">delete</a>|<a href="subcategory.jsp?eid=<%=res.getString("subcategory_id")%>">Edit</a></td>
                                            </tr>
                                            <%                      }


                                            %>

                                        </tbody>
                                    </table>
    </body>
</html>
<%@include file="../Guest/Foot.jsp" %>

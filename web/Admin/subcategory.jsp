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
    </head>
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
    <body>
        <form method="post">
            <table align="center" border="1">
                <tr>
                    <td>CATEGORY</td>
                    <td><select name="category"> 
                         <option value="null">----select----</option>
                            <% 
                String selQry = "select * from tbl_category";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {
            %>
            <option value="<%=rs.getString("category_id")%>"><%=rs.getString("category_name")%></option>
            <%
                }
            %>
                    </td>
                </tr>
                <tr>
                    <td>SUB CATEGORY</td>
                    <td><input required type="text" name="subcategory" value="<%=editsub%>" title="Category Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$"/></td>
                                    <input type="hidden" name="txtid" value="<%=editid%>">
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_save" value="SAVE">&nbsp&nbsp<input type="reset" name="btn_reset" value="RESET"</td>
                </tr>
            </table>
                
        </form>
                    <table border="1" align="center">
            <tr>
                <td>Sl.No</td>
                <td>Subcategory</td>
                <td>Category</td>
                <td>Action  </td>
            </tr>
            <% int i = 0;
                String seleQry = "select * from tbl_subcategory sc inner join tbl_category c on c.category_id=sc.category_id";
                ResultSet res = con.selectCommand(seleQry);
                while (res.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=res.getString("subcategory_name")%></td>
                <td><%=res.getString("category_name")%></td>
                <td><a href="subcategory.jsp?did=<%=res.getString("subcategory_id")%>">delete</a>|<a href="subcategory.jsp?eid=<%=res.getString("subcategory_id")%>">Edit</a></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>

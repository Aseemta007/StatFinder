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
    </head>
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
    <body>
        <form method="post">
            <table align="center" border="1">
                <tr>
                    <td align="center">CATEGORY</td>
                    <td><input required type="text" name="category" value="<%=editcat%>" title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$"/></td>
                        <input type="hidden" name="txtid" value="<%=editid%>">
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_save" value="SAVE"></td>
                </tr>
            </table>
        </form>
        <table border="1" align="center">
            <tr>
                <td>Sl.No</td>
                <td>Category</td>
                <td>Action  </td>
            </tr>
            <% int i = 0;
                String selQry = "select * from tbl_category";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("category_name")%></td>
                <td><a href="category.jsp?did=<%=rs.getString("category_id")%>">delete</a>|<a href="category.jsp?eid=<%=rs.getString("category_id")%>">Edit</a></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>

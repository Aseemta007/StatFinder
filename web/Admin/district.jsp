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
        <title>District 2</title>
    </head>
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
        <form method="post">
        <table border="3" align="center">
            <tr>
                <td>
                   District
                </td>
                <td><input type="text" name="txtloc" placeholder="Enter district name" value="<%=editname%>" title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$" required>
                        <input type="hidden" name="txtid" value="<%=editid%>">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="Save" value="Save">
                    <input type="reset" name="cancel" value="cancel">
                </td>
            </tr>
        </table>
                </form>
            <table border="1" align="center">
                <tr>
                    <th>Sl.No</th>
                    <th>Location</th>
                    <th>Action</th>
                </tr>
                <%
            String selqry="select * from tbl_district";
            ResultSet rs=con.selectCommand(selqry);
            int i=0;
            while(rs.next())
            {
                i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("district_name")%></td>
                    <td><a href="district.jsp?did=<%=rs.getString("district_id")%>">delete</a>|<a href="district.jsp?eid=<%=rs.getString("district_id")%>">Edit</a></td>
                </tr>
                <%
            }
                %>
            </table>
            
    </body>
</html>
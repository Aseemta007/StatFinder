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
    </head>
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
    <body>
        <form method="post">
            <table align="center" border="1">
                <tr>
                    <td>DISTRICT</td>
                    <td><select name="district">
                            <option value="">----select----</option>
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
                           
                    </td>
                </tr>
                <tr>
                    <td align="center">PLACE</td>
                    <td><input required type="text" name="place" value="<%=editpla%>" title="Place Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$"/></td>
                                    <input type="hidden" name="txtid" value="<%=editid%>">
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_save" value="SAVE">&nbsp&nbsp<input type="reset" name="btn_rest" value="RESET"></td>
                </tr>

            </table>
        </form>
        <table border="1" align="center">
            <tr>
                <td>Sl.No</td>
                <td>Place</td>
                <td>District</td>
                <td>Action  </td>
            </tr>
            <% int i = 0;
                String seleQry = "select * from tbl_place pc inner join tbl_district dc on dc.district_id=pc.district_id";
                ResultSet res = con.selectCommand(seleQry);
                while (res.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=res.getString("place_name")%></td>
                <td><%=res.getString("district_name")%></td>
               <td><a href="place.jsp?did=<%=res.getString("place_id")%>">delete</a>|<a href="place.jsp?eid=<%=res.getString("place_id")%>">Edit</a></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
    </body>
</html>

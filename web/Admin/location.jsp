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
        <title>lOCATION</title>
    </head>
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
    <body>
        <form method="post">
            <table align="center" border="1">
                <tr>
                    <td>PLACE</td>
                    <td><select name="place">
                            <option value="null">----select----</option>
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
                    </td>
                </tr>
                <tr>
                    <td align="center">LOCATION</td>
                    <td><input required type="text" name="location" value="<%=editloc%>" title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$"/></td>
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
                <td>location</td>
                <td>place</td>
                <td>Action  </td>
            </tr>
            <% int i = 0;
                String seleQry = "select * from tbl_location pc inner join tbl_place dc on dc.place_id=pc.place_id";
                ResultSet res = con.selectCommand(seleQry);
                while (res.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=res.getString("location_name")%></td>
                <td><%=res.getString("place_name")%></td>
                <td><a href="location.jsp?did=<%=res.getString("location_id")%>">delete</a>|<a href="location.jsp?eid=<%=res.getString("location_id")%>">Edit</a></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>


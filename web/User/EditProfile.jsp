<%-- 
    Document   : EditProfile
    Created on : Jan 18, 2024, 12:29:10 PM
    Author     : ANANTHU
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page  import = "java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
    </head>
    <body>
        <%
            if(request.getParameter("txtupdate")!=null)
            {
                    String uq = "update tbl_user set user_name = '"+request.getParameter("txtname")+"',user_contact = '"+request.getParameter("txtcontact")+"',user_email = '"+request.getParameter("txtemail")+"',user_address = '"+request.getParameter("txtaddress")+"'where user_id = '"+session.getAttribute("uid")+"'";
                    con.executeCommand(uq);
                    response.sendRedirect("EditProfile.jsp");    
            } 
            String editname="";
            String editcontact="";
            String editemail="";
            String editaddress="";
            String sq2 = "select*from tbl_user where user_id ='"+session.getAttribute("uid")+"'";
            ResultSet rs2 = con.selectCommand(sq2);
            rs2.next();
            editname = rs2.getString("user_name");
            editcontact = rs2.getString("user_contact");
            editemail = rs2.getString("user_email");
            editaddress = rs2.getString("user_address");
                        
        %>
        <form method="post">
            <table border="3" align="center">
                <tr>
                    <td>Name</td>
                    <td>
                        <input type="text" value="<%=editname%>" name="txtname" placeholder="Enter name" title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$" required>
                    </td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td>
                        <input type="text" value="<%=editcontact%>" name="txtcontact" placeholder="Enter Contact No" title="Phone number with 7-9 and remaing 9 digit with 0-9" pattern="[7-9]{1}[0-9]{9}" required>
                    </td>
                </tr>    
                <tr>
                    <td>Email</td>
                    <td>
                        <input type="email" value="<%=editemail%>" name="txtemail" placeholder="Enter Email-Id" required>
                    </td>
                </tr>   
                <tr>
                    <td>Address</td>
                    <td>
                        <textarea name="txtaddress" placeholder="Enter Address" required><%=editaddress%></textarea>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <input type="submit" name="txtupdate" value="Update">
                        <input type="reset" name="txtreset" value="Cancel">
                    </td>
                </tr>   
            </table>
        </form>   
    </body>
</html>
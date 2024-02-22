<%-- 
    Document   : userrgnjsp
    Created on : 10 Dec, 2023, 11:25:37 AM
    Author     : aseem
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@page import="java.sql.ResultSet"%>
    <jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>USER REGISTRATION</title>
        </head>
        <body>
            <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages1/UserUploadAction.jsp">
                  <table border="1" align="center">
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="username" placeholder="Enter Name" title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$" required> </td>
                    </tr>

                    <tr>
                        <td>Contact</td>
                        <td><input type="text" name="contact" placeholder="Enter Contact No" title="Phone number with 7-9 and remaing 9 digit with 0-9" pattern="[7-9]{1}[0-9]{9}" required> </td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="email" name="email" placeholder="Enter Email-Id" required></td>
                    </tr>
                    <tr>
                        <td>Gender</td>
                        <td>
                            Male<input type="radio" name="txtgender" value="Male" required>
                            Female<input type="radio" name="txtgender" value="Female">
                            Others<input type="radio" name="txtgender" value="Others">
                        </td>
                    </tr>
                    <tr>
                        <td>Date Of Birth</td>
                        <td><input type="text" name="dob"</td>
                    </tr>
                    <tr>
                        <td>District</td>
                        <td><select name="rgdist" onchange = "getDist(this.value)"> <!--Here onchange triggers the function getDist()-->
                                <option>--select District--</option>
                            <%
                                String sel = "select*from tbl_district";  /*Here data from table location is fecthed*/

                                ResultSet rs = con.selectCommand(sel); /*Here there select query is exectued into ResultSet array*/

                                while (rs.next()) /*Using while loop we iterate every values in the array and pass the value into Drop down list*/ {
                            %>
                            <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option> <!--Values from -->
                            <%
                                }
                            %>
                        </select>


                    </td>
                </tr>
                <tr>
                    <td>Place</td>
                    <td><select name="place" id="selplace" onchange = "getPlace(this.value)"> <!--Here onchange triggers the function getDist()-->
                            <option>--select Place--</option>
                            <%
                                String sel2 = "select*from tbl_place";  /*Here data from table location is fecthed*/

                                ResultSet rs2 = con.selectCommand(sel2); /*Here there select query is exectued into ResultSet array*/

                                while (rs2.next()) /*Using while loop we iterate every values in the array and pass the value into Drop down list*/ {
                            %>
                            <option value="<%=rs2.getString("place_id")%>"><%=rs2.getString("place_name")%></option> <!--Values from -->
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td >Location</td>
                    <td><select name="location" id="selLoc" >
                            <option value="null">----select Location----</option>

                        </select>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><textarea name="address" rows="4" cols="30"  placeholder="Enter Address" required></textarea></td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td align="center">
                        <input type="file" name="file_photo" required>
                    </td>   
                </tr>
                <tr>
<td>Password</td>
                    <td><input type="password" name="password" placeholder="Enter Password" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required></td>
                </tr>
                <tr>
                   <td>Confirm Password</td>
                    <td><input type="password" name="cpassword" placeholder="Enter Password" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_register" value="Register">&nbsp&nbsp<input type="reset" name="btn_reset" value="Reset"></td> 
                </tr>
            </table>
        </form>
    </body>
    <script src="../Assets/JQuery/jQuery.js"></script> <!--The jQuery (Javascript Library) file in the specified directory is being processed here-->         
    <script>
                        function getDist(did) /*Here the function is being defined were parameter is being passed*/
                        {

                            //  alert(did);  
                            $.ajax({url: "../Assets/AjaxPages/AjaxPlace.jsp?did=" + did, /*Here we use the $.ajax for passing the parameter value into the ajaxward file*/
                                success: function(result) { /*If the function is invoked successfully*/
                                    $("#selplace").html(result); /*We pass the value into the Ward drop down list using its drop down list id*/
                                }
                            })
                        }
                        function getPlace(pid) /*Here the function is being defined were parameter is being passed*/
                        {

                            //  alert(pid);  
                            $.ajax({url: "../Assets/AjaxPages/AjaxLoc.jsp?pid=" + pid, /*Here we use the $.ajax for passing the parameter value into the ajaxward file*/
                                success: function(result) { /*If the function is invoked successfully*/
                                    $("#selLoc").html(result); /*We pass the value into the Ward drop down list using its drop down list id*/
                                }
                            })
                        }

    </script>
</html>

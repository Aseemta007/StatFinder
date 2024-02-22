<%-- 
    Document   : product
    Created on : 4 Jan, 2024, 10:55:17 AM
    Author     : aseem
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product</title>
    </head>
        <body>
            <%
        if (request.getParameter("did") != null) {
            String id = request.getParameter("did");
            String delQry = "delete from tbl_product where product_id ='" + id + "'";
            con.executeCommand(delQry);
        }
    %>
        <form  method="post" enctype="multipart/form-data" action="../Assets/ActionPages1/ProductUploadAction.jsp" >
            <table border="1" align="center">
                 <tr>
                        <td>Category</td>
                        <td><select name="rgcat" onchange = "getCat(this.value)" required> <!--Here onchange triggers the function getCat()-->
                                <option>--select Category--</option>
                            <%
                                String sel = "select*from tbl_category";  /*Here data from table location is fecthed*/

                                ResultSet rs = con.selectCommand(sel); /*Here there select query is exectued into ResultSet array*/

                                while (rs.next()) /*Using while loop we iterate every values in the array and pass the value into Drop down list*/ {
                            %>
                            <option value="<%=rs.getString("category_id")%>"><%=rs.getString("category_name")%></option> <!--Values from -->
                            <%
                                }
                            %>
                        </select>


                    </td>
                </tr>
                <tr>
                    <td >Sub category</td>
                    <td><select name="subcategory" id="selscat" required>
                            <option value="null">----select Sub category----</option>

                        </select>
                </tr>
                <tr>
                    <td>Product Name</td>
                    <td><input type="text" name="product_name" required></td>
                </tr>
                <tr>
                    <td>Product Image</td>
                    <td><input type="file" name="product_image" required></td>
                </tr>
                <tr>
                    <td>Product Details</td>
                    <td>
                        <textarea name="product_details" rows="6" cols="20" required></textarea>
                    </td>
                </tr>
                <tr>
                    <td>Product Price</td>
                    <td><input type="text" name="product_price" required</td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_submit" value="Register">&nbsp&nbsp<input type="reset" name="btn_reset" value="Reset"</td>
                </tr>
            </table>
        </form>
        <table border="1" align="center">
                <tr>
                    <th>Sl.No</th>
                    <th>Name</th>
                    <th>Image</th>
                    <th>Price</th>
                    <th>Action</th>     
                </tr>
                <%
            String selqry="select * from tbl_product";
            ResultSet rs1=con.selectCommand(selqry);
            int i=0;
            while(rs1.next())
            {
                i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs1.getString("product_name")%></td>
                    <td><a href="../Assets/Files/ProductImage/<%=rs1.getString("product_image")%>"download>Download</a></td>
                    <td><%=rs1.getString("product_price")%></td>
                    <td><a href="ProductRegistration.jsp?did=<%=rs1.getString("product_id")%>">delete</a></td>
                </tr>
                <%
            }
                %>
            </table>
    </body>
    <script src="../Assets/JQuery/jQuery.js"></script> <!--The jQuery (Javascript Library) file in the specified directory is being processed here-->         
    <script>
                        function getCat(cid) /*Here the function is being defined were parameter is being passed*/
                        {

                            //  alert(cid);  
                            $.ajax({url: "../Assets/AjaxPages/AjaxCat.jsp?cid=" + cid, /*Here we use the $.ajax for passing the parameter value into the ajaxward file*/
                                success: function(result) { /*If the function is invoked successfully*/
                                    $("#selscat").html(result); /*We pass the value into the Ward drop down list using its drop down list id*/
                                }
                            })
                        }

    </script>
</html>
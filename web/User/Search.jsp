<%-- 
    Document   : Search
    Created on : Feb 22, 2024, 10:58:00 AM
    Author     : ANANTHU
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
    </head>
    <body onload="getProd()">
        <form>
            <table border="1" align="center"> 
                <tr>
                    <td>District</td>
                    <td><select name="rgdist" id="seldist" onchange = "getDist(this.value),getProd()"> <!--Here onchange triggers the function getDist()-->
                            <option value="">--select District--</option>
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
                    <td><select name="place" id="selplace" onchange = "getPlace(this.value),getProd()"> <!--Here onchange triggers the function getDist()-->
                            <option value="">--select Place--</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td >Location</td>
                    <td><select name="location" id="selLoc" >
                            <option value="">----select Location----</option>

                        </select>
                </tr>
                <tr>
                    <td>Category</td>
                    <td><select name="rgcat" id="selcat" onchange = "getCat(this.value),getProd()" > <!--Here onchange triggers the function getCat()-->
                            <option value="">--select Category--</option>
                            <%
                                String sel1 = "select*from tbl_category";  /*Here data from table location is fecthed*/

                                ResultSet rs1 = con.selectCommand(sel1); /*Here there select query is exectued into ResultSet array*/

                                while (rs1.next()) /*Using while loop we iterate every values in the array and pass the value into Drop down list*/ {
                            %>
                            <option value="<%=rs1.getString("category_id")%>"><%=rs1.getString("category_name")%></option> <!--Values from -->
                            <%
                                }
                            %>
                        </select>


                    </td>
                </tr>
                <tr>
                    <td >Sub category</td>
                    <td><select name="subcategory" id="selscat" onchange = "getProd()"  >
                            <option value="">----select Sub category----</option>

                        </select>
                </tr>
                <tr>
                    <td>Product Name</td>
                    <td><input type="text" name="product_name" id="selpn" onkeyup = "getProd()" value="" ></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="Save" value="Save">
                        <input type="reset" name="cancel" value="cancel">
                    </td>
                </tr>
            </table>
        </form>
        <table style="border-collapse:collapse;" align="center" id="dataT">
            
        </table>

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
                        function getCat(cid) /*Here the function is being defined were parameter is being passed*/
                        {

                            //  alert(cid);  
                            $.ajax({url: "../Assets/AjaxPages/AjaxCat.jsp?cid=" + cid, /*Here we use the $.ajax for passing the parameter value into the ajaxward file*/
                                success: function(result) { /*If the function is invoked successfully*/
                                    $("#selscat").html(result); /*We pass the value into the Ward drop down list using its drop down list id*/
                                }
                            })
                        }
                        function getProd()
                        {
                            var dsid = "", plid = "", lid = "", caid = "", scid = "", pnid = "";
                            dsid = document.getElementById('seldist').value.trim();
                            plid = document.getElementById('selplace').value.trim();
                            lid = document.getElementById('selLoc').value.trim();
                            caid = document.getElementById('selcat').value.trim();
                            scid = document.getElementById('selscat').value.trim();
                            pnid = document.getElementById('selpn').value.trim();

                            $.ajax({
                                url: "../Assets/AjaxPages/AjaxProd.jsp?dsid=" + dsid + "&plid=" + plid + "&lid=" + lid + "&caid=" + caid + "&scid=" + scid+ "&pnid=" + pnid,
                                        success: function(result) {
                                            $("#dataT").html(result);
                                        }
                            });

                        }

    </script>



</script>
</html>

<%-- 
    Document   : Search
    Created on : Feb 22, 2024, 10:58:00 AM
    Author     : ANANTHU
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Head.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
    </head>
    <body onload="getProd()">
        <div class="container my-4" style="width:700px;">
        <form>
            <div class="card">
                <div class="card-body">
                    <div class="form-group row mb-3">
                        <label for="seldist" class="col-sm-2 col-form-label">District</label>
                        <div class="col-sm-10">
                            <select name="rgdist" id="seldist" class="form-control" onchange="getDist(this.value),getProd()">
                                <option value="">--select District--</option>
                                <%
                                    String sel = "select*from tbl_district";
                                    ResultSet rs = con.selectCommand(sel);
                                    while (rs.next()) {
                                %>
                                <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row mb-3">
                        <label for="selplace" class="col-sm-2 col-form-label">Place</label>
                        <div class="col-sm-10">
                            <select name="place" id="selplace" class="form-control" onchange="getPlace(this.value),getProd()">
                                <option value="">--select Place--</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row mb-3">
                        <label for="selLoc" class="col-sm-2 col-form-label">Location</label>
                        <div class="col-sm-10">
                            <select name="location" id="selLoc" class="form-control">
                                <option value="">----select Location----</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row mb-3">
                        <label for="selcat" class="col-sm-2 col-form-label">Category</label>
                        <div class="col-sm-10">
                            <select name="rgcat" id="selcat" class="form-control" onchange="getCat(this.value),getProd()">
                                <option value="">--select Category--</option>
                                <%
                                    String sel1 = "select*from tbl_category";
                                    ResultSet rs1 = con.selectCommand(sel1);
                                    while (rs1.next()) {
                                %>
                                <option value="<%=rs1.getString("category_id")%>"><%=rs1.getString("category_name")%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row mb-3">
                        <label for="selscat" class="col-sm-2 col-form-label">Sub category</label>
                        <div class="col-sm-10">
                            <select name="subcategory" id="selscat" class="form-control" onchange="getProd()">
                                <option value="">----select Sub category----</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row mb-3">
                        <label for="selpn" class="col-sm-2 col-form-label">Product Name</label>
                        <div class="col-sm-10">
                            <input type="text" name="product_name" id="selpn" class="form-control" onkeyup="getProd()" value="">
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
                            <div class="container my-4">
        <div class="text-center mb-4">
            <h1>Products</h1>
        </div>
        <div class="row" id="dataT">
            
        </div>
    </div>

    </body>
    <script src="../Assets/JQuery/jQuery.js"></script> <!--The jQuery (Javascript Library) file in the specified directory is being processed here-->         
    <script>
                        function getDist(did)
                        {
                            console.log("hai")
                            //  alert(did);  
                            $.ajax({url: "../Assets/AjaxPages/AjaxPlace.jsp?did=" + did, 
                                success: function(result) { 
                                    $("#selplace").html(result); 
                                }
                            })
                        }
                        function getPlace(pid) 
                        {

                            //  alert(pid);  
                            $.ajax({url: "../Assets/AjaxPages/AjaxLoc.jsp?pid=" + pid, 
                                success: function(result) { 
                                    $("#selLoc").html(result); 
                                }
                            })
                        }
                        function getCat(cid) 
                        {

                            //  alert(cid);  
                            $.ajax({url: "../Assets/AjaxPages/AjaxCat.jsp?cid=" + cid, 
                                success: function(result) { 
                                    $("#selscat").html(result); 
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
                                            console.log(result)
                                            $("#dataT").html(result);
                                        }
                            });

                        }

    </script>



</html>
<%@include file="Foot.jsp" %>
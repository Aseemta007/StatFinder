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
        <link rel="stylesheet" href="../Assets/Templates/Main/css/footstyle2.css">
        <link rel="stylesheet" href="../Assets/Templates/Main/css/prodreg.css">
    </head>
    <%@include file="Userhead.jsp" %>
    <body onload="getProd()">
        <div class="formbold-main-wrapper">
  <div class="formbold-form-wrapper">
    <form method="post" >
      <div class="formbold-form-title">
        <h2 class="">Search</h2>
      </div>
        
        <div class="formbold-input-flex">
            <div>
        <label for="seldist" class="formbold-form-label">
            District
            </label>
  <select name="rgdist" id="seldist" onchange="getDist(this.value),getProd()" class="formbold-form-input" >
   <option value="">--select District--</option>
                            <%
            String sel = "select * from tbl_district";
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
    
    <div class="formbold-input-flex">
            <div>
        <label for="selplace" class="formbold-form-label">
            Place
            </label>
  <select name="place" id="selplace" onchange="getPlace(this.value),getProd()" class="formbold-form-input">
    <option value="">--select Place--</option>
  </select>
            </div>
            </div>
    
    <div class="formbold-input-flex">
            <div>
        <label for="selLoc" class="formbold-form-label">
            Location
            </label>
  <select name="location" id="selLoc" onchange="getProd()"class="formbold-form-input" >
    <option value="">----select Location----</option>
  </select>
            </div>
            </div>
    
    <div class="formbold-input-flex">
            <div>
        <label for="selcat" class="formbold-form-label">
            Category
            </label>
  <select name="rgcat" id="selcat" onchange="getCat(this.value),getProd()" class="formbold-form-input" required >
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
    
    <div class="formbold-input-flex">
            <div>
        <label for="selscat" class="formbold-form-label">
            Sub category
            </label>
  <select name="subcategory" id="selscat" onchange="getProd()" class="formbold-form-input" required>
    <option value="">----select Sub category----</option>
  </select>
            </div>
            </div>
    <div class="formbold-mb-3">
        <div>
          <label for="selpn" class="formbold-form-label">
            Product Name
          </label>
          <input 
            name="product_name" 
            placeholder="Enter Product Name" 
            title="Product Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" 
            pattern="^[A-Z]+[a-zA-Z ]*$"  
            type="text"
            class="formbold-form-input"
            id="selpn" 
            onkeyup="getProd()" 
            value=""
            
          />
        </div>
      </div> 
     </form>
  </div>
</div> 
                            <div class="container my-4">
        <div class="text-center mb-4">
            <h1 id="h2e">Products</h1>
        </div>
        <div class="row" id="dataT">
            Hii
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
<%@include file="../Guest/Foot.jsp" %>
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
        <link rel="stylesheet" href="../Assets/Templates/Main/css/footstyle2.css">
                 <link rel="stylesheet" href="../Assets/Templates/Main/css/prodreg.css">
    </head>
    <%@include file="Shophead.jsp" %>
        <body>
            <%
        if (request.getParameter("did") != null) {
            String id = request.getParameter("did");
            String delQry = "delete from tbl_product where product_id ='" + id + "'";
            con.executeCommand(delQry);
        }
    %>
        <div class="formbold-main-wrapper">
  <div class="formbold-form-wrapper">
    <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages1/ProductUploadAction.jsp">
      <div class="formbold-form-title">
        <h2 class="">Product Registration</h2>
      </div>
       
      <div class="formbold-input-flex">
            <div>
        <label for="rgcat" class="formbold-form-label">
            Category
            </label>
  <select name="rgcat" onchange = "getCat(this.value)" class="formbold-form-input" required >
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
            </div>
            </div>
                        <div class="formbold-input-flex">
            <div>
        <label for="subcategory" class="formbold-form-label">
            Sub category
            </label>
  <select name="subcategory" id="selscat" class="formbold-form-input" required>
    <option value="null">----select Sub category----</option>
  </select>
            </div>
            </div>
    <div class="formbold-mb-3">
        <div>
          <label for="prodname" class="formbold-form-label">
            Product Name
          </label>
          <input 
            name="product_name" 
            placeholder="Enter Product Name" 
            title="Product Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" 
            pattern="^[A-Z]+[a-zA-Z ]*$"  
            type="text"
            class="formbold-form-input"
            required
          />
        </div>
      </div>            
    <div class="formbold-mb-3">
        <label for="prod_img" class="formbold-form-label">
          Product Image
        </label>
        <input  
         type="file" 
         name="product_image" 
          id="file_proof"
          required
        />
      </div>
    <div class="formbold-mb-3">
        <div>
          <label for="shopname" class="formbold-form-label">
            Product Details
          </label>
          <textarea 
            name="product_details" 
            placeholder="Enter Product Details" 
            title="Product Details Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" 
            pattern="^[A-Z]+[a-zA-Z ]*$"  
            rows="6" cols="20"
            type="text"
            class="formbold-form-input"
            required
          ></textarea>
        </div>
      </div>
     <div class="formbold-mb-3">
        <div>
          <label for="prodname" class="formbold-form-label">
            Product Price
          </label>
          <input 
            name="product_price" 
            placeholder="Enter Product Price" 
            title="Product Price Allows Only Numbers" 
            pattern="[0-9]+([\.][0-9]{1,2})?"  
            type="text"
            class="formbold-form-input"
            required
          />
        </div>
      </div>
               <input type="submit" class="formbold-btn" name="btn_register" value="Register">&nbsp&nbsp<input type="reset" class="formbold-btn" name="btn_reset" value="Reset">
    </form>
  </div>
</div> 
    </body>
    <%@include file="../Guest/Foot.jsp" %>
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
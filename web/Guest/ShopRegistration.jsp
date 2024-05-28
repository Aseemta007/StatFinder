<%-- 
    Document   : sellerrgnjsp
    Created on : 10 Dec, 2023, 12:00:15 PM
    Author     : aseem
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@page import="java.sql.ResultSet"%>
    <jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SELLER REGISTRATION</title>
        <link rel="stylesheet" href="../Assets/Templates/Main/css/footstyle2.css">
                 <link rel="stylesheet" href="../Assets/Templates/Main/css/shopreg.css">
    </head>
    <%@include file="Shophead.jsp" %>
    <body>
     <div class="formbold-main-wrapper">
  <div class="formbold-form-wrapper">
    <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages1/ShopUploadAction.jsp">
      <div class="formbold-form-title">
        <h2 class="">Shop Registration</h2>
      </div>
       
      <div class="formbold-mb-3">
        <div>
          <label for="shopname" class="formbold-form-label">
            Shop Name
          </label>
          <input 
            name="shopname" 
            placeholder="Enter ShopName" 
            title="ShopName Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" 
            pattern="^[A-Z]+[a-zA-Z ]*$"  
            type="text"
            id="shopname"
            class="formbold-form-input"
            required
          />
        </div>
      </div>

      <div class="formbold-mb-3">
        <div>
          <label for="shopemail" class="formbold-form-label"> Shop Email </label>
          <input  
            name="shopemail" 
            placeholder="Enter Email-Id" 
            type="email"
            id="email"
            class="formbold-form-input"
            required
          />
        </div>
        </div>
        
        <div class="formbold-mb-3">
        <label for="shopaddress" class="formbold-form-label">
         Shop Address
        </label>
        <input 
          name="shopaddress" 
          placeholder="Enter Address"
          type="text"
          rows="4" 
          cols="30"
          id="address"
          class="formbold-form-input"
          required
        />
      </div>
        
         <div class="formbold-mb-3">
        <div>
          <label for="phone" class="formbold-form-label"> Phone number </label>
          <input  
            name="shopcontact"
            placeholder="Enter Contact No" 
            title="Phone number with 7-9 and remaing 9 digit with 0-9" 
            pattern="[7-9]{1}[0-9]{9}" 
            type="text"
            id="contact"
            class="formbold-form-input"
            required
          />
        </div>
      </div>
       
      <div class="formbold-mb-3">
        <div>
          <label for="shopname" class="formbold-form-label">
            Shop Owner Name
          </label>
          <input  
            name="shopownername"
            placeholder="Enter ShopOwnerName" 
            title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" 
            pattern="^[A-Z]+[a-zA-Z ]*$"  
            type="text"
            id="shopname"
            class="formbold-form-input"
            required
          />
        </div>
      </div>
        
        <div class="formbold-mb-3">
        <label for="file_photo" class="formbold-form-label">
          Shop Logo
        </label>
        <input  
         type="file" 
         name="file_logo" 
          id="file_proof"
          required
        />
      </div>
        
        <div class="formbold-mb-3">
        <label for="file_photo" class="formbold-form-label">
          Shop Proof
        </label>
        <input  
         type="file" 
         name="file_proof" 
          id="file_proof"
          required
        />
      </div>
        
        <div class="formbold-input-flex">
            <div>
        <label for="rgdist" class="formbold-form-label">
            District
            </label>
  <select name="rgdist" onchange = "getDist(this.value)" class="formbold-form-input" >
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
            </div>
            </div>
        
        <div class="formbold-input-flex">
            <div>
        <label for="place" class="formbold-form-label">
            Place
            </label>
  <select name="place" id="selplace" onchange = "getPlace(this.value)" class="formbold-form-input">
    <option>--select Place--</option>
  </select>
            </div>
            </div>
        
        <div class="formbold-input-flex">
            <div>
        <label for="location" class="formbold-form-label">
            Location
            </label>
  <select name="location" id="selLoc" class="formbold-form-input" >
    <option value="null">----select Location----</option>
  </select>
            </div>
            </div>



      <div class="formbold-mb-3">
        <div>
          <label for="password" class="formbold-form-label"> Password </label>
          <input 
              type="password" 
              name="password" 
              title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" 
              pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
            id="password"
            class="formbold-form-input"
            required
          />
        </div>   
      </div>

      <div class="formbold-mb-3">
        <div>
          <label for="cpassword" class="formbold-form-label"> Confirm Password </label>
         <input 
             type="password" 
             name="cpassword" 
             title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" 
             pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
            id="cpassword"
            class="formbold-form-input"
          />
        </div>
      </div>

      <div class="formbold-checkbox-wrapper">
        <label for="supportCheckbox" class="formbold-checkbox-label">
          <div class="formbold-relative">
            <input
              type="checkbox"
              id="supportCheckbox"
              class="formbold-input-checkbox"
            />
            <div class="formbold-checkbox-inner">
              <span class="formbold-opacity-0">
                <svg
                  width="11"
                  height="8"
                  viewBox="0 0 11 8"
                  fill="none"
                  class="formbold-stroke-current"
                >
                  <path
                    d="M10.0915 0.951972L10.0867 0.946075L10.0813 0.940568C9.90076 0.753564 9.61034 0.753146 9.42927 0.939309L4.16201 6.22962L1.58507 3.63469C1.40401 3.44841 1.11351 3.44879 0.932892 3.63584C0.755703 3.81933 0.755703 4.10875 0.932892 4.29224L0.932878 4.29225L0.934851 4.29424L3.58046 6.95832C3.73676 7.11955 3.94983 7.2 4.1473 7.2C4.36196 7.2 4.55963 7.11773 4.71406 6.9584L10.0468 1.60234C10.2436 1.4199 10.2421 1.1339 10.0915 0.951972ZM4.2327 6.30081L4.2317 6.2998C4.23206 6.30015 4.23237 6.30049 4.23269 6.30082L4.2327 6.30081Z"
                    stroke-width="0.4"
                  ></path>
                </svg>
              </span>
            </div>
          </div>
          I agree to the defined
          <a href="#"> terms, conditions, and policies</a>
        </label>
      </div>

      <input type="submit" class="formbold-btn" name="btn_register" value="Register">&nbsp&nbsp<input type="reset" class="formbold-btn" name="btn_reset" value="Reset">
    </form>
  </div>
</div>
    </body>
    <%@include file="Foot.jsp" %>
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

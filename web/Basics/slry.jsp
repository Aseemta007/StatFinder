<%-- 
    Document   : slryjsp
    Created on : 7 Dec, 2023, 12:08:15 PM
    Author     : aseem
--%>
<% 
    String firstName="",lastName="",Gender="",Marital="",Department="",Name="";
    int basicSalary=0;
    double TA=0,DA=0,HRA=0,LIC=0,PF=0,DEDUCTION=0,NET=0;
    if(request.getParameter("btn_submit")!=null) {
        firstName=request.getParameter("firstname");
        lastName=request.getParameter("lastname");
        Name=firstName+" "+lastName;
        Gender=request.getParameter("gender");
        Marital=request.getParameter("marital");
        Department=request.getParameter("department");
        basicSalary=Integer.parseInt(request.getParameter("basic_salary"));
        if(basicSalary>=10000){
            TA=basicSalary*40/100;
            DA=basicSalary*35/100;
            HRA=basicSalary*30/100;
            LIC=basicSalary*25/100;
            PF=basicSalary*20/100;
            
        }   
         if(basicSalary>=5000 && basicSalary<10000 ){
            TA=basicSalary*35/100;
            DA=basicSalary*30/100;
            HRA=basicSalary*25/100;
            LIC=basicSalary*20/100;
            PF=basicSalary*15/100;
            }
          if(basicSalary<5000){
            TA=basicSalary*30/100;
            DA=basicSalary*25/100;
            HRA=basicSalary*20/100;
            LIC=basicSalary*15/100;
            PF=basicSalary*10/100;
             }   
        DEDUCTION=LIC+PF;  
        NET=basicSalary+TA+DA+HRA-(LIC+PF);
    }
        
       
       
 %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Salary Calculator</title>
    </head>
    <body>
        <form method="post">
            <table border="1">
                <tr>
                    <td>First Name</td>
                    <td><input type="text" name="firstname"</td>
                </tr>
                <tr>
                    <td>Last Name</td>
                    <td><input type="text" name="lastname"</td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td><input type="radio" name="gender" value="Male">Male
                    <input type="radio" name="gender" value="Female">Female</td>
                </tr>
                <tr>
                    <td>Marital</td>
                    <td><input type="radio" name="marital" value="Single">Single
                    <input type="radio" name="marital" value="Married">Married</td>               
                </tr>
                <tr>
                    <td>Department</td>
                    <td><select name="department">
                            <option value="null"/>
                            <option value="Marketing">Marketing</option>
                            <option value="Human Resources">Human Resources</option>
                            <option value="Sales">Sales</option>
                        </select>
                        </td>
                </tr>
                <tr>
                    <td>Basic salary</td>
                    <td><input type="text" name="basic_salary"</td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_submit" value="submit">&nbsp&nbsp<input type="reset" name="btn_res" value="cancel"></td>
                </tr>
            </table>
        </form>
        <br>
        <br>
        <br>
        <table border="1">
            <tr>
                <td>Name</td>
                <td><input type="text" name="nm" value="<%=Name%>"></td>
            </tr>
            <tr>
                <td>Gender</td>
                <td><input type="text" name="Gen" value="<%=Gender%>"></td>
            </tr>
            <tr>
                <td>Marital</td>
                <td><input type="text" name="Mar" value="<%=Marital%>"></td>
            </tr>
            <tr>
                <td>Department</td>
                <td><input type="text" name="dep" value="<%=Department%>"></td>
            </tr>
            <tr>
                <td>Basic salary</td>
                <td><input type="text" name="bas" value="<%=basicSalary%>"></td>
            </tr>
            <tr>
                <td>T.A</td>
                <td><input type="text" name="ta" value="<%=TA%>"></td>
            </tr>
            <tr>
                <td>D.A</td>
                <td><input type="text" name="da" value="<%=DA%>"></td>
            </tr>
            <tr>
                <td>HRA</td>
                <td><input type="text" name="hra" value="<%=HRA%>"></td>
            </tr>
            <tr>
                <td>LIC</td>
                <td><input type="text" name="lic" value="<%=LIC%>"></td>
            </tr>
            <tr>
                <td>P.F</td>
                <td><input type="text" name="pf" value="<%=PF%>"></td>
            </tr>
            <tr>
                <td>DEDUCTION</td>
                <td><input type="text" name="dn" value="<%=DEDUCTION%>"></td>
            </tr>
            <tr>
                <td>NET</td>
                <td><input type="text" name="nt" value="<%=NET%>"></td>
            </tr>
            
        </table>

    </body>
</html>

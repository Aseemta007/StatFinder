<%-- 
    Document   : Calculator
    Created on : 7 Dec, 2023, 11:04:09 AM
    Author     : aseem
--%>

<%

    int a=0, b=0, c=0;
    if (request.getParameter("add")!=null) {
        a = Integer.parseInt(request.getParameter("number1"));
        b = Integer.parseInt(request.getParameter("number2"));
        c = a + b;
    }
    if(request.getParameter("sub")!=null){
        a=Integer.parseInt(request.getParameter("number1"));
        b=Integer.parseInt(request.getParameter("number2"));
        c=a-b; 
    }
    if(request.getParameter("mul")!=null){
        a=Integer.parseInt(request.getParameter("number1"));
        b=Integer.parseInt(request.getParameter("number2"));
        c=a*b;
    }
    if(request.getParameter("div")!=null){
        a=Integer.parseInt(request.getParameter("number1"));
        b=Integer.parseInt(request.getParameter("number2"));
        c=a/b; 
    }


%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post">
             <table border="1">
            <tr>
                <td align="center">Number 1</td>
                <td><input type="text" name="number1"></td>
            </tr>
            <tr>
                <td align="center">Number 2</td>
                <td><input type="text" name="number2"></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" name="add" value="+">&nbsp&nbsp<input type="submit" name="sub" value="-">&nbsp&nbsp<input type="submit" name="mul" value="*">&nbsp&nbsp<input type="submit" name="div" value="/"></td>               
            </tr>
            <tr>
                <td align="center">Result</td>
                <td align="center"><input type="text" name="result" value="<%=c%>" /></td>
            </tr>
        </table>
        </form>
    </body>
</html>

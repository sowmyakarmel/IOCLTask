<%-- 
    Document   : claimdetails
    Created on : Nov 27, 2017, 1:36:35 PM
    Author     : ishdapso
--%>


<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>My First Login Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
    <center>
        <h2>Please Enter the Details</h2>
      
        <br/>
      <%
          String empid=(String)session.getAttribute("empid"); 
           out.println("Welcome  " +empid);
      %>
        <form name="myform" method="post" action="edit.jsp" >
         
        
  
            Tour Date: <input type="date"  id="tdate" name="tdate" required=""/><br> 
        Starting Place:<input type="text"  id="startplace"  name="startplace" required=""/><br>
        Destination Place:<input type="text" id="dplace" name="dplace"  required=""/><br>
        Expenses Incurred:<input type="number"  id="expenses" name="expenses" required=""/><br>
        
        <input type="submit" value="submit"/>
    
        </form>
    
    </center>
    </body>
</html>

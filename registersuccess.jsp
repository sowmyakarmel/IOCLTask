<%-- 
    Document   : registersuccess
    Created on : Nov 23, 2017, 11:14:20 AM
    Author     : ishdapso
--%>

<%@page import="java.sql.Time"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <table>
                      <tr><th>Employee Id</th>
                          <th>Employee Name</th>
                          <th>Department</th>
                           <th>Designation</th>
                          <th>Mobile Number</th>
                          
                       </tr>
    </head>
    <body>
     <h1 align="center">Register Page</h1>
     
        <%
        
            
            String empname=request.getParameter("name");
            System.out.println("name" +empname);
            String empid=request.getParameter("empid");
            System.out.println("empid"+empid);
            String emppass=request.getParameter("password");
            System.out.println("password"+emppass);
            String empdept=request.getParameter("department");
            System.out.println("department"+empdept);
            String empdesg=request.getParameter("designation");
            System.out.println("designation"+empdesg);
            String empmobile=request.getParameter("mobile");
            System.out.println("mobile" +empmobile);
      
            Class.forName("oracle.jdbc.OracleDriver");
               System.out.println("connected");
        String url="jdbc:oracle:thin:@//10.194.32.41:1521/XE";
          System.out.println("url"+url);
       Connection con=DriverManager.getConnection(url,"hr","hr");
         System.out.println("connected ---1");
       String sql="insert into register_new(empid,name,password,department,designation,mobilenumber) values(?,?,?,?,?,?)";
         //System.out.println("sql"+sql);
         
         
          PreparedStatement ps=con.prepareStatement(sql);
           ps.setString(1, empid);
        ps.setString(2,empname);
         ps.setString(3, emppass);
        ps.setString(4,empdept);
         ps.setString(5, empdesg);
         ps.setString(6,empmobile);
       
    
      int i=ps.executeUpdate();
          System.out.println("integer value" +i);
      if(i>0)
      {
          out.println("Data entered successfully");
      }
      else
       {
          out.println("wrong data");
      }
    
    
        %>
    <tr>
        <td><%=empid%></td>
        <td><%=empname%></td>
        <td><%=empdept%></td>
        <td><%=empdesg%></td>
        <td><%=empmobile%></td>
       
    
    </tr>
        
        </table>
    
 
    <a href="login.html">Login</a>
    
    
    </body>
</html>

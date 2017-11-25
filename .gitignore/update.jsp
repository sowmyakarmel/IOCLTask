<%-- 
    Document   : update
    Created on : Nov 25, 2017, 4:32:55 PM
    Author     : ishdapso
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        
        
        
        <% 
            String empname=request.getParameter("empname");
            String emppass=request.getParameter("password");
            String empdept=request.getParameter("department");
            String empdesg=request.getParameter("designation");
            String empmob=request.getParameter("mobile");
            
            Class.forName("oracle.jdbc.OracleDriver");
               System.out.println("connected");
        String url="jdbc:oracle:thin:@//10.194.32.41:1521/XE";
          System.out.println("url"+url);
       Connection con=DriverManager.getConnection(url,"hr","hr");
         System.out.println("connected ---1");
         String empid=(String)session.getAttribute("empid");
       String sql="update register_new set name=?,password=?,department=?,designation=?,mobilenumber=? where empid=?";
         //System.out.println("sql"+sql);
         
         
          PreparedStatement ps=con.prepareStatement(sql);
      
        ps.setString(1,empname);
         ps.setString(2, emppass);
        ps.setString(3,empdept);
         ps.setString(4, empdesg);
         ps.setString(5,empmob);
              ps.setString(6, empid);
       
    
      int i=ps.executeUpdate();
          System.out.println("integer value" +i);
      if(i>0)
      {
          out.println("Updated successfully");
      }
      else
       {
          out.println("wrong data");
      }
      
      %>
    </body>
</html>

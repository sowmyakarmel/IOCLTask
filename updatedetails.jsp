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
            String splace=request.getParameter("splace1");
            System.out.println("splace");
            String dplace=request.getParameter("dplace1");
            System.out.println("dplace");
            String expenses=request.getParameter("expenses1");
            System.out.println("expenses");
            String tdate=request.getParameter("tdate1");
            System.out.println("tdate");
            
            Class.forName("oracle.jdbc.OracleDriver");
               System.out.println("connected");
        String url="jdbc:oracle:thin:@//10.194.32.41:1521/XE";
          System.out.println("url"+url);
       Connection con=DriverManager.getConnection(url,"hr","hr");
         System.out.println("connected ---1");
         String empid=(String)session.getAttribute("empid");
       String sql="update detail set splace=?,dplace=?,expenses=?,tdate=? where splace= +splace";
         System.out.println("sql"+sql);
         
         
          PreparedStatement ps=con.prepareStatement(sql);
      
        ps.setString(1,splace);
         ps.setString(2, dplace);
        ps.setString(3,expenses);
         ps.setString(4, tdate);
      
           
       
    
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
      <a href="index.jsp">Back</a>
    </body>
</html>

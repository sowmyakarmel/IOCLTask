

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Saving data</title>
    </head>
    <body>
        
     
        <%
            String empid=request.getParameter("empid");
            System.out.println(empid);
               String password=request.getParameter("password");
                System.out.println(password);
               String empname1=null,empid1=null,empdesg1=null,empdept1=null;
             String empmob1=null;
         session.setAttribute("empid", empid);
          session.setAttribute("empname", empname1);  
               
            Connection con=null;
            Class.forName("oracle.jdbc.OracleDriver");
            System.out.println("connected");
            con=DriverManager.getConnection("jdbc:oracle:thin:@10.194.32.41:1521:XE", "hr", "hr");
            System.out.println("done 1");
            String sql="select * from register_new where empid=? and password=?";
            System.out.println(sql);
            PreparedStatement ps=con.prepareStatement(sql);
        
        
        
        ps.setString(1, empid);
        ps.setString(2,password);
       ResultSet rs= ps.executeQuery();
     while(rs.next())
     {
   empid1= rs.getString(1);
   empname1= rs.getString(2);
    empdept1= rs.getString(4);
      empdesg1= rs.getString(5);
 empmob1= rs.getString(6);
 
          //System.out.println(empid1);
          //System.out.println(empname1);
         // System.out.println(empdesg1);
            
     }
   
     if(empid.equals(empid1))
     {
          //out.println("Welcome   "+empid1); 
          %>
          <br/>
          <%
        //out.println( "Name is   "+empname1);
       
       
   //out.println( "Name is   "+empdept1);
        //out.println( "Name is   "+empdesg1);
//out.println( "Name is   "+empmob1);
     }
     


   else
     {
           out.println("please re login!!!");
     }
            %>
            <table>
                <tr>
                    <th>EMP ID</th>
                     <th>EMP NAME</th>
                  <th>DEPARTMENT</th>
                    <th>DESIGNATION</th>
                    <th>MOBILE</th>
                    <th> EDIT</th>
                    <th> DELETE</th>
                      </tr>
                       <tr>
                    <td>
                        <%= empid1%>
                    </td>
                      <td>
                        <%= empname1%>
                    </td>
                      <td>
                        <%= empdept1%>
                    </td>
                      <td>
                        <%= empdesg1%>
                    </td>
                      <td>
                        <%= empmob1%>
                    </td>
                    <td> <a href="edit.jsp" >UPDATE</a></td>
                     <td> <a href="delete.jsp" >DELETE</a></td>
                </tr>
            </table>
       
            
    </body>
</html>

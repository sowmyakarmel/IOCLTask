
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
       
     
       <% 
           
                
           String splace=null,dplace=null,expense=null;
            String tdate=null;
       int i=0;
      
       tdate=request.getParameter("tdate");
          System.out.println(tdate);
      
           String startingplace=request.getParameter("startplace");
           System.out.println(startingplace);
                
           String destplace=request.getParameter("dplace");
           System.out.println(destplace);
           
           String expenses=request.getParameter("expenses");
           System.out.println(expenses);
           
         // session.setAttribute("emplid", empid);
         
          session.setAttribute("startingplace", splace);  
          session.setAttribute("destplace", dplace);
          session.setAttribute("expenses", expenses);  
          session.setAttribute("actualdate", tdate);
           Connection con=null;
           
           
            Class.forName("oracle.jdbc.OracleDriver");
            System.out.println("connected");
            con=DriverManager.getConnection("jdbc:oracle:thin:@10.194.32.41:1521:XE", "hr", "hr");
            System.out.println("done 1");
            String sql="insert  into detail (splace,dplace,expenses,tdate) values(?,?,?,?)";
            System.out.println(sql);
            System.out.println("sql statement printed");
            
            PreparedStatement ps=con.prepareStatement(sql);
            
            // String sql1="select * from detail where splace=? and dplace=? and expenses=?, tdate=?" ;  

       //   ps.setString(1, empid);
           ps.setString(1, startingplace);
           ps.setString(2,destplace);
            ps.setString(3, expenses);
         ps.setString(4, tdate);
         
       i=ps.executeUpdate(); 
    
   
    if(i>0)
     {
   // empid= rs.getString(1);
   // tdate= rs.getString(1);
   out.println("data entered successfully");
   
     }
    else
    {
        out.println("wrong");
    }
      %>
        
        
        <table>
                <tr>
                    
                     <th>Tour Date</th>
                  <th>Starting Place</th>
                    <th>Destination Place</th>
                    <th>Expenses</th>
                    <th> EDIT</th>
                    <th> DELETE</th>
                      </tr>
                       <tr>
                  
                      <td>
                        <%= tdate%>
                    </td>
                      <td>
                        <%= startingplace%>
                    </td>
                      <td>
                        <%= destplace%>
                    </td>
                      <td>
                        <%= expenses%>
                    </td>
                    <td> <a href="update.jsp" >UPDATE</a></td>
                     <td> <a href="delete.jsp" >DELETE</a></td>
                </tr>
            </table>
    </body>
</html>

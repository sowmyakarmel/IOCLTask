<%@ page language="java" import="java.util.*;"%>
<%@ page language="java" import="java.sql.*"%>
<head>
</head>
<body>       
        <%
                 
                    Statement stmt;
                    Connection con =null; 
                    String splace1=null,dplace1=null,expenses1=null,tdate1=null;     
                 
                   
                   Class.forName("oracle.jdbc.OracleDriver");
                    System.out.println("Oracle connected");
                    con=DriverManager.getConnection("jdbc:oracle:thin:@10.194.32.41:1521:XE", "hr", "hr");
                      System.out.println("DataBase connections established");
            
                      
                      
                          String sql="select * from detail where splace=?";
                           System.out.println(sql);
                               PreparedStatement ps=con.prepareStatement(sql);
                             
       
                        ResultSet rs= ps.executeQuery();
        while(rs.next())
        {
            splace1= rs.getString(1);
            dplace1= rs.getString(2);
            expenses1= rs.getString(3);
            tdate1= rs.getString(4);
        }
          
        %>
    <form action="update.jsp" method="post" >   
  <table align="center" width="300px" style="background-color:#EDF6EA;border:1px solid #000000;">
            <tr><td colspan=2 style="font-weight:bold;" align="center">Edit User</td></tr>
            <tr><td colspan=2 align="center" height="10px"></td></tr>
            
            <tr>  
                
                <td>Starting Place</td>
                <td><input type="text" name="splace" value="<%=splace1%>" ></td>
                
                
            </tr>
            <tr>
                <td>Destination</td>
                <td><input type="text" name="dplace" value="<%=dplace1%>" required="" ></td>
            </tr>
            <tr>
                <td>Expenses Incurred</td>
                <td><input type="text" name="expenses" value="<%=expenses1%>" required="" ></td>
            </tr>
            <tr>
                <td>Tour Date </td>
                <td><input type="text" name="tdate" value="<%=tdate1%>" required="" ></td>
            </tr>
            
                <td><input type="submit" name="Submit" value="Update" style="background-color:#49743D;font-weight:bold;color:#ffffff;"></td>
          
           
       
                  
    
              </table>    
   

   
   
   
     
   </form>
</body>
</html>
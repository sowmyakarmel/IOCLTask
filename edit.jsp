<%@ page language="java" import="java.util.*;"%>
<%@ page language="java" import="java.sql.*"%>
<head>
</head>
<body>       
        <%
                 
                    Statement stmt;
                    Connection con =null; 
                    String empid2=null,empname2=null,emppass2=null,empdept2=null,empdesg2=null,empmob2=null;     
                 
                   
                   Class.forName("oracle.jdbc.OracleDriver");
                    System.out.println("connected");
                    con=DriverManager.getConnection("jdbc:oracle:thin:@10.194.32.41:1521:XE", "hr", "hr");
                      System.out.println("done 1");
              String empid=(String)session.getAttribute("empid");
                 out.println(empid);
                      
                      
                          String sql="select * from register_new where empid=?";
                           System.out.println(sql);
                               PreparedStatement ps=con.prepareStatement(sql);
                                 ps.setString(1, empid);
       
                        ResultSet rs= ps.executeQuery();
        while(rs.next())
        {
            empid2= rs.getString(1);
            empname2= rs.getString(2);
            emppass2= rs.getString(3);
            empdept2= rs.getString(4);
            empdesg2= rs.getString(5);
            empmob2= rs.getString(6);
        }
          //System.out.println(empid1);
          //System.out.println(empname1);
         // System.out.println(empdesg1);
            
     
           // String query = "UPDATE register_new SET empname= "+empname+",password=" + password + ",department=" + department + ",designation=" + designation + ",mobile=" + mobile ;
        // stmt = con.createStatement();
         // int i = stmt.executeUpdate(query);
         // System.out.println("query" + query);
               //         if (i > 0) {
                                   // response.sendRedirect("loginsuccess.jsp");
                          //      }
                                //con.close();
                               // System.out.println("Disconnected from database");
        %>
    <form action="update.jsp" method="post" >   
  <table align="center" width="300px" style="background-color:#EDF6EA;border:1px solid #000000;">
            <tr><td colspan=2 style="font-weight:bold;" align="center">Edit User</td></tr>
            <tr><td colspan=2 align="center" height="10px"></td></tr>
            
            <tr>  
                
                <td>Employee ID</td>
                
                <td><input type="text" name="empid" value="<%=empid2%>" readonly="true"></td>
            </tr>
            <tr>
                <td>Employee Name</td>
                <td><input type="text" name="empname" value="<%=empname2%>" required="" ></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="text" name="password" value="<%=emppass2%>" required="" ></td>
            </tr>
            <tr>
                <td>Department </td>
                <td><input type="text" name="department" value="<%=empdept2%>" required="" ></td>
            </tr>
            <tr>
                <td>Designation</td>
                <td><input type="text" name="designation" value="<%=empdesg2%>" required="" ></td>
            </tr>
            <tr>
                <td>Mobile Number</td>
                <td><input type="text"  name="mobile" value="<%=empmob2%>"required="" ></td>
            </tr>
                <td></td>
                <td><input type="submit" name="Submit" value="Update" style="background-color:#49743D;font-weight:bold;color:#ffffff;"></td>
          
           
       
                  
        </form>
              </table>    
   

   
   
   
     
   </form>
</body>
</html>
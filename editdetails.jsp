<%@ page language="java" import="java.util.*;"%>
<%@ page language="java" import="java.sql.*"%>
<head>
</head>
<body>       
        <%
                 
                    Statement stmt;
                    Connection con =null; 
                        
                String startplace11=null,destplace11=null,expenses11=null,tourdate11=null,stime11=null,etime11=null,etime=null;
                    
                String startplace=request.getParameter("startplace");
                System.out.println("Starting place:" +startplace);
                   
                String destplace=request.getParameter("dplace");
                System.out.println("Destination Place: "+destplace);
                   
                String expenses=request.getParameter("expenses");
                System.out.println("Expenses Incurred: "+expenses);
                   
                String tourdate=request.getParameter("tdate");
                System.out.println("Tour Date: "+tourdate);
                   
                   
                String starttime=request.getParameter("stime");
                System.out.println("Starting time :" +starttime);
                   
              
                Class.forName("oracle.jdbc.OracleDriver");
                System.out.println("Oracle connected");
                con=DriverManager.getConnection("jdbc:oracle:thin:@10.194.32.41:1521:XE", "hr", "hr");
                System.out.println("DataBase connections established");
            
                String empid=(String)session.getAttribute("empid");
                System.out.println(empid);
                      
                String sql="insert into detail(splace,dplace,expenses,tdate,stime)values(?,?,?,?,?) " ;
                System.out.println(sql);
                PreparedStatement ps=con.prepareStatement(sql);
                ps.setString(1, startplace);
                ps.setString(2,destplace);
                ps.setString(3,expenses);
                ps.setString(4,tourdate);
                ps.setTimestamp(5,new java.sql.Timestamp(new java.util.Date().getTime()));
                ResultSet rs= ps.executeQuery();
                       
                        
                while(rs.next())
                {
                startplace11= rs.getString(1);
                destplace11= rs.getString(2);
                expenses11= rs.getString(3);
                tourdate11= rs.getString(4);
                stime11=rs.getString(5);
            
               }
               System.out.println("while loop completed");
        
               String sql1="select * from detail where stime='"+starttime+"' ";
               System.out.println(sql1);
               PreparedStatement ps1=con.prepareStatement(sql1);
               ps1.setString(5,starttime);
        
               ResultSet rs1=ps1.executeQuery();
               while(rs1.next())
                {
                startplace11=rs1.getString(1);
                destplace11=rs1.getString(2);
                expenses11=rs1.getString(3);
                tourdate11=rs1.getString(4);
                stime11=rs1.getString(5);
               
                }
        
        
        %>
        
        
    <form action="updatedetails.jsp" method="post" >   
    
    <table align="center" width="300px" style="background-color:#EDF6EA;border:1px solid #000000;">
        <tr>
            <td colspan=2 style="font-weight:bold;" align="center">Edit User</td>
        </tr>
        
        <tr>
            <td colspan=2 align="center" height="10px"></td>
        </tr>
        
        <tr>
            <td>Starting Place</td>  
            <td><input type="text" name="splace" value="<%=startplace11%>" ></td>
        </tr>
        
        <tr>
           <td>Destination</td>
            <td><input type="text" name="dplace" value="<%=destplace11%>" required="" ></td>
        </tr>
        <tr>
            <td>Expenses Incurred</td>
            <td><input type="text" name="expenses" value="<%=expenses11%>" required="" ></td>
        </tr>
            
        <tr>
            <td>Tour Date </td>
            <td><input type="text" name="tdate" value="<%=tourdate11%>" required="" ></td>
        </tr>
        
        <tr>
            <td>Start Time </td>
            <td><input type="text" name="ttime" value="<%=stime11%>" required="" ></td>
        </tr>
        
        
        
        <tr>
            <td><input type="submit" name="Submit" value="Update" style="background-color:#49743D;font-weight:bold;color:#ffffff;"></td>
        </tr>
     
    </table>    
   
    </form>
</body>
</html>
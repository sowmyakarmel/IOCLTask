<html>
<body>
<script>  
function validateform(){  
var employee=document.myform.employee.value;  
var password=document.myform.password.value;  
var department=document.myform.department.value;
var designation=document.myform.designation.value;
var mobile=document.myform.mobile.value;
if (employee==null || employee=="")
{
    if(password==null || password=="")
    {
        if(department==null || department=="")
        {
            if(designation==null || designation=="")
            {
                if(mobile==null || mobile=="")
                {
                    alert("Mobile number should not be empty");
                    return false;
                }
                else
                {
                    return true;
                }
                return false;
            }
        }
    }
    
  alert("employee can't be blank");  
  return false;  
}else if(password.length<6){  
  alert("Password must be at least 6 characters long.");  
  return false;  
  }  
}  
</script>  
<body>  
<form name="myform" method="post" action="registersuccess.jsp" onsubmit="return validateform()" >  
Employee-id <input type="text" name="empid" required=""><br/>  
Employee name: <input type="text" name="name" required=""><br/>  
Password: <input type="password" name="password" required=""><br/> 
Department:<input type="text" name="department" required=""></br>
Designation:<input type="text" name="designation" required=""></br>
Mobile Number:<input type="text" name="mobile" required=""></br>


<input type="submit" value="register">  
</form>  
</body>
</html>
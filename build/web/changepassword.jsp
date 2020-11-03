<%-- 
    Document   : changepassword
    Created on : 22-May-2020, 22:48:02
    Author     : Gaurab Pokharel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" type="text/css" href="css/userstyle.css">
        <title>Change password</title>
        <script type="text/javascript"> 
          
            
            function validation() { 
var a = document.form.username.value;
	if(a=="")
	{
		alert("Please Enter Username");
		document.form.username.focus();
		return false;
	}

	if ((a.length < 5) || (a.length > 15))
	{
		alert("Your Username Characters must be 5 to 15");
		document.form.username.select();
		return false;
	}
               var b=document.form.newpassword.value;
	if((b.length<5)||(b.length>15))
	{
		alert(" Password must be 5-15 characters long ");
		document.form.newpassword.select();
		return false;
            } 
}
        </script> 
    </head>
    <body >
       
        
        <form name="form" onsubmit="return validation()" action="changePassword" method="post">
            <div class="bgimg">
                <div class="centerdiv" style="height: 370px ;" >
                    <h1 style="text-align: center;margin-bottom:9px;padding-top: 20px">Change Password</h1>

                    <table align="center" border="0" cellspacing="15" style="margin-bottom: 20px;">
                        <tr>
                            <td><input type="text" name="username" placeholder="Username" id="box"></td>
                        </tr>
                        <tr>

                            <td><input type="password" name="oldpassword" placeholder="Old Password" id="box"></td>
                        </tr>
                        <tr>

                            <td><input type="password" name="newpassword" placeholder="New Password" id="box"></td>
                        </tr>
                       
                        <tr style="padding-bottom: 10px;"> <td align="center" ><input type="submit" value="Submit" id="btn"> </td>
                        </tr>
                        <tr><td><a href="userDashboard.jsp" style="color: white;text-decoration: none;font-size: 20px;padding-left: 110px;">Back</a></td></tr>
                       
                    </table>
                </div>
            </div>
                    </form>

    </body>
</html>

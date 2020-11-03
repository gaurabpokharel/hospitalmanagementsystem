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
        <title>New password</title>
    </head>
    <body >
       
        <form action="newPassword" method="post">
            <div class="bgimg">
                <div class="centerdiv" style="height: 350px ;" >
                    <h1 style="text-align: center;margin-bottom:9px;padding-top: 20px">New Password</h1><hr>

                    <table align="center" border="0" cellspacing="15" style="margin-bottom: 20px;">
                        <tr>
                            <td><input type="text" name="username" placeholder="Username" id="box"></td>
                        </tr>
                        <tr>

                            <td><input type="Password" name="newPassword" placeholder="New Password" id="box"></td>
                        </tr>
                        
                       
                        <tr style="padding-bottom: 10px;"> <td align="center" ><input type="submit" value=Confirm id="btn" style="width: 100px"> </td>
                        </tr>
                        
                       
                    </table>
                </div>
            </div>
                    </form>

    </body>
</html>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blood Donation Form</title>
        <link rel="stylesheet" type="text/css" href="css/userblood.css?ver=100">
        <script src="https://kit.fontawesome.com/a076d05399.js">     </script>
        <script type="text/javascript">
            function validation() 
            {
                
                var x = document.form.email.value;
                var atposition = x.indexOf("@");
                var dotposition = x.lastIndexOf(".");
                if (atposition < 1 || dotposition < atposition + 2 || dotposition + 2 >= x.length) 
                {
                    alert("Please enter a valid e-mail address");
                    document.form.email.select();
                    return false;
                }
                
                var num = document.form.pnumber.value;
                if (isNaN(num))
                {
                    alert("Please insert your phone number in 10 digit");
                    document.form.pnumber.select();
                    return false;
                }
                else
                {
                    if (num.length == 10)
                        return true;
                    else
                    {
                        alert("Enter 10 digit numeric value only");
                        document.form.pnumber.select();
                        return false;
                    }
                }
                
            }
            </script>
   
    </head>
    <body>
        <form name="form" onsubmit="return validation()" method="post" action="blooddonation">

           
            <div class="bgimg" style="background-image:url('img/blooddonation.jpg');">
                <div class="centerdiv">
                    <i class='fas fa-tint' style='font-size:48px;color: red;padding-left: 230px;padding-top: 20px;margin-bottom: 10px' ></i>
                    <h1 style="text-align: center">BLOOD DONATION FORM</h1>
                    <table align="center" border="0" cellspacing="15">
                        <tr><td>First name</td><td> <input type="text" name="fname" required id="box"/></td></tr>
                        <tr><td>Last name</td><td><input type="text" name="lname" required id="box"/></td></tr>
                        <tr><td>Address</td><td><input type="text" name="address" required id="box"/></td></tr>
                        <tr><td>Phone Number</td><td><input type="text" name="pnumber" required id="box"/></td></tr>
                        <% 
                               String email=(String)session.getAttribute("email");
                        %>
                        <tr><td>Email</td><td><input type="email" name="email" value="<%= email %>"  id="box"></td></tr>
                        <tr><td>Date of Birth</td><td><input type="date" name="dob" required id="box"/></td></tr>
                        <tr><td>Blood group</td><td><input type="text" name="bgroup" required id="box"/></td></tr>
                        <tr><td align="center" colspan="2"><input type="submit" value="Submit" id="btn"></td></tr>
                    </table>
                </div>
            </div>
        </form>
    </body>
</html>

<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Create a new account</title>
        <link rel="stylesheet" type="text/css" href="css/useraccountstyle.css">
        <script>
            function validation() {
                var a = document.form.username.value;
                if ((a.length < 5) || (a.length > 15))
                {
                    alert("Your Username Characters must be 5 to 15");
                    document.form.username.select();
                    return false;
                }
                if ((a.length > 5) || (a.length < 15))
                {
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?", "root", "");

                    Statement statement = connection.createStatement();

                    ResultSet resultset = statement.executeQuery("select * from userlogin");
                    while (resultset.next()) {
            %>
            <%=resultset.getString(4)%> alert("anc");
            <%
                    }
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>

                }


                var b = document.form.password.value;
                if ((b.length < 5) || (b.length > 15))
                {
                    alert(" Password must be 5-15 characters long ");
                    document.form.password.select();
                    return false;
                }

                var x = document.form.email.value;
                var atposition = x.indexOf("@");
                var dotposition = x.lastIndexOf(".");
                if (atposition < 1 || dotposition < atposition + 2 || dotposition + 2 >= x.length)
                {
                    alert("Please enter a valid e-mail address");
                    document.form.email.select();
                    return false;
                }


                var num = document.form.phonenumber.value;
                if (isNaN(num))
                {
                    alert("Enter 10 digit numeric value only");
                    document.form.phonenumber.select();
                    return false;
                }
                else
                {
                    if (num.length == 10)
                        return true;
                    else
                    {
                        alert("Enter 10 digit numeric value only");
                        document.form.phonenumber.select();
                        return false;
                    }

                }


            }
            function myFunction() {
                var x = document.getElementById("password1");
                if (x.type === "password") {
                    x.type = "text";
                } else {
                    x.type = "password";
                }
            }
        </script>


    </head>
    <body>
        <form name="form" onsubmit="return validation()" action="adduser" method="post">

            <h1 style="text-align: center">Please   register</h1>
            <table align="center" border="0" cellspacing="15">
                <tr>
                    <td> First Name<span class="required" style="color:red;font-size:20px;">*</span></td>
                    <td><input type="text" placeholder="First Name" name="firstname" required></td>
                </tr>
                <tr>
                    <td> Last Name<span class="required" style="color:red;font-size:20px;">*</span></td>
                    <td><input type="text" placeholder="Last Name" name="lastname" required></td>
                </tr>
                <tr>
                    <td> User Name<span class="required" style="color:red;font-size:20px;">*</span></td>
                    <td><input type="text" placeholder="User name" name="username" required></td>
                </tr>
                <tr>
                    <td>Password<span class="required" style="color:red;font-size:20px;">*</span></td>
                    <td><input type="password" placeholder="Password" name="password" id="password1" required></td>
                </tr>
                <tr><td></td><td><input type="checkbox" onclick="myFunction()">Show Password</td></tr>
                <tr>
                    <td>Email<span class="required" style="color:red;font-size:20px;">*</span></td>
                    <td><input type="email" name="email" placeholder="abc@gmail.com" required></td>
                </tr>
                <tr>
                    <td>Gender<span class="required" style="color:red;font-size:20px;">*</span></td>
                    <td> <select style="width:175px; text-align: center;"><option> ---Select--- </option> <option> Male </option> <option> Female </option> <option> Other </option> </select></td>
                </tr>
                <tr>    
                    <td> Date of Birth<span class="required" style="color:red;font-size:20px;">*</span></td>
                    <td><input type="date" name="DOB" placeholder="DD/MM/YYYY" style="width:170px;font-size: 15px" required></td>
                </tr>
                <tr>
                    <td>Phone Number <span class="required" style="color:red;font-size:20px;">*</span></td><td>
                        <input type="text" name="phonenumber" placeholder="98********" required></td>
                </tr>
                <tr> <td align="center" colspan="2"><input type="submit" value="Submit" id="btn"/>  </td></tr>

            </table>
        </form>


    </body>
</html>


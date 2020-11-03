<%-- 
    Document   : doctoreditprofile
    Created on : Aug 15, 2020, 7:27:37 PM
    Author     : gaura
--%>

<%@page import="java.sql.*"%>
<%@page import="com.info.dao.doctorDao"%>
<%@page import="com.info.method.doctorBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <script>
            function validation() {
                var b = document.form.fullname.value;
                if (b == "")
                {
                    alert("Please Enter Name");
                    document.form.fullname.focus();
                    return false;
                }
                
                var a = document.form.dusername.value;
                if (a == "")
                {
                    alert("Please Enter Username");
                    document.form.dusername.focus();
                    return false;
                }

                if ((a.length < 5) || (a.length > 15))
                {
                    alert("Your Username Characters must be 5 to 15");
                    document.form.dusername.select();
                    return false;
                }
                
                    var b = document.form.dpassword.value;
                 if ((b.length < 5) || (b.length > 15))
                {
                    alert(" Password must be 5-15 characters long ");
                    document.form.dpassword.select();
                    return false;
                }
                
                var x = document.form.demail.value;
                var atposition = x.indexOf("@");
                var dotposition = x.lastIndexOf(".");
                if (atposition < 1 || dotposition < atposition + 2 || dotposition + 2 >= x.length)
                {
                    alert("Please enter a valid e-mail address");
                    document.form.demail.select();
                    return false;
                }
               var num = document.form.dphonenumber.value;
                if (isNaN(num))
                {
                    alert("Enter 10 digit numeric value only");
                    document.form.dphonenumber.select();
                    return false;
                }
                else
                {
                    if (num.length == 10)
                        return true;
                    else
                    {
                        alert("Enter 10 digit numeric value only");
                        document.form.dphonenumber.select();
                        return false;
                    }
                }
                
               
            }
        </script>
        
    </head>
    <body>
        
<%          
        String id=(String)session.getAttribute("id");
       int inum = Integer.parseInt(id);
doctorBean u=doctorDao.getRecordById(Integer.parseInt(id));  
%>
        <form name="form" onsubmit="return validation()" action="editDoctorProfile" method="post">

            <h2 style="text-align: center">Edit Profile</h2>
            <table align="center" border="0" cellspacing="15" style="margin-left: 250px;">
                <tr>
                    <td>Id<span class="required" style="color:red;font-size:20px;">*</span></td>
                    <td><input type="text" name="id" value="<%=inum %>" required></td>
                </tr>
                <tr>
                    <td> Full Name<span class="required" style="color:red;font-size:20px;">*</span></td>
                    <td><input type="text" placeholder="Full Name" name="fullname" value="<%=u.getFullname() %>" required></td>
                </tr>
                <tr>
                    <td>Email<span class="required" style="color:red;font-size:20px;">*</span></td>
                    <td><input type="email" name="demail" value="<%=u.getEmail()%>" required></td>
                </tr>
                
                
                <tr>
                    <td>Phone Number <span class="required" style="color:red;font-size:20px;">*</span></td><td>
                        <input type="text" name="dphonenumber" value="<%=u.getPhonenumber() %>" required></td>
                </tr>
                <tr>
                    <td> <label>Select Department</label><span style="color:red;font-size:20px;">*</span></td>
                    <td>
                        <select value="<%=u.getDepartment() %>" name="department" id="department" style="height: 25px; width: 176px">
                            
                            <%ResultSet resultset = null;%>
                            <%
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?", "root", "");

                                    Statement statement = connection.createStatement();

                                    resultset = statement.executeQuery("select * from department");
                                } catch (Exception e) {

                                }
                            %>
                            <%  while (resultset.next()) {%>

                            <option><%= resultset.getString(1)%></option>
                            <% }%>
                        </select> 
                    </td>
                </tr> 
                <tr> <td align="center" colspan="2"><input type="submit" value="Submit" id="btn"/>  </td></tr>

            </table>
        </form>
        
    </body>
</html>

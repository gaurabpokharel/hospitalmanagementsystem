
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>



<html>
    <head>
        <title>Appointment</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/appointmentstyle.css">
        <script>
            // request permission on page load
            document.addEventListener('DOMContentLoaded', function () {
                if (!Notification) {
                    alert('Desktop notifications not available in your browser. Try Chromium.');
                    return;
                }

                if (Notification.permission !== 'granted')
                    Notification.requestPermission();
            });


            function Notify() {
                if (Notification.permission !== 'granted')
                    Notification.requestPermission();
                else {
                    var notification = new Notification('Hospital', {
                        icon: '<i class="fa fa-h-square" style="font-size:48px;color:red"></i>',
                        body: 'If appointment is done\n\
Please Check your email'
                    });

                    notification.onclick = function (event)
                    {
                        event.preventDefault();
                        window.open('http://www.gmail.com/', '_blank');
                    }
                }
            }
function validation(){

var num=document.form.pnumber.value;  
if (isNaN(num))
{  
alert("Enter 13 digit numeric value only for phone number");
document.form.pnumber.select();
return false;  
}
else
{
if(num.length==13)
return true;
else
{
alert("Enter 10 digit numeric value only for phone number");
document.form.pnumber.select();
return false;
}
}
}

        </script>
    </head>
    <body>
 <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

            if (session.getAttribute("email") == null) 
                response.sendRedirect("userlogin.jsp");
            
        %>
        <form name="form" onsubmit="return validation()" method="post" action="appointment" enctype = "multipart/form-data">


            <div class="bgimg" style="background-image:url('img/appointment.jpg');">
                <div class="centerdiv" >
                    <h1 align="center" style="padding-top:10px;"> <label >MAKE AN APPOINTMENT</label></h1>
                    <table align="center" border="0" cellspacing="15">



                        <tr>

                            <td><label>Patient Name</label><span  style="color:red;font-size:20px;">*</span></td>
                            <td><input type="text" name="pname" placeholder="Patient Name" id="box" required></td>

                        </tr>



                        <tr>
                            <td style="padding-bottom: 30px"><label>Medical Documents</label></td>

                            <td style="padding-top: 20px"><input type="file" name="document">
                                <p>Upload relevant documents here for
                                    better care.</p></td>
                        </tr>
                        <tr>
                        <tr>
                            <td><label>Phone Number</label><span  style="color:red;font-size:20px;">*</span></td>
                            <td>
                                <input type="text" placeholder="Phone number" name="pnumber" value="977" id="box"></td>


                        </tr>
                        <tr>
                            <% 
                               String email=(String)session.getAttribute("email");
                           %>
                            <td><label> Email</label></td>
                            <td>
                                <input type="text" placeholder="Email Id" value="<%= email %>" name="email" id="box"></td>
                        </tr>
                        <tr>
                            <th><hr style="width: 150px;"></th>
                        <th><hr style="width: 200px;"></th>
                        </tr>

                        <tr>
                            <td></td>
                            <td style="font-size: 20px">Schedule Information</td>
                        </tr>
                        <tr>
                            <td> <label>Select Department</label><span style="color:red;font-size:20px;">*</span></td>
                            <td>
                                <select  name="department" id="department" style="height: 32px; width: 258px" onchange="return change()" required>
                                    <option value="">--Select Department--</option>
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

                                    <option><%= resultset.getString(1) %></option>
                                    <% } %>
                                </select> 
                            </td>
                        </tr>

                        <tr>

                            <td> <label>Doctor Name:</label><span style="color:red;font-size:20px;">*</span></td>
                            <td>
                                <input type="text" name="doctor" placeholder="Doctor full Name" id="box">
                            </td>
                        </tr>
                        <tr>

                            <td><label>Preferred Date of Appointment</label><span  style="color:red;font-size:20px;">*</span></td>

                            <td><input type="date" name="apdate" required id="box"></td>

                        </tr>
                        <tr>

                            <td><label>Preferred Time</label><span  style="color:red;font-size:20px;">*</span></td>

                            <td><select  name="atime" required id="box">
                                    <option>10 am to 12 pm</option>
                                    <option>12 pm to 2 pm</option>
                                    <option>2 pm to 4pm</option>
                                    
                                </select>
                                
                            </td>

                        </tr>


                        <tr>
                            <td align="center" colspan="2"> <button type="submit" id="btn" onclick="Notify()" >Make an Appointment</button></td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2"> <a href="index.jsp">Back to the home page</a></td></tr>
                        <tr>
                            <td align="center" colspan="2"> <a href="userDashboard.jsp">Back to the Dashboard</a></td></tr>
                    </table>


                </div>
            </div>
        </form>
    </body>
</html>

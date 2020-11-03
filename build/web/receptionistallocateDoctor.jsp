    <%@page import="com.info.servlet.aa"%>
<!DOCTYPE html>  
    <%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<%
    try{
 Class.forName("com.mysql.jdbc.Driver");
Connection connection =DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?", "root", "");

       Statement statement = connection.createStatement() ;

       resultset =statement.executeQuery("select * from doctor") ;
    }catch(Exception e)
    {
        
    }
%>
<html>  
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> 
        
         <link rel="stylesheet" type="text/css" href="css/appointmentstyle.css?ver=100">
        <title>Allocate Doctor</title>  
    </head>  
    <body style="background-color: whitesmoke">  
        <%@page import="com.info.dao.*,com.info.method.*"%>  
        <hr>
        <%
            String id = request.getParameter("id");
            appointmentbean u = appointmentDao.getRecordById(Integer.parseInt(id));
        %>
        <div style="background-image:url('img/appointment.jpg'); width: 100%; height: 110vh">
                <div class="" style=" margin-top: 40px;  width: 500px;  height:650px;  position: absolute; left: 30%;
                opacity:0.9; background-color:  rgb(95, 157, 199);box-shadow: 0 1px 6px rgba(0, 0, 0, 0.12), 0 1px 4px rgba(0, 0, 0, 0.24);" >
                    <h1 align="center" style="padding-top:10px;"> <label >Allocate Doctor and Date</label></h1>
        <form action="allocateFinalDateEmail" method="post" > 
            <table>  
                <tr><td>Appointment id:</td><td>  
                        <input type="number" name="id" value="<%=u.getId()%>" id="box"/>  </td></tr> 
                <tr><td>Name:</td><td>  
                        <input type="text" name="pname" value="<%= u.getPname()%>" id="box"/></td></tr>  
                <tr><td>Appointment title:</td><td>  
                        <input type="text" name="aptitle" value="<%= u.getAptitle()%>" id="box"/></td></tr>  
                <tr><td>Preferred Date:</td><td>  
                        <input type="date" name="apdate" value="<%= u.getApdate()%>" id="box"/></td></tr>  
                <tr><td>Symptoms:</td><td>  
                        <input type="text" name="symptoms" value="<%= u.getSymptoms()%>" id="box"/></td></tr>
                <tr><td>Suspected disease:</td><td>  
                        <input type="text" name="disease" value="<%= u.getDisease()%>" id="box"/></td></tr>
                <tr><td>Email:</td><td>  
                        <input type="text" name="email" value="<%= u.getEmail()%>" id="box"/></td></tr>
                <tr><td>Phone Number:</td><td>  
                        <input type="text" name="pnumber" value="<%= u.getPnumber()%>" id="box"/></td></tr>
                
                <tr><td>Department:</td>  
                    <td> <select name="department" style="height: 32px; width: 258px">
                         <option>--Select Department--</option>
                         <%
    try{
 Class.forName("com.mysql.jdbc.Driver");
Connection connection =DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?", "root", "");

       Statement statement = connection.createStatement() ;

       resultset =statement.executeQuery("select * from department") ;
    }catch(Exception e)
    {
        
    }
%>
        <%  while(resultset.next()){ %>
        
            <option><%= resultset.getString(1)%></option>
        <% } %>
        </select> 
                    </td> </tr>

                        <tr>

                            <td> <label>Doctor Name:</label><span style="color:red;font-size:20px;">*</span></td>
                            <td>
                                <input type="text" name="doctor" placeholder="Doctor full Name" id="box">
                            </td>
                        </tr>
                <tr><td>Doctor id:</td><td>  
                        <input type="text" name="doctorid" placeholder="Doctor ID" id="box"/></td></tr>
                <tr><td>Allocation Date:</td><td>  
                        <input type="date" name="fdate" id="box"/></td></tr>
                <tr><td>Allocation Time:</td><td>  
                        <input type="time" name="time" id="box"/></td></tr>
                <td align="center" style="padding-top: 10px;" colspan="2">
                <button style="margin-left: 80px;font-weight: bold;color: black;font-size: 18px; width: 200px" type="submit" id="btn" >Submit</button></td>  
            </table>
     
        </form>  
                </div>
        </div>
    </body>  
</html>  
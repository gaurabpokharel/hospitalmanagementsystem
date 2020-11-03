    <!DOCTYPE html>  
 
<html>  
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> 
        
         <link rel="stylesheet" type="text/css" href="css/appointmentstyle.css?ver=100">
        <title>Confirm Appointment</title>  
    </head>  
    <body style="background-color: whitesmoke">  
        <%@page import="com.info.dao.*,com.info.method.*"%>  
        <hr>
        <%
            String id = request.getParameter("id");
            appointmentbean u = appointmentDao.getRecordById(Integer.parseInt(id));
        %>
        <div style="background-image:url('img/appointment.jpg'); width: 100%; height: 100vh">
                <div class="" style=" margin-top: 40px;  width: 500px;  height:600px;  position: absolute; left: 30%;
                opacity:0.9; background-color:  rgb(95, 157, 199);box-shadow: 0 1px 6px rgba(0, 0, 0, 0.12), 0 1px 4px rgba(0, 0, 0, 0.24);" >
                    <h1 align="center" style="padding-top:10px;"> <label >Confirm Appointment</label></h1>
        <form action="allocateFinalDateEmail" method="post" > 

            <table style="margin-left: 40px">  
                <tr><td>Appointment id:</td><td>  
                        <input type="number" name="id" value="<%=u.getId()%>" id="box"/>  </td></tr> 
                <tr><td>Name:</td><td>  
                        <input type="text" name="pname" value="<%= u.getPname()%>" id="box"/></td></tr>  
               <tr><td>Preferred Date:</td><td>  
                        <input type="date" name="apdate" value="<%= u.getApdate()%>" id="box"/></td></tr>  
                <tr><td>Preferred time:</td><td>  
                        <input type="text" name="atime" value="<%= u.getAtime()%>" id="box"/></td></tr>
                <tr><td>Email:</td><td>  
                        <input type="text" name="email" value="<%= u.getEmail()%>" id="box"/></td></tr>
                <tr><td>Department:</td>  
                    <td> 
                        <input type="text" name="department" value="<%= u.getDepartment()%>" id="box"/>
                    </td> </tr>
                <tr><td>Doctor:</td><td>  
                     <input type="text" name="doctor" value="<%= u.getDoctor()%>" id="box"/>
                       
                    </td></tr>
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

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctor Dashboard</title>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <style type="text/css">
            #class
            {
               margin-left :10px; height: 170px;width: 240px; font-size:25px;background-color:#034C83; 
                  border-radius: 45px;
               border-color: black;
               color: white;
            }
        </style>
        <style>
            .header{
                height:80px;
                font-size:40px;
                text-align:center;
                line-height:30px;
                box-shadow:0 2px 4px black;
            }
        </style>
        <link rel="stylesheet" href="css/imgdropdown.css">
    </head>
    <body style="background-color:#ecf5ff">
     <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
            
            if(session.getAttribute("demail")==null)
                response.sendRedirect("doctorLogin.jsp");
            %> 
            
         <div class="header"><br>Doctor Dashboard
            <div class="dropdown" style="float: right;font-size: 17px">
                <img src="img/doctor.png" style="margin-top:-15px; margin-right: 80px;height: 60px; width: 60px">
                <div class="dropdown-content" style="font-size:15px">
                    <a href="staffLogout">Logout</a>
                    <a href="doctorchangepassword.jsp">Change Password</a>
                    <a href="doctoreditprofile.jsp">Edit Profile</a>
                </div>
            </div>
            </div>
         <div style="margin-top: 20px">
        <form>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <button formaction="doctorAppointment.jsp" style="margin-left: 320px" id="class"><i style="font-size:62px" class="fa fa-calendar"></i><br><hr>
                View Appointment Request</button> &nbsp;&nbsp;

                <button formaction="doctorlabreport.jsp" style="margin-left: 20px" id="class"><i style="font-size:65px;" class="fa fa-address-card-o"></i><br><hr>

                View Lab<br> Report</button><br><br>
        </form>
         </div>

    </body>
</html>

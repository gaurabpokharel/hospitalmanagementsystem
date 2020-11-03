<%@page import="java.sql.*"%>
<%@page import="com.info.dao.*,com.info.method.*,java.util.*"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Request List</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
        <link href="css/userstyle.css?ver=100" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/receptionist-styles.css">


    </head>
    <body style="color: black; background-color: #ecf5ff">



        <div class="recep-dashboard" onclick="window.open('receptionistDashboard.jsp','_top')">
           <br> Receptionist Dashboard
             <div style="float: right;margin-top:-10px; margin-right: 20px">
        <form action="staffLogout">
            <button style="font-weight: 700;height:30px;width: 80px;border-radius: 20px;color: white;background-color: #FD6001 ">Logout</button>
        </form>
    </div>
        </div>
        <div class="container">
            <div class="side-bar" id="side-bar" style="color: white;background-color: #207dff">
                <div class="side-bar-item active" onclick="window.open('receptionistbookinglist.jsp','_top')">
                    (   <%                    try {
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "");
                        Statement st = con.createStatement();
                        String strQuery = "SELECT COUNT(*) FROM appointment WHERE doctor is NULL";
                        ResultSet rs = st.executeQuery(strQuery);
                        String Countrow = "";
                        while (rs.next()) {
                            Countrow = rs.getString(1);
                            out.println(Countrow);
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>)
                    <i class="fa fa-calendar"></i>Booking Request</div>
                <div class="side-bar-item cursor" onclick="window.open('receptionistappointmentlist.jsp','_top')">
                     (   <%                    try {
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "");
                        Statement st = con.createStatement();
                        String strQuery = "SELECT COUNT(*) FROM appointment WHERE doctorid is NULL and doctor IS NOT NULL";
                        ResultSet rs = st.executeQuery(strQuery);
                        String Countrow = "";
                        while (rs.next()) {
                            Countrow = rs.getString(1);
                            out.println(Countrow);
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>)
                    <i class="fa fa-calendar"></i>Appointment Request</div>
               
                    <div class="side-bar-item cursor" onclick="window.open('receptionistassignedBookingList.jsp','_top')">
                    (   <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "");
                        Statement st = con.createStatement();
                        String strQuery = "SELECT COUNT(*) FROM appointment WHERE doctor IS NOT NULL and doctorid IS NOT NULL and aptitle IS NOT NULL";
                        ResultSet rs = st.executeQuery(strQuery);
                        String Countrow = "";
                        while (rs.next()) {
                            Countrow = rs.getString(1);
                            out.println(Countrow);
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>)
                   &nbsp;&nbsp;&nbsp; <i class="fa fa-check"></i><i class="fa fa-calendar"></i>Confirmed Booking</div>
                <div class="side-bar-item cursor"  onclick="window.open('receptionistassignedAppointmentList.jsp','_top')" >
                    (   <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "");
                        Statement st = con.createStatement();
                        String strQuery = "SELECT COUNT(*) FROM appointment WHERE doctor IS NOT NULL and doctorid IS NOT NULL and aptitle IS NULL";
                        ResultSet rs = st.executeQuery(strQuery);
                        String Countrow = "";
                        while (rs.next()) {
                            Countrow = rs.getString(1);
                            out.println(Countrow);
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>)
                   &nbsp;&nbsp;&nbsp; <i class="fa fa-check"></i><i class="fa fa-calendar"></i>Confirmed Appointment</div>
                <div class="side-bar-item cursor"  onclick="window.open('appointment.jsp','_top')" ><i class="fa fa-user-plus"></i>Add New Appointment</div>
                



                        </div>
           
            <div class="body-content">
                <div class="top-header">Booking List</div>

                <%
                List<appointmentbean> list = appointmentDao.getReceptionistAllRecords();
                request.setAttribute("list", list);
            %> 
            
            <table border="1" width="90%" style="text-align: center;color:#0e4ca3">  
                <tr><th>Id</th><th>Patient Name</th><th>Appointment title</th><th>Preferred date</th>  
                    <th>Symptoms</th><th>Suspected Disease</th><th>Email</th><th>Phone Number</th><th>Allocate Doctor</th> <th>Delete</th>
                        <c:forEach items="${list}" var="u"> 
                    <tr><td>${u.getId()}</td><td>${u.getPname()}</td><td>${u.getAptitle()}</td>  
                        <td>${u.getApdate()}</td><td>${u.getSymptoms()}</td><td>${u.getDisease()}</td>
                        <td>${u.getEmail()}</td><td>${u.getPnumber()}</td> 
                        <td><a href="receptionistallocateDoctor.jsp?id=${u.getId()}" style="color:#0e4ca3">Allocate</a></td>
                        <td><a href="receptionistdeleteappointment.jsp?id=${u.getId()}" style="color:#0e4ca3">Delete</a></td>
                        
                    </c:forEach>  
            </table> 

                
                </div>
            <script>
                    
            let sideBar = document.getElementById("side-bar");
            sideBar.style.minHeight = window.innerHeight - 80 + "px";
                </script>
    </body>
</html>

    
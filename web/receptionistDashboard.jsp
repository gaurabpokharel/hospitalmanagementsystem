<%-- 
Document   : receptionist
Created on : 30-Apr-2020, 00:22:46
Author     : Gaurab Pokharel
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Receptionist Page</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/userstyle.css?ver=100" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/receptionist-styles.css">
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

    </head>
    <body style="background-color:#ecf5ff">
        
        
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

            if (session.getAttribute("username") == null) {
                response.sendRedirect("stafflogin.jsp");
            }
        %>
     

            <div class="recep-dashboard" style="color:black"><br>Receptionist Dashboard
             <div class="dropdown" style="float: right">
                <img src="img/receptionist1.png" style="margin-top: -10px;margin-right: 80px;height: 50px; width: 50px">
                <div class="dropdown-content">
                    <a href="staffLogout">Logout</a>
                    <a href="staffchangepassword.jsp">Change Password</a>
                </div>
            </div>
            </div>
        <div class="container">
            <div class="side-bar" id="side-bar" style="background-color: #207dff">
                <div class="side-bar-item cursor" onclick="window.open('receptionistbookinglist.jsp','_top')">
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
                <div class="side-bar-item cursor" onclick="window.open('appointment.jsp','_top')"><i class="fa fa-user-plus"></i>Add New Appointment</div>
            



                        </div>
            <div class="body-content container">
                <div class="container" style="font-weight:bolder;margin-bottom:30px;">
                    <span style="font-size:1.1em;padding:5px 10px; margin-right:30px;color:black">Calendar:</span>
                    <span class="cursor" style="padding:5px 10px;margin-right:20px;text-decoration:underline;color:black" onclick="toggleClass('nep')">Nepali</span>
                    <span class="cursor" style="padding:5px 10px;text-decoration:underline;color:black" onclick="toggleClass('eng')">English</span>
                </div>
                <iframe class="toggle show" src="https://www.hamropatro.com/widgets/calender-medium.php" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" style="border:none; overflow:hidden; width:295px; height:385px;" allowtransparency="true"></iframe>
                <iframe class="toggle hidden" src="https://calendar.google.com/calendar/embed?height=400&amp;wkst=1&amp;bgcolor=%23795548&amp;ctz=Asia%2FKathmandu&amp;src=cHE4b2NrbG02OWNtOGNsY3RsYm1lZ2F0MjBAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ&amp;color=%23F09300&amp;showTitle=0&amp;showNav=1&amp;showPrint=0&amp;showTz=1&amp;title=Calendar&amp;showTabs=0" style="border-width:0" width="295" height="385" frameborder="0" scrolling="no"></iframe>
            </div>
        </div>
       
               
                 <script>
            let sideBar = document.getElementById("side-bar");
            sideBar.style.minHeight = window.innerHeight - 80 + "px";
            function toggleClass(lang){
                let element = document.getElementsByClassName("toggle");
                let element1 = element[0];
                let element2 = element[1];
                if(lang === "nep" && element1.classList.contains("hidden")){
                    element1.classList.value = "toggle show";
                    element2.classList.value = "toggle hidden";
                }else if(lang === "eng" && element2.classList.contains("hidden")){
                    element1.classList.value = "toggle hidden";
                    element2.classList.value = "toggle show";
                }
            }
        </script>
    </body>
</html>

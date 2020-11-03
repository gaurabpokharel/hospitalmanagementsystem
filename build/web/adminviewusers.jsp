<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.info.dao.userDao"%>
<%@page import="com.info.method.userbean"%>
<!DOCTYPE html>  

<html>  
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
        <title>View Users</title>  
   </script>
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <style type="text/css">
          *{
              box-sizing:border-box;
              padding:0;
              margin:0;
          }
          body{
              background-color:#ebeff5;
              color:#0e4ca3;
              font-family:'Roboto',sans-serif;
          }
          .container{
              display:flex;
          }
          .first-item{
              flex:1;
              min-width:200px;
          }
          .second-item{
              padding:5px;
              flex:4;
          }
          .header{
              height:80px;
              font-size:28px;
              text-align:center;
              line-height:80px;
              box-shadow:0 2px 4px black;
          }
          .side-bar{
              flex-direction:column;
              border-right:1px solid black;
          }
          .side-bar .item{
              min-height:60px;
              line-height:60px;
              min-width:200px;
              cursor:pointer;
              justify-content:space-between;
          }
          .item.cursor, .sub-item.cursor, .toggle-item.cursor{
              padding-left:30px;
          }
          .sub-item .container{
              justify-content:space-around;
          }
          .sub-item i{
              margin-top:10px;
          }
          .toggle-item.cursor{
              font-size:12px;
              height:40px;
              line-height:40px;
          }
          .cursor{
              cursor:pointer;
          }
          .cursor:hover{
              background-color:#b6bec9;
          }
          .hide{
              display:none;
          }
          .show{
              display:block;
          }
          .arrow.up{
            transform:rotate(90deg);
          }
          .show-on-hover{
              display:none;
          }
        </style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

            if (session.getAttribute("username") == null) {
                response.sendRedirect("stafflogin.jsp");
            }

        %>
         <%@page import="java.util.*"%>  
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<div class="header" onclick="window.open('adminDashboard.jsp','_top')">Admin Dashboard
<div style="float: right; margin-right: 20px">
        <form action="staffLogout">
            <button style="font-weight: 700;height:30px;width: 80px;border-radius: 20px;color: white;background-color: #FD6001 ">Logout</button>
        </form>
    </div></div>

            <div class="container">
                <div class="first-item side-bar container">
                    <div class="item">
                        <div class="sub-item cursor container" onclick="toggle(0)">
                            <i style="font-size:30px" class="fa fa-user-plus"></i>&nbsp;
                            <div class="container">
                                <div>Add new list</div>
                                <div class="arrow">&nbsp;></div>
                            </div>
                        </div>
                        <div class="hide">
                            <div class="toggle-item cursor" onclick="window.open('adminadddoctor.jsp','_top')">-> Add new Doctor</div>
                            <div class="toggle-item cursor" onclick="window.open('adminaddstaff.jsp','_top')">-> Add new Staff</div>
                            <div class="toggle-item cursor" onclick="window.open('adminadddepartment.jsp','_top')" style="border-bottom:1px solid black;">-> Add new Department</div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="sub-item cursor container" onclick="toggle(1)">
                            <i style="font-size:30px" class='fas fa-user-tie'></i>&nbsp;
                            <div class="container">
                                <div>View list</div>
                                <div class="arrow"> &nbsp;></div>
                            </div>
                        </div>
                         <div class="hide">
                            <div class="toggle-item cursor" onclick="window.open('adminviewdoctorlist.jsp','_top')">-> View Doctor</div>
                            <div class="toggle-item cursor" onclick="window.open('adminviewusers.jsp','_top')">-> View User</div>
                            <div class="toggle-item cursor" style="border-bottom:1px solid black;" onclick="window.open('adminviewstafflist.jsp','_top')">-> View Staff</div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="sub-item cursor container" onclick="toggle(2)">
                            <i style="font-size:30px" class="fa fa-database"></i>&nbsp;
                            <div class="container">
                                <div>Backup Data</div>
                                <div class="arrow">&nbsp;></div>
                            </div>
                        </div>
                        <div class="hide">
                            <div class="toggle-item cursor" onclick="window.open('adminbackupofblooddonor.jsp','_top')" >-> Blood Donor</div>
                            <div class="toggle-item cursor" onclick="window.open('adminbackupofdoctor.jsp','_top')">-> Doctor</div>
                            <div class="toggle-item cursor" onclick="window.open('adminbackupofpatient.jsp','_top')">-> Patient</div>
                            <div class="toggle-item cursor" style="border-bottom:1px solid black;" onclick="window.open('adminbackupofstaff.jsp','_top')">-> Staff</div>
                        </div>
                    </div>
                    <div class="item cursor" onclick="window.open('admintodayappointmentlist.jsp','_top')"><i style="font-size:30px" class="fa fa-user"></i> In Patient</div>
                    <div class="item cursor" onclick="window.open('adminviewappointment.jsp','_top')"><i style="font-size:30px" class="fas fa-user-check"></i> Out Patient</div>
                    <div class="item cursor" onclick="window.open('admindetailforqrcode.jsp','_top')"><img src="img/qr.png" style="width: 30px;height: 30px;"> QR-code</div>
                <div class="item">
                        <div class="sub-item cursor container" onclick="toggle(3)">
                            <i style="font-size:30px" class=""></i>&nbsp;
                            <div class="container">
                                <div>   <img src="img/statistics.png" style="width: 30px;height: 30px;"> Data Visualization</div>
                                <div class="arrow">&nbsp;></div>
                            </div>
                        </div>
                        <div class="hide">
                            <div class="toggle-item cursor" style="border-bottom:1px solid black;" onclick="window.open('adminpiechart.jsp','_top')" >-> According to Department</div>
                        </div>
                    </div>
                </div>
                <div class="second-item" style="margin-left: 50px;">
       
        <h1 style="text-align: center">Users List</h1><hr style="width:75%; height:4px;background-color: black">  

        <%
            List<userbean> list = userDao.getAllRecords();
            request.setAttribute("list", list);
        %>  

        <table border="1" width="90%" style="text-align: center;margin-left: 5%">  
            <tr><th>Id</th><th>First Name</th><th>Last name</th><th>User name</th>  
                <th>Password</th><th>Email</th><th>Phone number</th><th>Delete</th></tr>  
                    <c:forEach items="${list}" var="u">  
                <tr><td>${u.getId()}</td><td>${u.getfirstname()}</td><td>${u.getlastname()}</td> <td>${u.getusername()}</td> 
                    <td>${u.getpassword()}</td><td>${u.getemail()}</td><td>${u.getphonenumber()}</td>  
                    <td><a href="deleteuser.jsp?id=${u.getId()}">Delete</a></td></tr>  
                </c:forEach>  
        </table> 
        <h2 style="text-align: right">   <%
                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?", "root", "");
                    Statement st = con.createStatement();
                    String strQuery = "SELECT COUNT(username) FROM userlogin";
                    ResultSet rs = st.executeQuery(strQuery);
                    String Count = "";
                    while (rs.next()) {
                        Count = rs.getString(1);
                        out.println("Total User :" + Count);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>
            </h2> 
        </div>
            </div>      
   <script>
            function toggle(a){
                let element = document.querySelectorAll(".sub-item.cursor")[a].parentNode.children[1];
                let arrow = document.querySelectorAll(".arrow")[a];
                if(!arrow.classList.contains("up")){
                    arrow.classList.value = "arrow up";
                }else{
                    arrow.classList.value = "arrow";
                }
                if(element.classList.contains("hide")){
                    element.classList.value = "show";
                }else{
                    element.classList.value = "hide";
                }
                console.log(element);
            }
            function toggleClass(lang){
                let element = document.getElementsByClassName("togggle");
                let element1 = element[0];
                let element2 = element[1];
                if(lang === "nep" && element1.classList.contains("hide")){
                    element1.classList.value = "togggle show";
                    element2.classList.value = "togggle hide";
                }else if(lang === "eng" && element2.classList.contains("hide")){
                    element1.classList.value = "togggle hide";
                    element2.classList.value = "togggle show";
                }
            }
        </script>   
    </body>  
</html> 
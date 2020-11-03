<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Create new doctor account</title>
        <link rel="stylesheet" type="text/css" href="css/useraccountstyle.css">
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

            if (session.getAttribute("username") == null) 
                response.sendRedirect("stafflogin.jsp");
            
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
       
        <form name="form" onsubmit="return validation()" action="adddoctor" method="post">

            <h2 style="text-align: center">Signup For New Doctor</h2>
            <table align="center" border="0" cellspacing="15" style="margin-left: 250px;">
                <tr>
                    <td> Full Name<span class="required" style="color:red;font-size:20px;">*</span></td>
                    <td><input type="text" placeholder="Full Name" name="fullname" value="Dr." required></td>
                </tr>

                <tr>
                    <td> User Name<span class="required" style="color:red;font-size:20px;">*</span></td>
                    <td><input type="text" placeholder="It must be unique" name="dusername" required></td>
                </tr>
                <tr>
                    <td>Password<span class="required" style="color:red;font-size:20px;">*</span></td>
                    <td><input type="password" placeholder="Password" name="dpassword" required></td>
                </tr>
                <tr>
                    <td>Email<span class="required" style="color:red;font-size:20px;">*</span></td>
                    <td><input type="email" name="demail" placeholder="abc@gmail.com" required></td>
                </tr>
                <tr>
                    <td>Gender<span class="required" style="color:red;font-size:20px;">*</span></td>
                    <td> <select style="width:175px;"><option>--Select--</option> <option> Male </option> <option> Female </option> <option> Other </option> </select></td>
                </tr>
                <tr>    
                    <td> Date of Birth<span class="required" style="color:red;font-size:20px;">*</span></td>
                    <td><input type="date" name="DOB" placeholder="DD/MM/YYYY"  style="height: 25px; width: 176px;font-size: 17px;" required></td>
                </tr>
                <tr>
                    <td>Phone Number <span class="required" style="color:red;font-size:20px;">*</span></td><td>
                        <input type="text" name="dphonenumber" placeholder="98********" required></td>
                </tr>
                <tr>
                    <td> <label>Select Department</label><span style="color:red;font-size:20px;">*</span></td>
                    <td>
                        <select  name="department" id="department" style="height: 25px; width: 176px">
                            <option>--Select Department--</option>
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
<%-- 
    Document   : admin.jsp
    Created on : 11-May-2020, 18:12:37
    Author     : Gaurab Pokharel
--%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<%
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "");
    Statement st = con.createStatement();
    String stra = "SELECT COUNT(fdate) FROM appointment where fdate=CURDATE()";
    ResultSet rsa = st.executeQuery(stra);
    String a = "";
    while (rsa.next()) {
        a = rsa.getString(1);
        // out.println(Countrow);
    }
    int i = Integer.parseInt(a);

    String strb = "SELECT COUNT(fdate) FROM appointment where fdate=CURDATE()-1";
    ResultSet rsb = st.executeQuery(strb);
    String b = "";
    while (rsb.next()) {
        b = rsb.getString(1);
        // out.println(Countrow);
    }
    int j = Integer.parseInt(b);

    String strc = "SELECT COUNT(fdate) FROM appointment where fdate=CURDATE()-2";
    ResultSet rsc = st.executeQuery(strc);
    String c = "";
    while (rsc.next()) {
        c = rsc.getString(1);
    }
    int k = Integer.parseInt(c);
    String strd = "SELECT COUNT(fdate) FROM appointment where fdate=CURDATE()-3";
    ResultSet rsd = st.executeQuery(strd);
    String d = "";
    while (rsd.next()) {
        d = rsd.getString(1);
    }
    int l = Integer.parseInt(d);

    String stre = "SELECT COUNT(fdate) FROM appointment where fdate=CURDATE()-4";
    ResultSet rse = st.executeQuery(stre);
    String e = "";
    while (rse.next()) {
        e = rse.getString(1);
    }
    int m = Integer.parseInt(e);

    String strf = "SELECT COUNT(fdate) FROM appointment where fdate=CURDATE()-5";
    ResultSet rsf = st.executeQuery(strf);
    String f = "";
    while (rsf.next()) {
        f = rsf.getString(1);
    }
    int n = Integer.parseInt(f);

    String strg = "SELECT COUNT(fdate) FROM appointment where fdate=CURDATE()-6";
    ResultSet rsg = st.executeQuery(strg);
    String g = "";
    while (rsg.next()) {
        g = rsg.getString(1);
    }
    int o = Integer.parseInt(g);

    String strh = "SELECT COUNT(fdate) FROM appointment where fdate=CURDATE()-7";
    ResultSet rsh = st.executeQuery(strh);
    String h = "";
    while (rsh.next()) {
        h = rsh.getString(1);
    }
    int p = Integer.parseInt(h);

    Gson gsonObj = new Gson();
    Map<Object, Object> map = null;
    List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();

    map = new HashMap<Object, Object>();
    map.put("label", "7 day ago");
    map.put("y", p);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "6 day ago");
    map.put("y", o);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "5 day ago");
    map.put("y", n);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "4 day ago");
    map.put("y", m);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "3 day ago");
    map.put("y", l);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "2 day ago");
    map.put("y", k);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "1 day ago");
    map.put("y", j);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", (new java.util.Date()));
    map.put("y", i);
    list.add(map);

    String dataPoints = gsonObj.toJson(list);
%>




<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
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
                line-height:30px;
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
            .dropbtn {
                background-color: #4CAF50;
                color: white;
                //padding: 5px;
                font-size: 16px;
                border: none;
            }

            .dropdown {
                position: relative;
                display: inline-block;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f1f1f1;
                min-width: 121px;
                box-shadow: 0px 4px 7px 0px rgba(0,0,0,0.2);
                z-index: 1;
                font-size: 12px;
            }

            .dropdown-content a {
                color: black;
                text-decoration: none;
                display: block;
            }

            .dropdown-content a:hover {background-color: #ddd;}

            .dropdown:hover .dropdown-content {display: block;}

            .dropdown:hover .dropbtn {background-color: #3e8e41;}
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
                    window.onload = function () {

                    var chart = new CanvasJS.Chart("chartContainer", {
                    animationEnabled: true,
                            theme: "light2", // "light1", "dark1", "dark2"
                            title: {
                            text: "Number of patient"
                            },
                            subtitles: [{
                            text: "In Bar Diagram",
                                    fontSize: 16
                            }],
                            axisY: {
                            scaleBreaks: {
                            type: "wavy",
                                    autoCalculate: true
                            }
                            },
                            data: [{
                            type: "column",
                                    indexLabel: "{y}",
                                    dataPoints: <%out.print(dataPoints);%>

                            }]
                    });
                            chart.render();
                    }
        </script>


    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
            
            String userName = (String) session.getAttribute("username");
            if (null == userName) {
                  request.setAttribute("Error", "Session has ended.  Please login.");
   RequestDispatcher rd = request.getRequestDispatcher("stafflogin.jsp");
   rd.forward(request, response);
            }
            

        %>

        <div class="header"><br>Admin Dashboard
            <div class="dropdown" style="float: right">
                <img src="img/admin1.png" style="margin-top:-15px; margin-right: 80px;height: 65px; width: 65px">
                <div class="dropdown-content">
                    <a href="staffLogout">Logout</a>
                    <a href="staffchangepassword.jsp">Change Password</a>
                </div>
            </div>
        </div>

       
        <form>
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
                            <div class="toggle-item cursor" onclick="window.open('adminadddoctor.jsp', '_top')" >-> Add new Doctor</div>
                            <div class="toggle-item cursor" onclick="window.open('adminaddstaff.jsp', '_top')" >-> Add new Staff</div>
                            <div class="toggle-item cursor" onclick="window.open('adminadddepartment.jsp', '_top')"  style="border-bottom:1px solid black;">-> Add new Department</div>
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
                            <div class="toggle-item cursor" onclick="window.open('adminviewdoctorlist.jsp', '_top')">-> View Doctor</div>
                            <div class="toggle-item cursor" onclick="window.open('adminviewusers.jsp', '_top')">-> View User</div>
                            <div class="toggle-item cursor" style="border-bottom:1px solid black;" onclick="window.open('adminviewstafflist.jsp', '_top')">-> View Staff</div>
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
                            <div class="toggle-item cursor" onclick="window.open('adminbackupofblooddonor.jsp', '_top')" >-> Blood Donor</div>
                            <div class="toggle-item cursor" onclick="window.open('adminbackupofdoctor.jsp', '_top')">-> Doctor</div>
                            <div class="toggle-item cursor" onclick="window.open('adminbackupofpatient.jsp', '_top')">-> Patient</div>
                            <div class="toggle-item cursor" style="border-bottom:1px solid black;" onclick="window.open('adminbackupofstaff.jsp', '_top')">-> Staff</div>
                        </div>
                    </div>
                    <div class="item cursor" onclick="window.open('admintodayappointmentlist.jsp', '_top')"><i style="font-size:30px" class="fa fa-user"></i> In Patient</div>
                    <div class="item cursor" onclick="window.open('adminviewappointment.jsp', '_top')"><i style="font-size:30px" class="fas fa-user-check"></i> Out Patient</div>
                    <div class="item cursor" onclick="window.open('admindetailforqrcode.jsp', '_top')"><img src="img/qr.png" style="width: 30px;height: 30px;"> QR-code</div>
                    <div class="item">
                        <div class="sub-item cursor container" onclick="toggle(3)">
                            <i style="font-size:30px" class=""></i>&nbsp;
                            <div class="container">
                                <div>   <img src="img/statistics.png" style="width: 30px;height: 30px;"> Data Visualization</div>
                                <div class="arrow">&nbsp;></div>
                            </div>
                        </div>
                        <div class="hide">
                            <div class="toggle-item cursor" style="border-bottom:1px solid black;" onclick="window.open('adminpiechart.jsp', '_top')" >-> According to Department</div>
                        </div>
                    </div>
                </div>
                <div class="second-item">
                    <div id="chartContainer" style="height: 370px; width: 100%;"></div>
                    <%                      response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

                        if (session.getAttribute("username") == null) {
                            response.sendRedirect("stafflogin.jsp");
                        }

                    %>
                    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

                    <div class="container" style="flex-direction:column;margin:30px;">
                        <div class="container" style="font-weight:bolder;margin-bottom:30px;">
                            <span style="font-size:1.1em;padding:5px 10px; margin-right:30px;">Calendar:</span>
                            <span style="cursor:pointer;padding:5px 10px;margin-right:20px;text-decoration:underline;" onclick="toggleClass('nep')">Nepali</span>
                            <span style="cursor:pointer;padding:5px 10px;text-decoration:underline;" onclick="toggleClass('eng')">English</span>
                        </div>
                        <iframe class="togggle show" src="https://www.hamropatro.com/widgets/calender-medium.php" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" style="border:none; overflow:hidden; width:295px; height:385px;" allowtransparency="true"></iframe>
                        <iframe class="togggle hide" src="https://calendar.google.com/calendar/embed?height=400&amp;wkst=1&amp;bgcolor=%23795548&amp;ctz=Asia%2FKathmandu&amp;src=cHE4b2NrbG02OWNtOGNsY3RsYm1lZ2F0MjBAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ&amp;color=%23F09300&amp;showTitle=0&amp;showNav=1&amp;showPrint=0&amp;showTz=1&amp;title=Calendar&amp;showTabs=0" style="border-width:0" width="295" height="385" frameborder="0" scrolling="no"></iframe>
                    </div>
                </div>
            </div>
        </form>

        <script src="js/admin-main.js"></script>

        <script>
                                        function toggle(a){
                                        let element = document.querySelectorAll(".sub-item.cursor")[a].parentNode.children[1];
                                                let arrow = document.querySelectorAll(".arrow")[a];
                                                if (!arrow.classList.contains("up")){
                                        arrow.classList.value = "arrow up";
                                        } else{
                                        arrow.classList.value = "arrow";
                                        }
                                        if (element.classList.contains("hide")){
                                        element.classList.value = "show";
                                        } else{
                                        element.classList.value = "hide";
                                        }
                                        console.log(element);
                                        }
                                function toggleClass(lang){
                                let element = document.getElementsByClassName("togggle");
                                        let element1 = element[0];
                                        let element2 = element[1];
                                        if (lang === "nep" && element1.classList.contains("hide")){
                                element1.classList.value = "togggle show";
                                        element2.classList.value = "togggle hide";
                                } else if (lang === "eng" && element2.classList.contains("hide")){
                                element1.classList.value = "togggle hide";
                                        element2.classList.value = "togggle show";
                                }
                                }
        </script>

    </body>
</html>






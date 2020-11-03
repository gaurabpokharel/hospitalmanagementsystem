
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <title>Hospital </title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/style.css?ver=100" rel="stylesheet" type="text/css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>
        
        <div class="top">

            <label class="toplevel" style="padding-left: 10px;" ><i class="fa fa-phone" style="font-size:18px"></i>+977 9800000000</label>
            <label class="toplevel" style="padding-left: 300px;"><i class="fa fa-envelope" style="font-size:20px"></i><a href="https://mail.google.com/mail/u/0/" style="text-decoration: none;color:white"> hospital@email.com</a></label>
            <label class="toplevel" style="padding-left: 400px;"> &nbsp;&nbsp<a href="createuseraccount.jsp" style="text-decoration: none;color: white" > SIGN UP</a>
                &nbsp;&nbsp   |&nbsp;&nbsp<select  onchange="location = this.value;" style="color:white; border:0px; width: 110px;height: 40px;background-color:transparent"> 
                    <option style="color: #207dff"> SIGN IN </option><option style="color: #207dff" value="staffLoginType.jsp">STAFF LOGIN </option> <option style="color: #207dff" value="userlogin.jsp"> USER </option> </select>   </label>

        </div>
        <div class="logo">
            <div>
                <table>

                    <tr>
                        <td width="500px" style="font-weight: 800;font-size: 40px;"> <font color="#428bca">  </font><font color="#000"> Hospital</font> </td>
                        <td> <br> <br>
                            <div style="margin-left: 450px; margin-top:-40px">
                                <font size="3px" > 
                                <a href="index.jsp">HOME</a> 
                                <a href="about.jsp">ABOUT US</a>  
                                <a href="service.jsp">SERVICE</a>
                                <a href="doctor.jsp">DOCTORS</a> 
                                <a href="contact.jsp">CONTACT US</a>  
                                <a href="userlogin.jsp"  class="appointment">APPOINTMENT</a>


                                </font></div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="middle">
            <div style="background-image:url('img/anc.jpg');">

                <a style="" class="blooddonation" href="bloodDonationPage.jsp">
                    <i class="fas fa-tint" style="font-size:25px;color:red"></i> &nbsp;Blood Donor List</a>
                <p>
                    <br> <br>
                    Health Care Services  <br>
                    <font size="6px"> We are here for your health </font>
                </p> 


            </div>
        </div>

        <div class="bottom">
            <div>
                <table border="0">
                    <tr>
                        <td>
                            <img style="width: 500px; height:600px; margin-top: -33px;margin-left: -80px;" src="img/b.jpg">
                        </td>

                        <td width="700px" style="padding-left: 40px">

                            <font color="#000" size="5px"> We Have Medicare Plan Options for You! </font> <br> <br>
                            Hospitals complement and amplify the effectiveness of many other parts of the health system, providing continuous availability of services for acute and complex conditions. Hospitals concentrate scarce resources within well-planned referral networks to respond efficiently to population health needs. They are an essential element of Universal Health Coverage and will be critical to meeting the Sustainable Development Goals.     
                            Hospitals are reservoirs of critical resources and knowledge. They can be classified according to the interventions they provide, the roles they play in the health system and the health and educational services they offer to the communities in and around them. <br><br>
                            <ul>
                                <h2><b><u>Our Services</u></b></h2>
                                <li>Laboratory services </li>
                                <li>Emergency Services</li>
                                <li>Qualified Doctor</li>
                                <li>Outdoor Checkup</li>
                                <li>24 Hours Services</li>
                                <li>Blood bank</li>
                            </ul>
                            <br>
                        </td>


                        <td> </td>
                    </tr>


                </table>
            </div>
        </div>



        <div class="footer" style="background-image: url(img/footer-bg.jpg)">
            ``<div class="footermedia"  >
                <h2 >Hospital</h2><br><br>
                <p>We are here for your health </p><br>

                <a href="https://twitter.com/" class="fa fa-twitter"></a>
                <a href="https://www.facebook.com/" class="fa fa-facebook"></a>
                <a href="https://www.instagram.com/" class="fa fa-instagram"></a>
            </div>

            <div class="footerdepartment">
                <h2>Departments</h2><br>
<ul>
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

                    <i class="arrow right"></i>&nbsp;&nbsp;<%= resultset.getString(1) %><br><br>
                                    <% } %>
                            </ul>
                            
               
            </div>
            <div class="footerdepartment">
                <h2>Services</h2><br>

                <i class="arrow right"></i>&nbsp;&nbsp;Emergency Services<br><br>
                <i class="arrow right"></i>&nbsp;&nbsp;Qualified Doctor<br><br>
                <i class="arrow right"></i>&nbsp;&nbsp;Outdoor Checkup<br><br>
                <i class="arrow right"></i>&nbsp;&nbsp;24 Hours Services<br><br>
                <i class="arrow right"></i>&nbsp;&nbsp;Blood bank<br><br>
            </div>
            <div class="footerdepartment">
                <h2>Links</h2><br>

                <i class="arrow right"></i>&nbsp;&nbsp;<a href="index.jsp" style="text-decoration: none">Home</a><br><br>
                <i class="arrow right"></i>&nbsp;&nbsp;<a href="contact.jsp" style="text-decoration: none">Contact</a><br><br>
                <i class="arrow right"></i>&nbsp;&nbsp;<a href="doctor.jsp" style="text-decoration: none">Doctor</a><br><br>
                <i class="arrow right"></i>&nbsp;&nbsp;<a href="service.jsp" style="text-decoration: none">Services</a><br><br>
            </div>
            <div class="footerquestion">
                <h2>Have any questions?</h2><br>
                <i class="fa fa-map-marker" style="font-size:24px"></i>Gaindakot-4,Nawalpur<br>
                <i class="fa fa-phone" style="font-size:18px"></i>+977 9800000000<br>
                <i class="fa fa-envelope" style="font-size:20px" ></i><a href="https://mail.google.com/mail/u/0/" style="text-decoration: none;color:black"> hospital@email.com</a>
            </div>
        </div>


   




    <div class="nav_down">
        <div>
            &copy; Hospital, site designed & developed by Gaurab Pokharel(+977 9861677616)

        </div>
    </div>
    </body>
</html>


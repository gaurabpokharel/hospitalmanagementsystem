<%@page import="java.sql.*"%>
<html>
    <head>
        <title>Hospital </title>

        <link href="css/style.css?ver=100" type="text/css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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

        <div class="bottom">
            <div>
                <table border="0">
                    <tr>
                        <td width="700px">
                            <font color="#000"> OUR OUTSTANDING SERVICES</font> <br> <br>

                            <font color="#000" size="6px"> What We Offer! </font> <br> <br>


                            <ul>
                                <li>Laboratory services </li>
                                <li>Emergency Services</li>
                                <li>Qualified Doctor</li>
                                <li>Outdoor Checkup</li>
                                <li>24 Hours Services</li>
                                <li>Blood bank</li>
                            </ul>
                            <br><br>

                            <br>
                        </td>


                        <td style="padding-left:20px;"> <img src="img/01.jpg" width="400px"></td>
                    </tr>


                </table>
            </div>
        </div>

        <div class="bottom">
            <div>
                <table border="0">
                    <tr>
                        <td width="700px">

                            <font color="#000" size="6px"> Our Department </font> <br> <br>
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

                    <li><%= resultset.getString(1) %></li>
                                    <% } %>
                            </ul>
                            

                            <br>
                        </td>


                        <td style="padding-left:20px;"> </td>
                    </tr>


                </table>
            </div>
        </div>


        <div class="nav_down">
            <div>
                &copy; Hospital, site designed & developed by Gaurab Pokharel(+977 9861677616)
            </div>
        </div>


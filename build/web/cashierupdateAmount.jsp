
<%@page import="com.info.method.appointmentbean"%>
<%@page import="com.info.dao.appointmentDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Amount Page</title>
        <link rel="stylesheet" type="text/css" href="css/userstyle.css?">
        <link href="https://fonts.googleapis.com/css?family=Cinzel" rel="stylesheet"> 
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            appointmentbean u = appointmentDao.getRecordById(Integer.parseInt(id));
        %>

        <form action="cashierUpdateAmount" method="post">
            <div class="bgimg">
                <div class="centerdiv" style="height: 350px;width:400px;">
                    <h1 style="text-align: center">Update Amount</h1><hr>

                    <table align="center" border="0" cellspacing="15" style="margin-bottom: 20px;">
                        <tr>
                            <td>Id:</td> <td><input style="margin-left: -100px;" type="text" name="id"  value="<%=u.getId()%>"  id="box"></td>
                        </tr>
                        <tr>
                            <td>Test:</td> <td><input  style="margin-left: -100px;" type="text" name="test"  value="<%=u.getTest()%>"  id="box"></td>
                        </tr>
                        
                         <tr>
                             <td>Amount:</td> <td><input type="text" style="margin-left: -100px;" name="amount" placeholder="Amount" id="box"></td>
                        </tr>
                        
                       
                        <tr style="padding-bottom: 10px;"> <td align="center" ><input type="submit"     style="margin-left: 76px" value="Update" id="btn"> </td>
                        </tr>
                        <tr><td><button formaction="cashierDashboard.jsp" id="btn" style="margin-left: 76px;">Back</button></td></tr>

                        </table>
                </div>
            </div>
        </form>

    </body>
</html>


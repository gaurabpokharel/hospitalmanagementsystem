<%-- 
    Document   : studentDetailViewForQrcode.jsp
    Created on : 29-Jul-2020, 13:34:09
    Author     : gaura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Detail</title>
    </head>
    <body>

        <form action="qrCodeServlet" method="post"> 

            <%@page import="com.info.dao.*,com.info.method.*"%>  

            <%
                String id = request.getParameter("id");
                doctorBean u = doctorDao.getRecordById(Integer.parseInt(id));
            %>
            <table style="margin-left:500px;margin-top: 100px">
                <tr> <th> ID:</th><th><input type="text" name="id" value="<%= u.getId()%>"></th></tr>
                <tr><th> Doctor full name:</th><th><input type="text" name="fullname" value="<%= u.getFullname()%>"></th></tr>
                <tr> <th>Username:</th><th><input type="text" name="username" value="<%= u.getUsername()%>"></th></tr>
                <tr> <th>Email:</th><th><input type="text" name="email" value="<%= u.getEmail()%>"></th></tr>
                <tr> <th>Phone number:</th><th><input type="text" name="phonenumber" value="<%= u.getPhonenumber()%>"></th></tr>
                <tr> <th>Department:</th><th><input type="text" name="department" value="<%= u.getDepartment()%>"></th></tr>
                <tr> <td align="center" colspan="2"><input type="submit" value="Generate QR Code" />  </td></tr>
                        <tr><td align="center" colspan="2">
                                <button formaction="adminDashboard.jsp" style="font-weight: 700;height:30px;width: 90px;background-color:blue;color: white ">Dashboard</button>
           
                    </td></tr>
                </tr>
            </table>
        </form>
             

    </body>
</html>

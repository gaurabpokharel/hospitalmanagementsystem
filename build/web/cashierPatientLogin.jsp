
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Cashier</title>
        <link rel="stylesheet" type="text/css" href="css/userstyle.css?">
        <link href="https://fonts.googleapis.com/css?family=Cinzel" rel="stylesheet"> 
    </head>
    <body>

        <form action="validPatientName" method="post">
            <div class="bgimg">
                <div class="centerdiv" style="height: 350px;width:400px;">
                    <h1 style="text-align: center">PATIENT VERIFICATION</h1><hr>

                    <table align="center" border="0" cellspacing="15" style="margin-bottom: 20px;">
                        <tr>
                            <td><input type="text" name="id" placeholder="Patient Id" id="box"></td>
                        </tr>
                         <tr>
                            <td><input type="text" name="pname" placeholder="Patient Name" id="box"></td>
                        </tr>
                         <tr>
                            <td><input type="text" name="dname" placeholder="Doctor Name" id="box"></td>
                        </tr>
                       
                        <tr style="padding-bottom: 10px;"> <td align="center" ><input type="submit" value="Verify" id="btn"> </td>
                        </tr>
                        <tr><td><button formaction="cashierDashboard.jsp" id="btn" style="margin-left: 76px;">Back</button></td></tr>

                        </table>
                </div>
            </div>
        </form>

    </body>
</html>


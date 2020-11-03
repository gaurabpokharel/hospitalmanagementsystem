<%-- 
    Document   : userPayment
    Created on : 21-Jul-2020, 13:05:42
    Author     : gaura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
    <script src="https://unpkg.com/khalti-checkout-web@latest/dist/khalti-checkout.iffe.js"></script>
    <title>Payment</title>
</head>
<body>
<body>
    <form action="https://uat.esewa.com.np/epay/main" method="POST">
    <input value="500" name="tAmt" type="hidden">
    <input value="500" name="amt" type="hidden">
    <input value="0" name="txAmt" type="hidden">
    <input value="0" name="psc" type="hidden">
    <input value="0" name="pdc" type="hidden">
    <input value="epay_payment" name="scd" type="hidden">
    <input value="ee2c3ca1-696b-4cc5-a6be-2c40d929d453" name="pid" type="hidden">
    <input value="http://merchant.com.np/page/esewa_payment_success?q=su" type="hidden" name="su">
    <input value="http://merchant.com.np/page/esewa_payment_failed?q=fu" type="hidden" name="fu">
    ...<input value="Pay with E-sewa" type="submit">...<br><br>
    ...<button formaction="userDashboard.jsp">Return to Dashboard</button>...
    </form>
    <script>
        var path="https://uat.esewa.com.np/epay/main";
var params= {
    amt: 500,
    psc: 0,
    pdc: 0,
    txAmt: 0,
    tAmt: 500,
    pid: "ee2c3ca1-696b-4cc5-a6be-2c40d929d453",
    scd: "epay_payment",
    su: "http://merchant.com.np/page/esewa_payment_success",
    fu: "http://merchant.com.np/page/esewa_payment_failed"
}

function post(path, params) {
    var form = document.createElement("form");
    form.setAttribute("method", "POST");
    form.setAttribute("action", path);

    for(var key in params) {
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", key);
        hiddenField.setAttribute("value", params[key]);
        form.appendChild(hiddenField);
    }

    document.body.appendChild(form);
    form.submit();
}
    </script>
</body>
</body>
</html>

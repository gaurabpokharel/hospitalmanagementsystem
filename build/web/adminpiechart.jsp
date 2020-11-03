<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 
<%
     Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "");
    Statement st = con.createStatement();
    
    String stra = "SELECT COUNT(department) FROM appointment where department='Neurology'";
    ResultSet rsa = st.executeQuery(stra);
    String a = "";
    while (rsa.next()) {
       a = rsa.getString(1);
        // out.println(Countrow);
    }
    int i = Integer.parseInt(a);
    
    String strb = "SELECT COUNT(department) FROM appointment where department='Surgical'";
    ResultSet rsb = st.executeQuery(strb);
    String b = "";
    while (rsb.next()) {
       b = rsb.getString(1);
        // out.println(Countrow);
    }
    int j = Integer.parseInt(b);
    
    String strc = "SELECT COUNT(department) FROM appointment where department='Cardiology'";
    ResultSet rsc = st.executeQuery(strc);
    String c = "";
    while (rsc.next()) {
       c = rsc.getString(1);
        // out.println(Countrow);
    }
    int k = Integer.parseInt(c);
    
    String strd = "SELECT COUNT(department) FROM appointment where department='Dental'";
    ResultSet rsd = st.executeQuery(strd);
    String d = "";
    while (rsd.next()) {
       d = rsd.getString(1);
        // out.println(Countrow);
    }
    int l = Integer.parseInt(d);
    
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
 
map = new HashMap<Object,Object>(); map.put("label", "Neurology"); map.put("y", i); map.put("exploded", true); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Surgical"); map.put("y", j); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Cardiology"); map.put("y", k); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Dental"); map.put("y", l); list.add(map);
 
String dataPoints = gsonObj.toJson(list);
%>
 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2",
	animationEnabled: true,
	exportFileName: "New Year Resolutions",
	exportEnabled: true,
	title:{
		text: "Data Visualization according to the Department"
	},
	data: [{
		type: "pie",
		showInLegend: true,
		legendText: "{label}",
		toolTipContent: "{label}: <strong>{y}%</strong>",
		indexLabel: "{label} {y}",
		dataPoints : <%out.print(dataPoints);%>
	}]
});
 
chart.render();
 
}
</script>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>           
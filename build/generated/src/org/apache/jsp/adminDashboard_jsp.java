package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

public final class adminDashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>Admin Dashboard</title>\r\n");
      out.write("        <script src='https://kit.fontawesome.com/a076d05399.js'></script>\r\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css2?family=Roboto&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\"> \r\n");
      out.write("        <style type=\"text/css\">\r\n");
      out.write("            *{\r\n");
      out.write("                box-sizing:border-box;\r\n");
      out.write("                padding:0;\r\n");
      out.write("                margin:0;\r\n");
      out.write("            }\r\n");
      out.write("            body{\r\n");
      out.write("                background-color:#ebeff5;\r\n");
      out.write("                color:#0e4ca3;\r\n");
      out.write("                font-family:'Roboto',sans-serif;\r\n");
      out.write("            }\r\n");
      out.write("            .container{\r\n");
      out.write("                display:flex;\r\n");
      out.write("            }\r\n");
      out.write("            .first-item{\r\n");
      out.write("                flex:1;\r\n");
      out.write("                min-width:200px;\r\n");
      out.write("            }\r\n");
      out.write("            .second-item{\r\n");
      out.write("                padding:5px;\r\n");
      out.write("                flex:4;\r\n");
      out.write("            }\r\n");
      out.write("            .header{\r\n");
      out.write("                height:80px;\r\n");
      out.write("                font-size:28px;\r\n");
      out.write("                text-align:center;\r\n");
      out.write("                line-height:30px;\r\n");
      out.write("                box-shadow:0 2px 4px black;\r\n");
      out.write("            }\r\n");
      out.write("            .side-bar{\r\n");
      out.write("                flex-direction:column;\r\n");
      out.write("                border-right:1px solid black;\r\n");
      out.write("            }\r\n");
      out.write("            .side-bar .item{\r\n");
      out.write("                min-height:60px;\r\n");
      out.write("                line-height:60px;\r\n");
      out.write("                min-width:200px;\r\n");
      out.write("                cursor:pointer;\r\n");
      out.write("                justify-content:space-between;\r\n");
      out.write("            }\r\n");
      out.write("            .item.cursor, .sub-item.cursor, .toggle-item.cursor{\r\n");
      out.write("                padding-left:30px;\r\n");
      out.write("            }\r\n");
      out.write("            .sub-item .container{\r\n");
      out.write("                justify-content:space-around;\r\n");
      out.write("            }\r\n");
      out.write("            .sub-item i{\r\n");
      out.write("                margin-top:10px;\r\n");
      out.write("            }\r\n");
      out.write("            .toggle-item.cursor{\r\n");
      out.write("                font-size:12px;\r\n");
      out.write("                height:40px;\r\n");
      out.write("                line-height:40px;\r\n");
      out.write("            }\r\n");
      out.write("            .cursor{\r\n");
      out.write("                cursor:pointer;\r\n");
      out.write("            }\r\n");
      out.write("            .cursor:hover{\r\n");
      out.write("                background-color:#b6bec9;\r\n");
      out.write("            }\r\n");
      out.write("            .hide{\r\n");
      out.write("                display:none;\r\n");
      out.write("            }\r\n");
      out.write("            .show{\r\n");
      out.write("                display:block;\r\n");
      out.write("            }\r\n");
      out.write("            .arrow.up{\r\n");
      out.write("                transform:rotate(90deg);\r\n");
      out.write("            }\r\n");
      out.write("            .show-on-hover{\r\n");
      out.write("                display:none;\r\n");
      out.write("            }\r\n");
      out.write("            .dropbtn {\r\n");
      out.write("                background-color: #4CAF50;\r\n");
      out.write("                color: white;\r\n");
      out.write("                //padding: 5px;\r\n");
      out.write("                font-size: 16px;\r\n");
      out.write("                border: none;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .dropdown {\r\n");
      out.write("                position: relative;\r\n");
      out.write("                display: inline-block;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .dropdown-content {\r\n");
      out.write("                display: none;\r\n");
      out.write("                position: absolute;\r\n");
      out.write("                background-color: #f1f1f1;\r\n");
      out.write("                min-width: 121px;\r\n");
      out.write("                box-shadow: 0px 4px 7px 0px rgba(0,0,0,0.2);\r\n");
      out.write("                z-index: 1;\r\n");
      out.write("                font-size: 12px;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .dropdown-content a {\r\n");
      out.write("                color: black;\r\n");
      out.write("                text-decoration: none;\r\n");
      out.write("                display: block;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .dropdown-content a:hover {background-color: #ddd;}\r\n");
      out.write("\r\n");
      out.write("            .dropdown:hover .dropdown-content {display: block;}\r\n");
      out.write("\r\n");
      out.write("            .dropdown:hover .dropbtn {background-color: #3e8e41;}\r\n");
      out.write("        </style>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <script type=\"text/javascript\">\r\n");
      out.write("                    window.onload = function () {\r\n");
      out.write("\r\n");
      out.write("                    var chart = new CanvasJS.Chart(\"chartContainer\", {\r\n");
      out.write("                    animationEnabled: true,\r\n");
      out.write("                            theme: \"light2\", // \"light1\", \"dark1\", \"dark2\"\r\n");
      out.write("                            title: {\r\n");
      out.write("                            text: \"Number of patient\"\r\n");
      out.write("                            },\r\n");
      out.write("                            subtitles: [{\r\n");
      out.write("                            text: \"In Bar Diagram\",\r\n");
      out.write("                                    fontSize: 16\r\n");
      out.write("                            }],\r\n");
      out.write("                            axisY: {\r\n");
      out.write("                            scaleBreaks: {\r\n");
      out.write("                            type: \"wavy\",\r\n");
      out.write("                                    autoCalculate: true\r\n");
      out.write("                            }\r\n");
      out.write("                            },\r\n");
      out.write("                            data: [{\r\n");
      out.write("                            type: \"column\",\r\n");
      out.write("                                    indexLabel: \"{y}\",\r\n");
      out.write("                                    dataPoints: ");
out.print(dataPoints);
      out.write("\r\n");
      out.write("\r\n");
      out.write("                            }]\r\n");
      out.write("                    });\r\n");
      out.write("                            chart.render();\r\n");
      out.write("                    }\r\n");
      out.write("        </script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        ");

            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
            
            String userName = (String) session.getAttribute("username");
            if (null == userName) {
                  request.setAttribute("Error", "Session has ended.  Please login.");
   RequestDispatcher rd = request.getRequestDispatcher("stafflogin.jsp");
   rd.forward(request, response);
            }
            

        
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <div class=\"header\"><br>Admin Dashboard\r\n");
      out.write("            <div class=\"dropdown\" style=\"float: right\">\r\n");
      out.write("                <img src=\"img/admin1.png\" style=\"margin-top:-15px; margin-right: 80px;height: 65px; width: 65px\">\r\n");
      out.write("                <div class=\"dropdown-content\">\r\n");
      out.write("                    <a href=\"staffLogout\">Logout</a>\r\n");
      out.write("                    <a href=\"staffchangepassword.jsp\">Change Password</a>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("       \r\n");
      out.write("        <form>\r\n");
      out.write("            <div class=\"container\">\r\n");
      out.write("                <div class=\"first-item side-bar container\">\r\n");
      out.write("                    <div class=\"item\">\r\n");
      out.write("                        <div class=\"sub-item cursor container\" onclick=\"toggle(0)\">\r\n");
      out.write("                            <i style=\"font-size:30px\" class=\"fa fa-user-plus\"></i>&nbsp;\r\n");
      out.write("                            <div class=\"container\">\r\n");
      out.write("                                <div>Add new list</div>\r\n");
      out.write("                                <div class=\"arrow\">&nbsp;></div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"hide\">\r\n");
      out.write("                            <div class=\"toggle-item cursor\" onclick=\"window.open('adminadddoctor.jsp', '_top')\" >-> Add new Doctor</div>\r\n");
      out.write("                            <div class=\"toggle-item cursor\" onclick=\"window.open('adminaddstaff.jsp', '_top')\" >-> Add new Staff</div>\r\n");
      out.write("                            <div class=\"toggle-item cursor\" onclick=\"window.open('adminadddepartment.jsp', '_top')\"  style=\"border-bottom:1px solid black;\">-> Add new Department</div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"item\">\r\n");
      out.write("                        <div class=\"sub-item cursor container\" onclick=\"toggle(1)\">\r\n");
      out.write("                            <i style=\"font-size:30px\" class='fas fa-user-tie'></i>&nbsp;\r\n");
      out.write("                            <div class=\"container\">\r\n");
      out.write("                                <div>View list</div>\r\n");
      out.write("                                <div class=\"arrow\"> &nbsp;></div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"hide\">\r\n");
      out.write("                            <div class=\"toggle-item cursor\" onclick=\"window.open('adminviewdoctorlist.jsp', '_top')\">-> View Doctor</div>\r\n");
      out.write("                            <div class=\"toggle-item cursor\" onclick=\"window.open('adminviewusers.jsp', '_top')\">-> View User</div>\r\n");
      out.write("                            <div class=\"toggle-item cursor\" style=\"border-bottom:1px solid black;\" onclick=\"window.open('adminviewstafflist.jsp', '_top')\">-> View Staff</div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"item\">\r\n");
      out.write("                        <div class=\"sub-item cursor container\" onclick=\"toggle(2)\">\r\n");
      out.write("                            <i style=\"font-size:30px\" class=\"fa fa-database\"></i>&nbsp;\r\n");
      out.write("                            <div class=\"container\">\r\n");
      out.write("                                <div>Backup Data</div>\r\n");
      out.write("                                <div class=\"arrow\">&nbsp;></div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"hide\">\r\n");
      out.write("                            <div class=\"toggle-item cursor\" onclick=\"window.open('adminbackupofblooddonor.jsp', '_top')\" >-> Blood Donor</div>\r\n");
      out.write("                            <div class=\"toggle-item cursor\" onclick=\"window.open('adminbackupofdoctor.jsp', '_top')\">-> Doctor</div>\r\n");
      out.write("                            <div class=\"toggle-item cursor\" onclick=\"window.open('adminbackupofpatient.jsp', '_top')\">-> Patient</div>\r\n");
      out.write("                            <div class=\"toggle-item cursor\" style=\"border-bottom:1px solid black;\" onclick=\"window.open('adminbackupofstaff.jsp', '_top')\">-> Staff</div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"item cursor\" onclick=\"window.open('admintodayappointmentlist.jsp', '_top')\"><i style=\"font-size:30px\" class=\"fa fa-user\"></i> In Patient</div>\r\n");
      out.write("                    <div class=\"item cursor\" onclick=\"window.open('adminviewappointment.jsp', '_top')\"><i style=\"font-size:30px\" class=\"fas fa-user-check\"></i> Out Patient</div>\r\n");
      out.write("                    <div class=\"item cursor\" onclick=\"window.open('admindetailforqrcode.jsp', '_top')\"><img src=\"img/qr.png\" style=\"width: 30px;height: 30px;\"> QR-code</div>\r\n");
      out.write("                    <div class=\"item\">\r\n");
      out.write("                        <div class=\"sub-item cursor container\" onclick=\"toggle(3)\">\r\n");
      out.write("                            <i style=\"font-size:30px\" class=\"\"></i>&nbsp;\r\n");
      out.write("                            <div class=\"container\">\r\n");
      out.write("                                <div>   <img src=\"img/statistics.png\" style=\"width: 30px;height: 30px;\"> Data Visualization</div>\r\n");
      out.write("                                <div class=\"arrow\">&nbsp;></div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"hide\">\r\n");
      out.write("                            <div class=\"toggle-item cursor\" style=\"border-bottom:1px solid black;\" onclick=\"window.open('adminpiechart.jsp', '_top')\" >-> According to Department</div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"second-item\">\r\n");
      out.write("                    <div id=\"chartContainer\" style=\"height: 370px; width: 100%;\"></div>\r\n");
      out.write("                    ");
                      response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

                        if (session.getAttribute("username") == null) {
                            response.sendRedirect("stafflogin.jsp");
                        }

                    
      out.write("\r\n");
      out.write("                    <script src=\"https://canvasjs.com/assets/script/canvasjs.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"container\" style=\"flex-direction:column;margin:30px;\">\r\n");
      out.write("                        <div class=\"container\" style=\"font-weight:bolder;margin-bottom:30px;\">\r\n");
      out.write("                            <span style=\"font-size:1.1em;padding:5px 10px; margin-right:30px;\">Calendar:</span>\r\n");
      out.write("                            <span style=\"cursor:pointer;padding:5px 10px;margin-right:20px;text-decoration:underline;\" onclick=\"toggleClass('nep')\">Nepali</span>\r\n");
      out.write("                            <span style=\"cursor:pointer;padding:5px 10px;text-decoration:underline;\" onclick=\"toggleClass('eng')\">English</span>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <iframe class=\"togggle show\" src=\"https://www.hamropatro.com/widgets/calender-medium.php\" frameborder=\"0\" scrolling=\"no\" marginwidth=\"0\" marginheight=\"0\" style=\"border:none; overflow:hidden; width:295px; height:385px;\" allowtransparency=\"true\"></iframe>\r\n");
      out.write("                        <iframe class=\"togggle hide\" src=\"https://calendar.google.com/calendar/embed?height=400&amp;wkst=1&amp;bgcolor=%23795548&amp;ctz=Asia%2FKathmandu&amp;src=cHE4b2NrbG02OWNtOGNsY3RsYm1lZ2F0MjBAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ&amp;color=%23F09300&amp;showTitle=0&amp;showNav=1&amp;showPrint=0&amp;showTz=1&amp;title=Calendar&amp;showTabs=0\" style=\"border-width:0\" width=\"295\" height=\"385\" frameborder=\"0\" scrolling=\"no\"></iframe>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </form>\r\n");
      out.write("\r\n");
      out.write("        <script src=\"js/admin-main.js\"></script>\r\n");
      out.write("\r\n");
      out.write("        <script>\r\n");
      out.write("                                        function toggle(a){\r\n");
      out.write("                                        let element = document.querySelectorAll(\".sub-item.cursor\")[a].parentNode.children[1];\r\n");
      out.write("                                                let arrow = document.querySelectorAll(\".arrow\")[a];\r\n");
      out.write("                                                if (!arrow.classList.contains(\"up\")){\r\n");
      out.write("                                        arrow.classList.value = \"arrow up\";\r\n");
      out.write("                                        } else{\r\n");
      out.write("                                        arrow.classList.value = \"arrow\";\r\n");
      out.write("                                        }\r\n");
      out.write("                                        if (element.classList.contains(\"hide\")){\r\n");
      out.write("                                        element.classList.value = \"show\";\r\n");
      out.write("                                        } else{\r\n");
      out.write("                                        element.classList.value = \"hide\";\r\n");
      out.write("                                        }\r\n");
      out.write("                                        console.log(element);\r\n");
      out.write("                                        }\r\n");
      out.write("                                function toggleClass(lang){\r\n");
      out.write("                                let element = document.getElementsByClassName(\"togggle\");\r\n");
      out.write("                                        let element1 = element[0];\r\n");
      out.write("                                        let element2 = element[1];\r\n");
      out.write("                                        if (lang === \"nep\" && element1.classList.contains(\"hide\")){\r\n");
      out.write("                                element1.classList.value = \"togggle show\";\r\n");
      out.write("                                        element2.classList.value = \"togggle hide\";\r\n");
      out.write("                                } else if (lang === \"eng\" && element2.classList.contains(\"hide\")){\r\n");
      out.write("                                element1.classList.value = \"togggle hide\";\r\n");
      out.write("                                        element2.classList.value = \"togggle show\";\r\n");
      out.write("                                }\r\n");
      out.write("                                }\r\n");
      out.write("        </script>\r\n");
      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

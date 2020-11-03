package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Hospital </title>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <link href=\"css/style.css?ver=100\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <script src='https://kit.fontawesome.com/a076d05399.js'></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        <div class=\"top\">\n");
      out.write("\n");
      out.write("            <label class=\"toplevel\" style=\"padding-left: 10px;\" ><i class=\"fa fa-phone\" style=\"font-size:18px\"></i>+977 9800000000</label>\n");
      out.write("            <label class=\"toplevel\" style=\"padding-left: 300px;\"><i class=\"fa fa-envelope\" style=\"font-size:20px\"></i><a href=\"https://mail.google.com/mail/u/0/\" style=\"text-decoration: none;color:white\"> hospital@email.com</a></label>\n");
      out.write("            <label class=\"toplevel\" style=\"padding-left: 400px;\"> &nbsp;&nbsp<a href=\"createuseraccount.jsp\" style=\"text-decoration: none;color: white\" > SIGN UP</a>\n");
      out.write("                &nbsp;&nbsp   |&nbsp;&nbsp<select  onchange=\"location = this.value;\" style=\"color:white; border:0px; width: 110px;height: 40px;background-color:transparent\"> \n");
      out.write("                    <option style=\"color: #207dff\"> SIGN IN </option><option style=\"color: #207dff\" value=\"staffLoginType.jsp\">STAFF LOGIN </option> <option style=\"color: #207dff\" value=\"userlogin.jsp\"> USER </option> </select>   </label>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        <div class=\"logo\">\n");
      out.write("            <div>\n");
      out.write("                <table>\n");
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td width=\"500px\" style=\"font-weight: 800;font-size: 40px;\"> <font color=\"#428bca\">  </font><font color=\"#000\"> Hospital</font> </td>\n");
      out.write("                        <td> <br> <br>\n");
      out.write("                            <div style=\"margin-left: 450px; margin-top:-40px\">\n");
      out.write("                                <font size=\"3px\" > \n");
      out.write("                                <a href=\"index.jsp\">HOME</a> \n");
      out.write("                                <a href=\"about.jsp\">ABOUT US</a>  \n");
      out.write("                                <a href=\"service.jsp\">SERVICE</a>\n");
      out.write("                                <a href=\"doctor.jsp\">DOCTORS</a> \n");
      out.write("                                <a href=\"contact.jsp\">CONTACT US</a>  \n");
      out.write("                                <a href=\"userlogin.jsp\"  class=\"appointment\">APPOINTMENT</a>\n");
      out.write("\n");
      out.write("\n");
      out.write("                                </font></div>\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                </table>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"middle\">\n");
      out.write("            <div style=\"background-image:url('img/anc.jpg');\">\n");
      out.write("\n");
      out.write("                <a style=\"\" class=\"blooddonation\" href=\"bloodDonationPage.jsp\">\n");
      out.write("                    <i class=\"fas fa-tint\" style=\"font-size:25px;color:red\"></i> &nbsp;Blood Donor List</a>\n");
      out.write("                <p>\n");
      out.write("                    <br> <br>\n");
      out.write("                    Health Care Services  <br>\n");
      out.write("                    <font size=\"6px\"> We are here for your health </font>\n");
      out.write("                </p> \n");
      out.write("\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div class=\"bottom\">\n");
      out.write("            <div>\n");
      out.write("                <table border=\"0\">\n");
      out.write("                    <tr>\n");
      out.write("                        <td>\n");
      out.write("                            <img style=\"width: 500px; height:600px; margin-top: -33px;margin-left: -80px;\" src=\"img/b.jpg\">\n");
      out.write("                        </td>\n");
      out.write("\n");
      out.write("                        <td width=\"700px\" style=\"padding-left: 40px\">\n");
      out.write("\n");
      out.write("                            <font color=\"#000\" size=\"5px\"> We Have Medicare Plan Options for You! </font> <br> <br>\n");
      out.write("                            Hospitals complement and amplify the effectiveness of many other parts of the health system, providing continuous availability of services for acute and complex conditions. Hospitals concentrate scarce resources within well-planned referral networks to respond efficiently to population health needs. They are an essential element of Universal Health Coverage and will be critical to meeting the Sustainable Development Goals.     \n");
      out.write("                            Hospitals are reservoirs of critical resources and knowledge. They can be classified according to the interventions they provide, the roles they play in the health system and the health and educational services they offer to the communities in and around them. <br><br>\n");
      out.write("                            <ul>\n");
      out.write("                                <h2><b><u>Our Services</u></b></h2>\n");
      out.write("                                <li>Laboratory services </li>\n");
      out.write("                                <li>Emergency Services</li>\n");
      out.write("                                <li>Qualified Doctor</li>\n");
      out.write("                                <li>Outdoor Checkup</li>\n");
      out.write("                                <li>24 Hours Services</li>\n");
      out.write("                                <li>Blood bank</li>\n");
      out.write("                            </ul>\n");
      out.write("                            <br>\n");
      out.write("                        </td>\n");
      out.write("\n");
      out.write("\n");
      out.write("                        <td> </td>\n");
      out.write("                    </tr>\n");
      out.write("\n");
      out.write("\n");
      out.write("                </table>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <div class=\"footer\" style=\"background-image: url(img/footer-bg.jpg)\">\n");
      out.write("            ``<div class=\"footermedia\"  >\n");
      out.write("                <h2 >Hospital</h2><br><br>\n");
      out.write("                <p>We are here for your health </p><br>\n");
      out.write("\n");
      out.write("                <a href=\"https://twitter.com/\" class=\"fa fa-twitter\"></a>\n");
      out.write("                <a href=\"https://www.facebook.com/\" class=\"fa fa-facebook\"></a>\n");
      out.write("                <a href=\"https://www.instagram.com/\" class=\"fa fa-instagram\"></a>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"footerdepartment\">\n");
      out.write("                <h2>Departments</h2><br>\n");
      out.write("<ul>\n");
      out.write("                             ");
ResultSet resultset = null;
      out.write("\n");
      out.write("                                    ");

                                        try {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?", "root", "");

                                            Statement statement = connection.createStatement();

                                            resultset = statement.executeQuery("select * from department");
                                        } catch (Exception e) {

                                        }
                                    
      out.write("\n");
      out.write("                                    ");
  while (resultset.next()) {
      out.write("\n");
      out.write("\n");
      out.write("                    <i class=\"arrow right\"></i>&nbsp;&nbsp;");
      out.print( resultset.getString(1) );
      out.write("<br><br>\n");
      out.write("                                    ");
 } 
      out.write("\n");
      out.write("                            </ul>\n");
      out.write("                            \n");
      out.write("               \n");
      out.write("            </div>\n");
      out.write("            <div class=\"footerdepartment\">\n");
      out.write("                <h2>Services</h2><br>\n");
      out.write("\n");
      out.write("                <i class=\"arrow right\"></i>&nbsp;&nbsp;Emergency Services<br><br>\n");
      out.write("                <i class=\"arrow right\"></i>&nbsp;&nbsp;Qualified Doctor<br><br>\n");
      out.write("                <i class=\"arrow right\"></i>&nbsp;&nbsp;Outdoor Checkup<br><br>\n");
      out.write("                <i class=\"arrow right\"></i>&nbsp;&nbsp;24 Hours Services<br><br>\n");
      out.write("                <i class=\"arrow right\"></i>&nbsp;&nbsp;Blood bank<br><br>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"footerdepartment\">\n");
      out.write("                <h2>Links</h2><br>\n");
      out.write("\n");
      out.write("                <i class=\"arrow right\"></i>&nbsp;&nbsp;<a href=\"index.jsp\" style=\"text-decoration: none\">Home</a><br><br>\n");
      out.write("                <i class=\"arrow right\"></i>&nbsp;&nbsp;<a href=\"contact.jsp\" style=\"text-decoration: none\">Contact</a><br><br>\n");
      out.write("                <i class=\"arrow right\"></i>&nbsp;&nbsp;<a href=\"doctor.jsp\" style=\"text-decoration: none\">Doctor</a><br><br>\n");
      out.write("                <i class=\"arrow right\"></i>&nbsp;&nbsp;<a href=\"service.jsp\" style=\"text-decoration: none\">Services</a><br><br>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"footerquestion\">\n");
      out.write("                <h2>Have any questions?</h2><br>\n");
      out.write("                <i class=\"fa fa-map-marker\" style=\"font-size:24px\"></i>Gaindakot-4,Nawalpur<br>\n");
      out.write("                <i class=\"fa fa-phone\" style=\"font-size:18px\"></i>+977 9800000000<br>\n");
      out.write("                <i class=\"fa fa-envelope\" style=\"font-size:20px\" ></i><a href=\"https://mail.google.com/mail/u/0/\" style=\"text-decoration: none;color:black\"> hospital@email.com</a>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("   \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    <div class=\"nav_down\">\n");
      out.write("        <div>\n");
      out.write("            &copy; Hospital, site designed & developed by Hospital Management System\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
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

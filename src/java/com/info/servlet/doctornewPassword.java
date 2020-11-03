package com.info.servlet;

//import com.info.config.*;
import com.info.dao.*;
import com.info.method.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dev
 */
public class doctornewPassword extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            //String email=request.getParameter("email");
            Base64.Encoder encoder = Base64.getEncoder();
            String username=request.getParameter("username");
            String newpassword = request.getParameter("newPassword");
            String newpw = encoder.encodeToString(newpassword.getBytes()); 
           

            doctorBean a = new doctorBean();

            a.setUsername(username);
            a.setPassword(newpw);
            

            int status = doctorDao.updatePassword(a);
            if (status > 0)
            {
                 out.println(" <script type=\"text/javascript\">");
            out.println(" alert('Your Password has been changed.');");
            out.println("</script>");
                 request.getRequestDispatcher("index.jsp").include(request,response);
            } 
            else
            {
                out.println("Unable to change password");
            }

            out.close();
        }
    }
}

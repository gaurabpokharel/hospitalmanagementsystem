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
public class staffnewPassword extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            String username=request.getParameter("username");
            String newpassword = request.getParameter("newPassword"); 
           

            staffBean a = new staffBean();

            a.setUsername(username);
            a.setPassword(newpassword);
            

            int status = staffDao.updatePassword(a);
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

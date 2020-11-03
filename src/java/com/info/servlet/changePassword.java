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
public class changePassword extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            //String email=request.getParameter("email");
            Base64.Encoder encoder = Base64.getEncoder();
            String username=request.getParameter("username");
            String oldpassword = request.getParameter("oldpassword");
             String oldpw = encoder.encodeToString(oldpassword.getBytes()); 
            String newpassword = request.getParameter("newpassword");
            String newpw = encoder.encodeToString(newpassword.getBytes()); 
           

            userbean a = new userbean();

            a.setusername(username);
            a.setOldpassword(oldpw);
            a.setNewpassword(newpw);
            

            int status = userDao.update(a);
            if (status > 0)
            {
                 request.getRequestDispatcher("userlogin.jsp").include(request,response);
            } 
            else
            {
                out.println("Unable to change password");
            }

            out.close();
        }
    }
}

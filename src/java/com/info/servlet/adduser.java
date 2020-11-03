package com.info.servlet;

import java.util.*;
import com.info.method.*;
import com.info.dao.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Gaurab Pokharel
 */
public class adduser extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Base64.Encoder encoder = Base64.getEncoder();

            String f = request.getParameter("firstname");
            String l = request.getParameter("lastname");
            String u = request.getParameter("username");
            String p = request.getParameter("password");

            String str = encoder.encodeToString(p.getBytes());
            String e = request.getParameter("email");
            String pho = request.getParameter("phonenumber");

            userbean es = new userbean();

            es.setfirstname(f);
            es.setlastname(l);
            es.setusername(u);
            es.setpassword(str);
            es.setemail(e);
            es.setphonenumber(pho);

            int status = adduseraccountDao.save(es);
            if (status > 0) {
                RequestDispatcher rd = request.getRequestDispatcher("newuser");
                rd.forward(request, response);
            } else {
                out.println("Make sure your E-mail and Phone number is unique ");
                RequestDispatcher rd = request.getRequestDispatcher("createuseraccount.jsp");
                rd.include(request, response);

            }

            out.close();

        }
    }

}

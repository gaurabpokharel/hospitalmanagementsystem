package com.info.servlet;

import java.util.*;
import com.info.dao.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class userlogin extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Base64.Encoder encoder = Base64.getEncoder();
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String str = encoder.encodeToString(password.getBytes()); 
                HttpSession session=request.getSession();
                    
            

            if (userDao.validate(email, str)) {
            
                session.setAttribute("email", email);
                 
                RequestDispatcher rd = request.getRequestDispatcher("userDashboard.jsp");
                rd.forward(request, response);
           
            } else {
                out.println(" <script type=\"text/javascript\">");
            out.println(" alert('Invalid Credentials.');");
            out.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("userlogin.jsp");
                rd.include(request, response);
            }

            out.close();
        }
    }
}

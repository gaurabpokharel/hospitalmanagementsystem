
package com.info.servlet;

import com.info.dao.userDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class forgetPassword extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String username=request.getParameter("username");  
            String email=request.getParameter("email");
            
            if (userDao.check(username,email)) 
            {
                RequestDispatcher rd = request.getRequestDispatcher("forgetPasswordMail");
                rd.forward(request, response);
                

            } 
            else {
                out.print("Sorry username or email error");
                RequestDispatcher rd = request.getRequestDispatcher("forgetPassword.jsp");
                rd.include(request, response);
            }

          
        }
    }

}

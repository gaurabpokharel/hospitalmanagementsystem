/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.servlet;

import com.info.dao.blooddonationDao;
import com.info.method.blooddonationBean;
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
public class blooddonation extends HttpServlet {

  
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String address = request.getParameter("address");
            String pnumber = request.getParameter("pnumber");
            String email = request.getParameter("email");
            String dob = request.getParameter("dob");
            String bgroup = request.getParameter("bgroup"); 
             
            blooddonationBean es = new blooddonationBean();
            es.setFname(fname);
            es.setLname(lname);
            es.setAddress(address);
            es.setPnumber(pnumber);
            es.setEmail(email);
            es.setDob(dob);
            es.setBgroup(bgroup);
            
            
            int status = blooddonationDao.save(es);
            if (status > 0) {
                out.println(" <script type=\"text/javascript\">");
            out.println(" alert('Your data is saved.');");
            out.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("bloodDonationPage.jsp");
                rd.forward(request, response);
            } else {
                out.println(" <script type=\"text/javascript\">");
            out.println(" alert('Your data cannot be saved.Please make sure your phone number and email is unique.');");
            out.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("bloodDonationForm.jsp");
                rd.forward(request, response);
            }

            out.close();
        }
    }
}

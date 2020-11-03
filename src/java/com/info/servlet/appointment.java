package com.info.servlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.info.dao.*;
import com.info.method.*;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/Upload")
@MultipartConfig(maxFileSize = 16177215)


public class appointment extends HttpServlet {

   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
             InputStream inputStream1 = null;
           
            Part filePart1 = request.getPart("document");
            if (filePart1 != null) 
            {
                inputStream1 = filePart1.getInputStream();
            }


            String pname = request.getParameter("pname");
            String aptitle = request.getParameter("aptitle");
            String apdate = request.getParameter("apdate");
            String symptoms = request.getParameter("symptoms");
            String disease = request.getParameter("disease");
            String email=request.getParameter("email");
            String pnumber= request.getParameter("pnumber");
            String department=request.getParameter("department");
            String doctor= request.getParameter("doctor");
            String time= request.getParameter("atime");

            appointmentbean es = new appointmentbean();
            es.setPname(pname);
            es.setApdate(apdate);
            es.setAptitle(aptitle);
            es.setDisease(disease);
            es.setSymptoms(symptoms);
            es.setEmail(email);
            es.setPnumber(pnumber);
            es.setDepartment(department);
            es.setDoctor(doctor);
            es.setAtime(time);

            int status = appointmentDao.save(es,inputStream1);
            if (status > 0) {
                
                RequestDispatcher rd = request.getRequestDispatcher("email");
                rd.forward(request, response);
            } else {
            out.println(" <script type=\"text/javascript\">");
            out.println(" alert('Your appointment is not saved.');");
            out.println("</script>");            }

            out.close();
        }
    }
}

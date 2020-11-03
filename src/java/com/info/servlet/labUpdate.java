/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.servlet;

import com.info.dao.appointmentDao;
import com.info.dao.labDao;
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

@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)

public class labUpdate extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            InputStream inputStream1 = null;
           
            Part filePart1 = request.getPart("report");
            if (filePart1 != null) {
//                System.out.println(filePart1.getName());
//                System.out.println(filePart1.getSize());
//                System.out.println(filePart1.getContentType());

                // obtains input stream of the upload file
                inputStream1 = filePart1.getInputStream();
            }

           // String doctor = request.getParameter("doctor");
            String sid = request.getParameter("id");
            int id = Integer.parseInt(sid);
            int status = labDao.update(id, inputStream1); 
          
            if (status>0) 
            {
                 RequestDispatcher rd = request.getRequestDispatcher("lab.jsp");
                rd.forward(request, response);
            } else {
                out.println("Sorry! unable to update record");
            }

            out.close();
        }
    }
}

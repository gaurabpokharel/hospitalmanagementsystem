package com.info.servlet;


import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



class sender1
{
     public static void send(String from, String password, String to, String un, String pw) 
     {
          Properties properties = new Properties();
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.required", "true");
        properties.put("mail.smtp.port", "587");

        //java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
        

        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            InternetAddress address = (new InternetAddress(to));
            message.setRecipient(Message.RecipientType.TO, address);
            message.setSubject("Your username and password of hospital is:");
            message.setText("Username=="+un+"\n"
                    +"Password=="+pw);

            Transport transport = session.getTransport("smtp");
            transport.connect("smtp.gmail.com", from, password);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
            System.out.println("Message sent successfully");

        } catch (Exception e) {
            System.out.println(e);
        }

     }
}
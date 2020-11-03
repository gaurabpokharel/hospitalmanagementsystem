
package com.info.servlet;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import net.glxn.qrgen.QRCode;
import net.glxn.qrgen.image.ImageType;
public class qrCodeGenerator {

  public qrCodeGenerator(String id,String fullname,String username,String email,
          String phonenumber,String department) throws IOException 
  {
        String details="ID:"+id+"\n"+
                "Doctor Full name:"+fullname+"\n"
                +"User name:"+username+"\n"
                +"Email:"+email+"\n"
                +"Grade:"+phonenumber+"\n"
                +"Department:"+department;
      
        
        ByteArrayOutputStream out=QRCode.from(details).to(ImageType.JPG).stream();
        
        File f=new File("C:\\Users\\gaura\\OneDrive\\Desktop\\hospital\\QR Code\\qrcode"
                + id+username
                + ".jpg");
        FileOutputStream fos=new FileOutputStream(f);
        fos.write(out.toByteArray());
        fos.flush();
        
    }
    public static void main(String[] args) throws IOException {
    qrCodeGenerator blah = new qrCodeGenerator();
}

    private qrCodeGenerator() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}

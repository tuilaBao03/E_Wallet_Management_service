// package com.backend.smartwalletapp.service;


// import org.springframework.mail.javamail.JavaMailSender;
// import org.springframework.mail.javamail.MimeMessageHelper;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.stereotype.Service;

// import jakarta.mail.internet.MimeMessage;

// @Service
// public class EmailService {

//     @Autowired
//     private JavaMailSender emailSender;

//     public void sendEmail(String to, String subject, String text) {
//         try {
//             MimeMessage message = emailSender.createMimeMessage();
//             MimeMessageHelper helper = new MimeMessageHelper(message, true);
//             helper.setTo(to);
//             helper.setSubject(subject);
//             helper.setText(text, true);
//             emailSender.send(message);
//         } catch (Exception e) {
//             e.printStackTrace();
//         }
//     }
// }


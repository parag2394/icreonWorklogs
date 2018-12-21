package com.icreon.mail;


import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;

import javax.mail.internet.MimeMessage;
import java.util.Map;
import java.util.Properties;

public class SendMail{

        final String username = "apitesting02@gmail.com";
      //  final String username = "parag.chaudhari@icreon.com";
        final String password = "********";


        public String sendEmail(Map<String, String> userMap, String p_worklog_id) {

            final JavaMailSenderImpl mailSender = new JavaMailSenderImpl();

            final String userEmailId = "apitesting02@gmail.com";
         // final String userEmailId = userMap.get("Email");

            String userName = userMap.get("Name");
            String userDate = userMap.get("Date");

            final String body = "Hi "+userName+",\n Your time log has been Approved.\n Details: Issue: "+p_worklog_id+"\n Date: "+userDate+"\n Thank you";
            final String subject = "Time Log Approved in JIRA";

            System.out.println("Email Id :" + userEmailId);

            mailSender.setHost("smtp.gmail.com");
        //    mailSender.setHost("smtp.office365.com");
            mailSender.setPort(587);
            mailSender.setUsername(username);
            mailSender.setPassword(password);

            Properties javaMailProperties = new Properties();
            javaMailProperties.put("mail.smtp.starttls.enable", "true");
            javaMailProperties.put("mail.smtp.auth", "true");
            javaMailProperties.put("mail.transport.protocol", "smtp");
            javaMailProperties.put("mail.debug", "true");


            mailSender.setJavaMailProperties(javaMailProperties);

            MimeMessagePreparator preparator = new MimeMessagePreparator() {
                public void prepare(MimeMessage mimeMessage) throws Exception {
                    MimeMessageHelper message = new MimeMessageHelper(mimeMessage);

                    message.setTo(userEmailId);
                    message.setFrom(mailSender.getUsername());
                    message.setSubject(subject);
                    message.setBcc(mailSender.getUsername());
                    message.setText(body);
                }
            };
            mailSender.send(preparator);

        return "Mail Sent Successfully.";
}
}

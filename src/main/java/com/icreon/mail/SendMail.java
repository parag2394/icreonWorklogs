package com.icreon.mail;


import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;
import java.util.Map;
import java.util.Properties;

import static com.icreon.util.ApplicationConstants.NOTIFICATION_SENDER_PASSWORD;
import static com.icreon.util.ApplicationConstants.NOTIFICATION_SENDER_USERNAME;

@Service
public class SendMail{

        public String sendEmail(final String subject,final String body,final String userEmailId) {

            final JavaMailSenderImpl mailSender = new JavaMailSenderImpl();

            System.out.println("Email Id :" + userEmailId);

            mailSender.setHost("smtp.gmail.com");
        //    mailSender.setHost("smtp.office365.com");
            mailSender.setPort(587);
            mailSender.setUsername(NOTIFICATION_SENDER_USERNAME);
            mailSender.setPassword(NOTIFICATION_SENDER_PASSWORD);

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

        public boolean prepare_mail(String p_project_id,Map<String, String> userMap, String p_issue_id,String to_status){

            String userName = userMap.get("Name");
            String userDate = userMap.get("Date");
            String timeSpent = userMap.get("Time");
            String description = userMap.get("Description");

            //    String userEmailId = userMap.get("Email");
              String userEmailId = "apitesting02@gmail.com";

            String body = "Hi "+userName+",\n\n Your time log of " + timeSpent + "hrs" + " has been "+to_status+".\n Details:\n  Project: " +p_project_id+ "\n  Issue: "+p_issue_id+"\n  Date: "+userDate+"\n  Description: " +description+"\n\nThank you";
            String subject = "Time Log Approved in JIRA";

            sendEmail(subject,body,userEmailId);

            return true;
        }
}

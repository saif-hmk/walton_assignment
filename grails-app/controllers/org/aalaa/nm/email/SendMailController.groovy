/**
 * @Created_By : AALAA
 * @Date       : 2022.08.05 11:29:32 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.nm.email

import grails.transaction.Transactional

import javax.activation.DataHandler
import javax.activation.DataSource
import javax.activation.FileDataSource
import javax.mail.*
import javax.mail.internet.InternetAddress
import javax.mail.internet.MimeBodyPart
import javax.mail.internet.MimeMessage
import javax.mail.internet.MimeMultipart

@Transactional(readOnly = true)
class SendMailController {

    def index() {}

    def sendEmail() throws MessagingException {
        println params

        //rnd
        SendEmailTLS        ("mis.ispp.lgd@gmail.com", "@#Mis.1spp@#", "saif.hmk@gmail.com", "1. Testing Gmail TLS"      , "1. This is a test Mail From ISPP");
        SendEmailSSL        ("mis.ispp.lgd@gmail.com", "@#Mis.1spp@#", "saif.hmk@gmail.com", "2. Testing Gmail SSL"      , "2. This is a test Mail From ISPP");

        /*
        String mailTo = params.to
        String cc = params.cc
        String subject = params.subject
        String msgBody = params.message
        String SENDER_EMAIL_ADDRESS = params.from
        String SENDER_EMAIL_PASSWORD = params.password

        Properties props = new Properties();
        props.put("mail.smtp.host", SMTP_SERVER);
        props.put("mail.smtp.socketFactory.port", SMTP_PORT);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.auth", "false");
        props.put("mail.smtp.port", SMTP_PORT);

        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(SENDER_EMAIL_ADDRESS,
                                SENDER_EMAIL_PASSWORD);
                    }
                });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(SENDER_EMAIL_ADDRESS));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mailTo));
        if (cc?.length() > 0) {
            message.setRecipients(Message.RecipientType.CC, InternetAddress.parse(cc));
        }
        message.setSubject(subject);
        message.setText(msgBody);

        def alertMessage = ""
        try {
            Transport.send(message);
            println "Message send successfully!"
            alertMessage = "Message send successfully!"
        } catch (Exception e) {
            println e
            alertMessage = "Due to an error Message sending failed! </br>Error : (" + e + ")"
        }
        render alertMessage
        return false
        */

        redirect(action: "index");
        return;
    }

    static void SendEmailTLS(String from, String password, String to, String sub, String msg) {
        Properties prop = new Properties();
        prop.put("mail.smtp.host"           , "smtp.gmail.com");
        prop.put("mail.smtp.port"           , "587");
        prop.put("mail.smtp.auth"           , "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS

        Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(sub);
            message.setText(msg);

            Transport.send(message);

            System.out.println("Done");
        }
        catch (MessagingException e) {
            "EX-02 : " + e.printStackTrace();
        }
    }

    static void SendEmailSSL(String from, String password, String to, String sub, String msg) {
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "465");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.socketFactory.port", "465");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(sub);
            message.setText(msg);

            Transport.send(message);

            System.out.println("Done");

        }
        catch (MessagingException e) {
            "EX-03 : " + e.printStackTrace();
        }
    }





    static final String SMTP_SERVER = "smtp.gmail.com";
    static final String SMTP_PORT = "465";
    static String SENDER_EMAIL_ADDRESS = "yourId@gmail.com";//todo: change
    static String SENDER_EMAIL_PASSWORD = "your password";   //todo: add

    /*
    static final String SMTP_SERVER = "smtp.live.com";
//    static final String SMTP_PORT = "587";
    static final String SMTP_PORT = "465";
    static String SENDER_EMAIL_ADDRESS = "yourId@live.com";//todo: change
    static String SENDER_EMAIL_PASSWORD = "your password";   //todo: add
    */
//    static final String SMTP_SERVER = "smtp.correo.yahoo.es";
//    static final String SMTP_PORT = "465";
//    static String SENDER_EMAIL_ADDRESS = "yourId@yahoo.com";  //todo: change
//    static String SENDER_EMAIL_PASSWORD = "your password";    //todo: add

    /*
    Incoming server: pop.myisp.com (or imap.myisp.com, if they use an IMAP server)
    Yahoo!: pop.mail.yahoo.com (incoming) and smtp.mail.yahoo.com (outgoing)
    AOL: imap.aol.com (incoming) and smtp.aol.com (outgoing)
    Gmail: pop.gmail.com (incoming) and smtp.gmail.com (outgoing)
    */

//    Server - smtp.mail.yahoo.com
// Yahoo! Mail SMTP server address: plus.smtp.mail.yahoo.com
//    Port - 465 or 587

//    Incoming Mail (POP3) Server: pop.mail.yahoo.com (Use SSL, port: 995)
//    Outgoing Mail (SMTP) Server: smtp.mail.yahoo.com (Use SSL, port: 465, use authentication)
//    Account Name/Login Name: Your Yahoo! Mail ID (your email address without the "@yahoo.com")
//    Email Address: Your Yahoo! Mail address (e.g., user@yahoo.com)
//    Password: Your Yahoo! Mail password


    def addEmailContents(messageBody, attachments) {

        // create the message part
        MimeBodyPart messageBodyPart = new MimeBodyPart();

        //fill message
        messageBodyPart.setText(messageBody);

        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(messageBodyPart);

        for (String attachment : attachments) {

            messageBodyPart = new MimeBodyPart();
            DataSource source = new FileDataSource(attachment);
            messageBodyPart.setDataHandler(new DataHandler(source));
            messageBodyPart.setFileName(attachment);
            multipart.addBodyPart(messageBodyPart);
        }
        return multipart;
    }

    def sendEmailWithAttachment(subject, messageBody, cc, bcc, mailTo, isAttachment, attachments) throws MessagingException {

        Properties props = new Properties();
        props.put("mail.smtp.host", SMTP_SERVER);
        props.put("mail.smtp.socketFactory.port", SMTP_PORT);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.auth", "false");
        props.put("mail.smtp.port", SMTP_PORT);
        String SENDER_EMAIL_ADDRESS = params.from
        String SENDER_EMAIL_PASSWORD = params.password

        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SENDER_EMAIL_ADDRESS, SENDER_EMAIL_PASSWORD);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(SENDER_EMAIL_ADDRESS));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mailTo));
        message.setSubject(subject);
        // message.setText(messageBody);
        if (!isAttachment) {
            message.setText(messageBody);
        } else {
            Multipart multipart = addEmailContents(messageBody, attachments)
            message.setContent(multipart);
        }
        Transport.send(message);
    }

}

<%-- 
    Document   : sendmail
    Created on : Aug 22, 2017, 5:48:32 AM
    Author     : sreekanth kasani  ')
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page  import="java.sql.*" %>
        <%@ page import="java.io.*"%>
        <%@ page import="javax.activation.*"%>
        <%@ page import="javax.servlet.http.*,javax.servlet.*"%>
        <%@page import=" java.util.*"%>
        <%@page import="javax.mail.*"%>
        <%@page import="javax.mail.internet.*"%>
        <%@page import="javax.mail.internet.MimeMessage"%>
        <%
            String mailto =null;
            try {
                String host = "smtp.gmail.com";
                String user = "/------------------INSERT YOUR USER_NAME HERE ---------------------------------/";
                String pass = "/-----------------------INSERT YOUR PASSWORD HERE --------------------/";
                String to = mailto;
                String from = "/--------------------INSERT YOUR MAIL HERE ----------------------------/";
                String subject = "Student Remarks - Vaagdevi group of Colleges";
                String messageText = "Dear"+ student +",<br>" +
                                                               "<p> I am the counseller attending you during your course of b-tech.</p>" +
                                                                "<center><p>academic remarks    :"    + aremarks + "<br>" +
                                                                "<p>behavioural remarks              :"    +bremarks + "<br>" +
                                                                "<p>total remarks during course   :"    +remarks_count + "<br></center>" + 
                                                                "<p>These are the remarks you have from your faculty and we hope that you do the best for the rest of period during your course </p>";
                boolean sessionDebug = false;

                Properties props = System.getProperties();

                props.put("mail.smtp.starttls.enable", "true");
                props.put("mail.smtp.host", host);
                props.put("mail.smtp.port", "587");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.starttls.required", "true");

                java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
                Session mailSession = Session.getDefaultInstance(props, null);
                mailSession.setDebug(sessionDebug);
                Message msg = new MimeMessage(mailSession);
                msg.setFrom(new InternetAddress(from));
                InternetAddress[] address = {new InternetAddress(to)};
                msg.setRecipients(Message.RecipientType.TO, address);
                msg.setSubject(subject);
                msg.setSentDate(new java.util.Date());
                msg.setContent(messageText,"text/html");

                Transport transport = mailSession.getTransport("smtp");
                transport.connect(host, user, pass);
                transport.sendMessage(msg, msg.getAllRecipients());
                transport.close();
                System.out.println("message send successfully");
            } catch (Exception ex) {
                System.out.println(ex);
            }

        %>
        <jsp:forward page="cDashboard.jsp" />
</body>
</html>

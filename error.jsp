<%-- 
    Document   : error
    Created on : Jun 20, 2017, 11:51:38 AM
    Author     : sreekanth kasani  ')
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>

<%
    Connection conn = null;
    String driver = "com.mysql.jdbc.Driver";
    String user = "root";
    String pass = "root";
    String address = "jdbc:mysql://localhost:3306/scms";
    Class.forName(driver);
    conn = DriverManager.getConnection(address, user, pass);
    Statement st = conn.createStatement();
%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry</title>
        <style>
            body {
                background-image:url(errorbg.png);
                background-repeat:no-repeat;
                background-size:cover;
            }
        </style>
    </head>
    <body>
            <center>
                <img src="errormsg.png" alt="something has gone wrong">
            <p> our technical staff is working on it<br />
                we'll try to recover as soon as possible <br />
                if problem persist please contact administator<br />
            </p>
            </center>
    </body>
</html>

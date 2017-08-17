<%-- 
    Document   : fbhandler
    Created on : Jul 3, 2017, 6:32:19 AM
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
        <%
            String user = request.getParameter("uid");
            String feedback =request.getParameter("feedback");
            PreparedStatement ps;
            Connection conn;
            ResultSet rs = null;
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/scms", "root", "root");
            Statement st = conn.createStatement();
            String query = "insert into feedback values('"+ user + "','" + feedback + "')"; 
            st.executeUpdate(query);
        %> 
        <jsp:forward page="AdminDashboard.jsp"></jsp:forward>
    </body>
</html>

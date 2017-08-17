<%-- 
    Document   : deleteProfile
    Created on : Jun 27, 2017, 6:28:13 PM
    Author     : sreekanth kasani  ')
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Profile</title>
    </head>
    <body>
        <%@ page language="java" %>
        <%@ page import="java.sql.*" %>
        <%@ page import="java.sql.DriverManager.*" %>
        <%
            String refno = null;
            boolean isEdit = false;
            String profileType = null;
            if(!session.getAttribute("profileType").equals(null)){
               profileType =  session.getAttribute("profileType").toString();
               isEdit = true;
               session.setAttribute("isEdit", true);
             }
            if ((request.getParameter("refno")).equals(null)) {
                response.sendRedirect("error.jsp");
                return;
           } else {
              refno = request.getParameter("refno").toString();
            }
            int j = 0; 
            String query;
            Statement st;
            PreparedStatement ps;
            Connection conn;
            ResultSet rs = null;
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/scms", "root", "root");
            st = conn.createStatement();
            String[] tables = {"personaldetails","academicperformance","attendance","achievements","counsellerdetails","remarks","feedetails"};
                for(int i=0;i<7;i++){
                query = "delete from " + tables[i] + " where admission_no ='"+ refno +"'";
                j = st.executeUpdate(query);
                if(j!=1){
                  response.sendRedirect("error.jsp");
               }
            } 
            if(!isEdit){
          response.sendRedirect("dashboard.jsp");
            }else{
                response.sendRedirect("studDB.jsp?htno=" + refno);
            }
        %>
    </body>
</html>

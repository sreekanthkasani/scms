<%-- 
    Document   : fetchDetails
    Created on : Jun 21, 2017, 8:10:53 AM
    Author     : sreekanth kasani  ')
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="table.css">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Fetching</title>
    </head>
    <body>

        <%@ page language="java" %>
        <%@ page import="java.sql.*" %>
        <%@ page import="java.sql.DriverManager.*" %>
        <%@page import="java.util.*" %>

        
    <%
        boolean permit=false;
        String exportToExcel = request.getParameter("exportToExcel");
        if (exportToExcel != null
                && exportToExcel.toString().equalsIgnoreCase("YES")) {
            permit = true;
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "inline; filename="
                    + "excel.xls");
 
        }
    %>
        

        <%
            String q = null;
            if(!permit){
            q = request.getParameter("q");
            session.setAttribute("status",q);
            }else{
             q = session.getAttribute("status").toString();
            }
            String[] str = q.split("\\s+");        
            ArrayList<String> columns = null;
            ResultSetMetaData metadata;
            int columnCount = 0;
            String columnName = null;
            String post_type = (String) session.getAttribute("postType");
            PreparedStatement ps;
            Connection conn;
            ResultSet rs = null;
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/scms", "root", "root");
            Statement st = conn.createStatement();
        %> 

        <%
            try {
                rs = st.executeQuery(q);
                metadata = rs.getMetaData();
                columnCount = metadata.getColumnCount();
                columns = new ArrayList<String>();
                for (int i = 1; i < columnCount + 1; i++) {
                    columnName = metadata.getColumnName(i);
                    columns.add(columnName);
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        %>
           <div style="font-family: cursive;">
                <h1> <%= str[3] %> </h1>   	
          </div>
        <%--   <%
               if (rs.next()) {
           %> --%>
        <table style="width: 1227px;">
            <thead>
                <tr>
                    <%
                        for (int i = 0; i < columns.size(); i++) {
                    %>
                    <th><%String k = columns.get(i);%><%= k%> </th>
                        <%
                            }
                        %>
                    <th>&nbsp;</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if(rs.next()){
                       do {
                %>
                <tr>
                    <%
                        String id = null;
                        for (int i = 0; i < columns.size(); i++) {
                            columnName = columns.get(i);
                            String k = rs.getString(columnName);
                    %>
                    <td><% if (columnName.equals("admission_no")){
                              id = k;
                        %>
                        <a href="getProfile.jsp?refno=<%=k %>"><%= k%></a>
                        <% }else if (columnName.equals("email") || columnName.equals("counseller_email") ) {%>
                        <a href="mailto:<%= k%>"><%= k%> </a>
                        <%} else {%>
                        <%= k%>
                        <%}%>
                    </td>
                    <%
                        }
                    %>
                    <td>
                        <a href="getProfile.jsp?refno=<%= id %>"><img src="profile_img.png" alt="P"></a>
                        <a href="editProfile.jsp?refno=<%= id %>"><img src="edit.png" alt="E"></a>
                        <a href="deleteProfile.jsp?refno=<%= id %>"><img src="delete.png" alt="D"></a>
                    </td>
                </tr>
                <%
                    }while(rs.next());
                %> 
            </tbody>                
        </table>
         <%} else {%>
         <h3 style="font-family: cursive;"> no search results found </h3>
         <%}%>

    <center>
  <footer style="
                width: 1438px;
                margin-left: 2px;
                margin-bottom: 0px;
                height: 0px;
                margin-right: 111px;
                padding-top: 0px;
                padding-bottom: 20px;
                ">
            <ul>
                <li style="margin-right:120px; float: right; text-decoration: none;"><a href="misc.jsp?req=1">give a feedback </a> | <a href="misc.jsp?req=2"> about project</a> |  <a href="misc.jsp?req=3"> Contact </a> </li>
            </ul>
        </footer>
    </center>
</body>
</html>

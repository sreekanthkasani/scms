<%-- 
    Document   : advanced
    Created on : Jun 30, 2017, 8:51:59 PM
    Author     : sreekanth kasani  ')
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>::query::</title>
         <link rel="shortcut icon" href="favicon.ico">
        <link rel="stylesheet" type="text/css" href="table.css">
        <style>
            body {
                /*font: 13px/20px 'Lucida Grande', Tahoma, Verdana, sans-serif;
                  color: #404040; */
                height:964px;
                background: #0ca3d2;
                background-image:url(webql.jpg);
                background-repeat:no-repeat;
                background-size:cover;
            }
            body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, 
            pre, form, fieldset, input, textarea, p, blockquote, th, td { 
                padding:0;
                margin:0;}
            </style>
        </head>
        <body>
            <%@page language="java" %>
            <%@page import="java.sql.*" %>
            <%@page import="java.sql.DriverManager.*" %>
            <%@page import = "java.util.*" %>
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

            <%
                boolean isAllowed = false;
                String cName = null;
                ResultSetMetaData metadata;
                int cCount = 0;
                int j = 0;
                ArrayList<String> columns = null;
                ResultSet rs = null;
                String[] ify = null;
                String query = null;
                query = (String) request.getParameter("q");
                ify = query.split("\\s+");
                if (ify[0].equalsIgnoreCase("select")) {
                    try {
                        isAllowed = true;
                        rs = st.executeQuery(query);
                        metadata = rs.getMetaData();
                        cCount = metadata.getColumnCount();
                        columns = new ArrayList<String>();
                        for (int i = 1; i < cCount + 1; i++) {
                            cName = metadata.getColumnName(i);
                            columns.add(cName);
                        }
                    } catch (SQLException se) {
                        out.println("Exception raised");
                    }
                } else {
                    j = st.executeUpdate(query);
                }
            %>
        <center>
            <div style="font-family: cursive;">
            <center><h1>query:  <%= query%> </h1></center>   	
        </div>
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
                    if (rs.next()) {
                        do {
                %>
                <tr>
                    <%
                        String id = null;
                        for (int i = 0; i < columns.size(); i++) {
                            cName = columns.get(i);
                            String k = rs.getString(cName);
                    %>
                    <td><% if (cName.equals("admission_no")) {
                            id = k;
                        %>
                        <a href="getProfile.jsp?refno=<%=k%>"><%= k%></a>
                        <% } else if (cName.equals("email") || cName.equals("counseller_email")) {%>
                        <a href="mailto:<%= k%>"><%= k%> </a>
                        <%} else {%>
                        <%= k%>
                        <%}%>
                    </td>
                    <%
                        }
                    %>
                    <td>
                        <a href="getProfile.jsp?refno=<%= id%>"><img src="profile_img.png" alt="P"></a>
                        <a href="editProfile.jsp?refno=<%= id%>"><img src="edit.png" alt="E"></a>
                        <a href="deleteUser.jsp?refno=<%= id%>"><img src="delete.png" alt="D"></a>
                    </td>
                </tr>
                <%
                    } while (rs.next());
                %> 
            </tbody>                
        </table>
        <%} else {%>
        <h3 style="font-family: cursive;"> no search results found </h3>
        <%}%>
    </center>
</body>
</html>

<%-- 
    Document   : validateLogin
    Created on : Jun 19, 2017, 6:54:56 PM
    Author     : sreekanth kasani  ')
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>authenticateLogin</title>
    </head>
    <body>

        <%@ page language="java" %>
        <%@ page import="java.sql.*" %>
        <%@ page import="java.sql.DriverManager.*" %>
        <%
            String post_type = (String) session.getAttribute("postType");
            PreparedStatement ps;
            Connection conn;
            ResultSet rs = null;
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/scms", "root", "root");
            out.println("connected to database");

            Statement st = conn.createStatement();
        %> 
        <%
            int queryStatus = 0;
            String name = null;
            String password = null;
            String userType = null;
            String email = null;
            String mobile = null;
            String password1 = null;
            String ar = null;
            String id = null;
            boolean aflag = false, flag = false, redirectFlag = false;
            if (post_type.equals("login")) {
                name = request.getParameter("uname");
                password = request.getParameter("password");
                userType = request.getParameter("course_year");
            } else {
                id = request.getParameter("id");
                name = request.getParameter("uname");
                password = request.getParameter("pass1");
                password1 = request.getParameter("pass2");
                email = request.getParameter("email");
                mobile = request.getParameter("mobile");
                ar = request.getParameter("Acess");
                if("Admin".equals(ar)){
                    ar  = "yes" ;
                }else{
                    ar = "no" ;
                }
            }


        %>

        <%           
            String sql;
            if (post_type.equals("login")) {
                sql = "select name, isAdmin  from users where name=? and password =?";
            } else {
                sql = "insert into users values(?,?,?,?,?,?)";
            }

            try {
                ps = conn.prepareStatement(sql);
                if (post_type.equals("login")) {
                    ps.setString(1, name);
                    ps.setString(2, password);
                    rs = ps.executeQuery();
                } else {
                    ps.setString(1, id);
                    ps.setString(2, name);
                    ps.setString(3, password );
                    ps.setString(4, ar);
                    ps.setString(5, email);
                    ps.setString(6, mobile);
                    queryStatus = ps.executeUpdate();
                }

                if (post_type.equals("login")) {
                    if (rs.next()) {
                        flag = true;
                        session.setAttribute("uname", rs.getString("name"));
                        session.setAttribute("isAdmin", rs.getString("isAdmin"));
                        if ("yes".equals(rs.getString("isAdmin"))) {
                            aflag = true;
                        } else {
                            session.setAttribute("course_year", userType);
                        }
                    } else {
                        request.setAttribute("err", "user name or password error!");
                    }

                    rs.close();
                    ps.close();
                    conn.close();

                } else {
                    if (queryStatus != 1) {
                        session.setAttribute("err", "unable to register the faculty");
                    } else {
                        redirectFlag = true;
                    }
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>


        <%
            if (flag || redirectFlag) {
                if (aflag) {
        %>
        <jsp:forward page="dashboard.jsp" />
        <%} else {
        %>
        <jsp:forward page="dashboard.jsp" />
        <%}
        } else {
        %>
        <jsp:forward page="error.jsp" /> 
        <%
            }
        %>
    </body>
</html>
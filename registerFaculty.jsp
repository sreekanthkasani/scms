<%-- 
    Document   : registerFaculty
    Created on : Jun 20, 2017, 4:04:59 AM
    Author     : sreekanth kasani  ')
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RegisterFaculty</title>
        <link rel="stylesheet" type="text/css" href="form.css">
        <link rel="stylesheet" type="text/css" href="home.css">
        <script type="text/javascript">
            function openPage(pageURL)
            {
                window.location.href = pageURL;
            }
        </script>
    </head>

    <body>
        <div  class="header-block1">
            <div id="loginMessage">&nbsp;</div>
            <div class="loginWrap" style="
                 float:left;
                 padding-left: 0px;
                 padding-right: 0px;
                 padding-bottom: 6px;
                 width: 322px;  ">
                <div class="loginBox">
                    <h3>Register Faculty</h3>
                    <form name="loginForm" id="loginForm" action="authenticateLogin.jsp" onsubmit="<%session.setAttribute("postType", "register");%>" method="post" style="margin-left: 16px;">

                        <input type="text" name="id"  id="password" placeholder="provide user id" />
                        <div class="loginErrorText" id="let2">&nbsp;</div>

                        <input type="text" name="uname" id="username" value="" placeholder="Assign Username" />
                        <div class="loginErrorText" id="let1">&nbsp;</div>

                        <input type="text" name="pass1" id="password" placeholder="Assign password" />
                        <div class="loginErrorText" id="let2">&nbsp;</div>

                        <input type="text" name="pass2" id="password" placeholder="Confirm password" />
                        <div class="loginErrorText" id="let2">&nbsp;</div>

                        <input type="text" name="email" id="password" placeholder="email here" />
                        <div class="loginErrorText" id="let3">&nbsp;</div>

                        <input type="text" name="mobile" id="password" placeholder="contact number here" />
                        <div class="loginErrorText" id="let4">&nbsp;</div>

                        <select name="Acess" >
                            <option name="default" disabled selected>Acess Rights</option>
                            <option name="a1">Admin</option>                       
                            <option name="a2" >Faculty</option>
                        </select>

                        <div>
                            <input type="submit" style="width: 265px;padding-bottom: 7px;margin-top: 0px;padding-top: 6px;" value="Register" />
                        </div>

                        <div class="center">
                            <a href="/" class="subtext">Forgot your password?</a>
                        </div>

                    </form>
                </div>
            </div>

        </div>
    </div>
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
            <li style="margin-right:120px; float: right;color: #e5dfd5"><a style="color: #e5dfd5; text-decoration: none;font-size: smaller;" href="feedback.jsp">give a feedback </a> | <a style="color: #e5dfd5; text-decoration: none;font-size: smaller;" href="about.jsp"> about project</a> |  <a style="color: #e5dfd5; text-decoration: none;font-size: smaller;" href="contact.jsp"> Contact </a> </li>
        </ul>
    </footer>
</center>
</body>
</html>

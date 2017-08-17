<%-- 
    Document   : misc
    Created on : Jul 2, 2017, 5:24:20 PM
    Author     : sreekanth kasani  ')
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="reg.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>::Misc::</title>
        <style>
            body {
                background: #343338;
            }
            
            h4{
                margin-left: 30px;
            }

            .container {
                height: 604px;
                width: 432px;
                background:#fff;
                margin:auto;
                box-shadow: 10px 10px 5px #222;
            }
            .topimg {
                height:40%;
                width:80%;
                margin:auto;
                overflow:hidden;
            }
            .topimg img {
                position:relative;
                max-width:100%;
                max-height:100%;
                -webkit-transition:all 0.7s ease-in-out;
                transition:all 0.7s ease-in-out;
            }
            .container:hover .topimg img {
                transform:scale(1.2);
                -webkit-transition:all 0.7s ease-in-out;
                transition:all 0.7s ease-in-out;
            }
            .info h2 {
                font-family: 'Playfair Display', serif;
                text-align:center;
                font-weight:bold;
                margin-bottom:5px;
                font-size:2em;
                margin-top:10px;
            }
            .info h3 {
                color:#b03f3f;
                text-align:center;
                font-style:italic;
                margin:0px;
            }
            .info p {
                text-align:center;
                text-transform:uppercase;
                font-weight:bold;
                font-size:0.8em;
                margin:5px;
                color:grey;
            }
            hr {
                width:70%;
                background:#b03f3f;
                height:1px;
                margin-top:5%;
            }

        </style>
    </head>
    <body background="#343338">
        <% String req = (String) request.getParameter("req");
            int k = Integer.parseInt(req);
        %>
        <%
            if (k == 1) {
        %>   
        <form action="fbhandler.jsp" class="regform" method="post">
            <fieldset id="first" style="padding-right: 31px;margin-left:500px;margin-top: 16px;"> 
                <h1 style="font-family: cursive;margin:0px;color:#0016ff;">Feedback</h1>
                <h4 style="font-family: cursive;margin:0px;color:#0ca3d2;" >We all need people who will give us feedback. That's how we improve.</h4>
                <hr>
                <h3>Are we fast enough..</h3>
                <input type="radio" name="speed" value="yes">Yes
                <input type="radio" name="speed" value="no">No
                <h3>How are options provided..</h3>
                <input type="radio" name="opts" value="yes">Good
                <input type="radio" name="opts" value="no">Need Improvement
                <h3>Is our platform responsive..</h3>
                <input type="radio" name="resp" value="yes">Yes
                <input type="radio" name="resp" value="no">No
                <input type="text" name="feedback" placeholder="Any features to be included">
                <input type="text" name="uid" placeholder="User name here" required=""> 
                <input type="submit" value="submit" name="submit" style="float: right;">
            </fieldset>
        </form>
        <%  } else if (k == 2) {
        %> 
        <jsp:forward page="aProject.jsp"></jsp:forward>
        <%
        } else {
        %> 

        <div class="container">
            <div class="topimg" style="margin-left:40px;">
                <img src="team2.jpg" alt="TEAM" style="margin-left:40px;"/>
            </div>
            <div class="info">
                <h2>Student Counselling Management System</h2> 
                <h3>Redefining Counselling System</h3>
                <hr>
                <h4>Sreekanth Kasani</h4>
                <h4>Sushanth Jonnala</h4>
                <h4>Spandana</h4>
                <h4>Swetha</h4>
                <p style="margin-top:5%;">meetus@scms.com</p>
                <p>+91 8179329263</p>
            </div>
        </div>
        <%}%>
    </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String userid = request.getParameter("userid");
    String secretkey = request.getParameter("secretkey");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/register.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon">
    <link href="css/index.css" rel="stylesheet" type="text/css">
    <link href="css/encryption.css" rel="stylesheet" type="text/css">

</head>
<body>
    <header>
        <div class="logo">
            <img class="logo-img" src="images/logo.png">
            <span>Secure Cloud</span>
        </div>
        <div class="navbar">
            <ul class="navlist">
                <li><a href="index.jsp">&nbsp;Home&nbsp;</a></li>
                <li><a href="register.jsp">&nbsp;Register&nbsp;</a></li>
                <li><a href="login.jsp">&nbsp;Login&nbsp;</a></li>
                <li><a href="about.jsp">&nbsp;About&nbsp;</a></li>
            </ul>
        </div>
        <div class="bx bx-menu" id="menu-icon">
        </div>
    </header>
    <div class="box">
        <form method="post" action="firstLogin" class="form">
            <h1 class="form-title">User ID</h1>
            <%
            String msg = null;
            msg = (String) session.getAttribute("MSG");
            if (msg != null) {
        %>
            <div class="error"><%=msg%></div>                                    
        <%
                session.removeAttribute("MSG");
            } else {
                session.setAttribute("MSG", "");

            }
        %>
            <div class="form-group">
                <input type="text" name="userid" id="userid" placeholder="User ID" class="form-control" required value="<%=userid%>"/>
                <label for="email" class="form-label">Your user id is</label>
            </div>
            <div class="button-box">
                <button class="form-button"><a href="login.jsp">click here to login</a></button>
            </div>
        </form>
    </div>
    <script src="js/nav.js"></script>
</body>
</html>
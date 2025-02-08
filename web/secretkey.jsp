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
    <title>Secrete Key</title>
    <link href="css/register.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon">
    <link href="css/index.css" rel="stylesheet" type="text/css" />
    <link href="css/encryption.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function validation() {
            
            var otp = document.getElementById('otp');
            if (otp.value.trim() == "") {
                alert('Please enter your otp');
                otp.focus();
                return false;
            }
        }
    </script>
</head>

<header>
    <div class="logo">
        <img class="logo-img"src="images/logo.png">
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
        <h1 class="form-title">Generate User ID</h1>
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
        <div>
            <input type="hidden" name="userid" id="userid" value="<%=userid%>"/>
        </div>
        <div class="form-group">
            <input type="text" name="secretekey" id="secretekey" placeholder="Secrete key" class="form-control" required value="<%=secretkey%>"/>
            <label for="text" class="form-label">Your ECDH key is</label>
        </div>
        <div class="form-group">
            <input type="text" name="otp" id="otp" placeholder="OTP" class="form-control" required/>
            <label for="text" class="form-label">OTP has been sent to your email id</label>
        </div>
        <div class="button-box">
            <input type="submit" name="btnsubmit" id="btnsubmit" value="Generate User ID" class="form-button" onclick="return validation();">
        </div>
    </form>
</div>
<script src="js/nav.js"></script>
<body>
    
</body>
</html>
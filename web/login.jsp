<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <link href="css/register.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/encryption.css">
    <script type="text/javascript">
        function validation() {
            var userid = document.getElementById('userid');
            if (userid.value.trim() == "") {
                alert('Please enter your userid');
                userid.focus();
                return false;
            }
            var opt = document.getElementById('opt');
            if (opt.value.trim() == "") {
                alert('Please enter your opt');
                opt.focus();
                return false;
            }
        }

        function otpgeneration() {

            var userid = document.getElementById('userid');
            if (userid.value.trim() == "") {
                alert('Please enter your userid');
                userid.focus();
                return false;
            } else {
                var xmlHttpRequest = init();
                function init() {
                    if (window.XMLHttpRequest) {
                        return new XMLHttpRequest();
                    } else if (window.ActiveXObject) {
                        return new ActiveXObject("Microsoft.XMLHTTP");
                    }
                }
                xmlHttpRequest.open("POST", "generateOTP?userid=" + escape(userid.value), true);
                xmlHttpRequest.onreadystatechange = processRequest;
                xmlHttpRequest.send(null);

                function processRequest() {
                    if (xmlHttpRequest.readyState == 4) {
                        if (xmlHttpRequest.status == 200) {
                            processResponse();
                        }
                    }
                }

                function processResponse() {
                    var xmlMessage = xmlHttpRequest.responseXML;
                    var result = xmlMessage.getElementsByTagName("sname")[0].firstChild.nodeValue;
                    alert(result);
                }
            }
        }
    </script>
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
        <form method="post" action="login" class="form">
            <h1 class="form-title">Login In</h1>
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
                <input type="text" name="userid" id="userid" placeholder="User ID" class="form-control" required />
                <label for="email" class="form-label">Enter user ID</label>
            </div>
            <div class="form-group">
                <input type="text" name="otp" id="opt" placeholder="OTP" class="form-control" required />
                <label for="password" class="form-label">Enter your OTP</label>
            </div>
            <div class="button-box">
                <a onclick="return otpgeneration()" style="margin-right: 30px; cursor: pointer;">Request for OTP<a/>
                <button class="form-button" name="btnsubmit" id="btnsubmit" value="Submit"
                    onclick="return validation()">Submit</button>
            </div>
        </form>
    </div>
    <script src="js/nav.js"></script>
</body>

</html>
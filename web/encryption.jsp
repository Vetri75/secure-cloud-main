<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
    response.setDateHeader("Expires", 0); //prevents caching at the proxy server
    response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
    String id = null;
    id = (String) session.getAttribute("ID");
    if (id != null) {
%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Encryption</title>
    <link href="css/register.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon">
    <link href="css/index.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/encryption.css">
    <script type="text/javascript">
        function validation() {
            var filename = document.getElementById('xkey');
            if (filename.value.trim() == "") {
                alert('Please enter encryption key');
                filename.focus();
                return false;
            }

            var usrfile = document.getElementById('usrfile');
            if (usrfile.value.trim() == "") {
                alert('Please select file');
                usrfile.focus();
                return false;
            }

        }
        function validation() {
            var userid = document.getElementById('userid');
            if (userid.value.trim() == "") {
                alert('Please enter your userid');
                userid.focus();
                return false;
            }
            var otp = document.getElementById('otp');
            if (otp.value.trim() == "") {
                alert('Please enter your otp');
                otp.focus();
                return false;
            }
        }
        function myFunction() {
            // Get the text field
            var copyText = document.getElementById("userid");

            // Select the text field
            copyText.select();
            copyText.setSelectionRange(0, 99999); // For mobile devices

            // Copy the text inside the text field
            navigator.clipboard.writeText(copyText.value);

            // Alert the copied text
            alert("Copied the text: " + copyText.value);
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
                <li><a href="myaccount.jsp">My Account</a></li>
                <li><a href="encryption.jsp">Encryption</a></li>
                <li><a href="description.jsp">Decryption</a></li>
                <li><a href="downloadfile.jsp">Download</a></li>
                <li><a href="logout">Logout</a></li>
            </ul>
        </div>
        <div class="bx bx-menu" id="menu-icon">
        </div>
    </header>
    <div class="box">
        <form method="post" action="encryption" enctype="multipart/form-data" style="height: 510px" class="form">
            <h1 class="form-title">Encryption</h1>
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
                <div class="drop-zone">
                    <span class="drop-zone__prompt">Drop file here or click to upload</span>
                    <input type="file" name="txtfile" id="txtfile" class="drop-zone__input"/>
                  </div>
                <div class="form-group">
                    <input type="text" name="xkey" id="xkey" placeholder="Encryption Key" class="form-control"
                        required />
                    <label for="email" class="form-label">Encryption Key</label>
                </div>
                <div class="button-box">
                    <input type="submit" name="btnsubmit" id="btnsubmit" class="form-button" value="Submit"
                        onclick="return validation()">
                </div>
            </div>
    </div>

    </form>
    </div>
    <script src="js/main.js"></script>
    <script src="js/nav.js"></script>
</body>
</html>
<%    } else {
    session.setAttribute("MSG", "You must be login.");
    response.sendRedirect("login.jsp");
}
%>
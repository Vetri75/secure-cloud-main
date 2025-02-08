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
    <title>Decrypt AES Key</title>
    <link href="css/register.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon">
    <link href="css/index.css" rel="stylesheet" type="text/css" />
    <link href="css/encryption.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function validation() {
            var publickey = document.getElementById('publickey');
            if (publickey.value.trim() == "") {
                alert('Please enter AES key');
                publickey.focus();
                return false;
            }                
            var txtfile = document.getElementById('txtfile');
            if (txtfile.value.trim() == "") {
                alert('Please select file');
                txtfile.focus();
                return false;
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
        <form method="post" action="decryptedKey" class="form">
            <h1 class="form-title">Enter public key for downloading file and decrypting AES Key</h1>
                <%
                                    String msg = null;
                                    String fileid = request.getParameter("fileid");
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
                <div >
                    <input type="hidden" name="fileid" id="fileid" value="<%=fileid%>"/>
                </div>
                <div class="form-group">
                    <input type="text" name="publickey" id="publickey" placeholder="Public Key" class="form-control"/>
                    <label for="Encryption key" class="form-label">Enter public key</label>
                </div>
                <div class="button-box">
                    <input type="submit" name="btnsubmit" id="btnsubmit" value="Submit" class="form-button" onclick="return validation()">
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
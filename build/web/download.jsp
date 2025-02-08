<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%    response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
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
    <title>Decryption</title>
    <link href="css/register.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon">
    <link href="css/index.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/encryption.css">
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
        <form method="post" action="description" enctype="multipart/form-data" class="form" style="min-height: 300px;">
            <h1 class="form-title">Download</h1>
            <div class="form-group">
                <div class="sample" style="font-size: 16px;text-align: center; ">
                    <%
                    String filename = request.getParameter("filename");
                %>
                Your file has been successfully decrypted.<br/>
                </div>
                <div class="sample" style="font-size: 16px;text-align: center;">
                    <button class="sample-btn"><a href="uploads/downloads/<%=filename%>" style="color: aliceblue;">Click here to download decrypted file</a></button>
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
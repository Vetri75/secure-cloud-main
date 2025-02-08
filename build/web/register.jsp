<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link href="css/register.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon">
    <link href="css/index.css" rel="stylesheet" type="text/css" />
    <link href="css/encryption.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function validation() {
            var name = document.getElementById('name');
            if (name.value.trim() == "") {
                alert('Please enter your name');
                name.focus();
                return false;
            }

            var alphaExp = /^[a-z A-Z]+$/;
            if (!name.value.match(alphaExp)) {
                alert("Name shoud be alphabatic.");
                return false;
            }

            var email = document.getElementById('email');
            if (email.value.trim() == "") {
                alert('Please enter your email');
                email.focus();
                return false;
            }

            var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
            if (reg.test(email.value) == false) {
                alert('Please enter valid email');
                email.focus();
                return false;
            }

            var mobile = document.getElementById('mobile');
            if (mobile.value.trim() == "") {
                alert('Please enter your mobile no.');
                mobile.focus();
                return false;
            }
            if (mobile.value.toString().length < 10) {
                alert("Mobile no should be ten character long");
                mobile.focus();
                return false;
            }
        }
    </script>
</head>
<body>
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
        <form method="post" action="register" class="form">
            <h1 class="form-title">Register</h1>
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
                <input type="text" name="name" id="name" class="form-control" required />
                <label for="text" class="form-label">Name</label>
            </div>
            <div class="form-group">
                <input type="email" name="email" id="email" class="form-control" required/>
                <label for="email" class="form-label">Email</label>
            </div>
            <div class="form-group">
                <input type="number" name="mobile" id="mobile" class="form-control" required/>
                <label for="number" class="form-label">Mobile number</label>
            </div>
            <div class="form-group">
                <input type="date" name="dob" id="dob" class="form-control" required />
                <label for="date" class="form-label">Date of Birth</label>
            </div>
            <div class="form-group">
                <select name="gender" id="gender" class="form-control">
                    <option value="na" selected="">Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                </select>
                <label for="text" class="form-label">Gender</label>
            </div>
            <div class="button-box">
                <a href="login.jsp">Already have an account ?</a>
                <input type="submit" name="btnsubmit" id="btnsubmit" value="Next" class="form-button" onclick="return validation()">
            </div>
        </form>
    </div>
    <script src="js/nav.js"></script>
</body>
</html>
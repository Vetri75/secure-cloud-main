<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<%
    Connection conn = null;
    Statement st = null;
    ResultSet result = null;
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
    <title>Secure Cloud</title>
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon">
    <link href="css/index.css" rel="stylesheet" type="text/css" />
    <link href="css/register.css" rel="stylesheet" type="text/css" />
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
    <section id="home">
        <div class="hero-text">
            <h3>Hello, <%=(String) session.getAttribute("NAME")%></h3>
            <h1>welcome To,</h1>
            <h3>Secure file storage system on cloud using <span>hybrid cryptography,</span></h3>
            <p>Efficient & Secure Data Storage & Access Scheme in Cloud Computing using Elliptic Curve Cryptography and
                AES</p>
            <a href="#about">Contact</a>
        </div>
        <div class="home-img">
            <img src="images/file1.png">
        </div>
    </section>
    <div class="icons">
        <a href="https://www.instagram.com/always_fun___vedi/" target="_blank"><i class='bx bxl-instagram'></i></i></a>
        <a href="https://www.linkedin.com/in/vediyappan-c-a78054235/" target="_blank"><i class='bx bxl-linkedin'></i></a>
        <a href="https://github.com/C-VEDIYAPPAN" target="_blank"><i class='bx bxl-github'></i></a>
    </div>
    <div class="scroll-down">
        <a href="#"><i class='bx bx-up-arrow-alt'></i></a>
    </div>
            <section id="home">
        <div class="hero-text">
            <h3>Secure cloud<span> hybrid cryptography,</span></h3>
            <p>The primary goal of this project is to provide and simulate an effective solution to 
                                    face the challenges and solve security issues that exists in cloud computing. 
                                    Cloud Computing is the impending need of computing which is used for the IT Industries
                                    It is one of the hottest topic in research areas.<span id="dots">...</span><span id="more"> Scalability and Flexibility increases
                                    for the computing services.The Application is deployed on the Cloud and for the secure transmission
                                    of the data we will be using ECC Algorithm in our project because of its advantages in terms
                                    of CPU utilization, time for Encryption and Key Size.</span></p>
            <a onclick="myFunction()" id="myBtn">Read more</a>
        </div>
        <div class="home-img">
            <img src="images/file2.png">
        </div>
    </section>
    <section>
        <div class="box">
            <form method="post" action="myAccount" class="form">
                <h1 class="form-title">Update Your Profile</h1>
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
                                <%
                                    try {
                                        conn = connection.dbConnection.makeConnection();
                                        String query = "SELECT name,email,mobile,gender,dob FROM users WHERE userid='" + id + "'";
                                        st = conn.prepareStatement(query);
                                        result = st.executeQuery(query);
                                        if (result.next()) {

                                            String name = result.getString(1);
                                            String email = result.getString(2);
                                            String mobile = result.getString(3);
                                            String gender = result.getString(4);
                                            String dob = result.getString(5);

                                %>
                <div class="form-group">
                    <input type="text" name="userid" id="userid" placeholder="Userid" class="form-control" value="<%=id%>"/>
                    <label for="text" class="form-label">User ID</label>
                </div>
                <div class="form-group">
                    <input type="text" name="name" id="name" placeholder="Name" class="form-control" value="<%=name%>"/>
                    <label for="Name" class="form-label">Name</label>
                </div>
                <div class="form-group">
                    <input type="text" name="email" id="email" placeholder="Email" class="form-control" value="<%=email%>"/>
                    <label for="email" class="form-label">Email</label>
                </div>
                <div class="form-group">
                    <input type="text" name="mobile" id="mobile" placeholder="Mobile No." class="form-control" value="<%=mobile%>"/>
                    <label for="date" class="form-label">MObile Number</label>
                </div>
                <div class="form-group">
                    <input type="date" name="dob" id="dob" placeholder="Date of Birth" class="form-control" value="<%=dob%>" />
                    <label for="date" class="form-label">Date of Birth</label>
                </div>
                <div class="form-group">
                    <select name="gender" id="gender" class="form-control">                                            
                        <%
                            if (gender.equals("Male")) {
                        %>
                        <option value="na">Gender</option>
                        <option value="Male" selected="">Male</option>
                        <option value="Female">Female</option>
                        <%
                        } else if (gender.equals("Female")) {
                        %>
                        <option value="na">Gender</option>
                        <option value="Male">Male</option>
                        <option value="Female"  selected="">Female</option>
                        <%
                        } else {
                        %>
                        <option value="na" selected="">Gender</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <%
                            }
                        %>
                    </select>
                    <label for="text" class="form-label">Gender</label>
                </div>
                <div class="button-box">
                    <input type="submit" name="btnsubmit" id="btnsubmit" value="Update" class="form-button"
                        onclick="return validation()">
                </div>
                    <%    }

                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }

                                %>
            </form>
        </div>
    <section class="footer">
        <footer>
            <div class="hero-text">
            <h3>Created By<span> @Backbenchers</span></h3>
            <p>parthiban,<br>
               vediyappan,<br>
               vetri, <br><!-- comment -->
               vijay sankar.
            </p>
            <h3 class="fo">&#169;BackBenchers</h3>
        </footer>
    </section>
    <script src="https://unpkg.com/scrollreveal"></script>
    <script src="js/nav.js"></script>
    <script src="js/index.js"></script>
</body>
</html>
<%    } else {
    session.setAttribute("MSG", "You must be login.");
    response.sendRedirect("login.jsp");
}
%>

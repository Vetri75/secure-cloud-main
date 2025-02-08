<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon">
    <title>Secure cloud</title>
    <script>
        function myFunction() {
  var dots = document.getElementById("dots");
  var moreText = document.getElementById("more");
  var btnText = document.getElementById("myBtn");

  if (dots.style.display === "none") {
    dots.style.display = "inline";
    btnText.innerHTML = "Read more";
    moreText.style.display = "none";
  } else {
    dots.style.display = "none";
    btnText.innerHTML = "Read less";
    moreText.style.display = "inline";
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
    <section id="home">
        <div class="hero-text">
            <h3>Hello,</h3>
            <h1>welcome,</h1>
            <h3>Secure file storage system on cloud using <span>hybrid cryptography,</span></h3>
            <p>Store the file safely in online cloud storage as these files will be stored in encrypted form in the cloud and only the authorized user has access to their files.</p>
            <a href="#about">Contact</a>
        </div>
        <div class="home-img">
            <img src="images/file.png">
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
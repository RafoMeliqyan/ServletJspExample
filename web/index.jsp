<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Main page</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>


<!-- Slideshow container -->
<div class="slideshow-container">

    <!-- Full-width images with number and caption text -->
    <div class="mySlides fade">
        <div class="numbertext">1 / 3</div>
        <img src="/img/img1.jpg" style="width:100%">
        <div class="text">Caption Text</div>
    </div>

    <div class="mySlides fade">
        <div class="numbertext">2 / 3</div>
        <img src="/img/img2.jpg" style="width:100%">
        <div class="text">Caption Two</div>
    </div>

    <div class="mySlides fade">
        <div class="numbertext">3 / 3</div>
        <img src="/img/img3.jpg" style="width:100%">
        <div class="text">Caption Three</div>
    </div>

    <!-- Next and previous buttons -->
    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
    <a class="next" onclick="plusSlides(1)">&#10095;</a>
</div>
<br>

<!-- The dots/circles -->
<div style="text-align:center">
    <span class="dot" onclick="currentSlide(1)"></span>
    <span class="dot" onclick="currentSlide(2)"></span>
    <span class="dot" onclick="currentSlide(3)"></span>
</div>


<%
    String msg = "";
    if (session.getAttribute("msg") != null) {
        msg = (String) session.getAttribute("msg");
        session.removeAttribute("msg");
    }
%>

<%--<iframe width="300" height="300" src="https://www.youtube.com/embed/Gi4nOvcjiHQ?list=RDGi4nOvcjiHQ" frameborder="0"--%>
<%--        allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>--%>


<p style="color: red">
    <%=msg%>
</p>

Login:
<form action="/login" method="post">
    <input type="text" name="username" placeholder="Please input username" required> <br>
    <input type="password" name="password" placeholder="Please input password" required> <br>
    <input type="submit" value="Login">
</form>
<br>
<br>
<div class="newDiv"></div>
<p>New p tag</p>
Register:
<form action="/register" method="post" enctype="multipart/form-data">
    <input type="text" name="name" placeholder="Please input name"> <br>
    <input type="text" name="surname" placeholder="Please input surname"> <br>
    <input type="text" name="username" placeholder="Please input username"> <br>
    <input type="password" name="password" placeholder="Please input password"> <br>
    <input type="file" name="image"> <br>
    <input type="submit" value="Register">
</form>

<p id="pid" class="pclass" style="width: 100px; height: 100px; border: 1px solid black"></p>
<button id="hide">Hide</button>
<button id="show">Show</button>
</body>

<script src="/js/jquery.js" type="text/javascript"></script>
<script src="/js/slider.js" type="text/javascript"></script>

<script>
    $(document).ready(function () {
        $('#hide').on('click', function () {
            $("#pid").hide();
        })

        $('#show').on('click', function () {
            $("#pid").show();
        })
    })

    // let p = document.getElementById("pid")
    // let button = document.getElementById("clickMe");
    //
    // button.onclick = function() {
    //     p.style["border"] = "2px solid red"
    //     p.style["width"] = "200px"
    // }

</script>

</html>

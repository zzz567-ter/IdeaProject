<%--
  Created by IntelliJ IDEA.
  User: 457884933
  Date: 2020/6/19
  Time: 0:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Home</title>
    <!-- metatags-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript">
        addEventListener("load", function() {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- Meta tag Keywords -->
    <!-- Custom-Style-Sheet -->
    <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!--style_sheet-->
    <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" property="" />
    <link rel="stylesheet" href="css/font-awesome.css">
    <!-- Font-Awesome_Icons-CSS -->
    <!--//Custom-Style-Sheet -->
    <!--online_fonts-->
    <link href="http://maxcdn.bootstrapcdn.com/css?family=Audiowide" rel="stylesheet">
    <link href="http://maxcdn.bootstrapcdn.com/css?family=Montserrat+Alternates" rel="stylesheet">
    <!--//online_fonts-->
</head>

<body>
<div class="w3l-head">
    <h1>网 上 书 城</h1>
</div>
<div class="w3l-main">
    <div class="w3l-left-side">

        <div class="flexslider">
            <ul class="slides">
                <li>
                    <img src="images/g5.jpg" alt="image" />
                </li>
                <li>
                    <img src="images/g2.jpg" alt="image" />
                </li>
                <li>
                    <img src="images/g3.jpg" alt="image" />
                </li>
                <li>
                    <img src="images/g4.jpg" alt="image" />
                </li>
                <li>
                    <img src="images/g1.jpg" alt="image" />
                </li>
            </ul>
        </div>
    </div>

    <div class="w3l-rigt-side">
        <form action="#" method="post">
            <div class="w3l-signin">
                <a class="w3_play_icon1" href="#small-dialog1"> 登 录</a>
            </div>
            <div class="w3l-signup">
                <a class="w3_play_icon1" href="#small-dialog2"> 注 册</a>
            </div>
            <div class="clear"></div>
        </form>
    </div>
    <div class="clear"></div>
</div>

<!--sign in form -->
<div id="small-dialog1" class="mfp-hide">
    <div class="wthree-container">
        <div class="wthree-form">
            <div class="agileits-2">
                <h2>登 录 窗 口</h2>
            </div>
            <form action="loginc/login" method="post">
                <div class="w3-user">
                    <span><i class="fa fa-user-o" aria-hidden="true"></i></span>
                    <input type="text" name="username" placeholder="Username" required="">
                </div>
                <div class="clear"></div>
                <div class="w3-psw">
                    <span><i class="fa fa-key" aria-hidden="true"></i></span>
                    <input type="password" name="password" placeholder="Password" required="">
                </div>
                <div class="clear"></div>
                <div class="w3l-check">
                    <input type="checkbox" class="checkbox" name="remember" value="true">
                    <span>记住密码</span>
                </div>
                <div class="clear"></div>
                <div class="signin">
                    <input type="submit" value="登 录">
                </div>
                <div class="clear"></div>
            </form>
        </div>
    </div>
</div>
<!--sign in form -->
<!-- for register popup -->

<!--sign up form -->
<div id="small-dialog2" class="mfp-hide">
    <div class="wthree-container">
        <div class="wthree-form bg">
            <div class="agileits-2">
                <h2>注 册 窗 口</h2>
            </div>
            <form action="loginc/logon" method="post" onsubmit="return testpass(this)">
                <div class="w3-user">
                    <span><i class="fa fa-user-o" aria-hidden="true"></i></span>
                    <input type="text" name="username" placeholder="Username" required="">
                </div>
                <div class="clear"></div>
                <div class="w3-email">
                    <span><i class="fa fa-envelope" aria-hidden="true"></i></span>
                    <input type="email" name="email" placeholder="Example@mail" required="" />
                </div>
                <div class="clear"></div>
                <div class="w3-psw">
                    <span><i class="fa fa-key" aria-hidden="true"></i></span>
                    <input type="password" name="password" placeholder="Password" required="">
                </div>
                <div class="w3-cpsw">
                    <span><i class="fa fa-key" aria-hidden="true"></i></span>
                    <input type="password" name="passwords" placeholder="confirm-Password" required="">
                </div>
                <div class="clear"></div>
                <div class="w3l-check">
                    <input type="checkbox" class="checkbox" name="remember">
                    <span><a href="https://privacy.qq.com/" target="view_window">我同意条款和条件</a></span>
                </div>
                <div class="clear"></div>
                <div class="signin">
                    <input type="submit" value="注 册">
                </div>
                <div class="clear"></div>
            </form>
        </div>
    </div>
</div>
<!--sign in form -->
<!-- //for register popup -->
<footer>Copyright &copy; 2020.Company name All rights reserved.
</footer>


<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>

<!-- pop-up-box-js-file -->
<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
<!--//pop-up-box-js-file -->
<script>
    $(document).ready(function() {
        $('.w3_play_icon,.w3_play_icon1,.w3_play_icon2').magnificPopup({
            type: 'inline',
            fixedContentPos: false,
            fixedBgPos: true,
            overflowY: 'auto',
            closeBtnInside: true,
            preloader: false,
            midClick: true,
            removalDelay: 300,
            mainClass: 'my-mfp-zoom-in'
        });

    });
    function testpass(form) {
        if(!form.remember.checked){
            alert("未同意条款");
            return false;
        }
        if (form.password.value==form.passwords.value){
            return true;
        }
        alert("密码不一致");
        return false;
    }
</script>
<!-- flexSlider -->
<script defer src="js/jquery.flexslider.js"></script>
<script type="text/javascript">
    $(window).load(function() {
        $('.flexslider').flexslider({
            animation: "slide",
            start: function(slider) {
                $('body').removeClass('loading');
            }
        });
    });
</script>
<!-- //flexSlider -->
</body>

</html>
<%--
  Created by IntelliJ IDEA.
  User: 457884933
  Date: 2020/6/1
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录页面</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/css/css.css" rel="stylesheet">
    <style>
        .form-group .col-sm-offset-2 {
            margin-left: 0;
            padding-left: 40%;
        }

        .form-group .col-sm-2 {
            width: 13.666667%;
        }
    </style>
    <script src="${pageContext.request.contextPath}/js/login.js"></script>
    <script>
        $(function () {
            var json=${user};
            $("#username").prop("value",json.username);
            $("#password").prop("value",json.password);
        })
    </script>
</head>

<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><span><img src="${pageContext.request.contextPath}/img/logo.png" style="width: 70px;"></span>教务系统</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">学校信息</a></li>
                <li class="">
                    <a href="#" class="" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">联系我们<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
<section class="container">
    <div class="jumbotron">
        <form action="servlet/login" class="form-horizontal"  onsubmit="return check(form);" name="form" method="POST" autocomplete="off">
            <div class="form-group">
                <label for="username" class="col-sm-2 control-label">学号</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="username" id="username" placeholder="Username">
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-2 control-label">密码</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" name="password"  id="password" placeholder="Password">
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-2 control-label">验证</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="testcode" id="testcode" placeholder="Testcode">

                </div>
                <div class="col-sm-2">
                    <canvas id="canvas" width="100" height="33" onclick="dj()" style="border: 1px solid #ccc;
        border-radius: 5px;"></canvas>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <div class="checkbox">
                        <label>
                            <input type="radio" onclick="cancel1()" id="passw" name="login" value="turn" > 记住密码
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">登录</button>
                    <button type="reset" class="btn btn-default">重置</button>
                </div>
            </div>
        </form>
    </div>
</section>
<video autoplay="autoplay" src="${pageContext.request.contextPath}/video/city.mp4" height="560px" width="100%" loop="loop" muted="muted" style="position: absolute; top: 50px; z-index: -99;"></video>
</body>



<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"  %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <%--    <meta name="viewport" content="width=device-width, initial-scale=1，user-scalable=no">--%>
    <title>考证管理</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/css/css.css" rel="stylesheet">
    <style>
        .well-lg {
            padding: 0px;
        }

        .main {
            background-color: rgba(184, 178, 178, 0.3);
            box-sizing: border-box;
            top: 30px;
            left: 0;
            float: left;
            transform: translateY(-20px);
            height: 550px;
            width: 85%;
            padding: 10px 10px;
        }
    </style>
    <script src="js/js.js"></script>
</head>

<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">
                <img src="${pageContext.request.contextPath}/img/logo.png" style="width: 80px; transform: translateY(-10px);">
            </a>
            <span style="position: absolute; right: 10px;">
                <span class="user"><a href="${pageContext.request.contextPath}/index.jsp">退出</a></span>
                <span class="user" style="margin: 0 10px;">|</span>
                <span class="user">欢迎，<a href="#">${sessionScope.username}</a></span>
                </span>
        </div>
    </div>
</nav>
<div id="nav-left">
    <div class="list-group">
        <a href="${pageContext.request.contextPath}/servlet/mainpage?query=All" class="list-group-item active" style="font-size: 20px;"> 首页</a>
        <a href="${pageContext.request.contextPath}/students.jsp" class="list-group-item">学生管理</a>
        <a href="${pageContext.request.contextPath}/schoolmap.jsp" class="list-group-item">宿舍管理</a>
        <a href="${pageContext.request.contextPath}/course.jsp" class="list-group-item">课程管理</a>
        <a href="${pageContext.request.contextPath}/exam.jsp" class="list-group-item">考试管理</a>
        <a href="${pageContext.request.contextPath}/index.jsp" class="list-group-item">退出</a>
    </div>
</div>
<div class="main">
    <div class="container-fluid">
        <div class="well well-lg" style="margin-bottom:10px">
            <h2 style="margin-top: 5px; margin-left:5px">首页/考试管理 <a href="#" class="btn btn-default" style="background-color: rgb(250, 250, 250); float: right; font-size: 20px;" role="button">添加</a></h2>
        </div>
        <div class="row" style="background-color:rgb(209, 211, 212); padding-top: 10px;">
            <div class="clo-xs-6 col-sm-3 col-md-2">
                <div class="thumbnail">
                    <img src="img/logo.png" alt="...">
                    <div class="caption">
                        <h3>计算机二级</h3>
                        <p>2020/7/7</p>
                        <p><a href="#" class="btn btn-primary" role="button">修改</a> <a href="#" class="btn btn-default" role="button">删除</a>
                        </p>
                    </div>
                </div>
            </div>
            <div class="clo-xs-6 col-sm-3 col-md-2">
                <div class="thumbnail">
                    <img src="img/logo.png" alt="...">
                    <div class="caption">
                        <h3>教师资格证</h3>
                        <p>2020/9/9</p>
                        <p><a href="#" class="btn btn-primary" role="button">修改</a> <input type="button" class="btn btn-default" role="button" value="删除"></input>
                        </p>
                    </div>
                </div>
            </div>
            <div class="clo-xs-6 col-sm-3 col-md-2">
                <div class="thumbnail">
                    <img src="img/logo.png" alt="...">
                    <div class="caption">
                        <h3>软件工程师</h3>
                        <p>2020/10/10</p>
                        <p><a href="#" class="btn btn-primary" role="button">修改</a> <input type="button" class="btn btn-default" role="button" value="删除"></input>
                        </p>
                    </div>
                </div>
            </div>
            <div class="clo-xs-6 col-sm-3 col-md-2">
                <div class="thumbnail">
                    <img src="img/logo.png" alt="...">
                    <div class="caption">
                        <h3>软件工程师</h3>
                        <p>2020/10/10</p>
                        <p><a href="#" class="btn btn-primary" role="button">修改</a> <input type="button" class="btn btn-default" role="button" value="删除"></input>
                        </p>
                    </div>
                </div>
            </div>
            <div class="clo-xs-6 col-sm-3 col-md-2">
                <div class="thumbnail">
                    <img src="img/logo.png" alt="...">
                    <div class="caption">
                        <h3>软件工程师</h3>
                        <p>2020/10/10</p>
                        <p><a href="#" class="btn btn-primary" role="button">修改</a> <input type="button" class="btn btn-default" role="button" value="删除"></input>
                        </p>
                    </div>
                </div>
            </div>
            <div class="clo-xs-6 col-sm-3 col-md-2">
                <div class="thumbnail">
                    <img src="img/logo.png" alt="...">
                    <div class="caption">
                        <h3>软件工程师</h3>
                        <p>2020/10/10</p>
                        <p><a href="#" class="btn btn-primary" role="button">修改</a> <input type="button" class="btn btn-default" role="button" value="删除"></input>
                        </p>
                    </div>
                </div>
            </div>
            <div class="clo-xs-6 col-sm-3 col-md-2">
                <div class="thumbnail">
                    <img src="img/logo.png" alt="...">
                    <div class="caption">
                        <h3>软件工程师</h3>
                        <p>2020/10/10</p>
                        <p><a href="#" class="btn btn-primary" role="button">修改</a> <input type="button" class="btn btn-default" role="button" value="删除"></input>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
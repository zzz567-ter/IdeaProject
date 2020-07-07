<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"  %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <%--    <meta name="viewport" content="width=device-width, initial-scale=1，user-scalable=no">--%>
    <title>学生信息</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/css/css.css" rel="stylesheet">
    <style>
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
    <!-- <iframe src="studentone.html" width="100%" height="580px"></iframe> -->
    <div class="container-fluid">
        <h2 style="margin-left: 40px; margin-top: 5px; margin-bottom: 80px;">${msg.name}<span class="label label-default">${msg.department}</span></h2>
        <form class="form-horizontal">
            <div class="form-group">
                <label class="col-sm-2 control-label">学号</label>
                <div class="col-sm-4">
                    <p class="form-control-static">${msg.no}</p>
                </div>
                <label class="col-sm-2 control-label">班级</label>
                <div class="col-sm-4">
                    <p class="form-control-static">${msg.major}${msg.clas}班</p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">性别</label>
                <div class="col-sm-4">
                    <p class="form-control-static">${msg.gender}</p>
                </div>
                <label class="col-sm-2 control-label">身份证</label>
                <div class="col-sm-4">
                    <p class="form-control-static">330981199810108888</p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">籍贯</label>
                <div class="col-sm-4">
                    <p class="form-control-static">广东茂名</p>
                </div>
                <label class="col-sm-2 control-label">宿舍号</label>
                <div class="col-sm-4">
                    <p class="form-control-static">46322</p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">专业</label>
                <div class="col-sm-4">
                    <p class="form-control-static">${msg.major}</p>
                </div>
                <label class="col-sm-2 control-label">年级</label>
                <div class="col-sm-4">
                    <p class="form-control-static">3</p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Email</label>
                <div class="col-sm-4">
                    <input type="password" class="form-control" id="email" placeholder="email@example.com">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">联系电话</label>
                <div class="col-sm-4">
                    <input type="password" class="form-control" id="call" placeholder="18*">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-4"></div>
                <div class="col-sm-3">
                    <a class="btn btn-default" style="font-size: 30px; margin-top: 30px; " href="#" role="button">修改</a>
                </div>
                <div class="col-sm-5">
                    <a class="btn btn-default" style="font-size: 30px; margin-top: 30px; " href="${pageContext.request.contextPath}/servlet/pagecode" role="button">返回</a>
                </div>
            </div>
    </div>
    </form>
</div>
</div>
</body>
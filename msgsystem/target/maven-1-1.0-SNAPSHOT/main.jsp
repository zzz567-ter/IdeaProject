<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"  %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
<%--    <meta name="viewport" content="width=device-width, initial-scale=1，user-scalable=no">--%>
    <title>主页面</title>
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
    <script src="js/js.js"></script>
    <script>
        $(function(){//Map数组一传就失效。。
            var a=${sum[1]}/${sum[0]};
            var gm=Math.round(a*100);
            $("#gm").css("width",gm+"%");
            $("#am").css("width",${doubles[0]}+"%");
            $("#bm").css("width",${doubles[1]}+"%");
            $("#cm").css("width",${doubles[2]}+"%");
            $("#dm").css("width",${doubles[3]}+"%");
            $("#em").css("width",${doubles[4]}+"%");
            $("#fm").css("width",${doubles[5]}+"%");
        })
    </script>
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
    <div class="container-fluid" style="padding: 10px 10px;">
        <p style="font-size: 25px;">首页统计/共${sum[0]}人
        </p>
        <div class="dropdown"><button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
            院校
            <span class="caret"></span>
        </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                <li><a href="${pageContext.request.contextPath}/servlet/mainpage?query=English">外国语学院</a></li>
                <li><a href="${pageContext.request.contextPath}/servlet/mainpage?query=Computer">信息技术学院</a></li>
                <li><a href="${pageContext.request.contextPath}/servlet/mainpage?query=Art">艺术设计学院</a></li>
                <li><a href="${pageContext.request.contextPath}/servlet/mainpage?query=Economy">经济管理学院</a></li>
                <li><a href="${pageContext.request.contextPath}/servlet/mainpage?query=Accountant">会计学院</a></li>
                <li><a href="${pageContext.request.contextPath}/servlet/mainpage?query=Build">建筑工程学院</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="${pageContext.request.contextPath}/servlet/mainpage?query=All">全部</a></li>
            </ul>
        </div>
        <div class="jumbotron">
            <h1>欢迎，${queryresult}!</h1>
        </div>
        <div class="progress">
            <div id="am" class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                <span class="sr-only">Complete (success)</span> ${indexs[0]}${ints[0]}
            </div>
        </div>
        <div class="progress">
            <div id="bm" class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                <span class="sr-only">Complete</span> ${indexs[1]}${ints[1]}
            </div>
        </div>
        <div class="progress">
            <div id="cm" class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                <span class="sr-only">Complete (warning)</span> ${indexs[2]}${ints[2]}
            </div>
        </div>
        <div class="progress">
            <div id="dm" class="progress-bar progress-bar-danger progress-bar-striped active" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                <span class="sr-only">Complete (danger)</span> ${indexs[3]}${ints[3]}
            </div>
        </div>
        <div class="progress">
            <div id="em" class="progress-bar progress-bar-black progress-bar-striped active" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                <span class="sr-only">Complete (danger)</span> ${indexs[4]}${ints[4]}
            </div>
        </div>
        <div class="progress">
            <div id="fm" class="progress-bar progress-bar-pink progress-bar-striped active" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                <span class="sr-only">Complete (danger)</span> ${indexs[5]}${ints[5]}
            </div>
        </div>
        <p style="font-size: 20px;">男/女比例</p>
        <div class="progress">
            <div class="progress-bar progress-bar-blue progress-bar-striped active" style="width: 100%" name="boy">
                <span class="sr-only">Complete (success)</span>男
                <div id="gm" class="progress-bar progress-bar-red progress-bar-striped active" name="girl" style="width: 100%">
                    <span class="sr-only">Complete (danger)</span>女
                </div>
            </div>
        </div>
</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"  %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <%--    <meta name="viewport" content="width=device-width, initial-scale=1，user-scalable=no">--%>
    <title>课程管理</title>
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
    <div class="container" style="padding: 20px 10px ;width: 1000px;">
        <h2 style="margin-top: -10px;margin-bottom: 50px;transform: translateX(-30px);">首页/课程管理&nbsp;${xx}</h2>
        <form class="form-inline">
            <div class="row">
                <div class="col-xs-4">
                    <div class="input-group">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">学院<span class="caret"></span></button>
                            <ul class="dropdown-menu">
                                <li><a href="#">外国语学院</a></li>
                                <li><a href="#">信息技术学院</a></li>
                                <li><a href="#">艺术设计学院</a></li>
                                <li><a href="#">经济管理学院</a></li>
                                <li><a href="#">会计学院</a></li>
                                <li><a href="#">建筑工程学院</a></li>
                            </ul>
                        </div>
                        <!-- /btn-group -->
                        <input type="text" class="form-control" aria-label="...">
                    </div>
                    <!-- /input-group -->
                </div>
                <div class="col-xs-1"></div>
                <div class="col-xs-4">
                    <div class="input-group">
                            <span class="input-group-addon">
                              班级
                            </span>
                        <input type="text" class="form-control" aria-label="...">
                    </div>
                </div>
                <div class="col-xs-1" style="float: right; margin-right: 50px;">
                    <input type="submit" class="btn btn-default btn-lg active" role="button" style="padding: 5px 16px;" value="修改"></input>
                </div>
                <div class="col-xs-1" style="float: right;"> <input type="submit" class="btn btn-default btn-lg active" role="button" style="padding: 5px 16px;" value="查询"></input>
                </div>

            </div>

        </form>
        <table class="table table-bordered">
            <!-- On rows -->
            <tr class="active">
                <td class="active"> </td>
                <td class="success">星期一</td>
                <td class="warning">星期二</td>
                <td class="danger">星期三</td>
                <td class="info">星期四</td>
                <td class="active">星期五</td>
            </tr>
            <tr class="success">
                <td>...</td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
            </tr>
            <tr class="warning">
                <td>...</td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
            </tr>
            <tr class="danger">
                <td class="active">...</td>
                <td class="success">...</td>
                <td class="warning">...</td>
                <td class="danger">...</td>
                <td>...</td>
                <td class="info">...</td>
            </tr>
            <tr class="info">
                <td>...</td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
            </tr>
            <tr class="success">
                <td>...</td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
            </tr>
            <tr class="warning">
                <td>...</td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
            </tr>
            <tr class="danger">
                <td class="active">...</td>
                <td class="success">...</td>
                <td class="warning">...</td>
                <td class="danger">...</td>
                <td>...</td>
                <td class="info">...</td>
            </tr>
            <tr class="info">
                <td>...</td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
            </tr>
        </table>
    </div>
</div>
</body>

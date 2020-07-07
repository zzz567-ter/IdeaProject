<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <%--    <meta name="viewport" content="width=device-width, initial-scale=1，user-scalable=no">--%>
    <title>学生管理</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/pagec.js"></script>
    <link href="${pageContext.request.contextPath}/css/css.css" rel="stylesheet">
    <script>
        $(function () {
            var code=${code};
            var length=${length}
            var maxcode=length-(code*10)
            if (code>1){
                $("#nexts").css("cursor","")
                $("#nexts").attr("href","${pageContext.request.contextPath}/servlet/pagecode?next=s")
            }else {
                $("#nexts").css("cursor","move")
                $("#nexts").removeAttr("href")
            }
            if (maxcode<10){
                $("#nexta").css("cursor","move")
                $("#nexta").removeAttr("href")
            }else {
                $("#nexta").css("cursor","")
                $("#nexta").attr("href","${pageContext.request.contextPath}/servlet/pagecode?next=a")
            }
                })
    </script>
    <style>

        .main {
            background-color: rgba(184, 178, 178, 0.3);
            top: 30px;
            left: 0;
            float: left;
            transform: translateX(30px);
            height: 550px;
            width: 85%;
        }

        .main .table {
            margin-top: 20px;
        }

        .table tr td .btn-lg {
            padding: 0px 16px;
            font-size: 15px;
        }

        .table tr th,
        td {
            text-align: center;
        }

        .col-xs-1 .btn-lg {
            padding: 4px 16px;
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
    <!-- <iframe src="studenq.html" width="100%" height="580px"></iframe> -->
    <div class="main panel panel-default">
        <h2>首页/学生管理</h2>
        <form class="form-inline" method="post" action="${pageContext.request.contextPath}/servlet/query" onsubmit="return check(form)" name="form" id="form">
            <div class="row">
                <div class="col-xs-3">
                    <div class="input-group">
                            <span class="input-group-addon">
                          姓名
                        </span>
                        <input type="text" autocomplete="off" id="sname" name="sname" class="form-control" aria-label="...">
                    </div>
                </div>
                <div class="col-xs-1"></div>
                <div class="col-xs-3">
                    <script src="js/pagec.js"></script>
                    <div class="input-group">
                        <div class="input-group-btn">
                            <button type="button" id="stext" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">学院<span class="caret"></span></button>
                            <ul class="dropdown-menu">
                                <li><a style="cursor: pointer;" name="外国语学院" onclick="redepartment(this.name)">外国语学院</a></li>
                                <li><a style="cursor: pointer;" name="信息技术学院" onclick="redepartment(this.name)">信息技术学院</a></li>
                                <li><a style="cursor: pointer;" name="艺术设计学院" onclick="redepartment(this.name)">艺术设计学院</a></li>
                                <li><a style="cursor: pointer;" name="经济管理学院" onclick="redepartment(this.name)">经济管理学院</a></li>
                                <li><a style="cursor: pointer;" name="会计学院" onclick="redepartment(this.name)">会计学院</a></li>
                                <li><a style="cursor: pointer;" name="建筑工程学院" onclick="redepartment(this.name)">建筑工程学院</a></li>
                            </ul>
                        </div>
                        <!-- /btn-group -->
                        <input type="text" id="sdepartment" autocomplete="off" name="sdepartment" class="form-control" aria-label="...">
                    </div>
                    <!-- /input-group -->
                </div>
                <div class="col-xs-1"></div>
                <div class="col-xs-3">
                    <div class="input-group">
                            <span class="input-group-addon">
                          班级
                        </span>
                        <input type="text" id="sclass" autocomplete="off" name="sclass" class="form-control" aria-label="...">
                    </div>
                </div>
                <div class="col-xs-1"><input type="submit" class="btn btn-default btn-lg active" role="button" value="查询"></input>
                </div>
            </div>
            <!-- /.row -->
        </form>
        <table class="table table-hover table-condensed">
            <tr>
                <th>学号</th>
                <th>姓名</th>
                <th>系部</th>
                <th>班级</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${list}" var="msg" varStatus="status" >
                <tr>
                    <td>${msg.no}</td>
                    <td>${msg.name}</td>
                    <td>${msg.department}</td>
                    <td>${msg.major}${msg.clas}班</td>
                    <td><a class="btn btn-default" style="padding: 2px 11px" href="${pageContext.request.contextPath}/servlet/studentmsg?code=${code}&no=${status.count}" role="button">查看</a></td>
                </tr>
            </c:forEach>
        </table>
        <nav aria-label="Page navigation">
            <ul class="pager" style="margin: 10px 200px;">
                <li class="previous"><a id="nexts" style="cursor: move"><span aria-hidden="true">&larr;</span></a></li>
                <li>第${code}页</li>
                <li class="next"><a id="nexta"><span aria-hidden="true">&rarr;</span></a></li>
            </ul>
        </nav>
    </div>
</div>
</body>
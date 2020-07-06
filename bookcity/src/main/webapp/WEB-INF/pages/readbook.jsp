<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 457884933
  Date: 2020/6/23
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="no-js">
<!--<![endif]-->

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Language" content="zh-cn">
    <title>线上书城</title>
    <meta name="description" content="A responsive web app template with common components like profile, list, tabs, menu views. Made for Codrops exclusively.">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/output.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
    <!-- <link rel="stylesheet" href="node_modules/tippy.js/dist/themes/light.css"> -->
</head>

<body class="bg-grey-lighter font-sans antialiased">
<div class="fixed bg-grey-lighter pin z-50 flex justify-center items-center" id="loading">
    <svg width="60px" height="60px" viewBox="0 0 60 60" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" id="morphing">
        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
            <g transform="translate(-1178.000000, -87.000000)">
                <g transform="translate(1159.000000, 0.000000)">
                    <g transform="translate(0.000000, 87.000000)">
                        <g transform="translate(19.000000, 0.000000)">
                            <circle id="small-circle" fill="#5661B3" cx="30" cy="30" r="30"></circle>
                            <path id="moon" d="M30.5,49.7304688 C40.7172679,49.7304688 30.5,43.266096 30.5,33.0488281 C30.5,22.8315603 40.7172679,12 30.5,12 C20.2827321,12 11.0390625,20.6479665 11.0390625,30.8652344 C11.0390625,41.0825022 20.2827321,49.7304688 30.5,49.7304688 Z" fill="#F4E1E0"></path>
                            <circle id="big-circle" fill="#070707" cx="31" cy="31" r="11"></circle>
                        </g>
                    </g>
                </g>
            </g>
        </g>
    </svg>
</div>
<div style="position: fixed; top: 0px; width: 100%; z-index: 30;" class="bg-indigo-darker text-center p-4 px-6 flex items-center">
    <div class="hidden lg:block lg:w-1/4 xl:w-1/5 pr-8">
        <a href="#" class="flex justify-start pl-6">
            <img src="${pageContext.request.contextPath}/images/logo.svg" class="" alt="logo">
        </a>
    </div>
    <div class="lg:hidden pr-3" id="mobile-nav-trigger">
        <div class="toggle p-2 block"><span></span></div>
    </div>
    <div class="flex flex-grow items-center lg:w-3/4 xl:w-4/5">
            <span class="relative w-full">
                <form action="search" method="post" name="searchform" onsubmit="return searchform(this)" >
		<input name="searchmsg" type="search" placeholder="Search" class="w-full text-sm text-white transition border border-transparent focus:outline-none focus:border-indigo placeholder-white rounded bg-indigo-medium py-1 px-2 pl-10 appearance-none leading-normal ds-input">
		</form><div class="absolute search-icon" style="top: .5rem; left: .8rem;">
		<svg class="fill-current pointer-events-none text-white w-4 h-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
			<path d="M12.9 14.32a8 8 0 1 1 1.41-1.41l5.35 5.33-1.42 1.42-5.33-5.34zM8 14A6 6 0 1 0 8 2a6 6 0 0 0 0 12z"></path>
		</svg>
		</div>
	</span>
        <a href="${pageContext.request.contextPath}/homec/personage" class="text-sm text-right text-white py-2 px-3 hover:text-grey-dark no-underline hidden lg:block lg:w-1/3 px-6">个 人 中 心</a>
    </div>
</div>
<!-- Main -->
<div class="flex">
    <!-- Side Nav -->
    <nav style="z-index: 10;" class="absolute lg:relative lg:flex lg:text-sm bg-indigo-darker lg:bg-transparent pin-l pin-r py-4 px-6 lg:pt-10 lg:pl-12 lg:pr-6 -mt-1 lg:mt-0 overflow-y-auto lg:w-1/5 lg:border-r z-40 hidden">
    </nav>
    <nav style="position: fixed; left: 0px; margin-top: 80px;" class="absolute lg:relative lg:flex lg:text-sm bg-indigo-darker lg:bg-transparent pin-l pin-r py-4 px-6 lg:pt-10 lg:pl-12 lg:pr-6 -mt-1 lg:mt-0 overflow-y-auto lg:w-1/5 lg:border-r z-40 hidden">
        <ul class="list-reset mb-8 w-full">
            <li class="ml-2 mb-4 flex">
                <img src="${pageContext.request.contextPath}/images/home-default.svg" alt="home-icon" class="w-4 h-4 mr-2">
                <div class="hover:cursor-pointer text-white lg:text-indigo-darkest no-underline font-medium mobile-home-trigger">Home</div>
            </li>
            <li class="ml-2 mb-4">
                <div class="flex" id="sidenav-categories-trigger">
                    <img src="${pageContext.request.contextPath}/images/category-default.svg" alt="home-icon" class="w-4 h-4 mr-2">
                    <div class="hover:cursor-pointer text-white lg:text-indigo-darkest no-underline font-medium w-full relative">
                        Categories
                        <div class="pointer-events-none absolute pin-y pin-r flex items-center px-1 text-grey-darker" id="sidenav-icon">
                            <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                                <path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z" />
                            </svg>
                        </div>
                    </div>
                </div>
                <ul class="text-grey lg:text-grey-dark list-reset leading-loose mt-2" id="sidenav-categories">
                    <li class="text-indigo-lighter lg:text-indigo-darker font-medium flex justify-between items-center hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">
                        <span>文学艺术</span>
                        <span class="bg-indigo-dark text-white text-xs rounded-full px-2 leading-normal">${sumbookdbnumber}</span>
                    </li>
                    <li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">人文社科</li>
                    <li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">经管励志</li>
                    <li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">健康生活</li>
                    <li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">艺术设计</li>
                    <li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">教育学习</li>
                </ul>
            </li>
            <li class="ml-2 mb-4 flex">
                <img src="${pageContext.request.contextPath}/images/wishlist-default.svg" alt="wishlist-icon" class="w-4 h-4 mr-2">
                <div class="hover:cursor-pointer text-white lg:text-indigo-darkest no-underline font-medium ">Wishlist</div>
            </li>
            <li class="ml-2 mb-4 flex lg:hidden">
                <img src="${pageContext.request.contextPath}/images/profile-default.svg" alt="profile-icon" class="w-4 h-4 mr-2">
                <div class="hover:cursor-pointer text-white lg:text-indigo-darkest no-underline font-medium" id="mobile-profile-trigger">Profile</div>
            </li>
        </ul>
    </nav>
    <!-- Content -->
    <div class="flex flex-1 flex-col md:px-6 pt-10" id="content">
        <!-- Title -->
        <div class="px-6 md:px-0 flex justify-between items-center -order-1" style="margin-top: 50px;">
                <h2 class="font-normal">${book.bname}</h2>
                <p class="text-grey-dark mt-2">${book.blabel}</p>
        </div>
        <!-- Desktop Stats -->
        <div class="hidden px-6 md:px-0 mt-4 md:flex flex-wrap order-1 md:-order-1 md:shadow-md js-tab-pane" id="section-stats">
            <div style="padding: 20px;" class="p-4 px-6 w-full md:w-1/2 rounded md:rounded-r-none bg-white shadow-md md:shadow-none">
                <div style="float: left; padding: 10px; position: relative;">
                    <p style="white-space: pre-line;font-size: 20px; color: #999999; margin: 5px; margin-bottom: 40px;text-indent:2em;">
                       ${readbooktext}
                    </p>
                    <p class="pbuttom" style="font-size: 20px;  margin: 5px; position: absolute;bottom: 0px; left: 30%;">
                        <a href="${pageContext.request.contextPath}/Book/nextpage?bno=${book.bno}&buttom=0" style="text-align: center; width: 50%; padding: 10px; background-color: #ffffff;border: #999999 1px solid;
                            margin: 10px; text-decoration: none; border-radius: 20px; color: #999999; margin-left: 30px;" class="abuttom0">
                            上一页
                        </a>
                        <a href="${pageContext.request.contextPath}/Book/nextpage?bno=${book.bno}&buttom=1" style="text-align: center; width: 50%; padding: 10px; background-color: #ffffff;border: #999999 1px solid;
                             margin: 10px;text-decoration: none;border-radius: 20px; color: #999999; margin-right: 30px; " class="abuttom1">
                            下一页
                        </a>
                        <form action="${pageContext.request.contextPath}/Book/skippage" style="float: right;" onsubmit="return jedgenumber(this)" method="get">
                        <input type="number" name="pagesnumber" style="width: 40px;height: 16px;border: solid 1px;text-align: center;"> 页
                        <input type="submit" value="跳转">
                        <input type="hidden" name="bno" value="${book.bno}">
                    </form>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(function () {
            var reding=${reading.bno};
            if(reding==0) {
                $("#redingbook").css("display","none");
            }
            var pstaus=${pagestaus};
            if(pstaus!=0){
                if(pstaus<0){
                    $(".abuttom0").css("pointer-events", "none");
                }else{
                    $(".abuttom1").css("pointer-events", "none");
                }
            }
        })
        function jedgenumber(form){
            if (form.pagesnumber.value<=0){
                return false;
            }else if(form.pagesnumber.value>999) {
                return false;
            }
            return true;
        }
    </script>
    <!-- Profile -->
    <div style="margin-top: 50px;" class="hidden absolute pin-b z-10 lg:relative lg:block w-full lg:w-1/5 bg-grey-lighter-2 px-6 pt-10" id="profile">
        <div class="flex items-center mb-6">
            <svg width="60px" height="60px" viewBox="0 0 60 60" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" id="avatar">
                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                    <g transform="translate(-1178.000000, -87.000000)">
                        <g transform="translate(1159.000000, 0.000000)">
                            <g transform="translate(0.000000, 87.000000)">
                                <g transform="translate(19.000000, 0.000000)">
                                    <circle id="small-circle" fill="#5661B3" cx="30" cy="30" r="30"></circle>
                                    <path id="moon" d="M30.5,49.7304688 C40.7172679,49.7304688 30.5,43.266096 30.5,33.0488281 C30.5,22.8315603 40.7172679,12 30.5,12 C20.2827321,12 11.0390625,20.6479665 11.0390625,30.8652344 C11.0390625,41.0825022 20.2827321,49.7304688 30.5,49.7304688 Z" fill="#F4E1E0"></path>
                                    <circle id="big-circle" fill="#070707" cx="31" cy="31" r="11"></circle>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
            </svg>
            <div class="ml-3">
                <p>${user.alias}</p>
                <p class="text-grey-dark mt-1 text-sm">自${user.loginyear}年加入</p>
            </div>
        </div>
        <div class="my-4 border-t pt-4">
            <h3 class="text-indigo-dark font-normal" style="margin-bottom: 10px">你已阅读<strong>${readbooks}本,共${sumbooks}本,</strong>在2020年</h3>
            <div class="flex flex-wrap -ml-2 justify-start items-center">
                <c:forEach items="${reads}" var="read">
                    <img src="${pageContext.request.contextPath}/images/books/${read.bno}.jpg" alt="read" class="w-1/6 lg:w-1/5 max-w-tiny shadow-md block m-2 transition-normal hover:brighter">
                </c:forEach>
            </div>
        </div>
        <div class="mt-6">
            <p class="text-grey-dark mt-1 text-sm">最近正在阅读</p>
            <div class="flex items-start mt-2">
                <img style="width: 80px" src="${pageContext.request.contextPath}/images/books/${reading.bno}.jpg" alt="read" class="w-1/6 lg:w-1/5 max-w-tiny shadow-md block transition-normal hover:brighter">
                <div class="ml-3">
                    <p class="mt-1 leading-normal"><a href="${pageContext.request.contextPath}/Book/abook?bno=${reading.bno}" style="text-decoration: none; color: #706a71;font-size: 18px" >${readingbook.bname}</a></p>
                    <p class="mt-1 leading-normal"><a href="#" style="text-decoration: none; color: #706a71;font-size: 10px" >${readingbook.bauthor}</a></p>
                    <p class="mt-1 leading-normal" style="font-size: 10px">${readingbook.byear}</p>
                    <p class="text-indigo text-sm mt-1">在 ${reading.pages} 页/共${sumpages}页</p>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/bundle.js" async defer></script>
</body>

</html>
<%--
  Created by IntelliJ IDEA.
  User: 457884933
  Date: 2020/6/24
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%-- prefix写成大c --%>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Language" content="zh-cn">
    <title>线上书城</title>
    <meta name="description" content="A responsive web app template with common components like profile, list, tabs, menu views. Made for Codrops exclusively.">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/output.css">
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
                    <li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">文学艺术</li>
                    <li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">人文社科</li>
                    <li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">经管励志</li>
                    <li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">健康生活</li>
                    <li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">艺术设计</li>
                    <li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">教育学习</li>
                </ul>
            </li>
            <li class="ml-2 mb-4 flex">
                <img src="${pageContext.request.contextPath}/images/wishlist-default.svg" alt="wishlist-icon" class="w-4 h-4 mr-2">
                <div class="hover:cursor-pointer text-white lg:text-indigo-darkest no-underline font-medium">Wishlist</div>
            </li>
            <li class="ml-2 mb-4 flex lg:hidden">
                <img src="${pageContext.request.contextPath}/images/profile-default.svg" alt="profile-icon" class="w-4 h-4 mr-2">
                <div class="hover:cursor-pointer text-white lg:text-indigo-darkest no-underline font-medium" id="mobile-profile-trigger">Profile</div>
            </li>
        </ul>
    </nav>
    <!-- Content -->
    <div style="padding-top: 80px;" class="flex flex-1 flex-col md:px-6 pt-10" id="content">
        <!-- Title -->
        <div class="px-6 md:px-0 flex justify-between items-center -order-1">
            <div>
                <h2 style="margin-top: 10px" class="font-normal">图书圈</h2>

                <!-- Parts1 -->
                <div>
                    <div class="px-6 md:px-0 flex items-baseline justify-between border-b-2 border-grey-light mt-6 order-0 lg:order-1">
                        <h4 class="hidden md:inline-block text-grey-dark font-normal" style="margin-bottom: 10px; font-size: 20px;">文学艺术</h4>
                    </div>
                    <!-- Library -->
                    <div class="hidden px-2 pt-2 md:px-0 flex-wrap order-2 pb-8 js-tab-pane active" id="section-library1">
                        <c:forEach items="${books.get('A')}" var="book" varStatus="status" >
                            <div class="flex flex-row sm:flex-col items-center sm:items-start w-full xs:w-1/2 sm:w-1/3 md:w-1/5 p-4 js-book">
                                <a href="${pageContext.request.contextPath}/Book/abook?bno=${book.bno}"><img src="${pageContext.request.contextPath}/images/books/${book.bno}.jpg" alt="book-01" class="w-1/3 sm:w-full shadow-md transition-normal hover:brighter hover:translate-y-1 hover:shadow-lg hover:border-indigo"></a>
                                <div class="ml-3 sm:ml-0 w-2/3 sm:w-full">
                                    <p class="text-sm my-2 font-medium sm:font-normal">${book.bname}</p>
                                    <label  class="hidden sm:inline-block rounded-full libre-bg-grey text-white px-2 py-1/2 text-xs">${book.blabel}</label>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- Parts2 -->
                <div>
                    <div class="px-6 md:px-0 flex items-baseline justify-between border-b-2 border-grey-light mt-6 order-0 lg:order-1">
                        <h4 class="hidden md:inline-block text-grey-dark font-normal" style="margin-bottom: 10px; font-size: 20px;">人文社科</h4>
                    </div>
                    <!-- Library -->
                    <div class="hidden px-2 pt-2 md:px-0 flex-wrap order-2 pb-8 js-tab-pane active" id="section-library2">
                        <c:forEach items="${books.get('B')}" var="book" varStatus="status" >
                            <div class="flex flex-row sm:flex-col items-center sm:items-start w-full xs:w-1/2 sm:w-1/3 md:w-1/5 p-4 js-book">
                                <a href="#"><img src="${pageContext.request.contextPath}/images/books/${book.bno}.jpg" alt="${book.bno}" class="w-1/3 sm:w-full shadow-md transition-normal hover:brighter hover:translate-y-1 hover:shadow-lg hover:border-indigo"></a>
                                <div class="ml-3 sm:ml-0 w-2/3 sm:w-full">
                                    <p class="text-sm my-2 font-medium sm:font-normal">${book.bname}</p>
                                    <label  class="hidden sm:inline-block rounded-full libre-bg-grey text-white px-2 py-1/2 text-xs">${book.blabel}</label>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- Parts3 -->
                <div>
                    <div class="px-6 md:px-0 flex items-baseline justify-between border-b-2 border-grey-light mt-6 order-0 lg:order-1">
                        <h4 class="hidden md:inline-block text-grey-dark font-normal" style="margin-bottom: 10px; font-size: 20px;">经管励志</h4>
                    </div>
                    <!-- Library -->
                    <div class="hidden px-2 pt-2 md:px-0 flex-wrap order-2 pb-8 js-tab-pane active" id="section-library3">
                        <c:forEach items="${books.get('C')}" var="book" varStatus="status" >
                            <div class="flex flex-row sm:flex-col items-center sm:items-start w-full xs:w-1/2 sm:w-1/3 md:w-1/5 p-4 js-book">
                                <a href="#"><img src="${pageContext.request.contextPath}/images/books/${book.bno}.jpg" alt="${book.bno}" class="w-1/3 sm:w-full shadow-md transition-normal hover:brighter hover:translate-y-1 hover:shadow-lg hover:border-indigo"></a>
                                <div class="ml-3 sm:ml-0 w-2/3 sm:w-full">
                                    <p class="text-sm my-2 font-medium sm:font-normal">${book.bname}</p>
                                    <label  class="hidden sm:inline-block rounded-full libre-bg-grey text-white px-2 py-1/2 text-xs">${book.blabel}</label>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- Parts4 -->
                <div>
                    <div class="px-6 md:px-0 flex items-baseline justify-between border-b-2 border-grey-light mt-6 order-0 lg:order-1">
                        <h4 class="hidden md:inline-block text-grey-dark font-normal" style="margin-bottom: 10px; font-size: 20px;">健康生活</h4>
                    </div>
                    <!-- Library -->
                    <div class="hidden px-2 pt-2 md:px-0 flex-wrap order-2 pb-8 js-tab-pane active" id="section-library4">
                        <c:forEach items="${books.get('D')}" var="book" varStatus="status" >
                            <div class="flex flex-row sm:flex-col items-center sm:items-start w-full xs:w-1/2 sm:w-1/3 md:w-1/5 p-4 js-book">
                                <a href="#"><img src="${pageContext.request.contextPath}/images/books/${book.bno}.jpg" alt="${book.bno}" class="w-1/3 sm:w-full shadow-md transition-normal hover:brighter hover:translate-y-1 hover:shadow-lg hover:border-indigo"></a>
                                <div class="ml-3 sm:ml-0 w-2/3 sm:w-full">
                                    <p class="text-sm my-2 font-medium sm:font-normal">${book.bname}</p>
                                    <label  class="hidden sm:inline-block rounded-full libre-bg-grey text-white px-2 py-1/2 text-xs">${book.blabel}</label>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- Parts5 -->
                <div>
                    <div class="px-6 md:px-0 flex items-baseline justify-between border-b-2 border-grey-light mt-6 order-0 lg:order-1">
                        <h4 class="hidden md:inline-block text-grey-dark font-normal" style="margin-bottom: 10px; font-size: 20px;">艺术设计</h4>
                    </div>
                    <!-- Library -->
                    <div class="hidden px-2 pt-2 md:px-0 flex-wrap order-2 pb-8 js-tab-pane active" id="section-library5">
                        <c:forEach items="${books.get('E')}" var="book" varStatus="status" >
                            <div class="flex flex-row sm:flex-col items-center sm:items-start w-full xs:w-1/2 sm:w-1/3 md:w-1/5 p-4 js-book">
                                <a href="#"><img src="${pageContext.request.contextPath}/images/books/${book.bno}.jpg" alt="${book.bno}" class="w-1/3 sm:w-full shadow-md transition-normal hover:brighter hover:translate-y-1 hover:shadow-lg hover:border-indigo"></a>
                                <div class="ml-3 sm:ml-0 w-2/3 sm:w-full">
                                    <p class="text-sm my-2 font-medium sm:font-normal">${book.bname}</p>
                                    <label  class="hidden sm:inline-block rounded-full libre-bg-grey text-white px-2 py-1/2 text-xs">${book.blabel}</label>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- Parts6 -->
                <div>
                    <div class="px-6 md:px-0 flex items-baseline justify-between border-b-2 border-grey-light mt-6 order-0 lg:order-1">
                        <h4 class="hidden md:inline-block text-grey-dark font-normal" style="margin-bottom: 10px; font-size: 20px;">教育学习</h4>
                    </div>
                    <!-- Library -->
                    <div class="hidden px-2 pt-2 md:px-0 flex-wrap order-2 pb-8 js-tab-pane active" id="section-library6">
                        <c:forEach items="${books.get('F')}" var="book" varStatus="status" >
                            <div class="flex flex-row sm:flex-col items-center sm:items-start w-full xs:w-1/2 sm:w-1/3 md:w-1/5 p-4 js-book">
                                <a href="#"><img src="${pageContext.request.contextPath}/images/books/${book.bno}.jpg" alt="${book.bno}" class="w-1/3 sm:w-full shadow-md transition-normal hover:brighter hover:translate-y-1 hover:shadow-lg hover:border-indigo"></a>
                                <div class="ml-3 sm:ml-0 w-2/3 sm:w-full">
                                    <p class="text-sm my-2 font-medium sm:font-normal">${book.bname}</p>
                                    <label  class="hidden sm:inline-block rounded-full libre-bg-grey text-white px-2 py-1/2 text-xs">${book.blabel}</label>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/bundle.js" async defer></script>
</body>

</html>
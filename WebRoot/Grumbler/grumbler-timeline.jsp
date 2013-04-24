<%@ page language="java" import="java.util.*,com.iMutter.action.*,com.iMutter.vo.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>嘟囔</title>
<link rel="stylesheet" href="css/style_v.css" media="screen" />
<script src="js/jquery.min.js"></script>
<script src="js/jquery.timelinr.js"></script>

<!-- 页面css -->
<style type="text/css">
/* 全局CSS*/
* {
	margin: 0px;
	padding: 0px;
}

a {
	text-decoration: none;
	outline: none;
}

a:hover {
	text-decoration: underline;
}

/* 实例CSS */
html {
	_background: url(about:blank);
}  /*阻止闪动 in IE6 , 把空文件换成about:blank , 减少请求*/
body {
    font-size:14px;
	font-family: Arial, Tahoma, sans-serif;
	color: white;
	text-align: center;
	background: #E2E2E2;
}

#topToolbar {
    z-index:100;
	color: white;
	font-weight:600;
	font-size:14px;
	letter-spacing:8px;
	width: 100%;
	height: 40px;
	line-height: 40px;
	background: rgba(0, 102, 153, 0.9) none repeat scroll 0 0 !important;
	*filter:Alpha(opacity=90);
	*background-color:rgb(0, 102, 153);
	border-bottom: 2px solid #409F89;
	position: fixed;
	top: 0;
	left: 0;
	_position: absolute;
	_top: expression(documentElement.scrollTop);
}

#bottomToolbar {
    
    color: white;
    font-weight:600;
	font-size:14px;
	width: 100%;
	height: 40px;
	line-height: 40px;
	background: rgba(0, 102, 153, 0.9) none repeat scroll 0 0 !important;
	*filter:Alpha(opacity=90);
	*background-color:rgb(0, 102, 153);
	border-top: 2px solid #409F89;
	position: fixed;
	bottom: 0;
	left: 0;
	_position: absolute;
	_top: expression(documentElement.scrollTop +  
		  documentElement.clientHeight-this.offsetHeight);
	/*

        document.body.scrollTop 网页滚动的距离

        document.body.clientHeight 网页可见区域高

        this.offsetHeight 当前元素的高度

    */
}

#bottomToolbar a {
	color: #FFF;
}

#content {
	width: 880px;
	height: 1390px;
	line-height: 18px;
	text-align: left;
	margin: 80px auto 80px auto;
	*margin-top:80px;
	padding: 30px 50px;
	background: #222;
	border: 1px solid #CCC;
	zoom:1;

}
</style>

<!-- 页面javascript -->

<script type="text/javascript">
$(function(){
	$().timelinr({
		orientation:'vertical',
		issuesSpeed:300,
		datesSpeed:100,
		arrowKeys:'true',
		startAt:1
	});
});
</script>

</head>

<body>

    <div id="topToolbar">
	看看今天大家都在嘟囔些啥？
    </div>

    <div id="mainFrame">
        <div id="content">
        
        <!-- 利用ognl实现的数据展现
        <s:iterator value="%{mutterList}" id="mutter" >
            ${mutterTopic}
        </s:iterator> 
        -->
    
        <!-- 更常规准确的实现方式
        <s:iterator value="mutterList" id="mutterL" var="mutter" >  
            <br />  
            <p><s:property value="#mutter.mutterTopic"/>&nbsp;&nbsp;&nbsp;&nbsp;发起者：<s:property value="#mutter.mutterAuthor"/>&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="#mutter.mutterPublishDate"/></p>
            <br />
            <p><s:property value="#mutter.mutterContent"/></p>
            <br />
            <hr />
        </s:iterator>
         -->
         
        <div id="timeline">
            <ul id="dates">
			<li><a href="#1900" class="selected">1900</a></li>
			<li><a href="#1999">1999</a></li>
			<li><a href="#2001">2001</a></li>
			<li><a href="#2011">2011</a></li>
		</ul>
		<ul id="issues">
			<li id="1900" class="selected">
				<s:iterator value="mutterList" id="mutterL" var="mutter" >  
                    <br />  
                    <p><s:property value="#mutter.mutterTopic"/>&nbsp;&nbsp;&nbsp;&nbsp;发起者：<s:property value="#mutter.mutterAuthor"/>&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="#mutter.mutterPublishDate"/></p>
                    <br />
                    <p><s:property value="#mutter.mutterContent"/></p>
                    <br />
                    <hr />
                </s:iterator>
			</li>
			<li id="1999">
				<p>嘟囔</p>
			</li>
			<li id="2001">
				<p>嘟囔</p>
			</li>
			<li id="2011">
				<p>嘟囔</p>
			</li>
		</ul>
		<div id="grad_top"></div>
		<div id="grad_bottom"></div>
		<a href="#" id="next">+</a>
		<a href="#" id="prev">-</a>
        </div>
    
        </div>
    </div>

    <div id="bottomToolbar">
	    Copyright Clouds Thinker & Wlj
    </div>

    <!-- 黑板报显示区域 -->

    <!-- 菜单导航区域 -->

    <!-- 添加嘟囔区域 -->

    <!-- 嘟囔列表区域 -->

</body>
</html>

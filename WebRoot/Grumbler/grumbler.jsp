<%@ page language="java" import="java.util.*,com.iMutter.action.*,com.iMutter.vo.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" href="images/logo.ico"  type="image/x-icon"/>
<title>嘟囔</title>
<link rel="stylesheet" type="text/css" href="css/pagestyle.css" media="screen"/>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.paginate.js" type="text/javascript" charset="gbk"></script>

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
	font-family: Arial, Tahoma,"宋体", sans-serif;
	color: black;
	/*background: #E2E2E2;*/
	background: white;
}

/*顶部功能栏*/
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

#topFuncbar {
    width:880px;
    margin-left:auto;
    margin-right:auto;
    
}

#userInfo {
    font-size:12px;
    width:200px;
    float:right;
    text-align:right;
    letter-spacing:3px;
}

#userInfoLabel {
    text-align:center;
    vertical-align:middle;
    line-height: 30px;
    hight:27px;
    display:inline-block;
}

#loginBtn,#registerBtn {
    width:40px;
    height:27px;
    line-height:22px;
}


#searchBar {
    width:370px;
    float:right;
    text-align:left;
}

/*底部信息栏*/
#bottomToolbar {
    
    color: white;
    font-weight:600;
	font-size:14px;
	text-align:center;
	width: 100%;
	height: 60px;
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

#copyright {
    width:880px;
    margin-left:auto;
    margin-right:auto;
    vertical-align:middle;
    
}

#mainFrame{
    width:880px;
    height:1100px;
    margin-left:auto;
    margin-right:auto;
}

#content {
	width: 880px;
	height: 880px;
	line-height: 18px;
	text-align: left;
	margin: 20px auto 65px auto;
	*margin-top:20px;
	*margin-bottom:65px;
	padding: 20px 30px;
	background: white;
	/*border: 1px solid #CCC;*/
	zoom:1;

}

.mutterUnit {
    width: 180px;
    height: 300px;
    margin-left: 15px;
    padding:10px;
    float: left;  
    display:none;
}

.mutterShow {
    width: 185px;
    height: 280px;
    border: 1px solid #CCC;
    border-style: dashed;
    background: #E7F3F9;
    padding: 5px;
    white-space:normal;
    word-wrap:break-word;
}

#pageBar {
    width:350px;
    height:50px;
    margin-left:auto;
    margin-right:auto;
    white-space:nowrap;
}

</style>

<!-- 页面javascript -->

<script type="text/javascript">
$(function() {
	initMutterList(1);
	
	$("#pageBar").paginate({
		onChange: initMutterList,
		count 		: '<s:property value="%{pageSize}"/>',
		start 		: 1,
		display     : 10,
		border					: true,
		border_color			: '#fff',
		text_color  			: '#79B5E3',
		background_color    	: 'none',	
		border_hover_color		: '#ccc',
		text_hover_color  		: 'black',
		rotate      : true,
		images		: false,
		mouse		: 'press'
		
	});
	
	//翻页调用  
	function PageCallback(index, jq) {             
		initMutterList(index);  
	}

	function initMutterList(index){
		$.ajax({   
			url: 'fetchMutterListDataAction.action',
			type: 'post',  
			data: {pageNo:index},
			dataType: 'json',  			  			  
			success: function(data) { 
				//获取页面中的各显示元素列表
				var mutterTopicElements = $("div.mutterTopic");
				var mutterAuthorElements = $("div.mutterAuthor");
				var mutterPublishDateElements = $("div.mutterPublishDate");
				var mutterContentElements = $("div.mutterContent");
				var mutterShowUnitElements = $("div.mutterUnit");
				
				if(data.mutterList.length < 12){
					for(var i = 11- data.mutterList.length; i < 12; i++){
						mutterShowUnitElements.eq(i).hide();
					}
			    }
				$.each(data.mutterList,function(index,mutterObjectList){
					
					//重设元素的值，注意用eq方法进行设置，使其仍然可以使用jquery方法进行操作
					mutterShowUnitElements.eq(index).show();
					
					mutterTopicElements.eq(index).html(mutterObjectList.mutterTopic);
				    mutterAuthorElements.eq(index).html("发起者：" + mutterObjectList.mutterAuthor);
					mutterPublishDateElements.eq(index).html(mutterObjectList.mutterPublishDate);
					mutterContentElements.eq(index).html(mutterObjectList.mutterContent);
					
					/*if(index > mutterTopicElements.size()){
		                $("#content").append("<div id='mutterUnit'>");
		                $("#content").append("<div id='mutterShow'>");
		                $("#content").append("<br />");  
		                $("#content").append("<div class='mutterTopic'>" + mutterObjectList.mutterTopic + "</div>");
		                $("#content").append("<br />");
		                $("#content").append("<div class='mutterAuthor'>发起者：" + mutterObjectList.mutterAuthor + "</div>");
		                $("#content").append("<div class='mutterPublishDate'>" + mutterObjectList.mutterPublishDate + "</div>");
		                $("#content").append("<br />");
		                $("#content").append("<hr />");
		                $("#content").append("<br />");
		                $("#content").append("<div class='mutterContent'>" + mutterObjectList.mutterContent + "</div>");
		                $("#content").append("<br />");
		                $("#content").append("</div>");
		                $("#content").append("</div>");
  
					}else {
						
					}*/			
									
				});
	    
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
                alert(textStatus);
            }
		});    

	}
	
});
</script>

</head>

<body>

    <div id="topToolbar">
        <div id="topFuncbar">
            <span id="userInfo">
                <label id="userInfoLabel">身份:随便逛逛</label>
                <input id="loginBtn" type="button" value="登录"/>
                <input id="registerBtn" type="button" value="注册"/>
            </span>
	        <span id="searchBar">看看今天大家都在嘟囔些啥？</span>	    
	    </div>
    </div>

    <div id="mainFrame">
        <div id="content">
        
        <!-- 利用ognl实现的数据展现
        <s:iterator value="%{mutterList}" id="mutter" >
            ${mutterTopic}
        </s:iterator> 
        -->
    
        <!-- 更常规准确的实现方式
        <s:iterator value="mutterList" id="mutter" var="mutter" >  
            <div class="mutterUnit">
                <div class="mutterShow">
                    <br />  
                    <div class="mutterTopic"><s:property value="#mutter.mutterTopic"/></div>
                    <br />
                    <div class="mutterAuthor">发起者：<s:property value="#mutter.mutterAuthor"/></div>
                    <div class="mutterPublishDate"><s:property value="#mutter.mutterPublishDate"/></div>
                    <br />
                    <hr />
                    <br />
                    <div class="mutterContent"><s:property value="#mutter.mutterContent"/></div>
                    <br />
                </div>
            </div>
        </s:iterator>    -->
        
        <% for(int i = 0;i < 12; i++) {%>
            <div class="mutterUnit">
                <div class="mutterShow">
                    <br />  
                    <div class="mutterTopic"></div>
                    <br />
                    <div class="mutterAuthor"></div>
                    <div class="mutterPublishDate"></div>
                    <br />
                    <hr />
                    <br />
                    <div class="mutterContent"></div>
                    <br />
                </div>
            </div>
        
        <%} %>
             
        
        </div>
        <div id="pageBar"></div>
    </div>
    

    <div id="bottomToolbar">
        <div id="copyright"></>Copyright Clouds Thinker & Wlj</div>
    </div>

    <!-- 黑板报显示区域 -->

    <!-- 菜单导航区域 -->

    <!-- 添加嘟囔区域 -->

    <!-- 嘟囔列表区域 -->

</body>
</html>

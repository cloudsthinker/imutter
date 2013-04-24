<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>嘟囔</title>

<script src="js/jquery.min.js"></script>
<script src="js/jquery.placeholder.1.3.min.js"></script>
<script type="text/javascript">
    $(function(){

		$.Placeholder.init();
		
    });
    
    $(document).ready(function () {  
    	$("#mutterString").html("欢迎");
    	
    	$("#mutterBtn").click(function(){
    		$.ajax({
                url:'addAnonymousMutterAction.action',
                type:'post',
                data:{mutterString:$("#mutterTextArea").val()},
                dataType:'json',
                success:function (ll) {
                	$("#mutterString").text(ll.operationState);

                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.status);
                    alert(XMLHttpRequest.readyState);
                    alert(textStatus);
                }
                
            });

    	});
    	
    	$("#mainBtn").click(function(){
    		window.location.href="fetchMutterListAction.action";  
    	});
    });
</script>

<style type="text/css">
<!--

/*底层div居中的样式设置开始 */
body {
    TEXT-ALIGN: center;
	background-color:#006699;
}

#BackView {
	margin-top:150px;
	width:800px;
	height:300px;
	z-index:1;
	background-color:#006699;
	margin-left: auto;
    margin-right: auto;
}
/*底层div居中的样式设置结束 */


#LeftView {
    margin-top:0px;
	width:400px;
	z-index:4;
	/*background-color:#3399FF;*/
	background:url(images/smallBlackBoard.png);
	/*让div可以横向排列
	float:left;*/
	min-height:300px;
	margin-left: auto;
    margin-right: auto;

}

#RightView {
    width:400px;
	z-index:5;
	/*background-color:#3399FF;*/
	background:url(images/login-form.png);
	/*让div可以横向排列
	float:left;*/
	min-height:350px;

}

#mutterTextArea {
    resize:none;
    margin-top:55px;
	margin-left:0px;
	width:195px;
	height:170px;
    border:0px;
	/*隐藏滚动条*/    
	overflow:hidden;
	background-color:transparent;
	color:#FFFFFF;
	font-size:18px;
	font-weight:bold;	
}

#mutterBtn,#mainBtn{
    padding:0;
    height:27px;
    width:68px;
    line-height:22px;
}

#mutterString{
    color:white;
}

-->
</style>

</head>

<body>
 
    <div id="BackView">
        <div id="LeftView">
		<textarea id="mutterTextArea" name="mutterTextArea" placeholder="随便嘟囔一下吧。。。"></textarea>
	    </div>
        <!-- <div id="RightView">
		</div>  -->  
		<div><label id="mutterString"></label></div>
		<input id="mutterBtn" type="button" value="嘟囔一下" />
		<input id="mainBtn" type="button" value="去逛逛" />
    </div>

</body>

</html>

<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>

<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>CDN登录界面</title>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<link href="<c:url value='/assets/css/oms.css'/>" type="text/css" rel="stylesheet"></link>
		<script language="javascript" src="<c:url value='/assets/js/des.js'/>"></script>
		<script language="javascript" src="<c:url value='/assets/js/jq.js'/>"></script>
		<script language="javascript" src="<c:url value='/assets/js/common_rosters.js'/>"></script>
		<script language="javascript" src="<c:url value='/assets/js/sha.js'/>"></script>
		<script language="javascript">
		</script></script>
		<%-- <link type="image/x-icon" href="<c:url value='/assets/img/favicon.ico'/>" rel="icon"> --%>
	</head>
	<body onload="createCode()">
	<script type="text/javascript">
	     var xmlHttp;
	     var code;
		function createXMLHttpRequest() {
			try {
				// Firefox, Opera 8.0+, Safari
				xmlHttp = new XMLHttpRequest();
			} catch (e) { // Internet Explorer
				try {
					xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
				} catch (e) {
					try {
						xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
					} catch (e) {
						alert('浏览器不支持');
						return false;
					}
				}
			}
		}
		
		// 创建4位验证码
		function createCode() {
			code = "";
			var codeLength = 4; // 验证码的长度
			var checkCode = document.getElementById("checkCode");
			var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'a', 'b', 'c', 'd',
					'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q',
					'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D',
					'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q',
					'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); // 所有候选组成验证码的字符，当然也可以用中文的
			for ( var i = 0; i < codeLength; i++) {
				var charNum = Math.floor(Math.random() * 52);
				code += codeChars[charNum];
			}
			if (checkCode) {
				checkCode.className = "code";
				checkCode.innerHTML = code;
			}
		}
		
		// 校验验证码
		function validateCode() {
			var inputCode = document.getElementById("j_captcha_response").value;
			if (inputCode.length <= 0) {
				alert("请输入验证码！");
			} else if (inputCode.toUpperCase() != code.toUpperCase()) {
				alert("验证码输入有误！");
				createCode();
			} 
		}
		
		function doRequestUsingPOST() {
			var username = document.getElementById("userName").value;
			var password = document.getElementById("password").value;
			if (username == "用户名") {
				username = "";
			}
			if (password == "密  码") {
				password = "";
			}
			if (username != null && username.length > 0 && password != null
					&& password.length > 0) {
				password = hex_sha1(password);
				createXMLHttpRequest();
				var url = "index.do";
				var queryString = 'username=' + username + '&password=' + password;
				xmlHttp.open("POST", url, true);
				xmlHttp.onreadystatechange = handleStateChange;
				xmlHttp.setRequestHeader("Content-Type",
						"application/x-www-form-urlencoded;");
				//设置报头,说明此请求是ajax请求
				xmlHttp.setRequestHeader("RequestType", "ajax");
				xmlHttp.send(queryString);
			} else {
				alert('请输入用户名或密码');
			}
		}

		function handleStateChange() {
			if (xmlHttp.readyState == 4) {
				if (xmlHttp.status == 200)
					parseResults();
			}
		}

		function parseResults() {
			var result = xmlHttp.responseText;
			result = eval("(" + result + ")");
			var resultCode = result.code;
			var resultMessage = result.message;
			if (resultCode != null && resultCode == 0) {
				var sec = 30;
				t_stopwatch = setInterval(function() {
					viewLeftSes(sec--)
				}, 1000);
				document.getElementById("sendMsgCode").style.display = "none";
				document.getElementById("sendMsgLastTime").style.display = "";
				var messCode=document.getElementById('messageCode');
		       	if(messCode!=null){
		    	   messCode.disabled=false;
		        }
		        return;
			} else if (resultCode != null && resultCode == 1) {
				alert('验证码短信发送失败！');
			} else if (resultCode != null && resultCode == 2) {
				alert('短信服务响应错误！');
			} else if (resultCode != null && resultCode == 3) {
				alert('短信服务不可用');
			} else if (resultCode != null && resultCode == 4) {
				alert('密码错误');
			} else if (resultCode != null && resultCode == 5) {
				alert('用户不存在');
			} else if (resultCode != null && resultCode == 10) {
				alert('用户已锁定,请稍后登陆');
			} else if (resultCode != null && resultCode == 11) {
				alert('密码错误，还有'
						+ result.count
						+ '次机会');
			} else if (resultCode != null && resultCode == 12) {
				alert('1小时内密码错误已超过5次，用户将锁定30分钟');
			} else if (resultCode != null && resultCode == 15) {
				alert('两次请求验证码的间隔时间小于30秒');
			} else {
				alert('短信服务不可用');
			}
			var messCode=document.getElementById('messageCode');
	       	if(messCode!=null){
				messCode.disabled=true;
	        }
		}

		function viewLeftSes(sec) {
			if (sec > 0) {
				//短信验证码获取状态为禁用
				document.getElementById("sec").innerHTML = "<font color='red'>"
						+ sec + "</font>";
			}
			if (sec < 0) {
				clearInterval(t_stopwatch);
				document.getElementById("sendMsgLastTime").style.display = "none";
				document.getElementById("sendMsgCode").style.display = "";
				document.getElementById("sec").innerHTML = "";

			}
		}

		function usernameOnfocus(th) {
			var username = document.getElementById('userName');
			if (th.id == "userName") {
				username.value = "";
			}
		}

		function usernameOnblur(th) {
			var username = document.getElementById("userName");
			if (th.value.length == 0) {
				username.value = "用户名";
			}
		}

		function passwordOnfocus(th) {
			var password = document.getElementById('password');
			if (th.id == "password") {
				password.value = "";
				password.type = "password";
			}
		}

		function passwordOnblur(th) {
			var password = document.getElementById('password');
			if (!th.value) {
				password.type = "text";
				password.value = "密  码";
			}
		}

		function yanzhengOnfocus(th) {
			var yanzheng = document.getElementById('j_captcha_response');
			if (th.value == "验证码") {
				yanzheng.value = "";
			}
		}

		function yanzhengOnblur(th) {
			var yanzheng = document.getElementById('j_captcha_response');
			if (th.value.length == 0) {
				yanzheng.value = "验证码";
			}
		}

		function messageOnfocus(th) {
			var message = document.getElementById('messageCode');
			if (th.value == "短信码") {
				message.value = "";
			}
		}

		function messageOnblur(th) {
			var message = document.getElementById('messageCode');
			if (th.value.length == 0) {
				message.value = "短信码";
			}
		}

		function clearInput(th) {
			var reset = document.getElementById('reset');
			reset.style.background = "url(assets/img/bt_cancel_press.png)";//在linux部署时url(/sso/img/bt_cancel_press.png)
			var username = document.getElementById('userName');
			var password = document.getElementById('password');
			var yanzheng = document.getElementById('j_captcha_response');
			var messageCode = document.getElementById('messageCode');

			userName.value = "用户名";

			password.type = "text";
			password.value = "密  码";

			if (yanzheng != null) {
				yanzheng.value = "验证码";
			}
			if (messageCode != null) {
				messageCode.value = "短信码";
			}

		}
		function changeBackground(){
	         var bg = document.getElementById('log_bg');
	         var number = Math.round(Math.random()*(3-1))+1;//获得1到3之间的随机数
	         bg.style.background="url(assets/img/bg" + number + ".png)"; //在linux部署时url(/sso/images/loginlogo/bg)
	 	}

		function doSubmit() {

			var username = document.getElementById("userName").value;
			var password = document.getElementById("password").value;
			var j_captcha_response = document.getElementById("j_captcha_response");
			document.getElementById("newCode").value = code;
			var messageCode = document.getElementById("messageCode");
			if (j_captcha_response != null) {
				j_captcha_response = j_captcha_response.value;
			}
			if (messageCode != null) {
				messageCode = messageCode.value;
			}
			if (username == null || username.length <= 0 || username == "用户名"
					|| password == null || password.length <= 0
					|| password == "密  码") {
				alert("请输入用户名和密码");
				return false;
			} else if (j_captcha_response != null && j_captcha_response.length < 4) {
				alert("请输入有效验证码");
				return false;
			} /* else if (username == 'administrator' || username == 'admin'){
				var pwd = strEnc(password,'ABCDEF1234567890',"","");
			document.getElementById("password").value=pwd;	
				return true;
			} */else if(messageCode != null && messageCode.length < 4) {
				alert("请输入有效短息验证码");
				return false;
			}
			
			var pwd = strEnc(password,'ABCDEF1234567890',"","");
			document.getElementById("password").value=pwd;
		}

		function onmouseroverReset() {
			var reset = document.getElementById('reset');
			reset.style.background = "url(assets/img/bt_cancel_over.png)"; //在linux部署时url(/sso/img/bt_cancel_over.png)
		}

		function onmouseoutReset() {
			var reset = document.getElementById('reset');
			reset.style.background = "url(assets/img/bt_cancel_nor.png)";//在linux部署时url(/sso/img/bt_cancel_nor.png)
		}
		//设置垂直居中
		function fBodyVericalAlign() {
			var nClientHeigh = document.documentElement.clientHeight;
			//alert(nClientHeigh/2-270);
			var heig = nClientHeigh / 2 - 270;

			if (heig > 0) {
				document.body.style.paddingTop = heig + 'px';
			}

		}
		fBodyVericalAlign();
		//绑定事件监听
		function fEventListen(oElement, sName, fObserver, bUseCapture) {
			bUseCapture = !!bUseCapture;
			if (oElement.addEventListener) {
				oElement.addEventListener(sName, fObserver, bUseCapture);
			} else if (oElement.attachEvent) {
				oElement.attachEvent('on' + sName, fObserver);
			}
		}
		//onresize事件
		fEventListen(window, 'resize', fBodyVericalAlign);
		//window.setInterval(changeBackground, 5000);
		window.onload=function() {
			changeBackground();
			createCode();
			clearInput();
		}
// 		window.onload=changeBackground;
// 		window.onload=createCode;
	</script>
		<div class="d_logo">
			<div class="cm_logo">
				<img src="<c:url value='/assets/img/mobilevideo.png'/>" alt="logo">
			</div>
			<div class="oms_name">CDN客户服务系统</div>
		</div>
		
		<div class="log_m">
			<div id="log_bg" class="log_bg" style="background: transparent url("assets/img/bg2.png") repeat scroll 0% 0%;">
				<div style="width: 800px; margin: 0 auto; overflow: hidden;">
					<div class="logpad">
						<div class="d_login">
							<form id="fm1" method="post" action="index.do" onsubmit="validateCode()">
								<div class="log_head">
									<div>用户登录</div>
								</div>
								<div class="log_input">
									<input id="userName"  type="text" name="userName" value="用户名" onblur="usernameOnblur(this);" onfocus="usernameOnfocus(this);"/>
								</div>
								<div class="log_input">
									<input id="password" type="text" value="密 码" name="password" onblur="passwordOnblur(this);" onfocus="passwordOnfocus(this);">
								</div>
								<input id="_eventId" type="hidden" value="submit" name="_eventId">
								<div class="log_input log_yz">
									<input id="j_captcha_response" type="text" value="验证码" name="j_captcha_response" onblur="yanzhengOnblur(this);" onfocus="yanzhengOnfocus(this);">
									<div class="yanzheng">
										<div class="code" id="checkCode" onclick="createCode()" width="101px" height="35px" align="middle" style="position: absolute; right: 0; top: 0; text-align: center; line-height: 37px; color: #2f88d0; font-size: 20px;"></div>
									</div>
									<input id="newCode" type="hidden" name="newCode"/>
								</div>
								<div class="errordiv"> </div>
								<div class="log_bt">
									<input id="submit" class="bt_ok" type="submit" onclick="javascript:return doSubmit();" value="">
									<input id="reset" class="bt_ag" type="button" onmouseout="javascript:onmouseoutReset()" onmouseover="javascript:onmouseroverReset();" onclick="javascript:clearInput(this);">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="d_shen">
			<div class="gongsi">
				<div ></div>
    				 Version 1.0.0
				</div>
			<div class="wondertek">  © 2015-2016 咪咕视讯科技有限公司</div>
	</div>
	</body>
</html>

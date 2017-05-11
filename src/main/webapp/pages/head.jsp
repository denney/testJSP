<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
        String username = session.getAttribute("userName") == null ? ""
                        : session.getAttribute("userName").toString();
                if(username.length()>14){
                                username = username.substring(0,14).concat("...");
                }

        String appname = session.getAttribute("_sso_appnames") == null ? ""
                        : session.getAttribute("_sso_appnames").toString();
        String appurl = session.getAttribute("_sso_appurls") == null ? ""
                        : session.getAttribute("_sso_appurls").toString();

        String[] appnames = appname.split(",");
        String[] appurls = appurl.split(",");
        String header_Url = request.getServerName() + request.getContextPath();
        String admin_url = session.getAttribute("_sso_admin_url") == null ? ""
           : session.getAttribute("_sso_admin_url").toString();
        String sso_server_url = admin_url.replace("-admin","");
        String pwdStat = session.getAttribute("_pwd_status") == null ? ""
                : session.getAttribute("_pwd_status").toString();
        String pwdMsg="";
        if(null!=pwdStat && (pwdStat.equals("1")||pwdStat.equals("-1")))
                        pwdMsg=",<font color='red'>您的密码即将到期,请及时修改</font>";

        //用户信息请求接口url保存到session中，便于获取
        session.setAttribute("userListInf",admin_url+"/userListInf.json");
        
%>
<% String [] appCss = new String[]{ "btn-pink", "btn-primary", "btn-success", "btn-info" }; %>
<div style="display:none;"><%=appname %></div>
	<!-- #section:basics/navbar.layout -->
		<div id="navbar" class="navbar navbar-default navbar-fixed-top">
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

			<div class="navbar-container" id="navbar-container">
				<!-- #section:basics/sidebar.mobile.toggle -->
				<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
					<span class="sr-only">Toggle sidebar</span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>
				</button>

				<!-- /section:basics/sidebar.mobile.toggle -->
				<div class="navbar-header pull-left hidden-xs hidden-sm">
					<!-- #section:basics/navbar.layout.brand -->
					<a href="#" class="navbar-brand no-padding">
						<small class="clearfix">
							<i class="navbar-logo pull-left"></i>
							<span class="navbar-title pull-left"><%--<fmt:message key="标题" />--%>呃</span>
						</small>
					</a>

					<!-- /section:basics/navbar.layout.brand -->

					<!-- #section:basics/navbar.toggle -->

					<!-- /section:basics/navbar.toggle -->
				</div>
				
				<div id="openAlert" style="width:200px;border-radius:6px;position:absolute;left:50%;background-color:#f0ffff;display:none;">
					<label style="padding-left:5px;">提示</label> 
					<div style="padding-left:5px;padding-right:5px;padding-bottom:5px;"></div>										
				</div>
				
				<!-- #section:basics/navbar.dropdown -->
				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<%-- <li class="grey">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-list-ul"></i>
								<span class="badge badge-grey"><%=appnames.length %></span>
							</a>

							<ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">									
									 应用
								</li>
								<% for(int i=0; i < appnames.length; i++) {%>
								<li>
									<a href="<%= appurls[i]%>" target="_blank">
										<i class="btn btn-xs no-hover <%=appCss[i%appCss.length] %>"></i>
										<%=appnames[i]%>
									</a>
								</li>
								<%} %>
							</ul>
						</li>
 --%>
						<!-- #section:basics/navbar.user_menu -->
						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="<c:url value='/assets/avatars/avatar2.png'/>" alt="ywyf002's Photo" />
								<span class="user-info">
									<small>欢迎您,</small>
									<%=username%>
								</span>

								<i class="ace-icon fa fa-chevron-down"></i>
							</a>

							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<%-- <li>
									<a href="<%=sso_server_url%>/profile/edit.html" target="_blank">
										<i class="ace-icon fa fa-user"></i>
										个人资料
									</a>
								</li> --%>

								<li class="divider"></li>

								<li>
									<a href="<%=request.getContextPath()%>/out.do">
										<i class="ace-icon fa fa-power-off"></i>
										退出
									</a>
								</li>
							</ul>
						</li>

						<!-- /section:basics/navbar.user_menu -->
					</ul>
				</div>

				<!-- /section:basics/navbar.dropdown -->
			</div><!-- /.navbar-container -->
		</div>
<script type="text/javascript">
	<!--提示部分-->
	function openAlert(title,content){
		$tip = $("#openAlert");
		$tip.find("div").text("");
		$tip.find("label").text(title ? title : "提示");
		$tip.find("div").append(content);
		$tip.slideDown("normal").delay(1000).slideUp("normal");
	}
</script>



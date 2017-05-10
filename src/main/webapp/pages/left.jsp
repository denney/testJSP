<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- #section:basics/sidebar -->
<div id="sidebar" class="sidebar responsive">
	<script type="text/javascript">
		try {
			ace.settings.check('sidebar', 'fixed')
		} catch (e) {
		}
	</script>

	<ul class="nav nav-list" id="left_menu">
	<!--    基础管理功能 start    -->
		<li>
			<a href="#" class="dropdown-toggle"> 
				<i class="menu-icon fa fa-desktop"></i> 
				<span class="menu-text">基础管理 </span> 
				<b class="arrow fa fa-angle-down"></b>
			</a> <b class="arrow"></b>

			<ul class="submenu">
				<li>
					<a href="#" menu-url="<c:url value='innerMessage'/>">
						站内信管理
					</a> 
					<b class="arrow"></b>
				</li>
				<li>
					<a href="#" menu-url="<c:url value='app'/>">
						App管理
					</a> 
					<b class="arrow"></b>
				</li>
				<li>
					<a href="#" menu-url="<c:url value='user'/>">
						用户设置信息
					</a> 
					<b class="arrow"></b>
				</li>
				<li>
					<a href="#" menu-url="<c:url value='messageInfo'/>">
						消息信息
					</a> 
					<b class="arrow"></b>
				</li>
			</ul>	
		</li>
	</ul>
	<!--    基础管理功能 end    -->
	
	<!-- /.nav-list -->

	<!-- #section:basics/sidebar.layout.minimize  -->
	<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
		<i class="ace-icon fa fa-angle-double-left"
		   data-icon1="ace-icon fa fa-angle-double-left"
		   data-icon2="ace-icon fa fa-angle-double-right"></i>
	</div>
      
	<!-- /section:basics/sidebar.layout.minimize -->
	<script type="text/javascript">
		try {
			ace.settings.check('sidebar', 'collapsed')
		} catch (e) {
		}
	</script>
</div>

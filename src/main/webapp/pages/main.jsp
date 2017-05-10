<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title><fmt:message key="webapp.name" /> </title>

		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<link rel="icon" href="<c:url value='/assets/img/favicon.ico'/>" type="image/x-icon" />
		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="<c:url value='/assets/css/bootstrap.css'/>" />
		<link rel="stylesheet" href="<c:url value='/assets/css/bootstrap-datetimepicker.css'/>"/>
		<link rel="stylesheet" href="<c:url value='/assets/css/bootstrap-editable.css'/>"/>
		<link rel="stylesheet" href="<c:url value='/assets/css/bootstrap-multiselect.css'/>" />
		<link rel="stylesheet" href="<c:url value='/assets/css/bootstrapValidator.css'/>" />
		<link rel="stylesheet" href="<c:url value='/assets/css/bootstrap-duallistbox.css'/>" />

		<!-- page specific plugin styles -->
		<link rel="stylesheet" href="<c:url value='/assets/css/datepicker.css'/>" />
		<link rel="stylesheet" href="<c:url value='/assets/css/ui.jqgrid.css'/>" />
		<link rel="stylesheet" href="<c:url value='/assets/css/chosen.css'/>" />
		<link rel="stylesheet" href="<c:url value='/assets/css/dropzone.css'/>" />
		<link rel="stylesheet" href="<c:url value='/assets/css/colorbox.css'/>"/>
		<link rel="stylesheet" href="<c:url value='/assets/css/select2.css'/>"/>

		<!-- jquery plugin styles -->
		<link rel="stylesheet" href="<c:url value='/assets/css/jquery-ui.css'/>" />
		<link rel="stylesheet" href="<c:url value='/assets/css/jquery-ui.custom.css'/>"/>
		<link rel="stylesheet" href="<c:url value='/assets/css/jquery.gritter.css'/>"/>
		
		<link rel="stylesheet" href="<c:url value='/assets/css/jquery.marquee.css'/>"/>
		<link rel="stylesheet" href="<c:url value='/plugins/css/jquery-jcrop/jquery.Jcrop.css'/>"/>
		<link rel="stylesheet" href="<c:url value='/assets/css/jquery.autocomplete.css'/>"/>
		<link rel="stylesheet" href="<c:url value='/plugins/css/css.css'/>"/>
		<link rel="stylesheet" href="<c:url value='/assets/css/lobibox.css'/>"/>
		
		<!-- text fonts -->
		<link rel="stylesheet" href="<c:url value='/assets/css/font-awesome.css'/>" />
		<link rel="stylesheet" href="<c:url value='/assets/css/ace-fonts.css'/>" />

		<!-- ace styles -->
		<link rel="stylesheet" href="<c:url value='/assets/css/ace.css'/>" class="ace-main-stylesheet" id="main-ace-style" />
		<link rel="stylesheet" href="<c:url value='/assets/css/bootstrap-growl.css'/>" />

		<!-- 项目自定义的css -->
		<link rel="stylesheet" href="<c:url value='/pages/message_admin.css'/>" />
		<!-- multiple selector -->
		<script src="<c:url value='/assets/js/ace-extra.js'/>"></script>
		<!--[if lte IE 9]>
			<link rel="stylesheet" href="<c:url value='/assets/css/ace-part2.css'/>" class="ace-main-stylesheet" />
		<![endif]-->

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="<c:url value='/assets/css/ace-ie.css'/>" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
		<script src="<c:url value='/assets/js/jquery.js'/>"></script>

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="<c:url value='/assets/js/html5shiv.js'/>"></script>
		<script src="<c:url value='/assets/js/respond.js'/>"></script>
		<![endif]-->
		
		<!-- basic scripts -->
		
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='<c:url value="/assets/js/jquery.js"/>'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("dst");
		</script>
		
		<%-- <script src="<c:url value='/echarts/js/echarts.js'/>"></script>
		<script src="<c:url value='/echarts/js/china.js'/>"></script> --%>
		
		<script src="<c:url value='/assets/js/bootstrap.js'/>"></script>

		<!-- page specific plugin scripts -->

		<!--[if lte IE 8]>
		  <script src="<c:url value='/assets/js/excanvas.js'/>"></script>
		<![endif]-->
		<script src="<c:url value='/plugins/js/msgTips.js'/>"></script>
		<script src="<c:url value='/assets/js/jquery-ui.custom.js'/>"></script>
		<script src="<c:url value='/assets/js/jquery.ui.touch-punch.js'/>"></script>
		<script src="<c:url value='/assets/js/flot/jquery.flot.js'/>"></script>
		<script src="<c:url value='/assets/js/flot/jquery.flot.pie.js'/>"></script>
		<script src="<c:url value='/assets/js/flot/jquery.flot.resize.js'/>"></script>
		<script src="<c:url value='/assets/js/lobibox.js'/>"></script>
		
		<!-- ace scripts -->
		<script src="<c:url value='/assets/js/ace/elements.scroller.js'/>"></script>
		<script src="<c:url value='/assets/js/ace/elements.colorpicker.js'/>"></script>
		<script src="<c:url value='/assets/js/ace/elements.fileinput.js'/>"></script>
		<script src="<c:url value='/assets/js/ace/elements.typeahead.js'/>"></script>
		<script src="<c:url value='/assets/js/ace/elements.wysiwyg.js'/>"></script>
		<script src="<c:url value='/assets/js/ace/elements.spinner.js'/>"></script>
		<script src="<c:url value='/assets/js/ace/elements.treeview.js'/>"></script>
		<script src="<c:url value='/assets/js/ace/elements.wizard.js'/>"></script>
		<script src="<c:url value='/assets/js/ace/elements.aside.js'/>"></script>
		<script src="<c:url value='/assets/js/ace/ace.js'/>"></script>
		<script src="<c:url value='/assets/js/ace/ace.ajax-content.js'/>"></script>
		<script src="<c:url value='/assets/js/ace/ace.touch-drag.js'/>"></script>
		<script src="<c:url value='/assets/js/ace/ace.sidebar.js'/>"></script>
		<script src="<c:url value='/assets/js/ace/ace.sidebar-scroll-1.js'/>"></script>
		<script src="<c:url value='/assets/js/ace/ace.submenu-hover.js'/>"></script>
		<script src="<c:url value='/assets/js/ace/ace.widget-box.js'/>"></script>
		<script src="<c:url value='/assets/js/ace/ace.settings.js'/>"></script>
		<script src="<c:url value='/assets/js/ace/ace.settings-rtl.js'/>"></script>
		<script src="<c:url value='/assets/js/ace/ace.settings-skin.js'/>"></script>
		<script src="<c:url value='/assets/js/ace/ace.widget-on-reload.js'/>"></script>
		<script src="<c:url value='/assets/js/ace/ace.searchbox-autocomplete.js'/>"></script>

		<!-- jqgrid -->
		<script src="<c:url value='/assets/js/jqGrid/jquery.jqGrid.src.js'/>"></script>
		<script src="<c:url value='/assets/js/jqGrid/i18n/grid.locale-cn.js'/>"></script>

		<!-- jquery plugin -->
		<script src="<c:url value='/assets/js/jquery-ui.js'/>"></script>
		<script src="<c:url value='/assets/js/jquery-ui.custom.js'/>"></script>
		<script src="<c:url value='/assets/js/jquery.ui.touch-punch.js'/>"></script>
		<script src="<c:url value='/assets/js/jquery.gritter.js'/>"></script>
		<script src="<c:url value='/assets/js/jquery.easypiechart.js'/>"></script>
		<script src="<c:url value='/assets/js/jquery.sparkline.js'/>"></script>
		<script src="<c:url value='/assets/js/typeahead.jquery.js'/>"></script>
		<script src="<c:url value='/assets/js/jquery.hotkeys.js'/>"></script>
		<script src="<c:url value='/assets/js/bootstrap-wysiwyg.js'/>"></script>
		<script src="<c:url value='/assets/js/fuelux/fuelux.wizard.js'/>"></script>
		<script src="<c:url value='/assets/js/select2.js'/>"></script>
		<script src="<c:url value='/assets/js/x-editable/bootstrap-editable.js'/>"></script>
		<script src="<c:url value='/assets/js/x-editable/ace-editable.js'/>"></script>
		<script src="<c:url value='/assets/js/jquery.colorbox.js'/>"></script>
		<script src="<c:url value='/assets/js/jquery.maskedinput.js'/>"></script>
		<script src="<c:url value='/assets/js/chosen.jquery.js'/>"></script>
		<script src="<c:url value='/plugins/js/jquery-pin/jquery.pin.min.js'/>"></script> 
		<script src="<c:url value='/plugins/js/waypoints/jquery.waypoints.min.js'/>"></script>	
		<script src="<c:url value='/plugins/js/jquery-jcrop/jquery.Jcrop.js'/>"></script>

		<script src="<c:url value='/assets/js/bootstrap-multiselect-now.js'/>"></script>
		<script src="<c:url value='/assets/js/date-time/moment.js'/>"></script>
		<script src="<c:url value='/assets/js/date-time/daterangepicker.js'/>"></script>
		<script src="<c:url value='/assets/js/date-time/bootstrap-datepicker.js'/>"></script>
		<script src="<c:url value='/assets/js/date-time/bootstrap-datetimepicker.js'/>"></script>
		<script src="<c:url value='/assets/js/bootstrapValidator.js'/>"></script>
		<script src="<c:url value='/plugins/js/echarts/dist/echarts.js'/>"></script>
		<script src="<c:url value='/assets/js/dropzone.js'/>"></script>
		<script src="<c:url value='/assets/js/bootbox.js'/>"></script>
		<script src="<c:url value='/assets/js/fuelux/fuelux.spinner.js'/>"></script>
		<script src="<c:url value='/plugins/js/resize.js'/>"></script>
		
		<%--双向 选择框 --%>
		<script src="<c:url value='/assets/js/jquery.bootstrap-duallistbox.js'/>"></script>
		<%--树 --%>
		<script src="<c:url value='/assets/js/fuelux/fuelux.tree.js'/>"></script>
		<script src="<c:url value='/plugins/js/mouseRightmenu/jquery-smartMenu.js'/>"></script>
		<script src="<c:url value='/pages/main.js'/>"></script>
		<script src="<c:url value='/pages/left.js'/>"></script>
	</head>
	<script >
		var __webroot__ ='<c:url value="/"/>'
	</script>
	<body class="no-skin"><!-- oncontextmenu="return false" -->
		<button style="display:none;" class="btn btn-lger" id="alertButton"></button><!-- 提示信息要用到 -->
		<jsp:include page="/pages/head.jsp" />
		<!-- /section:basics/navbar.layout -->
		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<jsp:include page="/pages/left.jsp" >
				<jsp:param value="home" name="curNav"/>
			</jsp:include>
			<div class="main-content">
				<div class="main-content-inner" id="main_page">
					<%-- <jsp:include page="/pages/info/test.jsp" /> --%>
				</div>
			 </div>
			<jsp:include page="/pages/footer.jsp" />
		</div><!-- /.main-container -->
		<script type="text/javascript">
			$(window).resize(function(){   
				$("#grid-table").setGridWidth($(".page-content").width());
			}); 
		</script>
	</body>
</html>

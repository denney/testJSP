<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<link rel="stylesheet" href="<c:url value='/assets/css/datepicker.css'/>" />
<link rel="stylesheet" href="<c:url value='/assets/css/bootstrap-datetimepicker.css'/>" />
<div class="breadcrumbs" id="breadcrumbs">
	<script type="text/javascript">
		try {
			ace.settings.check('breadcrumbs', 'fixed')
		} catch (e) {
		}
		jQuery(function($) {
			jQuery("#grid-table").jqGrid({
				url:"json/getUserInfo.do",
				mtype:"POST",
				datatype: "json",
				height:"100%",
				colNames:["ID","App类型","手机号","评论","点赞","系统消息","创建时间","更新时间"],
				colModel:[
						{name:'id',index:'id', width:90, sorttype:"int"},
						{name:'appType',index:'appType',width:90,sortable:false},
						{name:'phone',index:'phone',width:90,sortable:false},
						{name:'commentCfg',index:'commentCfg',width:90,sortable:false,
							formatter:function(cellvalue, options, rowObject){
								if(cellvalue==2){
									return "<span style='color:red;'>拒收</span>";
								}else if(cellvalue==1){
									return "<span style='color:green;'>免打扰</span>";
								}else{
									return "<span style='color:black;'>全接收</span>";
								}
							}	 
						},
						{name:'praiseCfg',index:'praiseCfg',width:90, sortable:false,
							formatter:function(cellvalue, options, rowObject){
								if(cellvalue==2){
									return "<span style='color:red;'>拒收</span>";
								}else if(cellvalue==1){
									return "<span style='color:green;'>免打扰</span>";
								}else{
									return "<span style='color:black;'>全接收</span>";
								}
							}	
						},
						{name:'sysCfg',index:'sysCfg',width:90, sortable:false,
							formatter:function(cellvalue, options, rowObject){
								if(cellvalue==2){
									return "<span style='color:red;'>拒收</span>";
								}else if(cellvalue==1){
									return "<span style='color:green;'>免打扰</span>";
								}else{
									return "<span style='color:black;'>全接收</span>";
								}
							}	
						},
						{name:'createTime',index:'createTime',width:120, sortable:false},
						{name:'updateTime',index:'updateTime',width:120, sortable:false},
				],
				autowidth: true,
				viewrecords : true,
				rowNum:10,
				rowList:[10,20,30],
				pager:"#grid-pager",
				emptyrecords: "Nothing to display",  
				altRows: true,
				jsonReader:{
					root: 'rows',
					repeatitems: true
				},
				sortable: true,
				sortname:'id',
				sortorder:'desc',
				multiselect: true,
		        multiboxonly: true,
		        loadComplete:function(){
		        	$("#grid-table").setGridWidth($(".page-content").width());
		        },
		      
			});		
			
		});
	</script>
<!-- 导航 -->
	<ul class="breadcrumb">
		<li><i class="ace-icon fa fa-home home-icon"></i><a href="#">首页</a></li>
		<li>基础管理</li>
		<li class="active"><span>用户设置信息</span></li>
	</ul>
</div>
<div class="page-content">
	<!-- 工具栏 -->
	
	<div class="btn-group clearfix">
		<button id="logSearch" flag="hide" class="btn btn-sm btn-round"> 
	       	<b class="ace-icon fa fa-search orange bigger-115"></b>
	       	搜索
	        <span><i class="fa fa-plus orange bigger-110"></i></span>
	    </button>
	</div>
	<div id="searchDiv" class="panel-body" style="display: none;">
		<form class="form-horizontal" id="searchForm" onsubmit="return false;">
			<div class="form-group">
				<div class="col-lg-11 col-sm-11">
					<label class="col-sm-1 control-label no-padding-right" contenteditable="false" for="businessName"style="width:80px">App类型</label>
					<div class="col-sm-3">
						 <input name="user.appType" id="searchAppType"
						 placeholder="请输入App类型" type="text" class="form-control" />
					</div>
					<label class="col-sm-1 control-label no-padding-right" contenteditable="false" for="businessName" style="width:60px">手机号</label>
					<div class="col-sm-3">
						<input name="user.phone" id="searchPhone"
						 placeholder="请输入用户的手机号" type="text" class="form-control" />
						 
					</div>
					<button id="searchButton" type="button" class="btn btn-primary btn-lg">
	                 	查询
	           		</button>
					<button type="button" class="btn btn-default btn-lg" 
	             			onclick="return $('#searchForm')[0].reset();">重置
	           		</button>	
					
				</div>
			</div>
		</form>
	</div>
	<!-- 表格 -->
	<div class="row">
		<div class="col-xs-12">
			<table id="grid-table"></table>
			<!-- <div id="grid-pager"></div> -->
		</div>
	</div>
	
	<!-- 提示信息 -->
	<div class="modal fade" id="warning" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="warning_title"></h4>
				</div>
				<div class="modal-body">
					<p id="warning_text"></p>
				</div>
				<div class="modal-footer">
					<button id="cdnCancel" type="button" class="btn btn-default btn-lg"
						data-dismiss="modal" onclick="return true">关闭</button>
				</div>
			</div>
		</div>
	</div>

	<script src="<c:url value='/pages/gridPage.js'/>"></script>
	<script type="text/javascript">
		$('#endTime').datetimepicker({
			format : 'YYYY-MM-DD HH:mm:ss'
		});
		$('#endTime').datetimepicker().next().on(ace.click_event, function() {
			$(this).prev().focus();
		});

		$("#logSearch")
				.click(
						function() {
							var flag = $("#logSearch").attr("flag");
							if (flag == 'show') {
								$("#searchDiv").slideUp();
								$("#logSearch").find("i").removeClass(
										"fa-minus").addClass("fa-plus").end()
										.attr("flag", "hide");
							} else {
								$("#searchDiv").slideDown();
								$("#logSearch").find("i")
										.removeClass("fa-plus").addClass(
												"fa-minus").end().attr("flag",
												"show");
							}
						});
		$("#searchButton").click(function() {
			var appType = $.trim($("#searchAppType").val());
			var phone = $.trim($("#searchPhone").val());
			if(appType == "" | phone == ""){
				$("#warning_title").text("提示");
				$("#warning_text").text("请将查询信息填写完整！");
				$("#warning_text").css("font-size","18px");
				$("#warning").modal("show");
				return;
			}
			
			jQuery("#grid-table").jqGrid('setGridParam', {
				postData : {
					"user.appType" : $("#searchAppType").val(),
					"user.phone" : $("#searchPhone").val(),
				},
				url : "json/getUserInfo.do"
			}).trigger("reloadGrid");
		});

	</script>
</div>
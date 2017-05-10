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
				url:"json/getMsgList.do",
				mtype:"POST",
				datatype: "json",
				height:"100%",
				colNames:["ID","消息类型","消息名称","描述","到期时间","创建时间"],
				colModel:[
						{name:'id',index:'id', width:90, sorttype:"int"},
						{name:'type',index:'type',width:90,sortable:false},
						{name:'name',index:'name',width:140,sortable:false},
						{name:'desc',index:'desc',width:240,sortable:false},
						{name:'expireTime',index:'expireTime',width:90, sortable:false},
						{name:'createTime',index:'createTime',width:90, sortable:false},
				],
				autowidth: true,
				viewrecords : true,
				rowNum:10,
				rowList:[10,20,30],
				pager:"#grid-pager",
				emptyrecords: "Nothing to display",  
				altRows: true,
				jsonReader:{
					total: 'total', 
					records: 'records',
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
		<li class="active"><span>站内信管理</span></li>
	</ul>
</div>
<div class="page-content">
	<!-- 工具栏 -->
	
	<div class="btn-group clearfix">
		<button id="doMainAdd" class="btn btn-sm btn-round"> 
	       	<i class="fa fa-plus bigger-110 orange"></i>
	       	<%-- <fmt:message key="button.search"/> --%>添加
	    </button>
		<button id="doMainDelete" class="btn btn-sm btn-round">
			<i class="ace-icon fa fa-trash-o orange bigger-120"></i>
			<%-- <fmt:message key="button.search"/> --%>删除
		</button>
		<button id="logSearch" flag="hide" class="btn btn-sm btn-round"> 
	       	<b class="ace-icon fa fa-search orange bigger-115"></b>
	       	<%-- <fmt:message key="button.search"/> --%>搜索
	        <span><i class="fa fa-plus orange bigger-110"></i></span>
	    </button>
	</div>
	<div id="searchDiv" class="panel-body" style="display: none;">
		<form class="form-horizontal" id="searchForm" onsubmit="return false;">
			<div class="form-group">
				<div class="col-lg-11 col-sm-11">
					<label class="col-sm-1 control-label no-padding-right" contenteditable="false" for="businessName">消息名称</label>
					<div class="col-sm-3">
						<input name="name" id="searchName"
						 placeholder="按消息名称搜索" type="text" class="form-control" />
					</div>
					<div class="col-sm-8">
						<button id="searchButton" type="button" class="btn btn-primary btn-lg">
	                 		查询
	           			</button>
						<button type="button" class="btn btn-default btn-lg" 
	             			onclick="return $('#searchForm')[0].reset();">重置
	           			</button>	
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- 表格 -->
	<div class="row">
		<div class="col-xs-12">
			<table id="grid-table"></table>
			<div id="grid-pager"></div>
		</div>
	</div>
	
	
	<!-- 添加的dialog -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false"
	   aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" onclick="return $('#addDialog')[0].reset();"
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="myModalLabel">
	            </h4>
	         </div>
	         <div class="modal-body">
	           <form class="form-horizontal" id="addDialog" onsubmit="return false;">
	           
					<div class="form-group"> 
						<div class="col-lg-11 col-sm-11">
							<label class="col-sm-2 control-label no-padding-right" for="apk">消息名称</label>
							<div class="col-sm-10">
								<input id="msgName" name="innerMessage.name" 
								 placeholder="输入您想添加的消息名称" type="text" class="form-control" />	
							</div>
						</div>
					</div>
					<div class="form-group"> 
						<div class="col-lg-11 col-sm-11">
							<label class="col-sm-2 control-label no-padding-right" contenteditable="false" for="tel">消息描述</label>
							<div class="col-sm-10">
								 <textarea id="msgDesc" class="form-control" name="innerMessage.desc" rows="8" cols="20" placeholder="输入此消息的内容描述"></textarea>	
							</div>
						</div>
					</div>
					<div class="form-group"> 
						<div class="col-lg-11 col-sm-11">
							<label class="col-sm-2 control-label no-padding-right" for="tel">到期时间</label>
							<div class="col-sm-10">
								<div class="input-group">
									<input id="endTime" name="innerMessage.expireTime" 
									 placeholder="输入此消息的到期时间" type="text" class="form-control" readonly="readonly"/>
									 <span class="input-group-addon"><i class="fa fa-clock-o bigger-110"></i></span>
								</div>
							</div>
						</div>
					</div>
				</form>
	         </div>
	         <div class="modal-footer">
	            <button id="cdnButton" type="button" class="btn btn-primary btn-lg">
	                 	提交
	            </button>
	            <button id="cdnCancel" type="button" class="btn btn-default btn-lg" 
	               data-dismiss="modal" onclick="return $('#addDialog')[0].reset();">关闭
	            </button>
	         </div>
	      </div>
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
			var name = $.trim($("#searchName").val());
			if(name == ""){
				$("#warning_title").text("提示");
				$("#warning_text").text("请输入消息名称！");
				$("#warning_text").css("font-size","18px");
				$("#warning").modal("show");
				return;
			}
			jQuery("#grid-table").jqGrid('setGridParam', {
				postData : {
					"innerMessage.name" : $("#searchName").val()
				},
				url : "json/getMsgList.do"
			}).trigger("reloadGrid");
		});

		$("#doMainAdd").click(function() {
			$("#myModalLabel").text("添加");
			$("#myModal").modal("show");
		});

		$("#cdnButton").click(function() {
			//先判断输入的内容是否为空及到期时间的正确性
			var name = $.trim($("#msgName").val());
			var desc = $.trim($("#msgDesc").val());
			var expireTime = $("#endTime").val();
			expireTime = expireTime.replace(/-/g, "/");
			var endTime = new Date(expireTime);//到期时间
			var createTime = new Date();//当前时间
			if(name == "" | desc == "" | expireTime == ""){
				$("#warning_title").text("提示");
				$("#warning_text").text("请将添加信息填写完整！");
				$("#warning_text").css("font-size","18px");
				$("#warning").modal("show");
				return;
			}
			if(endTime < createTime){
				$("#warning_title").text("提示");
				$("#warning_text").text("到期时间不能小于当前时间！");
				$("#warning_text").css("font-size","18px");
				$("#warning").modal("show");
				return;
			}
			$.ajax({
				type : "POST",
				url : "json/addInnerMessage.do",
				dataType : "json",
				data : $("#addDialog").serialize(),
				success : function(msg) {
					if (msg.success) {
						alertmsg("success", "保存成功！");
						jQuery("#grid-table").trigger("reloadGrid");
					} else {
						alertmsg("failure", "保存失败！");
					}
				}
			});
			$("#cdnCancel").click();
			$("#addDialog")[0].reset();
		});

		$("#doMainDelete").click(
				function() {
					var selectedIds = jQuery("#grid-table").jqGrid(
							"getGridParam", "selarrrow");//选择多行记录
					if (selectedIds == null || selectedIds.length == 0) {
						alertmsg("warning", "请至少选中一行！");
						return;
					}
					Lobibox.confirm({
						title : "提示",
						msg : "确定删除？",
						callback : function($this, type, eve) {
							if (type == "yes") {
								var data = {
									ids : selectedIds.join(",")
								};
								$.post("json/delInnerMessage.do", data,
										function(msg) {
											if (msg.success) {
												alertmsg("success", "删除成功！");
												jQuery("#grid-table").jqGrid(
														'setGridParam', {
															page : 1
														})
														.trigger("reloadGrid");
											} else {
												alertmsg("failure", "删除失败！");
											}
										});
							} else {
								jQuery("#grid-table").jqGrid('resetSelection');
							}
						}
					});
				});
	</script>
</div>
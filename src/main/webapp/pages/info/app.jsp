<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<link rel="stylesheet" href="<c:url value='/assets/css/datepicker.css'/>" />
<link rel="stylesheet" href="<c:url value='/assets/css/bootstrap-datetimepicker.css'/>" />
<div class="breadcrumbs" id="breadcrumbs">


    <%--检查该容器是否固定--%>
	<script type="text/javascript">
		try {

			ace.settings.check('breadcrumbs', 'fixed')
		} catch (e) {
		}


		/*表格数据请求*/
		jQuery(function($) {





			jQuery("#grid-table").jqGrid({
				url:"json/app",
				mtype:"GET",
				datatype: "json",
				height:"100%",
				colNames:["ID","应用名字","创建时间","应用版本","标签","AppId","AppKey","AasterSecret"],
				colModel:[
						{name:'id',index:'id', width:90, sorttype:"int"},
						{name:'appName',index:'appName',width:90,sortable:false},
						{name:'createTime',index:'createTime',width:90, sortable:false},
						{name:'appType',index:'appType',width:90,sortable:false},
						{name:'type',index:'type',width:90,sortable:false},
						{name:'appId',index:'appId',width:90, sortable:false},
						{name:'appKey',index:'appKey',width:120, sortable:false},
						{name:'masterSecret',index:'masterSecret',width:120, sortable:false},
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
		<li class="active"><span>App管理</span></li>
	</ul>
</div>




<!-- 工具栏 -->
<div class="page-content">

	
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


    <%-- 查询--%>
	<div id="searchDiv" class="panel-body" style="display: none;">
		<form class="form-horizontal" id="searchForm" onsubmit="return false;">
			<div class="form-group">
				<div class="col-lg-11 col-sm-11">
					<label class="col-sm-1 control-label no-padding-right" contenteditable="false" for="appName">App名称</label>
					<div class="col-sm-3">
						<input name="appName" id="searchAppName"
						 placeholder="按App名称搜索" type="text" class="form-control" />
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
							<label class="col-sm-2 control-label no-padding-right" contenteditable="false" for="appName">App名称</label>
							<div class="col-sm-10">
								<input id="appName_add" name="app.appName" 
								 placeholder="输入您想添加的App名称" type="text" class="form-control" />	
							</div>
						</div>
					</div>
					<div class="form-group"> 
						<div class="col-lg-11 col-sm-11">
							<label class="col-sm-2 control-label no-padding-right" contenteditable="false" for="appType">App版本</label>
							<div class="col-sm-10">
								<input id="appType_add" name="app.appType" 
								 placeholder="输入此App的版本" type="text" class="form-control" />	
							</div>
						</div>
					</div>
					<div class="form-group"> 
						<div class="col-lg-11 col-sm-11">
							<label class="col-sm-2 control-label no-padding-right" contenteditable="false" for="type">Type</label>
							<div class="col-sm-10">
								<input id="type_add" name="app.type" 
								 placeholder="输入此App的标签" type="text" class="form-control" />	
							</div>
						</div>
					</div>
					<div class="form-group"> 
						<div class="col-lg-11 col-sm-11">
							<label class="col-sm-2 control-label no-padding-right" contenteditable="false" for="appId">AppId</label>
							<div class="col-sm-10">
								<input id="appId_add" name="app.appId" 
								 placeholder="输入此App的Id" type="text" class="form-control" />	
							</div>
						</div>
					</div>
					<div class="form-group"> 
						<div class="col-lg-11 col-sm-11">
							<label class="col-sm-2 control-label no-padding-right" contenteditable="false" for="appKey">AppKey</label>
							<div class="col-sm-10">
								<input id="appKey_add" name="app.appKey" 
								 placeholder="输入此App的Key" type="text" class="form-control" />	
							</div>
						</div>
					</div>
					<div class="form-group"> 
						<div class="col-lg-11 col-sm-11">
							<label class="col-sm-2 control-label no-padding-right" contenteditable="false" for="masterSecret">MasterSecret</label>
							<div class="col-sm-10">
								<input id="masterSecret_add" name="app.masterSecret" 
								 placeholder="输入此App的MasterSecret" type="text" class="form-control" />	
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
	
	<!-- 修改的dialog -->	
	<div class="modal fade" id="myUpdate" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false"
		   aria-labelledby="myUpdateLabel" aria-hidden="true">
		   <div class="modal-dialog">
		  <div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close"
							onclick="return $('#updateDialog')[0].reset();" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myUpdateLabe_update"></h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="updateDialog"
							onsubmit="return false;">
							<div class="form-group">
								<div class="col-lg-11 col-sm-11">
									<label class="col-sm-2 control-label no-padding-right"
										contenteditable="true" for="serviceNumber"></label>
									<div class="col-sm-10">
										<input id="id_update" name="app.id"
											placeholder="" type="hidden" class="form-control" />								
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-11 col-sm-11">
									<label class="col-sm-2 control-label no-padding-right"
										contenteditable="false" for="serviceNumber">应用名字</label>
									<div class="col-sm-10">
										<input id="appName_update" name="app.appName"
											placeholder="" type="text" class="form-control" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-11 col-sm-11">
									<label class="col-sm-2 control-label no-padding-right"
										contenteditable="false" for="serviceNumber">应用版本</label>
									<div class="col-sm-10">
										<input id="appType_update" name="app.appType"
											placeholder="" type="text" class="form-control" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-11 col-sm-11">
									<label class="col-sm-2 control-label no-padding-right"
										contenteditable="false" for="serviceNumber">标签</label>
									<div class="col-sm-10">
										<input id="type_update" name="app.type"
											placeholder="" type="text" class="form-control" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-11 col-sm-11">
									<label class="col-sm-2 control-label no-padding-right"
										contenteditable="false" for="serviceNumber">AppId</label>
									<div class="col-sm-10">
										<input id="appId_update" name="app.appId"
											placeholder="" type="text" class="form-control" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-11 col-sm-11">
									<label class="col-sm-2 control-label no-padding-right"
										contenteditable="false" for="serviceNumber">AppKey</label>
									<div class="col-sm-10">
										<input id="appKey_update" name="app.appKey"
											placeholder="" type="text" class="form-control" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-11 col-sm-11">
									<label class="col-sm-2 control-label no-padding-right"
										contenteditable="false" for="serviceNumber">MasterSecret</label>
									<div class="col-sm-10">
										<input id="masterSecret_update" name="app.masterSecret"
											placeholder="" type="text" class="form-control" />
									</div>
								</div>
							</div>
							
						</form>
						<div class="modal-footer">
							<button id="updButton" type="button"
								class="btn btn-primary btn-lg">提交</button>
							<button id="updCancel" type="button"
								class="btn btn-default btn-lg" data-dismiss="modal"
								onclick="return $('#updateDialog')[0].reset();">关闭</button>
						</div>
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
		            <h4 class="modal-title" id="warning_title">
		            </h4>
		         </div>
		         <div class="modal-body">
		           <p id="warning_text"></p>
		         </div>
		         <div class="modal-footer">
		            <button id="cdnCancel" type="button" class="btn btn-default btn-lg" 
		               data-dismiss="modal" onclick="return true">关闭
		            </button>
		         </div>
		      </div>
			</div>
		</div>
		
		<script src="<c:url value='/pages/gridPage.js'/>"></script>
		<script type="text/javascript">
			$("#logSearch").click(function(){
				var flag=$("#logSearch").attr("flag");
		      	 if(flag=='show'){
		      		 $("#searchDiv").slideUp();
			         $("#logSearch").find("i").removeClass("fa-minus").addClass("fa-plus").end().attr("flag","hide");
		      	 }else{
		      		 $("#searchDiv").slideDown();
			         $("#logSearch").find("i").removeClass("fa-plus").addClass("fa-minus").end().attr("flag","show");
		      	 } 
			});
			$("#searchButton").click(function(){
				var appName = $.trim($("#searchAppName").val());
				if(appName == ""){
					$("#warning_title").text("提示");
					$("#warning_text").text("请输入App名称！");
					$("#warning_text").css("font-size","18px");
					$("#warning").modal("show");Name
					return;
				}
				jQuery("#grid-table").jqGrid('setGridParam',{postData:{"app.appName":$("#searchAppName").val()}, url:"json/searchByAppName"}).trigger("reloadGrid");
			});
			
			
			
			$("#doMainAdd").click(function(){
				$("#myModalLabel").text("添加");
				$("#myModal").modal("show");
			});
			$("#cdnButton").click(function(){
				//校验添加数据是否有空
				var appName = $.trim($("#appName_add").val());
				var appType = $.trim($("#appType_add").val());
				var type = $.trim($("#type_add").val());
				var appId = $.trim($("#appId_add").val());
				var appKey = $.trim($("#appKey_add").val());
				var masterSecret = $.trim($("#masterSecret_add").val());
				//信息不完整出现提示框
				if(appName == "" | appType == "" | type == "" | appId == "" | appKey == "" | masterSecret == ""){
					$("#warning_title").text("提示");
					$("#warning_text").text("请将添加信息填写完整！");
					$("#warning_text").css("font-size","18px");
					$("#warning").modal("show");
					return;
				}
				$.ajax({
					type:"POST",
					url:"json/addApp.do",
					dataType:"json",
					data:$("#addDialog").serialize(),
					success:function(msg){

						if(msg.success){
							alertmsg("success","保存成功！");
							jQuery("#grid-table").trigger("reloadGrid");
						}else{
							alertmsg("failure","保存失败！");
						}
					}
				});
				$("#cdnCancel").click();
				$("#addDialog")[0].reset();
			});
			
			
			$("#updButton").click(function(){
				//校验修改数据是否有空
				var appName = $.trim($("#appName_update").val());
				var appType = $.trim($("#appType_update").val());
				var type = $.trim($("#type_update").val());
				var appId = $.trim($("#appId_update").val());
				var appKey = $.trim($("#appKey_update").val());
				var masterSecret = $.trim($("#masterSecret_update").val());
				if(appName == "" | appType == "" | type == "" | appId == "" | appKey == "" | masterSecret == ""){
					$("#warning_title").text("提示");
					$("#warning_text").text("请将修改信息填写完整！");
					$("#warning_text").css("font-size","18px");
					$("#warning").modal("show");
					return;
				}
				$.ajax({
					type:"POST",
					url:"json/updateApp",
					dataType:"json",
					data:$("#updateDialog").serialize(),
					success:function(msg){

						if(msg.success){
							alertmsg("success","修改成功！");
							jQuery("#grid-table").trigger("reloadGrid");
						}else{
							alertmsg("failure","修改失败！");
						}
					}
				});
				$("#updCancel").click();
				$("#updateDialog")[0].reset();
			});
			
			
			$("#doMainDelete").click(function(){
				var selectedIds = jQuery("#grid-table").jqGrid("getGridParam", "selarrrow");//选择多行记录
				if(selectedIds == null || selectedIds.length == 0){
					alertmsg("warning","请至少选中一行！");
					return;
				}
				Lobibox.confirm({
					title: "提示",
					msg: "确定删除？",
					callback: function ($this, type, eve) {
						if(type == "yes"){
							var data = {ids: selectedIds.join(",")};
							$.post("json/delApp",data,function(msg){
									if(msg.success){
										alertmsg("success","删除成功！");
										jQuery("#grid-table").jqGrid('setGridParam',{page:1}).trigger("reloadGrid");
									}else{
										alertmsg("failure","删除失败！");
									}
							});
						}else{
							jQuery("#grid-table").jqGrid('resetSelection');
						}			
					}
				});	 
			});
			
			$("#grid-table").dblclick(function(){
				var selectedIds = jQuery("#grid-table").jqGrid(
						"getGridParam", "selarrrow");
				var model = jQuery("#grid-table").jqGrid(
						"getRowData", selectedIds);
				$("#id_update").val(model.id);
				$("#appName_update").val(model.appName);
				$("#appType_update").val(model.appType);
				$("#type_update").val(model.type);
				$("#appId_update").val(model.appId);
				$("#appKey_update").val(model.appKey);
				$("#masterSecret_update").val(model.masterSecret);
				$("#myUpdateLabe_update").text("修改App信息");
				$("#myUpdate").modal("show");
			});
			
		</script>
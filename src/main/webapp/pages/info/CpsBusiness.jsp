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
				url:"json/cpsBusinessList.do",
				mtype:"POST",
				datatype: "json",
				height:"100%",
				colNames:["ID","业务名称","APK包","联系电话","创建时间","状态","驳回意见"],
				colModel:[
						{name:'id',index:'id', width:90, sorttype:"int"/*, hidden:true*/},
						{name:'businessName',index:'businessName',width:90,sortable:false},
						{name:'apk',index:'apk',width:140,sortable:false},
						{name:'tel',index:'tel',width:140,sortable:false},
						{name:'createTime',index:'createTime',width:90, sortable:false},
						{name:'status',index:'status',width:90, sortable:false,formatter:'select',editoptions:{value:'0:创建中;1:待审核;2:被驳回;3:已通过'}
							},
						{name:'opinion',index:'opinion',width:90, sortable:false},
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
		<li class="active"><span>业务管理</span></li>
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
	    <button id="doMainUpdate" class="btn btn-sm btn-round">
			<i class="fa fa-edit orange bigger-120"></i>
			<%-- <fmt:message key="button.search"/> --%>修改
		</button> 
		 <button id="doMainCheck" class="btn btn-sm btn-round">
			<i class="ace-icon fa fa-check orange bigger-120"></i>
			<%-- <fmt:message key="button.search"/> --%>提交审核
		</button>
	</div>
	<div id="searchDiv" class="panel-body" style="display: none;">
		<form class="form-horizontal" id="searchForm" onsubmit="return false;">
			<div class="form-group">
				<div class="col-lg-11 col-sm-11">
					<label class="col-sm-1 control-label no-padding-right" contenteditable="true" for="businessName">业务名称</label>
					<div class="col-sm-3">
						<input name="businessName" id="searchbusinessName"
						 placeholder="按业务名称搜索" type="text" class="form-control" />
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
							<label class="col-sm-2 control-label no-padding-right" contenteditable="true" for="businessName">业务名称</label>
							<div class="col-sm-10">
								<input id="businessName" name="cpsBusiness.businessName" 
								 placeholder="输入您想添加的业务名称" type="text" class="form-control" />	
							</div>
						</div>
					</div>
					<div class="form-group"> 
						<div class="col-lg-11 col-sm-11">
							<label class="col-sm-2 control-label no-padding-right" contenteditable="true" for="apk">APK包</label>
							<div class="col-sm-10">
								<input id="apk" name="cpsBusiness.apk" 
								 placeholder="输入您想添加的APK包" type="text" class="form-control" />	
							</div>
						</div>
					</div>
					<div class="form-group"> 
						<div class="col-lg-11 col-sm-11">
							<label class="col-sm-2 control-label no-padding-right" contenteditable="true" for="tel">联系电话</label>
							<div class="col-sm-10">
								<input id="tel" name="cpsBusiness.tel" 
								 placeholder="输入此业务的联系电话" type="text" class="form-control" />	
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
						<h4 class="modal-title" id="myUpdateLabel"></h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="updateDialog"
							onsubmit="return false;">
							<div class="form-group">
								<div class="col-lg-11 col-sm-11">
									<label class="col-sm-2 control-label no-padding-right"
										contenteditable="true" for="serviceNumber"></label>
									<div class="col-sm-10">
										<input   id="cpsId" name="cpsBusiness.id"
											placeholder="ID" type="hidden" class="form-control" />								
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-11 col-sm-11">
									<label class="col-sm-2 control-label no-padding-right"
										contenteditable="true" for="serviceNumber">业务名称</label>
									<div class="col-sm-10">
										<input id="cpsBusinessName" name="cpsBusiness.businessName"
											placeholder="请输入业务名称" type="text" class="form-control" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-11 col-sm-11">
									<label class="col-sm-2 control-label no-padding-right"
										contenteditable="true" for="serviceNumber">APK包</label>
									<div class="col-sm-10">
										<input id="cpsApk" name="cpsBusiness.apk"
											placeholder="APK包" type="text" class="form-control" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-11 col-sm-11">
									<label class="col-sm-2 control-label no-padding-right"
										contenteditable="true" for="serviceNumber">联系电话</label>
									<div class="col-sm-10">
										<input id="cpsTel" name="cpsBusiness.tel"
											placeholder="联系电话" type="text" class="form-control" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-11 col-sm-11">
									<label class="col-sm-2 control-label no-padding-right"
										contenteditable="true" for="serviceNumber"></label>
									<div class="col-sm-10">
										<input   id="cpsCreateTime" name="cpsBusiness.createTime"
											placeholder="创建时间" type="hidden" class="form-control" />								
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-11 col-sm-11">
									<label class="col-sm-2 control-label no-padding-right"
										contenteditable="true" for="serviceNumber">状态</label>
									<div class="col-sm-10">
										<input   id="cpsStatus" name="cpsBusiness.status"
											placeholder="状态" type="hidden" class="form-control" />								
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-11 col-sm-11">
									<label class="col-sm-2 control-label no-padding-right"
										contenteditable="true" for="serviceNumber"></label>
									<div class="col-sm-10">
										<input   id="cpsOpinion" name="cpsBusiness.opinion"
											placeholder="驳回意见" type="text"  class="form-control" readonly="readonly" />								
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
				jQuery("#grid-table").jqGrid('setGridParam',{postData:{"businessName":$("#searchbusinessName").val()}}).trigger("reloadGrid");
			});
			
			
			
			$("#doMainAdd").click(function(){
				$("#myModalLabel").text("添加");
				$("#myModal").modal("show");
			});
			$("#cdnButton").click(function(){
				$.ajax({
					type:"POST",
					url:"json/editBusiness.do",
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
			
			
			$("#doMainUpdate").click(function() { 
				var selectedIds = jQuery("#grid-table").jqGrid(
						"getGridParam", "selarrrow");
				if (selectedIds == null || selectedIds.length == 0||selectedIds.length>1) {
					alertmsg("warning", "请选中一行并且只能选中一行");
					return;
				}
				var model = jQuery("#grid-table").jqGrid(
						"getRowData", selectedIds);
				
				 if("3"==(model.status)){
					alertmsg("warning", "审核通过的业务无法修改");
					return;
				} 
				$("#cpsId").val(model.id);
				$("#cpsCreateTime").val(model.createTime);
				$("#cpsApk").val(model.apk);
				$("#cpsBusinessName").val(model.businessName);
				$("#cpsTel").val(model.tel);
				$("#cpsStatus").val(model.status);
				$("#cpsOpinion").val(model.opinion);
				$("#myUpdateLabel").text("修改业务信息");
				$("#myUpdate").modal("show");
			});
			
			$("#updButton").click(function(){
				$.ajax({
					type:"POST",
					url:"json/editBusiness.do",
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
				}else{
					for(var i=0;i<selectedIds.length;i++){
						var model = jQuery("#grid-table").jqGrid(
								"getRowData", selectedIds[i]);
						if(model.status==1||model.status==3){
							alertmsg("warning","审核通过和待审核的业务不允许删除！");
							return;
						}
					}
				}
				Lobibox.confirm({
					title: "提示",
					msg: "确定删除？",
					callback: function ($this, type, eve) {
						if(type == "yes"){
							var data = {ids: selectedIds.join(",")};
							$.post("json/deleteBusiness.do",data,function(msg){
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
			
			$("#doMainCheck").click(function(){
				var selectedIds = jQuery("#grid-table").jqGrid("getGridParam", "selarrrow");//选择多行记录
				if(selectedIds == null || selectedIds.length == 0){
					alertmsg("warning","请至少选中一行！");
					return;
				}	
				Lobibox.confirm({
					title: "提示",
					msg: "确定提交审核？",
					callback: function ($this, type, eve) {
						if(type == "yes"){
							var data = {ids: selectedIds.join(",")};
							$.post("json/checkBusiness.do",data,function(msg){
									if(msg.success){
										alertmsg("success","提交成功！");
										jQuery("#grid-table").jqGrid('setGridParam',{page:1}).trigger("reloadGrid");
									}else{
										alertmsg("failure","提交失败！");
									}
							});
						}else{
							jQuery("#grid-table").jqGrid('resetSelection');
						}			
					}
				});	 
			});			 	
		</script>
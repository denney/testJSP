<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"  lang="zh">
	<head>
        <title><fmt:message key="webapp.name"/></title>
        <link href="<c:url value='/assets/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css"  />
        <link href="<c:url value='/assets/bootstrap/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css"  />
   	    <link href="<c:url value='/assets/beyond/css/beyond.min.css'/>" rel="stylesheet" type="text/css" />
        <script  type="text/javascript" src="<c:url value='/assets/beyond/js/skins.min.js'/>"></script>
        <script  type="text/javascript" src="<c:url value='/assets/jquery/jquery.min.js'/>"></script>
        <script  type="text/javascript" src="<c:url value='/assets/jquery/slimscroll/jquery.slimscroll.min.js'/>"></script>
        <script  type="text/javascript" src="<c:url value='/assets/bootstrap/js/bootstrap.min.js'/>"></script>
        <style type="text/css"   media="all" >@import url("<c:url value='/assets/fileinput/css/fileinput.css'/>");</style>
    </head>
    <body>
        <jsp:include page="/pages/head.jsp" />
           <div class="main-container container-fluid">
		        <div class="page-container">
		            <jsp:include page="/pages/left.jsp" >
						<jsp:param value="page LastPage" name="curNav"/>
				    </jsp:include>
			        <div class="container kv-main">
			            <form enctype="multipart/form-data">
			                <input id="file-0a" class="file" type="file"  name="upLoadFile" multiple data-min-file-count="1">
			                <br>
			            </form>
			        </div>
		        </div>
        </div>
    </body>
    <script  type="text/javascript" src="<c:url value='/assets/beyond/js/beyond.min.js'/>"></script> 
    <script  type="text/javascript" src="<c:url value='/assets/fileinput/fileinput.min.js'/>"></script>
    <script  type="text/javascript" src="<c:url value='/assets/fileinput/fileinput_locale_zh.js'/>"></script>
	<script type="text/javascript">
	    $("#file-0a").fileinput({
	    	uploadUrl: "<c:url value='/json/ipUpload.do'/> ",
	        allowedFileExtensions : ['zip'],
	        overwriteInitial: false,
	        maxFileSize: 5000,
	        maxFilesNum: 1,
	        language:'zh',
	        slugCallback: function(filename) {
	            return filename.replace('(', '_').replace(']', '_');
	        }
		}).on('fileuploaded',function(event, data,id, index){
			if(data.response.success){
				$('#modalWarnPrompt').modal('show');
        	 	$("#modalWarnPromptDiv").html(data.response.message);
			}
		});
	</script>
</html>
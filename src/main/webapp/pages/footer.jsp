<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp" %>
  <div class="footer">
		<div class="footer-inner">
			<!-- #section:basics/footer -->
			<div class="footer-content">
				<span>
					<!-- <span class="blue bolder">Wondertek</span> -->
					Wondertek Version 1.0 &copy; 2015-2016
				</span>
			</div>
			<div  class="lang-box" id="lang-box">
				<button type="button" class="btn btn-sm lang-cn">简</button>
				<button type="button" class="btn btn-sm lang-ch" style="display: none;">繁</button>
				<button type="button" class="btn btn-sm lang-en" style="display: none;">英</button>			
			</div>
			<script>
				$("#lang-box").find("button:visible").click(function() {
					$(this).siblings().toggle();				
				});
			</script>
			<!-- /section:basics/footer -->
		</div>
	</div>

	<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
		<i class="ace-icon fa fa-angle-double-up icon-only bigger-110 white"></i>
	</a>

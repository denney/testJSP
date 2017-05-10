$(document).ready(function(){
	$.ajaxSetup ({
    	cache: false //关闭AJAX相应的缓存
    });
	$('#left_menu a').each(function(n, v) {
		var url = $(v).attr("menu-url");
		if(url) {
			$(v).unbind('click').click(function(e) {
				openPage($(this).attr("menu-url"));
				
				$('#left_menu .active').each(function(nn, vv) {
					 $(vv).removeClass("active");
				});
				$(this).parents("li").each(function(nn, vv) {
					 $(vv).addClass("active");
				});
			});
		}
	});
});
function openPage(url) {
	var p = $("#main_page");
	if(p.length > 0) {
		p.load(url, function(response,status,xhr){
			if(status != "success") {
				console.log("load page error.");
			}
		});
	}
}
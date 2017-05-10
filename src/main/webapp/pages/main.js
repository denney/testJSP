$(document).ready(function(){

	var ret =initmyindex();
	//initchar(ret);
	$('.widget-body').hover(function(){
		$(this).css('overflow','auto');
	},function(){
        $(this).css('overflow','hidden');
	})
});
//显示提示信息方法
function alertmsg(type, msg){
	$("#alertButton").manhua_msgTips({
		Event : "click",	//响应的事件
		timeOut : 1000,		//提示层显示的时间
		msg : msg,			//显示的消息
		speed : 500,		//滑动速度
		type : type			//提示类型（1、success 2、error 3、warning）

	});
	$("#alertButton").click();
}

//初始化我的首页
function initmyindex(){
	//alert("initIndex");
	var d =$("#main_page").find("div [data-value]");
	d.attr("style","display:none;");
	var retdata ="";
	$.ajax({
		type: "post",
		async: false, //控制同步
		//url: __webroot__+"other/initmyindex.htm",
		dataType: "json",
		cache: false,
		success: function(data) {
			if(data.index!=null && ""!=data.index ){
				initIndexchebox(data.index);
				retdata = data.index.mamSelf;
			}else{
				initIndexchebox("");
			}
			if(data.myapp!=null && ""!=data.myapp){
				initmyappchebox(data.myapp);
			}else{
				initmyappchebox("");
			}
			if(data.mywork!=null && ""!=data.mywork){
				initmyworkchebox(data.mywork);
			}else{
				initmyworkchebox("");
			}

			//openAlert('提示',data.msg);
			//alert(data.msg);
			//$("#grid-table-period").jqGrid().trigger('reloadGrid');//刷新最顶层grid
		},
		Error: function(err) {
			alert("delete error");
		}
	});
	return retdata;
}
function curentTime(){ //默认当时时间，格式为：2016-3-7 11:11:00
    var now = new Date();
    var year = now.getFullYear();       //年
    var month = now.getMonth() + 1;     //月
    var day = now.getDate();            //日
    var hh = now.getHours();            //时
    var mm = now.getMinutes();          //分
    var clock = year + "-";
    if(month < 10)
        clock += "0";
    clock += month + "-";
    if(day < 10)
        clock += "0";
    clock += day;
    return(clock); 
}
function monthTime(){ //默认当时时间，格式为：2016-3-7 11:11:00
    var now = new Date();
    var year = now.getFullYear();       //年
    var month = now.getMonth() + 1;     //月
    var clock = year + "-";
    if(month < 10)
        clock += "0";
    clock += month;
    return(clock); 
}

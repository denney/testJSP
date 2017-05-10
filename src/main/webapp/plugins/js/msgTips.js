$(function() {
	$.fn.manhua_msgTips = function(options) {
		var defaults = {
			Event : "click",			
			timeOut : 500,		//下滑时间		
			msg : "��Ϣ��ʾ - www.sucaijiayuan.com",			
			speed : 300,		//下滑速度		
			type : "success"	//警告类型  （1、success 2、error 3、warning）		
		};
		var options = $.extend(defaults,options);
		var bid = parseInt(Math.random()*100000);
		$("body").prepend('<div id="tip_container'+bid+'" class="container tip_container"><div id="tip'+bid+'" class="mtip"><i class="micon"></i><span id="tsc'+bid+'"></span><i id="mclose'+bid+'" class="mclose"></i></div></div>');
		var $this = $(this);
		var $tip_container = $("#tip_container"+bid)
		var $tip = $("#tip"+bid);
		var $tipSpan = $("#tsc"+bid);
		var $colse = $("#mclose"+bid);		
		//�������ʱ��
		clearTimeout(window.timer);
		
		//����Ԫ�ذ��¼�
		$this.unbind().bind(options.Event,function(){
			$tip.attr("class", options.type).addClass("mtip");	
			$tipSpan.html(options.msg);			
			$tip_container.slideDown(options.speed);
			//��ʾ�����ض�ʱ��
			window.timer = setTimeout(function (){
				$tip_container.slideUp(options.speed);
			}, options.timeOut);
		
		});	
		//����Ƶ���ʾ��ʱ���ʱ��
		$tip_container.bind("mouseover",function() {
			clearTimeout(window.timer);
		});
		
		//����Ƴ���ʾ��ʱ������ʱ��
		$tip_container.bind("mouseout",function() {
			window.timer = setTimeout(function (){
				$tip_container.slideUp(options.speed);
			}, options.timeOut);
		});
	
		//�رհ�ť���¼�
		$colse.bind("click",function() {
			$tip_container.slideUp(options.speed);
		});
	}
});
/*www.sucaijiayuan.com*/
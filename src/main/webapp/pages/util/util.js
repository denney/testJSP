//获取表单数据
var getParams = function(selector) {
	var data = {};
	$("input",selector).each(function() {
		var name = $(this).attr("name");
		if(name) {
			data[name] = $(this).val();
		}
	});
	$("select",selector).each(function() {
		var name = $(this).attr("name");
		if(name) {
			data[name] = ($(this).val()||'').toString();
		}
	});
	$("textArea",selector).each(function() {
		var name = $(this).attr("name");
		if(name) {
			data[name] = $(this).val().replace(/\n/g,"");
		}
	});
	console.log(data);
	return data;
};

var getValuesByAttr = function(selector, attr) {
	var data = [];
	$("input",selector).each(function() {
		var val = $(this).attr(attr);
		if(val && val != '') {
			data.push(val);
		}
	});
	$("select",selector).each(function() {
		var val = $(this).attr(attr);
		if(val && val != '') {
			data.push(val);
		}
	});
	$("textArea",selector).each(function() {
		var val = $(this).attr(attr);
		if(val && val != '') {
			data.push(val);
		}
	});
	console.log(data);
	return (data||'').toString();;
};

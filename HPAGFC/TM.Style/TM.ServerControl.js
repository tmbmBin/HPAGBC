$(function () {
	bind_datepicker(false);
	bind_decimaltextbox();

	var $datepickers = $.find("input[type=text][datepicker=datepicker]");
	$($datepickers).each(function () {
		$(this).attr("title", "請輸入日期或使用日期選擇器選擇，手動輸入日期時，格式為 101/12/31");
	});
});

function bind_datepicker(isReadonly) {
	/// <summary>設定需要使用日期選擇欄位的控制項。</summary>
	var objs = $.find("input[type=text][datepicker=datepicker]");
	if (objs.length == 0) return;
	$(objs).datepicker().attr("readonly", isReadonly).unbind("focus").dblclick(function () {
		$(this).datepicker('show');
	}).siblings("img.datepicker-caller").click(function () {
		var $ctrl = $(this).siblings("input.hasDatepicker");
		if (!$ctrl.attr("disabled")) $ctrl.datepicker('show');
	});
}

function bind_decimaltextbox() {

	function formatCurrency(num) {
		num = num.toString().replace(/\$|\,/g, '');
		if (isNaN(num))
			num = "0";
		sign = (num == (num = Math.abs(num)));
		num = Math.floor(num * 100 + 0.50000000001);
		num = Math.floor(num / 100).toString();
		for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
			num = num.substring(0, num.length - (4 * i + 3)) + ',' + num.substring(num.length - (4 * i + 3));
		return (((sign) ? '' : '-') + num);
	}

	function on_decimaltextbox_blur() {
		var $s = $(this);
		if ($s.val().length == 0) return;
		var point = parseInt($s.attr("DecimalPoint"));
		var val = !isNaN($s.val().replace(/,/g, '')) ? parseFloat($s.val().replace(/,/g, '')) : 0;
		var s = val.toString().split(".");
		var s1;
		if (s.length == 2) {
			s1 = parseFloat("0." + s[1]);
			s1 = Math.round(s1 * Math.pow(10, point)) / Math.pow(10, point);
			if (s1 >= 1.0) {
				val = val + 1;
				if (s1.length > 2) s1 = "." + s1.substring(2);
				else s1 = "";
			} else s1 = s1.leng > 2 ? s1.substring(2).length > 0 ? "." + s1.substring(2) : "" : "";
		} else s1 = "";
		var num = new Number(val);
		$s.val(formatCurrency(num) + s1);
	}
	function on_decimaltextbox_focus() {
		var $s = $(this);
		if ($($s).val().length == 0) return;
		var val = !isNaN($s.val().replace(/,/g, '')) ? parseFloat($s.val().replace(/,/g, '')) : 0;
		$s.val(val).select();
	}

	$("input.DecimalBox").blur(on_decimaltextbox_blur).focus(on_decimaltextbox_focus);
	$("input.DecimalBox").each(on_decimaltextbox_blur);
}
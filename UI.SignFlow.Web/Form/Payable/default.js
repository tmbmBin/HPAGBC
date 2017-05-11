$(function () {
	var dis = $.jget["dis"];
	var ShowButton = $("#ShowButton").val();
	if (ShowButton == "1") {
		//僅顯示取回按鈕
		$(".menubar #td2").remove();
		$(".gridstyle [id$=pay]").hide();
	} else {
		if (dis != "1") {
			$(".gridstyle [id$=back]").hide();
		}
	}
});
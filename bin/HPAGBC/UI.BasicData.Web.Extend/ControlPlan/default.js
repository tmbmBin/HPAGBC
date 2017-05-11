$(function () {
	$(".gridstyle [id$=chkFlag]").click(function () {
		$(".gridstyle [id$=chkFlag]").parent().parent().removeClass("checked");
		$(".gridstyle [id$=chkFlag]:checked").parent().parent().addClass("checked");
	});
	$(".gridstyle [id$=chkFlag]:checked").parent().parent().addClass("checked");
});
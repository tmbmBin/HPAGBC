$(function () {
	$(".status-view").click(function () {
		var $this = $(this);
		$(".gridstyle tr.current").removeClass("current");
		$this.parent().parent().addClass("current");
		var fid = $(this).siblings("[id$=FID]").val();
		var k = $(this).siblings("[id$=PK]").val();
		showLogForm(fid, k);
		return false;
	});
});

function showLogForm(fid, k) {
	$("#logfrm").attr("src", "LogViewer.aspx?FID=" + fid + "&PK=" + k);
	$("#logform").dialog({
		title: '',
		show: 'fade', //特效參考：http://jqueryui.com/demos/effect/
		bgiframe: true, width: 600, height: 400,
		modal: true, draggable: true, resizable: false,
		overlay: { opacity: 0.3, background: "#FF8899" },
		buttons: [{ text: '關閉', click: function () {
			$(this).dialog('close');
		}
		}]
	});
}
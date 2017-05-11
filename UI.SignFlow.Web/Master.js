$(function () {
	$(".status-view").click(function () {
		var $this = $(this);
		$(".gridstyle tr.current").removeClass("current");
		$this.parent().parent().addClass("current");
		var fid = $(this).siblings("[id$=FID]").val();
		var k = $(this).siblings("[id$=PK]").val();
		showRecForm(fid, k);
		return false;
	});
});

function showRecForm(fid, k) {
	$("#logfrm").attr("src", "../iSignForm/?FID=" + fid + "&PK=" + k);
	$("#logform").dialog({
		title: '線上簽核資訊',
		show: 'fade', //特效參考：http://jqueryui.com/demos/effect/
		bgiframe: true, width: 600, height: 400,
		modal: true, draggable: true, resizable: false,
		overlay: { opacity: 0.3, background: "#FF8899" },
		buttons: [
		{ text: '歷程簽核資訊', click: function () {
			$(this).dialog("option", "title", '歷程簽核資訊');
			$("#logfrm").attr("src", "../LogPrint/LogViewer.aspx?FID=" + fid + "&PK=" + k);
		}
		},
{ text: '線上簽核資訊', click: function () {
	$(this).dialog("option", "title", '線上簽核資訊');
	$("#logfrm").attr("src", "../iSignForm/?FID=" + fid + "&PK=" + k);
}
},
		{ text: '關閉', click: function () { $(this).dialog('close'); } }

]
	});
}
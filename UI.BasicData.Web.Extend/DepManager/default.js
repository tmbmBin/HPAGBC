var dpt;
$(function () {
	$(".change").click(function () {
		showOption($(this)); return false;
	});
	$(".remove").click(function () {
		if (confirm("確認移除該部門主管設定?")) {
			dpt = $(this).parent().siblings(".content1").find("input[id$=code]").val();
			remove();
		}
		return false;
	});

	$(".opt input[type=radio]").click(function () {
		$(".opt label[for]").removeClass("current");
		$(".opt label[for="+$(this).attr("id") + "]").addClass("current");
	});

	$(".opt label[for]").click(function () {
		var forid = $(this).attr("for");
		$("#" + forid).trigger("click");
	});

	$(".opt input[type=radio]").dblclick(function () {
		update();
	});

	$(".opt label[for]").dblclick(function () {
		var forid = $(this).attr("for");
		$("#" + forid).trigger("dblclick");
	});
});

function showOption(e) {
	$(".opt label[for]").removeClass("current");
	var title = $(e).parent().siblings(".content1").text();
	title = "請選擇" + $.trim(title) + "的部門主管...";
	title = decodeURI(encodeURI(title).replace(/%C2%A0/g, ""));//去除&nbsp;
	var emp = $(e).siblings("#emp").val();
	if (emp.length > 0) {
		$("input[name=rdos][value='" + emp + "']").attr("checked", true).trigger("click");
	} else
		$("input[name=rdos]").attr("checked", false);
	dpt = $(e).parent().siblings(".content1").find("input[id$=code]").val();
	$(".opt").dialog({
		title: title,
		show: 'fade', //特效參考：http://jqueryui.com/demos/effect/
		bgiframe: true, width: 440,height:400, modal: true, draggable: true, resizable: false,
		overlay: { opacity: 0.3, background: "#FF8899" },
		buttons: [{ text: '確定', click: function () {
			var emp = $("input[name=rdos]:checked").val();
			if (emp.length == 0) {
				$(this).dialog('close');
				return;
			}
			update();
		}
		}
		, { text: '取消', click: function () { $(this).dialog('close'); } }
		]
	, beforeClose: function () { }
	});
}

function update() {
	var dep = dpt;
	var emp = $("input[name=rdos]:checked").val();
	var p = {mode:"update", dep: dep, emp: emp };
	$.ajax({ data: p, dataType: "json", type: "POST"
		, success: function (d) {
			if (d.result == "1") {
				$(".opt").dialog("close");
				showMsg("部門主管指定完成。");
			} else showMsg(d.error);
		}
	});
}

function remove() {
	var dep = dpt;
	var p = { mode: "remove", dep: dep };
	$.ajax({ data: p, dataType: "json", type: "POST"
		, success: function (d) {
			if (d.result == "1") {
				$(".opt").dialog("close");
				showMsg("部門主管移除完成。");
			} else showMsg(d.error);
		}
	});
}

function showMsg(msg) {
	$("#msg").text(msg);
	$("#msg").dialog({
		title: '',
		show: 'fade', //特效參考：http://jqueryui.com/demos/effect/
		bgiframe: true, width: 440,
		modal: true, draggable: true, resizable: false,
		overlay: { opacity: 0.3, background: "#FF8899" },
		buttons: [{ text: '確定', click: function () {
			$(this).dialog('close');
		}
		}]
		, beforeClose: function () { location.reload(); }
	});
}
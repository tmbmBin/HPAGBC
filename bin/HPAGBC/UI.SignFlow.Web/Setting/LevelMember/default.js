var fid;
var vid;
var kind;
$(function () {

	if ($(".member ul li").length == 0) {
		alert("尚無任何人員可設定，請先建立人員資料。");
	}

	fid = $.jget["f"];

	$(".setpass").click(function () {
		var $this = $(this);
		$(".gridstyle tr.current").removeClass("current");
		$this.parent().parent().addClass("current");
		kind = "1";
		vid = $this.siblings("#vid").val();
		loadSetting(fid, vid);
		showForm(fid, vid, "審核");
		return false;
	});

	$(".setdecide").click(function () {
		var $this = $(this);
		$(".gridstyle tr.current").removeClass("current");
		$this.parent().parent().addClass("current");
		kind = "2";
		vid = $this.siblings("#vid").val();
		loadSetting(fid, vid);
		showForm(fid, vid, "決行");
		return false;
	});

	$(".setreplacedecide").click(function () {
		var $this = $(this);
		$(".gridstyle tr.current").removeClass("current");
		$this.parent().parent().addClass("current");
		kind = "3";
		vid = $this.siblings("#vid").val();
		loadSetting(fid, vid);
		showForm(fid, vid, "代為決行");
		return false;
	});

});
function loadSetting(fid, vid) {
	//初始化所有 checkbox 為 unchecked
	$(".member input[type=checkbox]:checked").attr("checked", false);
	$(".member label.selected").removeClass("selected");

	$(".member label[for]").click(function () {
		var forID = $(this).attr("for");
		var checked = $("#" + forID).attr("checked");
		if (checked) {
			$(this).removeClass("selected");
		} else {
			$(this).addClass("selected");
		}
	});

	var p = { f: fid, v: vid, kind: kind };
	$.ajax({ async: false, data: p, dataType: "json", type: "POST", url: "ashx/GetSettedMember.ashx"
	, success: function (d) {
		if (d.length > 0) {
			for (var i = 0; i < d.length; i++) {
				var json = { member: d[i].member };
				$(".member #" + json.member).attr("checked", true).siblings("label[for=" + json.member + "]").addClass("selected");

			}
		}
	}
	});
}
function showForm(fid, vid, title) {
	$(".member").dialog({ title: "設定【" + title + "】人員",
		show: 'fade', bgiframe: true, width: 360, height: 500,
		modal: true, draggable: true, resizable: false,
		overlay: { opacity: 0.3, background: "#FF8899" },
		buttons: [
		{ text: '儲存',
			click: function () {
				if (!confirm("確認儲存?")) return;
				var checked = $(".member input[type=checkbox]:checked");
				var arr = new Array();
				checked.each(function () {
					arr.push($(this).val());
				});
				save(fid, vid, arr.join(","));
				$(this).dialog('close');
			}
		}, { text: '關閉',
			click: function () {
				$(this).dialog('close');
			}
		}
	], beforeClose: function () { $(".gridstyle tr.current").removeClass("current"); }
	});
}

function save(fid, vid, members) {
	var p = { f: fid, v: vid, members: members,kind:kind };
	$.ajax({ async: false, data: p, dataType: "json", type: "POST", url: "ashx/Manager.ashx"
	, success: function (d) {
		if (d.success == "1") {
			alert("儲存成功。");
		}
		else {
			alert(d.error);
		}
	}
	});
}
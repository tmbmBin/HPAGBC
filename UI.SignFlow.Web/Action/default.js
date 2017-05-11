var clicked = false;
$(function () {
	var isredirect = $("#isredirect").val();
	if (isredirect == "1") {
		alert($("#redirectmsg").val());
		var url = $("#url").val();
		location.href = url;
	}

	$(".ui-action-button-container input").click(function () {
		if (clicked) {
			alert("執行中，請稍後..."); return false;
		}
		if ($(this).attr("class") != "back") {
			if (confirm($(this).val() + "確認！")) {
				clicked = true;
				$(this).siblings("input.back").hide();
			}
			else return false;
		} else {
			history.back(); return false;
		}
	});
});
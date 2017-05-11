$(function () {
	$(".members input[type=checkbox]:checked").each(function () {
		$this = $(this);
		$this.siblings("label[for=" + $this.attr("id") + "]").addClass("selected");
	});

	$(".members label[for]").click(function () {
		var forID = $(this).attr("for");
		var checked = $("#" + forID).attr("checked");
		if (checked) {
			$(this).removeClass("selected");
		} else {
			$(this).addClass("selected");
		}
	});
});
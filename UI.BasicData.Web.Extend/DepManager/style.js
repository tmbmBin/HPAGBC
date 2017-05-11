$(function () {
	$(".ui-list-container").children("div:odd").addClass("zebra");

	$(".emp").each(function () {
		var $this = $(this);
		if ($this.val().length == 0) {
			$this.siblings(".remove").hide();
		}
	});
});
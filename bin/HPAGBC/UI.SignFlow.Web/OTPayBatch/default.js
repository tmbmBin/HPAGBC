function bindGridRowSelectAllClick() {
    $("[id$='chkSelectAll']").on("click", function () {
        // jquery 1.6 後, attr 改為 prop
        var checked = $(this).prop("checked");
        var $tr = $(this).parent().parent();
        $tr.siblings().find("[id$='chkSelect']").prop("checked", checked);

        //觸發重新計算換休總時數
        triggerRestHRSum();
    });
}

function bindGridRowSelectClick() {
    $("[id$='chkSelect']").on("click", function () {
        var checked = $(this).prop("checked");
        //觸發勾選全選: 取消勾選=>取消全選; 勾選=>判斷所有的項目是否勾選決定是否全選
        var allChecked = true;
        if (!checked) {
            allChecked = checked;
        } else {

            $("[id$='chkSelect']").each(function () {
                var check = $(this).prop("checked");
                if (!check) { allChecked = false; }
            });
        }
        $("[id$='chkSelectAll']").prop("checked", allChecked);

        //觸發重新計算換休總時數
        var $tr = $(this).parent().parent();
        $tr.find("[id$='atoForRestHRs']").change();
    });
}

function checkInputNumber($ctrl, event) {
    var code = (event.keyCode ? event.keyCode : event.which);
    return ((code >= 48 && code <= 57) || code == 8 || code == 46) ? true : false;
}

function bindTextBoxNumCheck() {
    $("[data-type='num']").on("keypress", function (e) {
        return checkInputNumber($(this), e);
    });
}

function bindRestHrsOnChange() {
    $("[id$='atoForRestHRs']").on("change", function () {
        var empCode = $(this).data("key");
        var sum = 0;
        // 找到同樣empCode,且有勾選的做加總
        $("[id$='atoForRestHRs'][data-key='" + empCode + "']").each(function () {

            var $tr = $(this).parent().parent();
            var checked = $tr.find("[id$='chkSelect']").prop("checked");
            if (!checked) { return true; }

            var v = $.isNumeric($(this).val()) ? parseFloat($(this).val()) : 0;
            sum += v;
        });

        // 已審核換休時數(取第一個 item 的值)
        var passRestHRs = $("[id$='passRestHRs'][data-key='" + empCode + "']").first().text();
        var passV = $.isNumeric(passRestHRs) ? parseFloat(passRestHRs) : 0;
        sum += passV;

        $inputs = $("[id$='RestHRSum'][data-key='" + empCode + "']");
        $inputs.text(sum);

        $inputs.removeClass("notify");
        $inputs.removeClass("notify-warn");

        if (sum > 16) {
            $inputs.addClass("notify");
        } else if (sum == 16) {
            $inputs.addClass("notify-warn");
        }
    });
}

function triggerRestHRSum() {

    var empCode = "";
    $("[id$='atoForRestHRs']").each(function () {
        var emp = $(this).data("key");
        if (empCode === emp) { return true; }

        empCode = emp;
        $(this).change();
    });
}


$(function () {

    //勾選全選
    bindGridRowSelectAllClick();
    //textbox 輸入判定(僅數字,小數點..)
    bindTextBoxNumCheck();
    //換休時數 textbox 值變更
    bindRestHrsOnChange();
    //勾選 row checkbox
    bindGridRowSelectClick();
    //重新計算換休總時數
    triggerRestHRSum();
});
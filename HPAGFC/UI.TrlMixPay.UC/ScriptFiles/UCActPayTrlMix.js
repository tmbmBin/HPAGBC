$(function () {

    //2013.09.25：Add
    //#region 開啟「選取員工資料」視窗
    $("[MyName='btnSelect']").click(function () {
        var $this = $(this);
        var empNum = $("[MyName='hdfusrAlias']").val();


        var sURL = "../UI.Component.Web/iFrmBasEmployeeSelect2.aspx"
            + "?empNum=" + encodeURIComponent(empNum);
        var sFeatures = "dialogWidth:600px; dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;";
        var vReturnValue = MyLibraryJs.WindowExt.fnShowModalDialog(sURL, undefined, sFeatures);
        var sHidenValue = "";

        if (vReturnValue != undefined) {
            sHidenValue = vReturnValue;
            $("[MyName='hdfReturn']").val(sHidenValue);
            $.blockUI({ message: "<h1><b><img src='../Images/ajax-loader.gif' />資料讀取中...</b></h1>" });
            return true;
        }


        return false;
    });
    //#endregion

});
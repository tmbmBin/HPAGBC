$(function () {
	addPrintLinkToGrid();
});

function addPrintLinkToGrid() {
	var $th = $("<th>").text("單據報表");
	$th.appendTo($(".gridstyle tr:eq(0)[class!=empty]"));
	$(".gridstyle tr:gt(0)").each(function () {
	    var $tr = $(this), $td = $("<td>").css("text-align", "center");
	    var $a = $("<a href='#'><img src='../images/printer32x32.png' title='列印視窗' style='border:0' /></a>").click(function () {
	        $(".gridstyle tr.current").removeClass("current");
	        $tr.addClass("current");

	        var FID = $tr.find("[id$=FID]").val(), PK = $tr.find("[id$=PK]").val()
, tmp = PK.split(":"), year = parseInt(tmp[0]), no = parseInt(tmp[1])
			, num = $tr.find("td.num").text(), visastage;
	        switch (FID) {
	            case "PROD001":
	            case "PROD002":
	            case "CASH_PROD001":
	            case "SALARY_PROD001":
	            case "TRAVEL_PROD001":
	                visastage = "M";
	                break;
	            case "PRE_EXPENSE":
	                visastage = "PA";
	                break;
	            case "PAYMENT":
	                visastage = "P";
	                break;
	            default: return;
	        }

	        var p = new Array();

	        if (FID == "TRAVEL_PROD001") {
	            var trl = 0;
	            var e = { year: year, no: no };
	            $.ajax({ async: false, data: e, dataType: "json", url: "../ashx/getTrlNum.ashx"
					, success: function (j) {
					    trl = j.trl;
					}
	            });
	            p.push("acmTrlNo=" + trl);
	        } else if (FID == "PRE_EXPENSE" || FID == "PAYMENT") {
	            p.push("acpPayYear=" + tmp[2]);
	            p.push("acpPayNo=" + tmp[3]); //1001011:[add]:Kevin Add 暫付款需要acpPayNo 
	            p.push("acpPayNoPrv=" + tmp[4]);
	        }
	  
	        p.push("visastage=" + visastage);
	        p.push("acmYear=" + year);
	        p.push("acmNo=" + no);
	        p.push("acmWordNum=" + num);
	        p.push("acmNo1=0");
	        p.push("acpPayYear=" + year);
	        p.push("acmKindNum=Prod");
	        p.push("page1qty=7");
	        p.push("page2qty=43");
	       
	        window.open("../../UI.ActReports.Web/FrmRptMenu.aspx?" + p.join("&"), '', 'resizable=yes,scrollbars=yes,menubar=yes,toolbar=no,status=no,location=no');

	        return false;
	    });
	    $a.appendTo($td);
	    $td.appendTo($tr);
	});
}
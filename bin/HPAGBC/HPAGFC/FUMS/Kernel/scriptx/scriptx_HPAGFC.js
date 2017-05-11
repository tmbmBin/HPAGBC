var FileUploadManagerX1_PK;
var FileUploadManagerX1_remove_clicked_callback;
$(function () {
    FileUploadManagerX1_PK=$("#"+"FileUploadManagerX1_PK").val();
	FileUploadManagerX1_loadUploaded();
	FileUploadManagerX1_loadUploadify();
    $("#FileUploadManagerX1 .attach").bind("click",function(){
        FileUploadManagerX1_loadUploaded();
    });
	$("#FileUploadManagerX1 .trash .title a.clear").bind("click",function(){
		FileUploadManagerX1_trashClear_click();return false;
	});
});
function FileUploadManagerX1_loadUploadify() {
$('#FileUploadManagerX1_FileData').uploadify({
	'uploader': '../../HPAGFC/FUMS/Kernel/uploadify.swf','script': '../../HPAGFC/FUMS/Kernel/upload.ashx','scriptData':{PK:FileUploadManagerX1_PK},
	'cancelImg': '../../HPAGFC/FUMS/Kernel/cancel.png',
	'buttonText': '',
	'buttonImg': '../../HPAGFC/FUMS/Kernel/button.png',
	'hideButton':false,
	'width': 64,
	'height': 14,
	'fileDataName': 'FileUploadManagerX1_FileData',		
	'folder': '/temp',
	'multi': true,'auto': true,'wmode':'transparent',
	'fileExt': '*.*',
	'fileDesc': 'All Files (*.*)',
	'sizeLimit': 0,
	'queueID': 'FileUploadManagerX1_queuelist',
	'queueSizeLimit': 0,
	'simUploadLimit': 0,
	'removeCompleted': true,
	'onQueueFull':function(event,queueSizeLimit){return false;},
	'onError':function(event,ID,fileObj,errorObj){
		var err;
		if(errorObj.type=="File Size"){
			err="檔案大小超過限制的長度 "+ getFileSizeStr(errorObj.info)+"。";
		}else{
			err=errorObj.type + " 錯誤:" + errorObj.info;
		}
		alert(fileObj.name + " "+err+ " ");
	},
	'onAllComplete': function (event, data) {FileUploadManagerX1_loadUploaded();}
});
}
function FileUploadManagerX1_loadUploaded() {
    var fums=$("#FileUploadManagerX1");
	var uploaded = $("#FileUploadManagerX1_uploaded");
    var trash=$("#FileUploadManagerX1_Trash");
	var enaobj="FileUploadManagerX1_Enable";
	var ena=$("#"+enaobj).val();//啟用刪除功能
	var dl=$("#"+enaobj).attr("dl");//啟用下載連結
	var p = { mode: "listUploaded", PK: FileUploadManagerX1_PK };
	$.ajax({
		type: "POST", url: "../../HPAGFC/FUMS/Kernel/managex.ashx", dataType: "json", data: p,
		success: function (data) {
			var d = data;
			//if (d != "0") {
			uploaded.empty();
			trash.find(".uploadedItem").remove();
			for (var i = 0; i < d.length; i++) {
				var fileName = d[i].name;
				var len = d[i].len;
				var id = d[i].id;
				var s = d[i].s;//R,T,trash
				var bs= getFileSizeStr(len);
				var uploadedItem = $("<div>").addClass("uploadedItem");
				//var c= ena=="1"? "<div class='cancel'><a id='" + id + "' s='" + s + "' href=''><img src='../../HPAGFC/FUMS/Kernel/cancel.png' border='0'></a></div>":"";
				var c= ena=="1"? "<div class='cancel'><a id='" + id + "' s='" + s + "' href=''><img src='../../HPAGFC/FUMS/Kernel/"+ (s=="trash"?"trash01.gif":"trash02.png").toString()+ "' border='0' title='"+(s=="trash"?"立即刪除":"移至資源回收桶")+"'></a></div>":"";
				var cancel = $(c+"<span class='fileName'>"
					+(dl=="1"? "<a href='../../HPAGFC/FUMS/Kernel/filex/?v=" + id.substring(0, 12) + "&s=" + s + "&k=" + id.substring(12) + "' class='"+s+ "' target='_blank'>":"")
					+ decodeURIComponent(decodeURIComponent(fileName)) + ' (' + bs + ")"+(dl=="1"?"</a>":"")
					+(s=="trash"?"&nbsp;<a id='"+id+"' href='' class='restore'>(復原)</a>":"")
					+"</span><span class='percentage'></span>").appendTo(uploadedItem);
				if(s=="trash"){
					uploadedItem.appendTo(trash);
				}else{
					uploadedItem.appendTo(uploaded);
				}
			}
			//}
			//bind link
			$(uploaded).find(".uploadedItem .cancel a").bind("click",function(){return FileUploadManagerX1_remove_click($(this));});
            $(trash).find(".uploadedItem .cancel a").bind("click", function(){return FileUploadManagerX1_remove_click($(this));});
			$(trash).find(".uploadedItem a.restore").bind("click", function(){return FileUploadManagerX1_restore_click($(this));});
		},
		error: function (xhr, ajaxOptions, thrownError) {alert(xhr.status + ":::" + xhr.responseText + ":::"+thrownError);}
	});
}
function FileUploadManagerX1_remove_click(e){
    var withfn=true;
    var recycle=false;
    var FileUploadManagerX1_removeConfirmText = "";
    var FileUploadManagerX1_enableBeforeRemove = false;
    var status=$(e).attr("s");
    var fnamecfm=$(e).parent().siblings("span").find("a:eq(0)").text()+"\n\n";
    if(status=="trash"){
        if(!confirm(fnamecfm+"警告:此動作會將檔案徹底刪除且無法復原，是否確定刪除?")){return false;}
    }else{
	    if (FileUploadManagerX1_enableBeforeRemove) {if (!confirm((withfn?fnamecfm:"") +FileUploadManagerX1_removeConfirmText)) {return false;}}
    }
    var a = $(e);
    var pp = { mode: "del" };
    pp.s = status;
    pp.name = $(a).attr("id");
    pp.PK = FileUploadManagerX1_PK;
    pp.recycle=recycle?"1":"";
    $.ajax({
	    type: "POST", async: false, url: "../../HPAGFC/FUMS/Kernel/managex.ashx", data: pp,
	    success: function (data) {
//		    $(a).parent(".cancel").parent(".uploadedItem").remove();
            FileUploadManagerX1_loadUploaded();
			if(FileUploadManagerX1_remove_clicked_callback) FileUploadManagerX1_remove_clicked_callback.call();
	    },
	    error: function () {
		    alert("刪除檔案發生錯誤...");
	    }
    });
    return false;
}
function FileUploadManagerX1_restore_click(e){
	var a = $(e);
    var pp = { mode: "restore" };
    pp.name = $(a).attr("id");
    pp.PK = FileUploadManagerX1_PK;
    $.ajax({
	    type: "POST", async: false, url: "../../HPAGFC/FUMS/Kernel/managex.ashx", data: pp,
	    success: function (data) {
            FileUploadManagerX1_loadUploaded();
	    },
	    error: function () {
		    alert("檔案復原發生錯誤...");
	    }
    });
    return false;
}
function FileUploadManagerX1_trashClear_click(){
	var len=$("#FileUploadManagerX1 .trash .uploadedItem").length;
	if(len==0){return;}
	if(confirm("清空全部檔案?\n\n"+"警告:此動作會將檔案徹底刪除且無法復原，是否確定刪除?")){
		var p={mode:'clear',PK:FileUploadManagerX1_PK};
		$.ajax({
			type: "POST", async: true, url: "../../HPAGFC/FUMS/Kernel/managex.ashx", data: p,
			success: function (d) {
				FileUploadManagerX1_loadUploaded();
			},
			error:function(d){alert("清空資源回收桶時發生錯誤。");}
		});
	}
}
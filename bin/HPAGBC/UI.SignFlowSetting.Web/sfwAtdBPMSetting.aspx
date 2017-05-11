<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sfwAtdBPMSetting.aspx.cs" Inherits="sfwAtdBPMSetting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>流程說明設定</title>
      <link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/default/easyui.css">
      <link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/icon.css">
      <link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/demo/demo.css">

   <%-- <link href="Css/demo.css" rel="stylesheet" />
    <link href="Css/easyui.css" rel="stylesheet" />
    <link href="Css/icon.css" rel="stylesheet" />--%>


    <script src="Scripts/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="Scripts/jquery.easyui.min.js" type="text/javascript"></script>
    <script type="text/javascript">
            $(function () {
                var qParams = { mode: "Grid", MemoId: $('#ddl_absMemo').val() }; //取得查詢參數
                var opt = $('#dg');
                try
                {
                    opt.datagrid({
                        queryParams: qParams,  //參數
                        url: 'sfwAtdBPMSettingGrid.aspx',  //資料處理頁
                        idField: 'absEmpCode',  //主索引
                        sortName: 'absDataNo',
                        sortOrder: 'asc',
                        pageSize: 15,
                        pageList: [15, 40, 200], //每頁顯示筆數清單
                        pagination: true, //是否啟用分頁
                        rownumbers: true, //是否顯示列數
                        toolbar: '#toolbar',
                        columns: [[
                            { field: 'absMemo', title: '流程名稱', width: 100, align: 'left', sortable: 'true' },
                            { field: 'abdNo', title: '序號', width: 30, align: 'left', sortable: 'true' },
                            { field: 'empName', title: '員工姓名', width: 60, align: 'left', sortable: 'true' },
                            { field: 'EmpNum', title: '員工編號', width: 40, align: 'left', sortable: 'true' },
                            { field: 'dptName', title: '所屬部門', width: 80, align: 'left', sortable: 'true' },
                            { field: 'absEmpCode', title: '員工系統號', width: 60, align: 'left', sortable: 'true', hidden: true },
                            { field: 'absDataNo', title: '流程編號', width: 50, align: 'left', sortable: 'true',hidden:true }
                        ]]
                    })
                     .datagrid("getPager").pagination({
                         onBeforeRefresh: function () {
                             return true;
                         }
                     });
                }

                catch (e) { alert("存取資料異常!"); }
            });
        //for sfwAtdBPMSetting
        function Add() {

                var $this = $(this);
                var horizontalPadding = 0;
                var verticalPadding = 0;
                $('#div_Set').show();
                $('#openMemberIframe')[0].src = 'sfwAtdBPMSettingAdd.aspx?M=Add&DEPNo=' + $('#ddl_absMemo').val()
                $('#div_Set').dialog({
                    autoOpen: true,
                    title: '新增流程人員',
                    width: 450,
                    height: 300,
                    modal: true,
                    resizable: true,
                    autoResize: true,
                    closeOnEscape: true,
                    draggable: true,
                    resizable: false,
                    overlay: { opacity: 0.5, background: "black" },
                    onClose: function () {
                    }
                }).width('auto').height('auto');
        }
        function Edit() {
            var row = $('#dg').datagrid('getSelected');
            if (row) {
                var $this = $(this);
                var horizontalPadding = 0;
                var verticalPadding = 0;
                $('#div_Set').show();
                $('#openMemberIframe')[0].src = 'sfwAtdBPMSettingAdd.aspx?M=Edit&EMP=' + row.absEmpCode + '&DEPNo=' + row.absDataNo
                $('#div_Set').dialog({
                    autoOpen: true,
                    title: '編輯流程人員',
                    width: 450,
                    height: 300,
                    modal: true,
                    resizable: true,
                    autoResize: true,
                    closeOnEscape: true,
                    draggable: true,
                    resizable: false,
                    overlay: { opacity: 0.5, background: "black" },
                    onClose: function () {
                        $('#dg').datagrid('reload');
                    }
                }).width('auto').height('auto');
            }
            else {
                $.messager.alert('訊息', '尚未選擇資料列！', 'info');   //
            }
        }
        function Delete() {
            var row = $('#dg').datagrid('getSelected');
            if (row) {
                $.messager.confirm('確認訊息', '確定要刪除這筆資料嗎？', function (r) {
                    if (r) {
                        $.post('sfwAtdBPMSettingGrid.aspx', { DepNo: row.absDataNo, EmpNo: row.absEmpCode, mode: 'Del' }, function (result) {
                            if (result.success) {
                                $('#dg').datagrid('reload');    // reload the user data
                            } else {
                                $.messager.show({    // show error message
                                    title: 'Error',
                                    msg: result.msg
                                });
                            }
                        }, 'json');
                    }
                });
            } else
                alert('請選點選一筆店家資料!!')
        }
        //關閉子視窗
        function Closediv() {
            $('#div_Set').dialog('close');
            $('#dg').datagrid('reload');
        }
    </script>
</head>
<body>

    <form id="form1" runat="server">
	<table style="border-collapse: collapse; margin-top: 5" cellpadding="0" border="1" bordercolor="#D4D0C8" bgcolor="#FFFFFF">
		<tr>
			<td style="padding-left: 5px; padding-right: 5px" align="right" nowrap>現有流程</td>
			<td width="30" style="padding-right: -2px"><div style="width: 300px; OVERFLOW: hidden;"><asp:DropDownList id="ddl_absMemo" runat="server" style="margin-bottom:-1" Width="301" AutoPostBack="True"></asp:DropDownList></div></td>
		</tr>
	</table>

    <div data-options="region:'center'" style="padding:5px;background:#eee;">
	    <h2>流程人員管理</h2>
	    <table id="dg" class="easyui-datagrid" style="width:'100%'; min-height:250px; height:auto;" pagination="true" rownumbers="true" fitColumns="true" singleSelect="true"></table>
	    <div id="toolbar">
	  	    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="Add()">新增</a>
	  	    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="Edit()">編輯</a>
	  	    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="Delete()">刪除</a>
	    </div>
    </div>
    </form>
    <div id="div_Set" style="display: 1none;">
        <iframe scrolling="no" id='openMemberIframe' frameborder="0" src="" style="width: 400px; height: 250px;"></iframe>
    </div>
</body>
</html>

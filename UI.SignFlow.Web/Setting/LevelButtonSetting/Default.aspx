<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UI.SignFlow.Web.Setting.LevelButtonSetting.Default" %>

<%@ Register Assembly="TM.ServerControl" Namespace="TM.ServerControl" TagPrefix="TM" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="content-language" content="utf-8" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="Cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<title>關卡按鈕設定</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="form1" runat="server">
<div id="wrap">

<div id="header">
	<div style="padding:8px; background:#EFEFEF">
	<fieldset style="padding:8px">
	<legend>關卡按鈕設定(僅使用於系統開發人員)</legend>
	<div style="font-size:12pt">
		<asp:RadioButtonList ID="rdosForm" runat="server"
		AutoPostBack="true" RepeatLayout="Table" onselectedindexchanged="rdosForm_SelectedIndexChanged">
		</asp:RadioButtonList>

		<span style="background:#FFFFEF;border:1px solid brown;padding:4px 8px;display:inline-block;">
		關卡選擇
		<asp:DropDownList ID="cboLevelSwitch" runat="server" AutoPostBack="true" onselectedindexchanged="cboLevelSwitch_SelectedIndexChanged"></asp:DropDownList>
		</span>

<asp:GridView ID="grid" runat="server" CssClass="gridstyle" AutoGenerateColumns="false" onrowcommand="grid_RowCommand">
<Columns>

<asp:TemplateField HeaderText="使用">
<ItemStyle HorizontalAlign="Center" Width="80px" />
<ItemTemplate>
<asp:CheckBox ID="txtChecked" runat="server" Checked='<%# Eval("IsChecked") %>' />
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="動作名稱">
<ItemStyle HorizontalAlign="Center" />
<ItemTemplate>
<asp:HiddenField ID="hdnActID" runat="server" Value='<%# Eval("ActID") %>' />
<asp:Literal ID="ltActName" Text='<%# Eval("ActName") %>' runat="server" />
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="顯示的按鈕文字">
<ItemStyle Width="100px" />
<ItemTemplate>
<asp:TextBox ID="txtDispBtnText" runat="server" Text='<%# Eval("DispBtnText") %>' Width="90px"></asp:TextBox>
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="執行成功後執行的網址一">
<ItemTemplate>
<asp:TextBox ID="txtAfterExecSuccUrl" runat="server" Text='<%# Eval("AfterExecSuccUrl") %>' Width="95%" />
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="執行成功後執行的網址二">
<ItemTemplate>
<asp:TextBox ID="txtAfterExecSuccUrl1" runat="server" Text='<%# Eval("AfterExecSuccUrl1") %>' Width="95%" />
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="執行成功後執行的網址三">
<ItemTemplate>
<asp:TextBox ID="txtAfterExecSuccUrl2" runat="server" Text='<%# Eval("AfterExecSuccUrl2") %>' Width="95%" />
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="執行成功後執行的網址四">
<ItemTemplate>
<asp:TextBox ID="txtAfterExecSuccUrl3" runat="server" Text='<%# Eval("AfterExecSuccUrl3") %>' Width="95%" />
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="排序代碼">
<ItemStyle Width="60px" />
<ItemTemplate>
<asp:TextBox ID="txtSortCode" runat="server" Text='<%# Eval("SortCode") %>' Width="50px" />
</ItemTemplate>
</asp:TemplateField>

</Columns>
<AlternatingRowStyle CssClass="zebra" />
<EmptyDataTemplate>未設定表單流程關卡，請洽系統管理人員。</EmptyDataTemplate>
</asp:GridView>

<TM:MessagePanel ID="MessagePanel1" runat="server"></TM:MessagePanel>

<div class="actarea">	
	<asp:Button ID="btnSave" Text="儲存設定" runat="server" onclick="btnSave_Click" />
</div>

<div class="description">
<ul>
	<li>請示階段 [退承辦人] 必須安插將請示明細轉回暫存區 [actVisaTemp]→UI.Comm.Web/FrmReturn.aspx</li>
	<li>請示階段 [決行] 必須安插 [1] 將資料送至第確認核銷/預支階段→UI.SignFlow.Web/Procs/ToConfirmable/Default.aspx</li>
	<li>請示階段 [決行] 必須安插 [2] 同步審核旗標→UI.SignFlow.Web/Procs/SyncApply/Default.aspx</li>
	<li>確認核銷/預支階段 [同意] 必須安插 [1]→UI.SignFlow.Web/Procs/ToPayable/Default.aspx</li>
	<li>確認核銷/預支階段 [同意] 必須安插 [2]→UI.SignFlow.Web/Procs/SyncExpense/Default.aspx</li>
	<li>報支階段 [同意] 必須安插→UI.SignFlow.Web/Procs/SyncPayment/Default.aspx</li>
</ul>
</div>
	</div>
	</fieldset>
	</div>
</div><%--header end--%>


</div>
</form>
</body>
</html>

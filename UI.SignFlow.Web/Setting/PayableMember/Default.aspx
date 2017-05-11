<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UI.SignFlow.Web.Setting.PayableMember.Default" %>

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
<title>可報支人員設定</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script src="../../../jQuery/jQuery-min.js" type="text/javascript"></script>
<script src="default.js" type="text/javascript"></script>
<script src="style.js" type="text/javascript"></script>
</head>
<body>
<form id="form1" runat="server">
<div id="wrap">	
	<div style="padding:8px; background:#EFEFEF">
	<fieldset style="padding:8px">
	<legend>表單選擇</legend>
	<div style="font-size:12pt">
		<asp:RadioButtonList ID="rdosForm" runat="server"
		AutoPostBack="true" RepeatLayout="Table" RepeatColumns="2"
		onselectedindexchanged="rdosForm_SelectedIndexChanged"></asp:RadioButtonList>
	</div>
	<div>
	<fieldset style="padding:0 8px 0 0;background:#F6F6F6;height:300px;overflow-y:scroll;">
	<legend>可報支人員設定（將可報支的人員勾選後並儲存即可）</legend>
		<div class="members">
			<asp:CheckBoxList ID="chksMember" runat="server" RepeatLayout="Flow" RepeatColumns="1"></asp:CheckBoxList>
		</div>
	</fieldset>
		<div class="actarea">
			<asp:Button ID="btnSet" Text="儲存設定" runat="server" onclick="btnSet_Click" />
		</div>
	<TM:MessagePanel ID="MessagePanel1" runat="server"></TM:MessagePanel>
	
	</div>
	</fieldset>
	</div>
</div>
</form></body></html>
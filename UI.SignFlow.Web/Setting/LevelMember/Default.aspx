<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs"
Inherits="UI.SignFlow.Web.Setting.LevelMember._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="content-language" content="utf-8" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="Cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<title>關卡審核人員設定</title>
<%--連結 CSS 檔案 (BEGIN)--%>
<link href="../../../jQuery/css/ui-1.8.9/dialog.style3/jquery-ui-1.8.9.custom-style3.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="Stylesheet" href="style.css" /> 
<%--連結 CSS 檔案 (END)--%>

<%--連結 JavaScript 檔案 (BEGIN)--%>
<script src="../../../jQuery/jQuery-min.js" type="text/javascript"></script>
<script src="../../../jQuery/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>
<script src="../../../jQuery/jquery.jget.js" type="text/javascript"></script>
<script src="default.js" type="text/javascript"></script>
<%--連結 JavaScript 檔案 (END)--%>
</head>
<body>
<form id="form1" runat="server">
<div id="wrap">

<div id="header">
	<div style="padding:8px; background:#EFEFEF">
	<fieldset style="padding:8px">
	<legend>關卡審核人員設定</legend>
	<div style="font-size:12pt">
		<asp:RadioButtonList ID="rdosForm" runat="server"
		AutoPostBack="true" RepeatLayout="Table"
		onselectedindexchanged="rdosForm_SelectedIndexChanged"></asp:RadioButtonList>

<asp:GridView ID="grid" runat="server" CssClass="gridstyle" AutoGenerateColumns="false" onrowcommand="grid_RowCommand">
<Columns>

<asp:TemplateField HeaderText="&nbsp;">
<ItemStyle HorizontalAlign="Center" Width="80px" />
<ItemTemplate>
第 <%# Container.DataItemIndex + 1 %> 關
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="關卡審核角色">
<ItemStyle HorizontalAlign="Center" />
<ItemTemplate>
<%# Eval("LevelName")%></ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="審核">
<ItemStyle HorizontalAlign="Center" Width="80px" />
<ItemTemplate>
<input type="hidden" id="vid" value='<%# Eval("LevelID") %>' />
<asp:Button ID="setbtn" Text="設定" CssClass="setpass" runat="server" Enabled='<%# Eval("EnableApprove") %>' />
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="決行">
<ItemStyle HorizontalAlign="Center" Width="80px" />
<ItemTemplate>
<input type="hidden" id="vid" value='<%# Eval("LevelID") %>' />
<asp:Button ID="setbtn" CssClass="setdecide" Text="設定" runat="server" Enabled='<%# Eval("EnableDecide") %>' />
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="代為決行">
<ItemStyle HorizontalAlign="Center" Width="80px" />
<ItemTemplate>
<input type="hidden" id="vid" value='<%# Eval("LevelID") %>' />
<asp:Button ID="setbtn" CssClass="setreplacedecide" Text="設定" runat="server" Enabled='<%# Eval("EnableReplaceDecide") %>' />
</ItemTemplate>
</asp:TemplateField>

</Columns>
<AlternatingRowStyle CssClass="zebra" />
<EmptyDataTemplate>未設定表單流程關卡，請洽系統管理人員。</EmptyDataTemplate>
</asp:GridView>

	</div>
	</fieldset>
	</div>
</div><%--header end--%>
	
<div id="content">
	<div style="color:Green;font-size:10pt;font-weight:bold">注意：關卡簽核者為「請購人直屬主管或計畫主持人」允許不設定審核人員，系統會自動辨識並動態指定人員。</div>	
</div><%--content end--%>
	
<div id="footer">
	
</div><%--footer end--%>

</div><%--wrap end--%>

<div class="member" style="display:none">
<ul>
<asp:Repeater ID="memberlist" runat="server">
<ItemTemplate>
<li>
<input id="<%# Eval("payCode") %>" type="checkbox" value='<%# Eval("payCode") %>' />
<label title='<%# Eval("payCode") %>' for="<%# Eval("payCode") %>"><%# Eval("payName") %></label>
</li>
</ItemTemplate>
</asp:Repeater>
</ul>
<div class="clr"></div>
</div>
</form>
</body>
</html>

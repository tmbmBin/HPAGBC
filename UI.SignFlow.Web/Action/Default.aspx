<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UI.SignFlow.Web.Action._Default" %>

<%@ Register Assembly="TM.ServerControl" Namespace="TM.ServerControl" TagPrefix="TM" %>
<%@ Register TagPrefix="SF" TagName="UCLevelProgressList" Src="ascx/UCLevelProgressList.ascx" %>
<%@ Register TagPrefix="SF" TagName="UCActionButton" Src="ascx/UCActionButton.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="content-language" content="utf-8" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="Cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<title>線上簽核系統 - 進行簽核</title>
<%--連結 CSS 檔案 (BEGIN)--%>
<link type="text/css" rel="Stylesheet" href="style.css" /> 
<%--連結 CSS 檔案 (END)--%>

<%--連結 JavaScript 檔案 (BEGIN)--%>
<script src="../../jQuery/jQuery-min.js" type="text/javascript"></script>
<script src="../../jQuery/jquery.jget.js" type="text/javascript"></script>
<script src="default.js" type="text/javascript"></script>
<script src="style.js" type="text/javascript"></script>
<%--連結 JavaScript 檔案 (END)--%>
</head>
<body>
<form id="form1" runat="server">
<div id="wrap">
<asp:HiddenField ID="url" runat="server" />
<asp:HiddenField ID="isredirect" runat="server" />
<asp:HiddenField ID="redirectmsg" runat="server" />
<div id="header">

</div><%--header end--%>
	
<div id="content">
    <div style="font-size:10pt;background:#EFEFEF;margin:0;padding:8px;">
		<fieldset style="padding:4px;color:#333;">
		<legend>簽核表單資訊</legend>
        <div style="line-height:22px">表單編號&nbsp;&raquo;&nbsp;<label style="font-family:Verdana;font-weight:bold"><asp:Literal ID="ltFormNumber" runat="server" /></label></div>
        <div style="line-height:22px">內容描述&nbsp;&raquo;&nbsp;<asp:Literal ID="ltDescript" runat="server" /></div>
		</fieldset>
    </div>
	<asp:PlaceHolder ID="phattach" runat="server">
		<div style="padding:0 8px 8px 8px; background:#EFEFEF">
		<fieldset style="padding:8px">
		<legend>附加表單</legend>
		<iframe id="iatturl" runat="server" frameborder="0" marginwidth="0" marginheight="0" width="100%" height="300px" scrolling="auto"></iframe>
		</fieldset>
		</div>
	</asp:PlaceHolder>
	<SF:UCLevelProgressList ID="progresslist" runat="server" />
	<div class="ui-memo-container">
		<div class="header">意見或註記</div>
		<div class="content">
			<asp:TextBox ID="txtMemo" runat="server" Width="600px" TextMode="MultiLine" />
		</div>
	</div>
	<SF:UCActionButton ID="actbtns" runat="server" />
	<TM:MessagePanel ID="MessagePanel1" runat="server">
	</TM:MessagePanel>
</div><%--content end--%>
	
<div id="footer">
	
</div><%--footer end--%>

</div><%--wrap end--%>


</form>
</body>
</html>

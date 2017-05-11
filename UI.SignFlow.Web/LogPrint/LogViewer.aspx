<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogViewer.aspx.cs" Inherits="UI.SignFlow.Web.LogPrint.LogViewer" %>
<%@ Register TagPrefix="TM" TagName="UCLogListDetail" Src="ascx/UCLogListDetail.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="content-language" content="utf-8" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="Cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<title></title>
<%--連結 CSS 檔案 (BEGIN)--%>
<link type="text/css" rel="Stylesheet" href="style.css" /> 
<link href="../Master.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.btn{background:#5D7B9D;color:#FFF;}
</style>
<%--連結 CSS 檔案 (END)--%>
<script src="../../jQuery/jQuery-min.js" type="text/javascript"></script>
<script src="../../jQuery/jquery.jget.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function () {
		$("#btnPrint").click(function () {
//		    window.open("Print.aspx?FID=" + $.jget["FID"] + "&PK=" + $.jget["PK"], "print", "width=800,height=600");
		    window.open("Print.aspx?FID=" + $.jget["FID"] + "&PK=" + $.jget["PK"]   );
		});
	});
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<div style="margin-bottom:8px">
			<%--<asp:Button ID="btnPrint" CssClass="btn" Text="列印" runat="server" onclick="btnPrint_Click" />--%>
			<input type="button" id="btnPrint" class="btn" value="列印" />
		</div>
		<TM:UCLogListDetail ID="ucloglistdtl" runat="server" />
    </div>
    </form>
</body>
</html>
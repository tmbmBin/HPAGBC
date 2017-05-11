<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCMenuBar.ascx.cs" Inherits="UI.SignFlow.Web.ascx.UCMenuBar" %>
<script type="text/javascript">
$(function () { $(".menubar td").hover(function () { $(this).addClass("over"); }, function () { $(this).removeClass("over"); }); });
</script>
<style type="text/css">
.menubar{
	border-bottom:2px dotted #5D7B9D;
	padding:0;
}
.menubar table{
	margin:0;
}
.menubar td{
	width:100px;
	background-color:#FFF;
	height:26px;
	text-align:center;
	font-size:10pt;
}
.menubar td a{
	color:#5D7B9D;
	text-decoration:none;
	display:block;
	height:26px;
	line-height:26px;
}
.menubar td.current{
	background:#5D7B9D;
	font-weight:bold;
}
.menubar td.current a{
	color:#FFF;
}
.menubar td.over{
	background:#48607A;
}
.menubar td.over a{
	color:#FFF;
}
</style>
<div class="menubar"><table><tr>
<td id="td1" runat="server"><a href="../Todo">可處理待辦事項</a></td>
<td id="td2" runat="server"><a href="../ReadyTodo">將處理待辦事項</a></td>
<td id="td3" runat="server"><a href="../Done">經辦事項</a></td>
<td id="td5" runat="server"><a href="../Decide">已決行案件</a></td>
<td id="td4" runat="server"><a href="../Trace">流程追蹤</a></td>
<td id="td6" runat="server"><a href="../LogPrint">簽核歷程列印</a></td>
<td id="td7" runat="server"><a href="../QA">問與答</a></td>
</tr></table></div>
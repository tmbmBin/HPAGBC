<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FrmChoosePhrase.aspx.vb" Inherits="UI.BasicData.Web.FrmChoosePhrase"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>FrmChoosePhrase</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
		<base target="_self">
		<script language="javascript">
<!--

function fnGetInfo(bnkSubNo){
//var sData = dialogArguments;
//sData.sUserName = bnkSubNo;
//sData.fnUpdate();
returnValue=bnkSubNo;

 //returnValue=bnkSubNo;
}


 returnValue="Cancel";
function fnCancel(){
//var sData = dialogArguments;
//sData.sUserName = "";
//sData.fnUpdate();
}

//-->
		</script>
	</HEAD>
	<body MS_POSITIONING="GridLayout" bgColor="#dadee9">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" style="Z-INDEX: 105; LEFT: 16px; WIDTH: 496px; POSITION: absolute; TOP: 16px; HEIGHT: 142px"
				cellSpacing="1" cellPadding="1" width="496" border="0">
				<TR>
					<TD style="WIDTH: 69px; HEIGHT: 2px"><FONT face="新細明體">片語代碼</FONT></TD>
					<TD style="WIDTH: 152px; HEIGHT: 2px">
						<asp:TextBox id="TBID" runat="server" MaxLength="6"></asp:TextBox></TD>
					<TD style="WIDTH: 36px; HEIGHT: 2px"></TD>
					<TD style="HEIGHT: 2px"></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 69px; HEIGHT: 2px"><FONT face="新細明體">片語內容</FONT></TD>
					<TD style="WIDTH: 152px; HEIGHT: 2px">
						<asp:TextBox id="TBName" runat="server"></asp:TextBox></TD>
					<TD style="WIDTH: 36px; HEIGHT: 2px"><FONT face="新細明體">
							<asp:Button id="BtnSearch" runat="server" Text="搜尋"></asp:Button></FONT></TD>
					<TD style="HEIGHT: 2px">
						<asp:Button id="BtnAdd" runat="server" Text="新增編輯"></asp:Button></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 69px; HEIGHT: 1px"><FONT face="新細明體"></FONT></TD>
					<TD colspan="3"><FONT face="新細明體">
							<asp:Button id="BtnSortCode" runat="server" Text="依片語代碼排序"></asp:Button>
							<asp:Button id="BtnSortName" runat="server" Text="依片語名稱排序"></asp:Button></FONT></TD>
				</TR>
				<TR>
					<TD colspan="4"><FONT face="新細明體">
							<asp:datalist id="DataList1" runat="server" BorderWidth="2px" CellPadding="3" BackColor="White"
								CellSpacing="1" BorderStyle="Ridge" BorderColor="White" RepeatColumns="3" RepeatDirection="Horizontal">
								<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#9471DE"></SelectedItemStyle>
								<FooterStyle ForeColor="Black" BackColor="#C6C3C6"></FooterStyle>
								<ItemStyle ForeColor="Black" BackColor="#DEDFDE"></ItemStyle>
								<ItemTemplate>
									<a style="CURSOR: hand;" onclick='fnGetInfo("<%#container.dataitem("phaData")%>");window.close();'>
										<%# container.dataitem("phaCode")  &" " & container.dataitem("phaData")%>
									</a>
								</ItemTemplate>
								<HeaderStyle Font-Bold="True" ForeColor="#E7E7FF" BackColor="#4A3C8C"></HeaderStyle>
							</asp:datalist></FONT></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>

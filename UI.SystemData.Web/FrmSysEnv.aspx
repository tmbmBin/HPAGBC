<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FrmSysEnv.aspx.vb" Inherits="UI.SystemData.Web.FrmSysEnv"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>FrmSysEnv</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<META http-equiv="Pragma" content="No-cache">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellPadding="5"
				width="600" bgColor="#dadee9">
				<tr>
					<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"
						borderColor="#666668" width="600">
						<table border="1" cellpadding="1" style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff"
							width="100%">
							<tr>
								<td>
									<table border="0" width="100%" cellpadding="1" style="TABLE-LAYOUT: fixed">
										<tr>
											<td vAlign="bottom" align="left">&nbsp;</td>
											<td vAlign="bottom" align="left"></td>
											<td vAlign="bottom" align="left"></td>
											<td vAlign="bottom" align="left"></td>
											<td vAlign="bottom" align="left"></td>
											<td vAlign="bottom" align="right"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table border="0" cellpadding="5" cellspacing="0" style="TABLE-LAYOUT: fixed">
										<tr>
											<td width="80">工作年月</td>
											<td width="80" align="right">年份</td>
											<td width="80"><asp:DropDownList id="DDLDefYear" runat="server" Width="50px" AutoPostBack="True"></asp:DropDownList></td>
											<td width="80" align="right">月份</td>
											<td width="80">
												<asp:DropDownList id="DDLDefMonth" runat="server" Width="50px" AutoPostBack="True">
													<asp:ListItem Value="1">1</asp:ListItem>
													<asp:ListItem Value="2">2</asp:ListItem>
													<asp:ListItem Value="3">3</asp:ListItem>
													<asp:ListItem Value="4">4</asp:ListItem>
													<asp:ListItem Value="5">5</asp:ListItem>
													<asp:ListItem Value="6">6</asp:ListItem>
													<asp:ListItem Value="7">7</asp:ListItem>
													<asp:ListItem Value="8">8</asp:ListItem>
													<asp:ListItem Value="9">9</asp:ListItem>
													<asp:ListItem Value="10">10</asp:ListItem>
													<asp:ListItem Value="11">11</asp:ListItem>
													<asp:ListItem Value="12">12</asp:ListItem>
												</asp:DropDownList>
											</td>
											<td width="180" style="display:none">
												<asp:Button id="BtnSave" Text="儲存目前工作年月" title="儲存工作年月,下次登入時將以目前儲存之工作年月作為工作年月" runat="server"
													Height="22px"></asp:Button>
												<asp:Button id="BtnClear" Text="取消工作年月設定" title="清除工作年月設定,下次登入時將以系統年月作為目前工作年月" runat="server"
													Height="22px"></asp:Button></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td bgColor="#ffffff" height="10"></td>
				</tr>
				<tr style=<%=strShowFlag %>>
					<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid; BORDER-COLLAPSE: collapse" borderColor="#666668">
						<table style="TABLE-LAYOUT: fixed; BORDER-COLLAPSE: collapse" borderColor="#ffffff" border="1" cellpadding="1" width="100%">
							<tr style="display:none">
							    <td width="90px"></td>
								<td ></td>
							</tr>
							<tr>
								<td align="right">單位切換：</td>
								<td>
                                    <asp:DropDownList ID="DDLChangeDep" runat="server" AutoPostBack="True"></asp:DropDownList>
                                </td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>

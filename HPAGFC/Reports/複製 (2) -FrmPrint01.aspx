<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FrmPrint01.aspx.vb" Inherits="Reports.FrmPrint01"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>FrmPrint01</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../CSSFiles/calendarStyle.css" type="text/css" rel="stylesheet">
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache">
		<script language="javascript">
		function UCBDate_Change(calendar)
			{
				var vDay = new Date(calendar.GetSelectedDate());
				document.getElementById("TBBDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
			}
		function UCEDate_Change(calendar)
			{
				var vDay = new Date(calendar.GetSelectedDate());
				document.getElementById("TBEDate").value = (vDay.getYear()-1911) + '/' + (vDay.getMonth()+1) + '/' + vDay.getDate();
			}

		</script>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table style="TABLE-LAYOUT: fixed; MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse"
				borderColor="#666668" cellPadding="5" width="750" bgColor="#dadee9" border="1">
				<tr>
					<td>
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="1" width="100%"
							border="1">
							<tr>
								<td>
									<table cellSpacing="0" cellPadding="5" width="100%" border="0">
										<tr>
											<td align="right" width="90">����϶�</td>
											<td colSpan="2"><asp:textbox id="TBBDate" ondblclick="JavaScript: UCBDate.Show();" runat="server" Width="80px"></asp:textbox><COMPONENTART:CALENDAR id="UCBDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day"
													DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif"
													CalendarCssClass="calendar" PopUpExpandControlId="TBBDate" PopUp="Custom" ClientSideOnSelectionChanged="UCBDate_Change"></COMPONENTART:CALENDAR>��<asp:textbox id="TBEDate" ondblclick="JavaScript: UCEDate.Show();" runat="server" Width="80px"></asp:textbox><COMPONENTART:CALENDAR id="UCEDate" runat="server" CultureId="1028" CalendarTitleCssClass="title" DayCssClass="day"
													DayHeaderCssClass="dayheader" DayHoverCssClass="dayhover" MonthCssClass="month" OtherMonthDayCssClass="othermonthday" SelectedDayCssClass="selectedday" PickerFormat="Long" NextImageUrl="../images/cal_nextMonth.gif" PrevImageUrl="../images/cal_prevMonth.gif" CalendarCssClass="calendar" PopUpExpandControlId="TBEDate" PopUp="Custom" ClientSideOnSelectionChanged="UCEDate_Change"></COMPONENTART:CALENDAR></td>
											<td><asp:checkbox id="CBMonthly" runat="server" Text="�뵲" Visible="False"></asp:checkbox></td>
										</tr>
										<tr>
											<TD align="right" width="90" style="DISPLAY:none"><FONT face="�s�ө���">
													<asp:Label id="Label1" runat="server" Width="72px" Visible="False">�b�O�W��</asp:Label></FONT></TD>
											<TD width="150" style="DISPLAY:none">
												<asp:dropdownlist width="144px" Visible="False" id="DDLTeamName" runat="server"></asp:dropdownlist></TD>
											<td align="right" width="90" style="<%=ShowFlag(1)%>">�~ ��</td>
											<td style="WIDTH: 150px" align="left" style="<%=ShowFlag(1)%>"><asp:dropdownlist id="DDLAcmYear" runat="server" Width="144px"></asp:dropdownlist></td>
										</tr>
										<tr>
											<td align="right" width="90"style="<%=ShowFlag(2)%>" >�w��ӷ�</td>
											<td width="150" style="<%=ShowFlag(2)%>"><asp:dropdownlist id="DDLBgtSource" runat="server" Width="144px"></asp:dropdownlist></td>
											<td align="right" width="90" style="<%=ShowFlag(3)%>">�g����O</td>
											<td style="WIDTH: 150px" align="left" style="<%=ShowFlag(3)%>"><asp:dropdownlist id="DDLAccKind" runat="server" Width="144px"></asp:dropdownlist></td>
										</tr>
										<tr>
											<td align="right" width="90" style="<%=ShowFlag(4)%>">�g�O���</td>
											<td width="150" style="<%=ShowFlag(4)%>"><asp:dropdownlist id="DDLBgtDep" runat="server" Width="144px" AutoPostBack="True"></asp:dropdownlist></td>
											<td align="right" width="90" style="<%=ShowFlag(5)%>">������</td>
											<td style="WIDTH: 150px" align="left" style="<%=ShowFlag(5)%>"><font face="�s�ө���"><asp:dropdownlist id="DDLWorkDep" runat="server" Width="144px"></asp:dropdownlist></font></td>
										</tr>
										<tr>
											<td align="right" width="90" style="<%=ShowFlag(6)%>">���b�~��</td>
											<td width="150" style="<%=ShowFlag(6)%>"><asp:dropdownlist id="DDLBiz" runat="server" Width="144px"></asp:dropdownlist></td>
											<td align="right" width="90" style="<%=ShowFlag(7)%>">�ӿ�H��</td>
											<td style="WIDTH: 150px" align="left" style="<%=ShowFlag(7)%>"><asp:textbox id="TBStaffName" runat="server" Width="144px"></asp:textbox></td>
										</tr>
										<tr style="<%=ShowFlag(11)%>">
											<td align="right" width="90"></td>
											<td class=" " width="150"><FONT face="�s�ө���">&nbsp;</FONT><asp:checkbox id="CBShowLevel" runat="server" Text="�h�Ŧ��C��" ></asp:checkbox></td>
											<td align="right" width="90"></td>
											<td align="left" width="150"></td>
										</tr>
										<tr style="<%=ShowFlag(8)%>">
											<td align="right" width="90" valign="top">�p�e���</td>
											<td colspan="2" valign="top"><asp:dropdownlist id="DDLPlan" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
											<td align="left" width="150" valign="top"><asp:checkboxlist id="CBLPlanLevel" runat="server" Width="208px" Height="16px" RepeatColumns="2">
													<asp:ListItem Value="2">�~�ȭp�e</asp:ListItem>
													<asp:ListItem Value="3">�u�@�p�e</asp:ListItem>
													<asp:ListItem Value="4">����p�e</asp:ListItem>
													<asp:ListItem Value="5">�����p�e</asp:ListItem>
												</asp:checkboxlist></td>
										</tr>
										<tr style="<%=ShowFlag(9)%>">
											<td align="right" width="90" valign="top">�γ~�O���</td>
											<td colspan="2" valign="top"><asp:dropdownlist id="DDLOul" runat="server"></asp:dropdownlist></td>
											<td align="left" width="150" valign="top"><asp:checkboxlist id="CBLOulLevel" runat="server" Width="217px" Height="16px" RepeatColumns="2">
													<asp:ListItem Value="1">�@�ťγ~�O</asp:ListItem>
													<asp:ListItem Value="2">�G�ťγ~�O</asp:ListItem>
													<asp:ListItem Value="3">�T�ťγ~�O</asp:ListItem>
													<asp:ListItem Value="4">�|�ťγ~�O</asp:ListItem>
												</asp:checkboxlist></td>
										</tr>
										<tr>
											<td align="right" width="90"  ><asp:button id="BtnPrint" runat="server" Width="75px" Text="�C�X����" Height="22px"></asp:button></td>
											<td align="right" width="150" style="<%=ShowFlag(10)%>">�̤j�C�L�b�ȼ�</td>
											<td align="left" width="90" style="<%=ShowFlag(10)%>"><asp:textbox id="TBMaxRec" runat="server" Width="56px">90</asp:textbox></td>
											<td width="150"><asp:checkbox id="CBDownLoad" runat="server" Text="�U������" Checked="True"></asp:checkbox></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>

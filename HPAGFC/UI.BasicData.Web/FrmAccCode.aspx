<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FrmAccCode.aspx.vb" Inherits="UI.BasicData.Web.FrmAccCode"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>FrmAccCode</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<META http-equiv="Pragma" content="No-cache">
		<script language="javascript">
		<!--

		function fnCallSearchDialog(){

		var strReturnVal=showModalDialog("FrmSortPlanDep.aspx?showtype=2",window,"dialogWidth:640px;dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;");

		if (strReturnVal != "Cancel" )
			{

				Form1.TBFindSql.value=strReturnVal;
			}

		//Form1.TBFindSql.value=strReturnVal;

		}


		function Mark(setObj,PrvFlag)
		{try{
			var Val="";
			if(typeof(setObj)=="string") setObj=document.all[setObj];
				if(setObj.selectedIndex>=0)
					Val=setObj.options[setObj.selectedIndex].value;
						for(var i=0;i<setObj.options.length;i++)
							 if(PrvFlag)
								{if(Val.indexOf(setObj.options[i].value)==0)
										setObj.options[i].selected=true;
										}
										else
										if(setObj.options[i].value.indexOf(Val)==0)
											setObj.options[i].selected=true;  
									}catch(e){;}      
									}

	
		function go_left_top(){
			gift.style.left=document.body.scrollLeft;
			gift.style.top=document.body.scrollTop;}
		//-->

		</script>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" borderColor="#666668"
				cellPadding="0" width="600" bgColor="#dadee9" border="1">
				<tr>
					<td>
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="1" width="100%"
							border="1">
							<tr>
								<td>
									<table style="TABLE-LAYOUT: fixed" cellPadding="1" width="100%" border="0">
										<tr>
											<td vAlign="bottom" align="left"></td>
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
									<table cellSpacing="0" cellPadding="2" width="100%" border="0">
										<tr>
											<td style="WIDTH: 132px" vAlign="bottom" align="right">�����W��</td>
											<td vAlign="bottom" align="left"><asp:dropdownlist id="DDLDep" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
										</tr>
										<tr>
											<td style="WIDTH: 132px" vAlign="bottom" align="right">�p�e�W��</td>
											<td vAlign="bottom" align="left"><asp:dropdownlist id="DDLPlan" runat="server" AutoPostBack="True" Width="530px"></asp:dropdownlist></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table cellSpacing="0" cellPadding="0" width="100%" border="0">
										<tr>
											<td style="WIDTH: 275px" vAlign="bottom" align="center"><font size="2">�w����</font></td>
											<td style="WIDTH: 50px" vAlign="bottom" align="left"></td>
											<td style="WIDTH: 275px" vAlign="bottom" align="center"><font size="2">�i����</font></td>
										</tr>
										<tr>
											<td vAlign="top" align="left">
												<div style="MARGIN-TOP: 0px; OVERFLOW-Y: scroll; MARGIN-LEFT: 10px; WIDTH: 275px; HEIGHT: 300px"><asp:datagrid id="DGSelect" runat="server" ForeColor="Black" GridLines="None" CellPadding="2"
														BackColor="LightGoldenrodYellow" BorderWidth="1px" BorderColor="Tan" Width="250px" AutoGenerateColumns="False">
														<FooterStyle BackColor="Tan"></FooterStyle>
														<SelectedItemStyle ForeColor="GhostWhite" BackColor="DarkSlateBlue"></SelectedItemStyle>
														<AlternatingItemStyle Font-Size="X-Small" BackColor="PaleGoldenrod"></AlternatingItemStyle>
														<ItemStyle Font-Size="X-Small"></ItemStyle>
														<HeaderStyle Font-Size="X-Small" Font-Bold="True" BackColor="Tan"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn>
																<HeaderStyle Width="25px"></HeaderStyle>
																<ItemTemplate>
																	<asp:CheckBox id="CBSelect" runat="server"></asp:CheckBox>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:BoundColumn DataField="oulOutlayName" SortExpression="oulOutlayName" HeaderText="�γ~�O���"></asp:BoundColumn>
															<asp:BoundColumn Visible="False" DataField="accOutlayCode" SortExpression="accOutlayCode" HeaderText="�γ~�O�N�X"></asp:BoundColumn>
															<asp:TemplateColumn HeaderText="����">
																<HeaderStyle Width="30px"></HeaderStyle>
																<ItemTemplate>
																	<asp:CheckBox id="CBStop" runat="server"></asp:CheckBox>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:BoundColumn Visible="False" DataField="accCreateDate" SortExpression="accCreateDate" HeaderText="�إߤ��"></asp:BoundColumn>
															<asp:BoundColumn Visible="False" DataField="accStopDate" SortExpression="accStopDate" HeaderText="���Τ��"></asp:BoundColumn>
														</Columns>
														<PagerStyle HorizontalAlign="Center" ForeColor="DarkSlateBlue" BackColor="PaleGoldenrod" PageButtonCount="5"></PagerStyle>
													</asp:datagrid></div>
											</td>
											<td vAlign="middle" align="center"><asp:button id="BtnSelectAll" runat="server" Height="22px" Text="<<" ToolTip="�[�J��������" Width="50px"></asp:button><br>
												<br>
												<asp:button id="BtnSelect" runat="server" Height="22px" Text="<" ToolTip="�[�J��ܶ���" Width="50px"></asp:button><br>
												<br>
												<asp:button id="BtnRemove" runat="server" Height="22px" Text=">" ToolTip="������ܶ���" Width="50px"></asp:button><br>
												<br>
												<asp:button id="BtnRemoveall" runat="server" Height="22px" Text=">>" ToolTip="������������" Width="50px"></asp:button></td>
											<td vAlign="top" align="left">
												<div style="MARGIN-TOP: 0px; OVERFLOW-Y: scroll; MARGIN-LEFT: 10px; WIDTH: 275px; HEIGHT: 300px"><asp:datagrid id="DGUnSelect" runat="server" GridLines="Horizontal" CellPadding="3" BackColor="White"
														BorderWidth="1px" BorderColor="#E7E7FF" Width="250px" BorderStyle="None" AutoGenerateColumns="False">
														<FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
														<SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
														<AlternatingItemStyle BackColor="#F7F7F7"></AlternatingItemStyle>
														<ItemStyle ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
														<HeaderStyle Font-Size="X-Small" Font-Bold="True" ForeColor="#F7F7F7" BackColor="#4A3C8C"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn>
																<HeaderStyle Width="25px"></HeaderStyle>
																<ItemTemplate>
																	<asp:CheckBox id="CBUnSelect" runat="server"></asp:CheckBox>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:BoundColumn DataField="oulOutlayName" SortExpression="oulOutlayName" HeaderText="�γ~�O���">
																<HeaderStyle Font-Size="X-Small"></HeaderStyle>
																<ItemStyle Font-Size="X-Small"></ItemStyle>
															</asp:BoundColumn>
															<asp:BoundColumn Visible="False" DataField="oulOutlayCode" SortExpression="oulOutlayCode" HeaderText="�γ~�O�N�X"></asp:BoundColumn>
														</Columns>
														<PagerStyle HorizontalAlign="Right" ForeColor="#4A3C8C" BackColor="#E7E7FF" Mode="NumericPages"></PagerStyle>
													</asp:datagrid></div>
											</td>
										</tr>
										<tr>
											<td vAlign="bottom" align="right"><INPUT id="BtnSelectedDown" onclick="Mark(LBSelect);" type="button" value="��U�h" name="BtnSelectedDown"
													runat="server"> <INPUT id="BtnSelectedUp" onclick="Mark(LBSelect,true);" type="button" value="��W�h" name="BtnSelectedUp"
													runat="server"></td>
											<td vAlign="bottom" align="left"><FONT face="�s�ө���"></FONT></td>
											<td vAlign="bottom" align="left"><INPUT id="BtnUnSelectUp" onclick="Mark(LBUnSelect,true);" type="button" value="��W�h" name="BtnUnSelectUp"
													runat="server"> <INPUT id="BtnUnSelectDown" onclick="Mark(LBUnSelect);" type="button" value="��U�h" name="BtnUnSelectDown"
													runat="server">
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="5" width="100%"
							border="1">
							<tr>
								<td vAlign="bottom" align="left">
									<table cellPadding="1" border="0">
										<tr>
											<td vAlign="bottom" align="center"><asp:button id="BtnAdd" runat="server" Height="22" Text="�s�W"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnEdit" runat="server" Height="22" Text="�ק�"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnDelete" runat="server" Height="22" Text="�R��"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnSave" runat="server" Height="22" Text="�x�s"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnCancel" runat="server" Height="22" Text="����"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnSearch" runat="server" Height="22" Text="�d��"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnPrint" runat="server" Height="22" Text="�C�L"></asp:button></td>
											<td vAlign="bottom" align="center"><asp:button id="BtnExit" runat="server" Height="22" Text="���}"></asp:button></td>
											<td vAlign="bottom" align="center"><INPUT id="TBFindSql" style="WIDTH: 56px; HEIGHT: 22px" type="hidden" size="4" name="TBFindSql"
													runat="server"><asp:button id="BtnImport" runat="server" Height="22" Text="�פJ" ToolTip="�פJ�W�~�׸��"></asp:button></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td><asp:datagrid id="DataGrid1" runat="server" Width="100%" AutoGenerateColumns="False" AllowPaging="True">
										<SelectedItemStyle Font-Bold="True" BackColor="DarkOrange"></SelectedItemStyle>
										<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
										<ItemStyle Font-Size="X-Small" BackColor="WhiteSmoke"></ItemStyle>
										<HeaderStyle Font-Size="X-Small" Font-Bold="True" Wrap="False" HorizontalAlign="Center" ForeColor="White"
											BackColor="#003366"></HeaderStyle>
										<Columns>
											<asp:ButtonColumn Text="��" HeaderText="���" CommandName="Select">
												<HeaderStyle Width="30px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
											</asp:ButtonColumn>
											<asp:BoundColumn DataField="dptName" SortExpression="dptName" HeaderText="���W��">
												<HeaderStyle Width="200px"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="plnPlanName" SortExpression="plnPlanName" HeaderText="�p�e�W��"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="accDepCode" SortExpression="accTeaCode" HeaderText="�����N�X">
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="accCodeVer" SortExpression="accCodeVer" HeaderText="��ئ~�קO"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="accPlanCode" SortExpression="accPlanCode" HeaderText="�p�e�N�X">
												<ItemStyle HorizontalAlign="Left"></ItemStyle>
											</asp:BoundColumn>
										</Columns>
										<PagerStyle HorizontalAlign="Center" ForeColor="DarkOrange" BackColor="#666668" Mode="NumericPages"></PagerStyle>
									</asp:datagrid></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>

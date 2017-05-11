<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmChooseActData.aspx.vb" Inherits="UI.GBA2.Web.FrmChooseActData" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    		<base target="_self">
    <style type="text/css">

            .Freezing {position:relative ;  table-layout:fixed;top:expression(this.offsetParent.scrollTop);z-index: 10;} 
            </style>
            <script>

                function fnGetInfo() {
                    strValue = document.all("TBSessionID").value;
                    returnValue = strValue;

                }


                returnValue = "Cancel";
                function fnCancel() {
                    //var sData = dialogArguments;
                    //sData.sUserName = "";
                    //sData.fnUpdate();
                }
			
            </script>
</head>
<body>
    <form id="form1" runat="server">
<table style="MARGIN-TOP: 10px; MARGIN-LEFT: 10px; BORDER-COLLAPSE: collapse" cellPadding="5"
				width="950" bgColor="#dadee9">
				<tr>
					<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"
						borderColor="#666668">
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="1" width="100%"
							border="1">
							<tr>
								<td>
                                    <table style="table-layout:fixed">
                                        <tr>										
											<td align="right" width="90">年 度</td>
											<td align="left" width="150"><asp:dropdownlist id="DDLAcmYear" runat="server" Width="144px"></asp:dropdownlist></td>
											<td align="right" width="80">執行單位</td>
											<td align="left" width="150"><asp:dropdownlist id="DDLWorkDep" runat="server" Width="144px"></asp:dropdownlist></td>
											<td align="right" width="90" >經費單位</td>
											<td  width="150"><asp:dropdownlist id="DDLBgtDep" runat="server" Width="144px" AutoPostBack="True"></asp:dropdownlist></td>
                                            <td >&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
										<tr>
											<td align="right" width="90">動支編號</td>
											<td width="150"><asp:textbox id="TBacmWordNum" runat="server" Width="120px"></asp:textbox></td>
											<td align="right" width="80">群組號</td>
											<td align="left" width="150"><asp:textbox id="TBAcpGroupNo" runat="server" 
                                                    Width="120px"></asp:textbox></td>
                                                                                        <td  align="right">經資門別</td>
                                            <td><asp:dropdownlist id="DDLAccKind" runat="server" Width="120px"></asp:dropdownlist></td>
                                            <td></td>
                                            <td></td>
										</tr>
										<tr>
											<td align="right" width="90">計畫科目</td>
											<td colspan="3"><asp:dropdownlist id="DDLPlan" runat="server" AutoPostBack="True" Width="400px"></asp:dropdownlist></td>
											<td align="right" width="80">用途別</td>
											<td align="left" colspan=3>
                                                <asp:dropdownlist id="DDLOul" runat="server" 
                                                    Width="300px"></asp:dropdownlist></td>
										</tr>
                                    </table>
                                </td>
							</tr>
							<tr>
								<td><asp:button id="BtnFilter" runat="server" Text="過濾資料" Height="22px"></asp:button></td>
							</tr>
							<tr>
								<td><% Dim scrollPosURL As String = "../Behavior/ScrollPos.htc" %>
									<DIV id=MyDiv style="BORDER-RIGHT: 1px groove; BORDER-TOP: 1px groove; BEHAVIOR: url(<%= resolveurl(scrollposurl)%>); OVERFLOW: auto; BORDER-LEFT: 1px groove; WIDTH: 950px; BORDER-BOTTOM: 1px groove; HEIGHT: 300px"  persistid="<%= savescrollpos.uniqueid %>"  scrollpos="<%= savescrollpos.value %>"><input id="savescrollpos" type="hidden" name="savescrollpos" runat="server">
										<asp:datagrid id="DataGrid1" runat="server" Width="100%" AutoGenerateColumns="False"  
											GridLines="Horizontal" CellPadding="3" BackColor="White" BorderWidth="1px" BorderStyle="None" 
                                            BorderColor="#E7E7FF">
											<FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
											<SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
											<AlternatingItemStyle BackColor="#F7F7F7"></AlternatingItemStyle>
											<ItemStyle Font-Size="X-Small" Font-Names="新細明體" ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
											<HeaderStyle Font-Size="X-Small" Font-Names="新細明體" Font-Bold="True" ForeColor="#F7F7F7" CssClass="Freezing"
												BackColor="#4A3C8C"></HeaderStyle>
											<Columns>
												<asp:TemplateColumn HeaderText="選取">
													<HeaderStyle Font-Size="X-Small" Wrap="False" Width="20px"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center"></ItemStyle>
													<HeaderTemplate>
														<asp:CheckBox id="CBSelectAll1" onclick="AllCheck('DataGrid2_,,CBdgSelect',this.checked);" runat="server"
															ToolTip="打勾全選" visible="false"></asp:CheckBox>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:CheckBox id="CBdgSelect" runat="server"></asp:CheckBox>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="年度">                                                   
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcmYear" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acmYear") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="群組編號">                                                    
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcpGroupNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpGroupNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="動支編號">                                                  
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcmWordNum" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acmWordNum") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="經資別">                                                    
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvAccKindName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.accKindName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="預算來源">                                               
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvBgtSourName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.orgName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="會計分錄">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgTrnEntryNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.trnEntryNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="工作計畫">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgWorkPlanName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.WorkPlanName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="分支計畫">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgSubPlanName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SubPlanName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="用途別名稱">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgOulName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.oulOutlayName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="金額">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvMoney" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvMoney", "{0:#,0}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="備註">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvMemo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvMemo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="acmNo-12" Visible="False">                                             
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcmNo" runat="server" 
                                                            Text='<%# DataBinder.Eval(Container, "DataItem.acmNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="acmNo1-13" Visible="False"> 
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcmNo1" runat="server" 
                                                            Text='<%# DataBinder.Eval(Container, "DataItem.acmNo1") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="acmNo2-14" Visible="False">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcmNo2" runat="server" 
                                                            Text='<%# DataBinder.Eval(Container, "DataItem.acmNo2") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="acvNo-15" Visible="False">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvNo" runat="server" 
                                                            Text='<%# DataBinder.Eval(Container, "DataItem.acvNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="acvNo1-16" Visible="False">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvNo1" runat="server" 
                                                            Text='<%# DataBinder.Eval(Container, "DataItem.acvNo1") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="acvNo2-17" Visible="False">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvNo2" runat="server" 
                                                            Text='<%# DataBinder.Eval(Container, "DataItem.acvNo2") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="acpPayYear-18" Visible="False">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcpPayYear" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpPayYear") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="報支號">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcpPayNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpPayNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="acvSubNo-20" Visible="False">                            
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvSubNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvSubNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="轉正號">                                                 
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcpPayNo1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpPayNo1") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="acvSubNo1-22" Visible="False">                                            
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvSubNo1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvSubNo1") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="用途別代碼-24" Visible="False">                                                  
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvOutlayCode" runat="server" 
                                                            Text='<%# DataBinder.Eval(Container, "DataItem.acvOutlayCode") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="計畫代碼-25" Visible="False">                                        
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvPlanCode" runat="server" 
                                                            Text='<%# DataBinder.Eval(Container, "DataItem.acvPlanCode") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="科目年度別-26" Visible="False">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvOutlayYear" runat="server" 
                                                            Text='<%# DataBinder.Eval(Container, "DataItem.acvOutlayYear") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="匯入序號-27" Visible="False">                                      
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvWTranID" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvWTranID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="批號-28" Visible="False">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvWTranBNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvWTranBNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="SeectlFlag-29" Visible="False">  
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgSelectFlag" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SelectFlag") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="傳票號碼">                                                   
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvWExchNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvWExchNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="繳回傳票號碼">                                             
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvWExchNo1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvWExchNo1") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>									
                                                <asp:TemplateColumn HeaderText="ActKeys" Visible="False">  
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgActKeys" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.actKeys") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
											</Columns>
											<PagerStyle HorizontalAlign="Right" ForeColor="#4A3C8C" BackColor="#E7E7FF" Mode="NumericPages"></PagerStyle>
										</asp:datagrid></DIV>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td bgColor="#ffffff" height="10"></td>
				</tr>
                <tr>
					<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"
						borderColor="#666668">
                        <table>
                            <tr>                              
                                <td><asp:Button ID="ReMoveAll" runat="server" Text="全部移除" /></td>
                                <td><asp:Button ID="Remove" runat="server" Text="移除" /></td>
                                <td><asp:Button ID="Selected" runat="server" Text="選取" /> 
                                </td>
                                <td><asp:Button ID="SelectedAll" runat="server" Text="選取全部" />
                                    <input id="TBSessionID" runat="server" type="hidden" />                                
                                    <input id="btnOK" runat="server" type="button" value="傳回選取資料"  onclick="fnGetInfo();window.close();" /></td>
                            </tr>
                        </table>
                    </td>
				</tr>
                <tr>
					<td bgColor="#ffffff" height="10">
                       <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                        </td>
				</tr>
				<tr>
					<td style="BORDER-RIGHT: #666668 1pt solid; BORDER-TOP: #666668 1pt solid; BORDER-LEFT: #666668 1pt solid; BORDER-BOTTOM: #666668 1pt solid"
						borderColor="#666668">
						<table style="BORDER-COLLAPSE: collapse" borderColor="#ffffff" cellPadding="5" width="100%"
							border="1">
							<tr>
								<td >
                                	<div id="DIV2" style="BORDER-RIGHT: 1px groove; BORDER-TOP: 1px groove; BEHAVIOR: url(<%= resolveurl(scrollposurl)%>); OVERFLOW: auto; BORDER-LEFT: 1px groove; WIDTH: 950px; BORDER-BOTTOM: 1px groove; HEIGHT: 300px"  persistid="<%= savescrollpos.uniqueid %>"  scrollpos="<%= savescrollpos.value %>">
										<asp:datagrid id="DataGrid2" runat="server" Width="100%" AutoGenerateColumns="False"  
											GridLines="Horizontal" CellPadding="3" BackColor="White" BorderWidth="1px" BorderStyle="None" 
                                            BorderColor="#E7E7FF">
											<FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
											<SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
											<AlternatingItemStyle BackColor="#F7F7F7"></AlternatingItemStyle>
											<ItemStyle Font-Size="X-Small" Font-Names="新細明體" ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
											<HeaderStyle Font-Size="X-Small" Font-Names="新細明體" Font-Bold="True" ForeColor="#F7F7F7"  
												BackColor="#4A3C8C"></HeaderStyle>
											<Columns>
												<asp:TemplateColumn HeaderText="選取">
													<HeaderStyle Font-Size="X-Small" Wrap="False" Width="20px"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center"></ItemStyle>
													<HeaderTemplate>
														<asp:CheckBox id="CBSelectAll1" onclick="AllCheck('DataGrid2_,,CBdgSelect',this.checked);" runat="server"
															ToolTip="打勾全選" visible="false"></asp:CheckBox>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:CheckBox id="CBdgSelect" runat="server"></asp:CheckBox>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="年度">                                                   
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcmYear" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acmYear") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="群組編號">                                                    
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcpGroupNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpGroupNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="動支編號">                                                  
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcmWordNum" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acmWordNum") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="經資別">                                                    
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvAccKindName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.accKindName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="預算來源">                                               
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvBgtSourName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.orgName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="會計分錄">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgTrnEntryNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.trnEntryNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="工作計畫">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgWorkPlanName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.WorkPlanName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="分支計畫">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgSubPlanName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SubPlanName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="用途別名稱">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgOulName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.oulOutlayName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="金額">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvMoney" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvMoney", "{0:#,0}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="備註">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvMemo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvMemo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="acmNo-12" Visible="False">                                             
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcmNo" runat="server" 
                                                            Text='<%# DataBinder.Eval(Container, "DataItem.acmNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="acmNo1-13" Visible="False"> 
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcmNo1" runat="server" 
                                                            Text='<%# DataBinder.Eval(Container, "DataItem.acmNo1") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="acmNo2-14" Visible="False">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcmNo2" runat="server" 
                                                            Text='<%# DataBinder.Eval(Container, "DataItem.acmNo2") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="acvNo-15" Visible="False">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvNo" runat="server" 
                                                            Text='<%# DataBinder.Eval(Container, "DataItem.acvNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="acvNo1-16" Visible="False">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvNo1" runat="server" 
                                                            Text='<%# DataBinder.Eval(Container, "DataItem.acvNo1") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="acvNo2-17" Visible="False">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvNo2" runat="server" 
                                                            Text='<%# DataBinder.Eval(Container, "DataItem.acvNo2") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="acpPayYear-18" Visible="False">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcpPayYear" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpPayYear") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="報支號">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcpPayNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpPayNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="acvSubNo-20" Visible="False">                            
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvSubNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvSubNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="轉正號">                                                 
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcpPayNo1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acpPayNo1") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="acvSubNo1-22" Visible="False">                                            
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvSubNo1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvSubNo1") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="用途別代碼-24" Visible="False">                                                  
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvOutlayCode" runat="server" 
                                                            Text='<%# DataBinder.Eval(Container, "DataItem.acvOutlayCode") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="計畫代碼-25" Visible="False">                                        
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvPlanCode" runat="server" 
                                                            Text='<%# DataBinder.Eval(Container, "DataItem.acvPlanCode") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="科目年度別-26" Visible="False">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvOutlayYear" runat="server" 
                                                            Text='<%# DataBinder.Eval(Container, "DataItem.acvOutlayYear") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="匯入序號-27" Visible="False">                                      
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvWTranID" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvWTranID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="批號-28" Visible="False">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvWTranBNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvWTranBNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="SeectlFlag-29" Visible="False">  
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgSelectFlag" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SelectFlag") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="傳票號碼">                                                   
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvWExchNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvWExchNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="繳回傳票號碼">                                             
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgAcvWExchNo1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.acvWExchNo1") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                                                                <asp:TemplateColumn HeaderText="ActKeys" Visible="False">  
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBdgActKeys" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.actKeys") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
											</Columns>
											<PagerStyle HorizontalAlign="Right" ForeColor="#4A3C8C" BackColor="#E7E7FF" Mode="NumericPages"></PagerStyle>
										</asp:datagrid></DIV>
                                </td>
							</tr>						
						</table>
					</td>
				</tr>
			</table>
    <div>
    
    </div>
    </form>
</body>
</html>

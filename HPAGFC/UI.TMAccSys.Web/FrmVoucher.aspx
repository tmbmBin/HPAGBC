<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmVoucher.aspx.cs" Inherits="UI.TMAccSys.Web.FrmVoucher" EnableEventValidation = "false" %>
 
<%@ Register assembly="MyWebControls" namespace="MyWebControls" tagprefix="tm" %>
<%@ Import Namespace="MyExtensionsTools" %>
<%@ Import Namespace="MyEncryptTools" %>
<%@ Import Namespace="MyDateTools" %>
<%@ Import Namespace="MyTools" %>
<%@ Register assembly="MyDataPager" namespace="MyDataPager" tagprefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     	    <table style="table-layout: fixed; margin-top: 10px; margin-left: 10px; border-collapse: collapse; width:850px; background-color:#dadee9" bordercolor="#666668" cellpadding="5" border="1">
				<tr>
					<td>
						<table style="border-collapse: collapse" bordercolor="#ffffff" cellpadding="1" width="100%" border="1">
							<tr>
								<td>
									 <table style=" table-layout:fixed; width:100%">
                                         <tr>
                                             <td style="width:100px; text-align:right">日期：</td>
                                             <td colspan="3"><tm:MyTextBox ID="ctl_acmDateB" runat="server" WhereText="DS.acmDate" WhereOperator ="大於等於" DBFieldDataType="DateTime" Width="80px"></tm:MyTextBox>
                                                 至<tm:MyTextBox ID="ctl_acmDateE" runat="server" WhereText="DS.acmDate" WhereOperator ="小於等於" DBFieldDataType="DateTime" Width="80px"></tm:MyTextBox>
                                             </td>
                                             <td style="width:100px; text-align:right">&nbsp;</td>
                                             <td>&nbsp;</td>
                                         </tr>
                                         <tr>
                                             <td style="width:100px; text-align:right">執行單位：</td>
                                             <td><tm:MyDropDownList ID="ctl_acmWorkUnitNo" runat="server" WhereText="IsNull(IsNull(M1.acmWorkUnitNo, M.acmWorkUnitNo), '')" WhereOperator="等於" Width="150px"></tm:MyDropDownList></td>
                                             <td style="width:100px; text-align:right">經費單位：</td>
                                             <td><tm:MyDropDownList ID="ctl_acvBgtDepCode" runat="server" WhereText="acvBgtDepCode" WhereOperator="等於" Width="150px"></tm:MyDropDownList></td>
                                             <td style="width:100px; text-align:right">經資門別：</td>
                                             <td><tm:MyDropDownList ID="ctl_acvAccKind" runat="server" WhereText="acvAccKind" WhereOperator="等於" Width="150px"></tm:MyDropDownList></td>
                                         </tr>
                                         <tr>
                                             <td style="width:100px; text-align:right">預算來源：</td>
                                             <td><tm:MyDropDownList ID="ctl_acvBgtSourCode" runat="server" WhereText="acvBgtSourceCode" WhereOperator="等於" Width="150px"></tm:MyDropDownList></td>
                                             <td style="width:100px; text-align:right">動支編號：</td>
                                             <td>
                                                 <tm:MyTextBox ID="ctl_AcmWordNum" runat="server" WhereText="IsNull(IsNull(M.acmTopWordNum, M.acmSourWordNum), M.acmWordNum)" WhereOperator="等於" Width="140px"></tm:MyTextBox>
                                             </td>
                                             <td style="width:100px; text-align:right">廠商名稱：</td>
                                             <td><tm:MyTextBox ID="ctl_acpPayName" runat="server" WhereText="acpPayName" WhereOperator="關鍵字" Width="140px"></tm:MyTextBox></td>
                                         </tr>
                                         <tr>
                                             <td style="width:100px; text-align:right">傳票狀態：</td>
                                             <td><tm:MyDropDownList ID="ctl_AcvExchStatus" runat="server" Width="150px">
                                                 <asp:ListItem Value="0">未開傳票</asp:ListItem>
                                                 <asp:ListItem Value="1">已開傳票</asp:ListItem>
                                                 <asp:ListItem Value=""></asp:ListItem>
                                                 </tm:MyDropDownList></td>
                                             <td style="width:100px; text-align:right">傳票號碼：</td>
                                             <td><tm:MyTextBox ID="ctl_AcvExchNo" runat="server" Width="140px" ></tm:MyTextBox></td>
                                             <td style="width:100px; text-align:right">群組編號：</td>
                                             <td><tm:MyTextBox ID="ctl_acpGroupNo" runat="server" WhereText="acpGroupNo" WhereOperator="等於" Width="140px"></tm:MyTextBox></td>
                                         </tr>
                                         <tr>
                                             <td style="width:100px; text-align:right">計畫科目：</td>
                                             <td colspan="3"><tm:MyDropDownList ID="ctl_acvPlanCode" runat="server" Width="408px" ></tm:MyDropDownList></td>
                                             <td style="width:100px; text-align:right">摘要：</td>
                                             <%--<td><tm:MyTextBox ID="ctl_acvMemo" runat="server" WhereText="IsNull(acvMemo, '')" WhereOperator="關鍵字" Width="140px" ></tm:MyTextBox></td>--%>
                                            <%--20150311 [mdf]:摘要條件搜尋無資料--%>
                                            <td><tm:MyTextBox ID="ctl_acvMemo" runat="server" WhereText="IsNull(IsNull(DS.acvMemo, DS.acpMemo), '')" WhereOperator="關鍵字" Width="140px" ></tm:MyTextBox></td>
                                         </tr>
                                         <tr>
                                             <td style="width:100px; text-align:right">用途別科目：</td>
                                             <td colspan="3"><tm:MyDropDownList ID="ctl_acvOutlayCode" runat="server" Width="407px" ></tm:MyDropDownList></td>
                                             <td>&nbsp;</td>
                                             <td>&nbsp;</td>
                                         </tr>
                                         <tr>
                                             <td style="width:100px; text-align:right">&nbsp;</td>
                                             <td>&nbsp;</td>
                                             <td style="width:100px; text-align:right">&nbsp;</td>
                                             <td>&nbsp;</td>
                                             <td>&nbsp;</td>
                                             <td>&nbsp;</td>
                                         </tr>
                                         <tr>
                                             <td style="width:100px; text-align:right">
                                                 <asp:Button ID="btnList" runat="server" Text="列出資料" OnClick="btnList_Click1"/>
                                             </td>
                                             <td>&nbsp;</td>
                                             <td style="width:100px; text-align:right">&nbsp;</td>
                                             <td>&nbsp;</td>
                                             <td>&nbsp;</td>
                                             <td>&nbsp;</td>
                                         </tr>
									 </table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
        <br />
	    <table style="table-layout: fixed; margin-top: 10px; margin-left: 10px; border-collapse: collapse; background-color:#dadee9" bordercolor="#666668" cellpadding="5" border="1">
				<tr>
					<td>
						<table style="border-collapse: collapse; border-color:#ffffff"  cellpadding="1" width="100%" border="1">
							<tr>
								<td>
									 <table style="width:100%">
                                         <tr>
                                             <td>
                                                 <table style="table-layout:fixed; width:100%">
                                                     <tr>
                                                         <td style="text-align:center"><asp:Button ID="btnExport" runat="server" Text="匯出Excel" OnClick="btnExport_Click" Height="22" /><asp:button id="BtnSave" runat="server" Height="22" Text="傳票號碼登錄存檔" OnClick="BtnSave_Click"></asp:button></td>
                                                         <td style="text-align:center"><span id="Label1" style="color: red; text-align:center">請存檔後再換頁。</span></td>
                                                         <td>報支總和：<asp:Label ID="lbTotalPay" runat="server" Text="0"></asp:Label>
                                                         </td>
                                                         <td>轉正總和：<asp:Label ID="lbTotalOffSet" runat="server" Text="0"></asp:Label>
                                                         </td>
                                                         <td>繳回總和：<asp:Label ID="lbTotalPayBack" runat="server" Text="0"></asp:Label>
                                                         </td>
                                                     </tr>
                                                 </table>
                                                 </td>
                                         </tr>
                                         <tr>
                                             <td style=" padding:2px">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" EnableModelValidation="True" GridLines="Vertical" HeaderStyle-Font-Size="Small" RowStyle-Font-Size="Small" >
            <AlternatingRowStyle BackColor="Gainsboro" />
            <Columns>
                <asp:TemplateField HeaderText="選取">
                    <ItemTemplate>
                        <asp:HiddenField ID="ctl_acmYear" runat="server" Value='<%# Eval("acmYear") %>' />
                        <asp:HiddenField ID="ctl_acmNo" runat="server" Value='<%# Eval("acmNo") %>' />
                        <asp:HiddenField ID="ctl_acvNo" runat="server" Value='<%# Eval("acvNo") %>' />
                        <asp:HiddenField ID="ctl_acmNo1" runat="server" Value='<%# Eval("acmNo1") %>' />
                        <asp:HiddenField ID="ctl_acvNo1" runat="server" Value='<%# Eval("acvNo1") %>' />
                        <asp:HiddenField ID="ctl_acmNo2" runat="server" Value='<%# Eval("acmNo2") %>' />
                        <asp:HiddenField ID="ctl_acvNo2" runat="server" Value='<%# Eval("acvNo2") %>' />
                        <asp:HiddenField ID="ctl_acpPayYear" runat="server" Value='<%# Eval("acpPayYear") %>' />
                        <asp:HiddenField ID="ctl_acpPayNo" runat="server" Value='<%# Eval("acpPayNo") %>' />
                        <asp:HiddenField ID="ctl_acvSubNo" runat="server" Value='<%# Eval("acvSubNo") %>' />
                        <asp:HiddenField ID="ctl_acpPayNo1" runat="server" Value='<%# Eval("acpPayNo1") %>' />
                        <asp:HiddenField ID="ctl_acvSubNo1" runat="server" Value='<%# Eval("acvSubNo1") %>' />
                        <asp:CheckBox ID="CBdgSelect" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="傳票號碼">
                    <ItemTemplate>
                        <asp:TextBox ID="ctl_AcvExchNo" runat="server" Text='<%# Eval("acvExchNo") %>' Width="60px"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="製票日期">
                    <ItemTemplate>
                        <asp:TextBox ID="ctl_AcvExchMakeDate" runat="server" Text='<%# MyDateTools.DateTool.WDateToCDate(Eval("acvExchMakeDate").ToString(), MyEnumTools.EnumDate.DateSplitSymbol.Slash) %>' Width="60px"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="繳回傳票號碼">
                    <ItemTemplate>
                        <asp:TextBox ID="ctl_AcvExchNo1" runat="server" Text='<%# Eval("acvExchNo1") %>' Width="60px"></asp:TextBox>
                    </ItemTemplate>
                    <HeaderStyle Font-Size="Small" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="繳回製票日期">
                    <ItemTemplate>
                        <asp:TextBox ID="ctl_AcvExchMakeDate1" runat="server" Text='<%# MyDateTools.DateTool.WDateToCDate(Eval("acvExchMakeDate1").ToString(), MyEnumTools.EnumDate.DateSplitSymbol.Slash)  %>' Width="60px"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="動支編號">
                    <ItemTemplate>
                        <asp:Label ID="ctl_AcmWordNum" runat="server" Text='<%# Eval("acmWordNum") %>' Width="60px"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" />
                    <ItemStyle HorizontalAlign="Center" Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="報支日期">
                    <ItemTemplate>
                        <asp:Label ID="ctl_acpMarkDate" runat="server" Text='<%# MyDateTools.DateTool.WDateToCDate(Eval("acpMarkDate").ToString(), MyEnumTools.EnumDate.DateSplitSymbol.Slash) %>' Width="60px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="計畫名稱">
                    <ItemTemplate>
                        <asp:Label ID="ctl_PlanName" runat="server" Text='<%# Eval("PlanName") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="用途別名稱">
                    <ItemTemplate>
                        <asp:Label ID="ctl_OulName" runat="server" Text='<%# Eval("OulName") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="承辦單位">
                    <ItemTemplate>
                        <asp:Label ID="ctl_WorkDepName" runat="server" Text='<%# Eval("WorkDepName") %>'></asp:Label>
                    </ItemTemplate>
                     <HeaderStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="承辦人員">
                    <ItemTemplate>
                        <asp:Label ID="ctl_AcmWorkUserNo" runat="server" Text='<%# Eval("acmWorkUserNo") %>'></asp:Label>
                    </ItemTemplate>
                     <HeaderStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="報支金額" >
                    <ItemStyle HorizontalAlign="Right" />
                    <ItemTemplate>
                        <asp:Label style="text-align:right" ID="ctl_AcvMoney" runat="server" Text='<%#  Eval("acvMoney", "{0:#,#}").ToString()%>'></asp:Label>
                    </ItemTemplate> 
                     <HeaderStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="轉正金額">
                     <ItemStyle HorizontalAlign="Right" />
                    <ItemTemplate>
                        <asp:Label style="text-align:right" ID="ctl_AcvOffSetMoney" runat="server" Text='<%# Eval("acvOffSetMoney",  "{0:#,#}" ).ToString() %>'></asp:Label>
                    </ItemTemplate> 
                     <HeaderStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="繳回金額">
                     <ItemStyle HorizontalAlign="Right" />
                    <ItemTemplate>
                        <asp:Label style="text-align:right" ID="ctl_AcvAdjustMoney" runat="server" Text='<%# Eval("acvAdjustMoney", "{0:#,#}").ToString() %>'></asp:Label>
                    </ItemTemplate> 
                     <HeaderStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="事由">
                    <ItemTemplate>
                        <asp:Label ID="ctl_AcvMemo" runat="server" Text='<%# Eval("acvMemo") %>'></asp:Label>
                    </ItemTemplate> 
                     <HeaderStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="群組編號">
                    <ItemTemplate>
                        <asp:Label ID="ctl_AcpGroupNo" runat="server" Text='<%# Eval("acpGroupNo") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
                                             </td>
                                         </tr>
                                         <tr>
                                             <td style=" height:30px"> 
                                                 <cc1:MyDataPager ID="MyDataPager1" runat="server" PageSize="10" OnPageChanged="MyDataPager1_PageChanged"    />
                                             </td>                                            
                                         </tr>
									 </table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>        
    </div>
        <table ><tr><td>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" EnableModelValidation="True" GridLines="Vertical" HeaderStyle-Font-Size="Small" RowStyle-Font-Size="Small" >
            <%--<AlternatingRowStyle BackColor="Gainsboro" />--%>
            <Columns>
                <asp:TemplateField HeaderText="選取" Visible="false">
                    <ItemTemplate>
                        <asp:HiddenField ID="ctl_acmYear" runat="server" Value='<%# Eval("acmYear") %>' />
                        <asp:HiddenField ID="ctl_acmNo" runat="server" Value='<%# Eval("acmNo") %>' />
                        <asp:HiddenField ID="ctl_acvNo" runat="server" Value='<%# Eval("acvNo") %>' />
                        <asp:HiddenField ID="ctl_acmNo1" runat="server" Value='<%# Eval("acmNo1") %>' />
                        <asp:HiddenField ID="ctl_acvNo1" runat="server" Value='<%# Eval("acvNo1") %>' />
                        <asp:HiddenField ID="ctl_acmNo2" runat="server" Value='<%# Eval("acmNo2") %>' />
                        <asp:HiddenField ID="ctl_acvNo2" runat="server" Value='<%# Eval("acvNo2") %>' />
                        <asp:HiddenField ID="ctl_acpPayYear" runat="server" Value='<%# Eval("acpPayYear") %>' />
                        <asp:HiddenField ID="ctl_acpPayNo" runat="server" Value='<%# Eval("acpPayNo") %>' />
                        <asp:HiddenField ID="ctl_acvSubNo" runat="server" Value='<%# Eval("acvSubNo") %>' />
                        <asp:HiddenField ID="ctl_acpPayNo1" runat="server" Value='<%# Eval("acpPayNo1") %>' />
                        <asp:HiddenField ID="ctl_acvSubNo1" runat="server" Value='<%# Eval("acvSubNo1") %>' />
                        <asp:CheckBox ID="CBdgSelect" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="傳票號碼">
                    <ItemTemplate>
                        <asp:label ID="ctl_AcvExchNo" runat="server" Text='<%# Eval("acvExchNo") %>' Width="60px"></asp:label>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="製票日期">
                    <ItemTemplate>
                        <asp:label ID="ctl_AcvExchMakeDate" runat="server" Text='<%# MyDateTools.DateTool.WDateToCDate(Eval("acvExchMakeDate").ToString(), MyEnumTools.EnumDate.DateSplitSymbol.Slash) %>' Width="60px"></asp:label>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="繳回傳票號碼">
                    <ItemTemplate>
                        <asp:label ID="ctl_AcvExchNo1" runat="server" Text='<%# Eval("acvExchNo1") %>' Width="60px"></asp:label>
                    </ItemTemplate>
                    <HeaderStyle Font-Size="Small" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="繳回製票日期">
                    <ItemTemplate>
                        <asp:label ID="ctl_AcvExchMakeDate1" runat="server" Text='<%# MyDateTools.DateTool.WDateToCDate(Eval("acvExchMakeDate1").ToString(), MyEnumTools.EnumDate.DateSplitSymbol.Slash)  %>' Width="60px"></asp:label>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="動支編號">
                    <ItemTemplate>
                        <asp:Label ID="ctl_AcmWordNum" runat="server" Text='<%# Eval("acmWordNum") %>' Width="60px"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" />
                    <ItemStyle HorizontalAlign="Center" Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="報支日期">
                    <ItemTemplate>
                        <asp:Label ID="ctl_acpMarkDate" runat="server" Text='<%# MyDateTools.DateTool.WDateToCDate(Eval("acpMarkDate").ToString(), MyEnumTools.EnumDate.DateSplitSymbol.Slash) %>' Width="60px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="計畫名稱">
                    <ItemTemplate>
                        <asp:Label ID="ctl_PlanName" runat="server" Text='<%# Eval("PlanName") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="用途別名稱">
                    <ItemTemplate>
                        <asp:Label ID="ctl_OulName" runat="server" Text='<%# Eval("OulName") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="承辦單位">
                    <ItemTemplate>
                        <asp:Label ID="ctl_WorkDepName" runat="server" Text='<%# Eval("WorkDepName") %>'></asp:Label>
                    </ItemTemplate>
                     <HeaderStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="承辦人員">
                    <ItemTemplate>
                        <asp:Label ID="ctl_AcmWorkUserNo" runat="server" Text='<%# Eval("acmWorkUserNo") %>'></asp:Label>
                    </ItemTemplate>
                     <HeaderStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="報支金額" >
                    <ItemStyle HorizontalAlign="Right" />
                    <ItemTemplate>
                        <asp:Label style="text-align:right" ID="ctl_AcvMoney" runat="server" Text='<%#  Eval("acvMoney", "{0:#,#}").ToString()%>'></asp:Label>
                    </ItemTemplate> 
                     <HeaderStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="轉正金額">
                     <ItemStyle HorizontalAlign="Right" />
                    <ItemTemplate>
                        <asp:Label style="text-align:right" ID="ctl_AcvOffSetMoney" runat="server" Text='<%# Eval("acvOffSetMoney",  "{0:#,#}" ).ToString() %>'></asp:Label>
                    </ItemTemplate> 
                     <HeaderStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="繳回金額">
                     <ItemStyle HorizontalAlign="Right" />
                    <ItemTemplate>
                        <asp:Label style="text-align:right" ID="ctl_AcvAdjustMoney" runat="server" Text='<%# Eval("acvAdjustMoney", "{0:#,#}").ToString() %>'></asp:Label>
                    </ItemTemplate> 
                     <HeaderStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="事由">
                    <ItemTemplate>
                        <asp:Label ID="ctl_AcvMemo" runat="server" Text='<%# Eval("acvMemo") %>'></asp:Label>
                    </ItemTemplate> 
                     <HeaderStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="群組編號">
                    <ItemTemplate>
                        <asp:Label ID="ctl_AcpGroupNo" runat="server" Text='<%# Eval("acpGroupNo") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
                   </td></tr></table>
    </form>
</body>
</html>
